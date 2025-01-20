@interface VMUAnalyzerBase
+ (id)analyzerClasses;
- (VMUAnalyzerBase)initWithGraph:(id)a3 regionIdentifier:(id)a4 debugTimer:(id)a5;
- (const)analyzerName;
- (id)analysisSummaryWithError:(id *)a3;
@end

@implementation VMUAnalyzerBase

- (const)analyzerName
{
  return "Base - this should get overridden by subclasses";
}

+ (id)analyzerClasses
{
  v4[3] = *MEMORY[0x1E4F143B8];
  v4[0] = objc_opt_class();
  v4[1] = objc_opt_class();
  v4[2] = objc_opt_class();
  v2 = [MEMORY[0x1E4F1C978] arrayWithObjects:v4 count:3];

  return v2;
}

- (VMUAnalyzerBase)initWithGraph:(id)a3 regionIdentifier:(id)a4 debugTimer:(id)a5
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  v12 = [(VMUAnalyzerBase *)self init];
  v13 = v12;
  if (v12)
  {
    objc_storeStrong((id *)&v12->_graph, a3);
    objc_storeStrong((id *)&v13->_regionIdentifier, a4);
    objc_storeStrong((id *)&v13->_debugTimer, a5);
  }

  return v13;
}

- (id)analysisSummaryWithError:(id *)a3
{
  return 0;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_debugTimer, 0);
  objc_storeStrong((id *)&self->_regionIdentifier, 0);

  objc_storeStrong((id *)&self->_graph, 0);
}

@end