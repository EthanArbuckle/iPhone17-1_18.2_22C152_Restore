@interface SBImageAnalysisServer
+ (id)secureCodableRequestClasses;
+ (id)secureCodableResponseClasses;
- (SBImageAnalysisServer)init;
- (id)executeAnalysisRequest:(id)a3 error:(id *)a4;
- (id)executeAnalysisRequest:(id)a3 reply:(id)a4;
- (void)cancelRequest:(id)a3;
@end

@implementation SBImageAnalysisServer

+ (id)secureCodableRequestClasses
{
  return +[PRUISAnalysisService secureCodableRequestClasses];
}

+ (id)secureCodableResponseClasses
{
  return +[PRUISAnalysisService secureCodableResponseClasses];
}

- (SBImageAnalysisServer)init
{
  v6.receiver = self;
  v6.super_class = (Class)SBImageAnalysisServer;
  v2 = [(SBImageAnalysisServer *)&v6 init];
  if (v2)
  {
    uint64_t v3 = objc_opt_new();
    analyzer = v2->_analyzer;
    v2->_analyzer = (SBImageAnalyzer *)v3;
  }
  return v2;
}

- (void)cancelRequest:(id)a3
{
}

- (id)executeAnalysisRequest:(id)a3 reply:(id)a4
{
  return [(SBImageAnalyzer *)self->_analyzer executeAnalysisRequest:a3 completion:a4];
}

- (id)executeAnalysisRequest:(id)a3 error:(id *)a4
{
  return [(SBImageAnalyzer *)self->_analyzer executeAnalysisRequest:a3 error:a4];
}

- (void).cxx_destruct
{
}

@end