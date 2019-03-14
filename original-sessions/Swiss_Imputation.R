

library(AER)
#library(FactoMineR)

data("SwissLabor")
df<-SwissLabor
summary(df)
df$participation<-factor(df$participation,
                         labels=paste("f.Par",sep="-",levels(df$participation)))
df$foreign<-factor(df$foreign,labels=paste("f.For",sep="-",levels(df$foreign)))

llista<-sample(1:nrow(SwissLabor),40);llista
df[llista,"age"]<-NA

library(missMDA)
# Numeric imputation 
vars_con<-names(df)[2:6]
summary(df[,vars_con])

res.input<-imputePCA(df[,vars_con],ncp=4)
summary(res.input$completeObs)

llista<-sample(1:nrow(SwissLabor),40);llista
df[llista,"participation"]<-NA

library(missMDA)
# Numeric imputation 
vars_dis<-names(df)[c(1,7)]
summary(df[,vars_dis])
   
# nb <- estim_ncpMCA(df[, vars_dis],ncp.max=5)  # It takes a lot
res.input<-imputeMCA(df[,vars_dis],ncp=2)
summary(res.input$completeObs)
   