@interface ContentAnimationTestRunner
- (BOOL)performActionForPage:(id)a3;
- (BOOL)startPageAction:(id)a3;
- (ContentAnimationTestRunner)initWithTestName:(id)a3 browserController:(id)a4;
- (id)finalStatusForPage:(id)a3;
- (id)outputDataForPage:(id)a3;
- (void)finishedTestPage:(id)a3;
- (void)finishedTestRunner;
- (void)writeOutputData;
@end

@implementation ContentAnimationTestRunner

- (ContentAnimationTestRunner)initWithTestName:(id)a3 browserController:(id)a4
{
  v9.receiver = self;
  v9.super_class = (Class)ContentAnimationTestRunner;
  v4 = [(PurplePageLoadTestRunner *)&v9 initWithTestName:a3 browserController:a4];
  if (v4)
  {
    uint64_t v5 = [MEMORY[0x1E4F1CA60] dictionary];
    outputData = v4->_outputData;
    v4->_outputData = (NSMutableDictionary *)v5;

    [(PageLoadTestRunner *)v4 setResetsZoomBetweenPages:0];
    v7 = v4;
  }

  return v4;
}

- (BOOL)startPageAction:(id)a3
{
  v4 = (void *)MEMORY[0x1E4F1C9C8];
  id v5 = a3;
  v6 = [v4 date];
  [v5 startRenderTime:v6];

  v8.receiver = self;
  v8.super_class = (Class)ContentAnimationTestRunner;
  LOBYTE(self) = [(PageLoadTestRunner *)&v8 startPageAction:v5];

  return (char)self;
}

- (BOOL)performActionForPage:(id)a3
{
  v3 = [(PageLoadTestRunner *)self browserController];
  v4 = [v3 tabController];
  id v5 = [v4 activeTabDocument];

  v6 = [v5 URL];
  v7 = [v6 fragment];
  char v8 = [v7 isEqualToString:@"done"] ^ 1;

  return v8;
}

- (void)finishedTestPage:(id)a3
{
  id v4 = a3;
  id v5 = [(ContentAnimationTestRunner *)self outputDataForPage:v4];
  outputData = self->_outputData;
  v7 = [v4 URL];
  char v8 = [v7 lastPathComponent];
  [(NSMutableDictionary *)outputData setObject:v5 forKeyedSubscript:v8];

  v9.receiver = self;
  v9.super_class = (Class)ContentAnimationTestRunner;
  [(PageLoadTestRunner *)&v9 finishedTestPage:v4];
}

- (id)finalStatusForPage:(id)a3
{
  unsigned int v3 = [a3 status];
  if (v3 > 6) {
    return @"Finished";
  }
  else {
    return off_1E6D7AB98[v3];
  }
}

- (id)outputDataForPage:(id)a3
{
  v8[2] = *MEMORY[0x1E4F143B8];
  v7[0] = @"substitutions";
  v7[1] = @"framerate";
  v8[0] = &unk_1F3C73E78;
  unsigned int v3 = (void *)MEMORY[0x1E4F28ED0];
  [a3 framesPerSecond];
  id v4 = objc_msgSend(v3, "numberWithDouble:");
  v8[1] = v4;
  id v5 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v8 forKeys:v7 count:2];

  return v5;
}

- (void)writeOutputData
{
  unsigned int v3 = [(PageLoadTestRunner *)self outputFilename];

  if (!v3)
  {
    NSLog((NSString *)@"ContentAnimation results: %@", self->_outputData);
    return;
  }
  outputData = self->_outputData;
  id v11 = 0;
  id v5 = [MEMORY[0x1E4F28D90] dataWithJSONObject:outputData options:0 error:&v11];
  id v6 = v11;
  if (v6)
  {
    id v7 = v6;
    NSLog((NSString *)@"Error while serializing Scrolling Performance Test results: %@", v6);
LABEL_7:

    goto LABEL_8;
  }
  char v8 = [(PageLoadTestRunner *)self outputFilename];
  id v10 = 0;
  [v5 writeToFile:v8 options:0 error:&v10];
  id v7 = v10;

  if (v7)
  {
    objc_super v9 = [(PageLoadTestRunner *)self outputFilename];
    NSLog((NSString *)@"Error writing output to file %@: %@", v9, v7);

    goto LABEL_7;
  }
LABEL_8:
}

- (void)finishedTestRunner
{
  [(ContentAnimationTestRunner *)self writeOutputData];
  v12.receiver = self;
  v12.super_class = (Class)ContentAnimationTestRunner;
  [(PurplePageLoadTestRunner *)&v12 finishedTestRunner];
  unsigned int v3 = [(PageLoadTestRunner *)self outputFilename];
  [(PageLoadTestRunner *)self log:@"Animation Complete. Wrote data to %@", v3];

  id v4 = [(PageLoadTestRunner *)self browserController];
  id v5 = [v4 tabController];
  id v6 = [v5 activeTabDocument];

  id v7 = (void *)MEMORY[0x1E4F29088];
  char v8 = [v6 URL];
  objc_super v9 = [v7 componentsWithURL:v8 resolvingAgainstBaseURL:0];

  [v9 setFragment:@"submit"];
  id v10 = [v9 URL];
  id v11 = (id)[v6 loadURL:v10 userDriven:0];
}

- (void).cxx_destruct
{
}

@end