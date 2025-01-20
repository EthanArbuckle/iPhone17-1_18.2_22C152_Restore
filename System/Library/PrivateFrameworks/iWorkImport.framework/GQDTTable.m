@interface GQDTTable
+ (const)stateForReading;
- (BOOL)isStreamed;
- (id)defaultVectorStyleForVectorType:(int)a3;
- (id)model;
- (id)tableStyle;
- (int)walkTableWithGenerator:(Class)a3 state:(id)a4;
- (void)dealloc;
- (void)setModel:(id)a3;
- (void)setTableStyle:(id)a3;
@end

@implementation GQDTTable

+ (const)stateForReading
{
  return (const StateSpec *)&unk_A0730;
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)GQDTTable;
  [(GQDGraphic *)&v3 dealloc];
}

- (id)model
{
  return self->mModel;
}

- (void)setModel:(id)a3
{
  id v5 = a3;

  self->mModel = (GQDTTableModel *)a3;
}

- (id)tableStyle
{
  return self->mStyle;
}

- (void)setTableStyle:(id)a3
{
  id v5 = a3;

  self->mStyle = (GQDSStyle *)a3;
}

- (BOOL)isStreamed
{
  return self->mIsStreamed;
}

- (id)defaultVectorStyleForVectorType:(int)a3
{
  if (a3 > 6) {
    uint64_t v3 = 100;
  }
  else {
    uint64_t v3 = dword_5F00C[a3];
  }
  id v5 = 0;
  if ([(GQDSStyle *)self->mStyle hasValueForObjectProperty:v3 value:&v5]) {
    return v5;
  }
  else {
    return 0;
  }
}

- (int)walkTableWithGenerator:(Class)a3 state:(id)a4
{
  if (self->mIsStreamed) {
    return 1;
  }
  int result = -[objc_class beginTable:state:](a3, "beginTable:state:", self);
  if (result == 1)
  {
    int result = [(objc_class *)a3 beginCells:self state:a4];
    if (result == 1)
    {
      CFArrayRef v8 = (const __CFArray *)objc_msgSend(-[GQDTTable model](self, "model"), "cells");
      unint64_t Count = CFArrayGetCount(v8);
      if (!Count) {
        goto LABEL_10;
      }
      unint64_t v10 = 0;
      do
        int result = [(objc_class *)a3 handleCell:CFArrayGetValueAtIndex(v8, v10++) state:a4];
      while (v10 < Count && result == 1);
      if (result == 1)
      {
LABEL_10:
        int result = [(objc_class *)a3 endCells:self state:a4];
        if (result == 1)
        {
          int v11 = [(objc_class *)a3 endTable:self state:a4];
          [a4 setCurrentTableGenerator:0];
          return v11;
        }
      }
    }
  }
  return result;
}

@end