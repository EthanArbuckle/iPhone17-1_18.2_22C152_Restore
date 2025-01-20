@interface WDBlock
- (BOOL)isEmpty;
- (WDBlock)init;
- (WDBlock)initWithText:(id)a3;
- (id)description;
- (id)document;
- (id)newRunIterator;
- (id)runIterator;
- (id)text;
- (int)blockType;
- (int)textType;
@end

@implementation WDBlock

- (WDBlock)initWithText:(id)a3
{
  v5.receiver = self;
  v5.super_class = (Class)WDBlock;
  result = [(WDBlock *)&v5 init];
  if (result) {
    result->mText = (WDText *)a3;
  }
  return result;
}

- (id)document
{
  return [(WDText *)self->mText document];
}

- (int)textType
{
  return [(WDText *)self->mText textType];
}

- (id)text
{
  return self->mText;
}

- (int)blockType
{
  return 0;
}

- (WDBlock)init
{
  return 0;
}

- (id)runIterator
{
  return 0;
}

- (id)newRunIterator
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
  v4.super_class = (Class)WDBlock;
  v2 = [(WDBlock *)&v4 description];
  return v2;
}

@end