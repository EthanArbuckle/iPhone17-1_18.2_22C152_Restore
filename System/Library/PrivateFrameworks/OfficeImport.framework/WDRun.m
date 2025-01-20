@interface WDRun
- (BOOL)isEmpty;
- (WDParagraph)paragraph;
- (WDRun)init;
- (WDRun)initWithParagraph:(id)a3;
- (id)description;
- (int)runType;
@end

@implementation WDRun

- (WDRun)initWithParagraph:(id)a3
{
  id v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)WDRun;
  v5 = [(WDRun *)&v8 init];
  v6 = v5;
  if (v5) {
    objc_storeWeak((id *)&v5->mParagraph, v4);
  }

  return v6;
}

- (WDParagraph)paragraph
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->mParagraph);
  return (WDParagraph *)WeakRetained;
}

- (int)runType
{
  return 0;
}

- (WDRun)init
{
  return 0;
}

- (BOOL)isEmpty
{
  return 0;
}

- (id)description
{
  v4.receiver = self;
  v4.super_class = (Class)WDRun;
  v2 = [(WDRun *)&v4 description];
  return v2;
}

- (void).cxx_destruct
{
}

@end