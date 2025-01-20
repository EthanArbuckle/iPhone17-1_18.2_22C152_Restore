@interface EXSheetContext
- (BOOL)loadDelayedNode:(id)a3;
- (EXSheetContext)initWithSheetLocation:(id)a3 sheetXmlType:(id)a4 state:(id)a5;
@end

@implementation EXSheetContext

- (EXSheetContext)initWithSheetLocation:(id)a3 sheetXmlType:(id)a4 state:(id)a5
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  v20.receiver = self;
  v20.super_class = (Class)EXSheetContext;
  v12 = [(EXSheetContext *)&v20 init];
  v13 = v12;
  if (v12)
  {
    objc_storeStrong((id *)&v12->mSheetState, a5);
    objc_storeStrong((id *)&v13->mPackageLocation, a3);
    objc_storeStrong((id *)&v13->mType, a4);
    v14 = [MEMORY[0x263F08B88] currentThread];
    v15 = [v14 threadDictionary];

    v16 = [v15 objectForKey:@"kSheetCountInEntireDocument"];
    int v17 = [v16 intValue];

    v18 = [NSNumber numberWithInt:(v17 + 1)];
    [v15 setObject:v18 forKey:@"kSheetCountInEntireDocument"];
  }
  return v13;
}

- (BOOL)loadDelayedNode:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0 && self->mPackageLocation && self->mSheetState)
  {
    +[TCProgressContext createStageWithSteps:1.0 takingSteps:1.0];
    v5 = (void *)MEMORY[0x23EC9A170](+[TCProgressContext createStageWithSteps:@"Delayed reading of sheet" takingSteps:1.0 name:0.9]);
    [(EXReadState *)self->mSheetState setCurrentSheet:v4];
    +[EXSheet readDelayedSheeWithLocation:self->mPackageLocation sheetXmlType:self->mType state:self->mSheetState];
    [(EXReadState *)self->mSheetState setCurrentSheet:0];
    [(EXReadState *)self->mSheetState resetForNewSheet];
    mSheetState = self->mSheetState;
    self->mSheetState = 0;

    +[TCProgressContext endStage];
    [v4 setLoaded:1];
    v7 = (void *)MEMORY[0x23EC9A170](+[TCProgressContext createStageWithSteps:@"Applying processors for delayed sheet" takingSteps:1.0 name:0.1]);
    [v4 applyProcessors];
    +[TCProgressContext endStage];
    +[TCProgressContext endStage];

    BOOL v8 = 1;
  }
  else
  {
    BOOL v8 = 0;
  }

  return v8;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->mType, 0);
  objc_storeStrong((id *)&self->mPackageLocation, 0);
  objc_storeStrong((id *)&self->mSheetState, 0);
}

@end