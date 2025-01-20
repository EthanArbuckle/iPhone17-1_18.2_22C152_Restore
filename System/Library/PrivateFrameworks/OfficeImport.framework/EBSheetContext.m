@interface EBSheetContext
- (BOOL)loadDelayedNode:(id)a3;
- (EBSheetContext)initWithSheetIndex:(unsigned int)a3 state:(id)a4;
@end

@implementation EBSheetContext

- (EBSheetContext)initWithSheetIndex:(unsigned int)a3 state:(id)a4
{
  id v6 = a4;
  v16.receiver = self;
  v16.super_class = (Class)EBSheetContext;
  v7 = [(EBSheetContext *)&v16 init];
  if (v7)
  {
    v8 = [[EBReaderSheetState alloc] initWithReaderState:v6];
    mSheetState = v7->mSheetState;
    v7->mSheetState = v8;

    v7->mSheetIndex = a3;
    v10 = [MEMORY[0x263F08B88] currentThread];
    v11 = [v10 threadDictionary];

    v12 = [v11 objectForKey:@"kSheetCountInEntireDocument"];
    int v13 = [v12 intValue];

    v14 = [NSNumber numberWithInt:(v13 + 1)];
    [v11 setObject:v14 forKey:@"kSheetCountInEntireDocument"];
  }
  return v7;
}

- (BOOL)loadDelayedNode:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();
  if (isKindOfClass)
  {
    id v6 = (void *)MEMORY[0x23EC9A170](+[TCProgressContext createStageWithSteps:@"Delayed reading of sheet" takingSteps:1.0 name:0.9]);
    [(EBReaderSheetState *)self->mSheetState setEDSheet:v4];
    v7 = [(EBReaderSheetState *)self->mSheetState readerState];
    [v7 resumeReading];

    +[EBSheet readDelayedSheetWithIndex:self->mSheetIndex state:self->mSheetState];
    v8 = [(EBReaderSheetState *)self->mSheetState readerState];
    [v8 pauseReading];

    mSheetState = self->mSheetState;
    self->mSheetState = 0;

    +[TCProgressContext endStage];
    [v4 setLoaded:1];
    v10 = (void *)MEMORY[0x23EC9A170](+[TCProgressContext createStageWithSteps:@"Applying processors for delayed sheet" takingSteps:1.0 name:0.1]);
    [v4 applyProcessors];
    +[TCProgressContext endStage];
  }
  return isKindOfClass & 1;
}

- (void).cxx_destruct
{
}

@end