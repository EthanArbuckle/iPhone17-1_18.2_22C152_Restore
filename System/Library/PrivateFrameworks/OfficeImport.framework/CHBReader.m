@interface CHBReader
+ (void)readChart:(id)a3 state:(id)a4;
@end

@implementation CHBReader

+ (void)readChart:(id)a3 state:(id)a4
{
  id v9 = a3;
  id v5 = a4;
  v6 = (void *)MEMORY[0x23EC9A170]();
  v7 = [v5 edSheet];
  [v9 setSheet:v7];

  [v9 setStyleId:0];
  v8 = [[CHBReaderState alloc] initWithEBReaderSheetState:v5];
  [(CHBReaderState *)v8 setChart:v9];
  +[CHBChart readWithState:v8];
}

@end