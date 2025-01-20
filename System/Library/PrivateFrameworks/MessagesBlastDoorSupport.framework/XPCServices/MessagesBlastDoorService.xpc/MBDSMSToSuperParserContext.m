@interface MBDSMSToSuperParserContext
- (BOOL)supportsMessagePartNumbersInAttributes;
- (NSArray)orderedParts;
- (id)name;
- (void)_addPart:(id)a3;
@end

@implementation MBDSMSToSuperParserContext

- (id)name
{
  return @"MBDSMSToSuper";
}

- (void)_addPart:(id)a3
{
  id v4 = a3;
  if (v4)
  {
    orderedParts = self->_orderedParts;
    id v8 = v4;
    if (!orderedParts)
    {
      v6 = (NSMutableArray *)objc_alloc_init((Class)NSMutableArray);
      v7 = self->_orderedParts;
      self->_orderedParts = v6;

      orderedParts = self->_orderedParts;
    }
    [(NSMutableArray *)orderedParts addObject:v8];
  }

  _objc_release_x1();
}

- (BOOL)supportsMessagePartNumbersInAttributes
{
  return 0;
}

- (NSArray)orderedParts
{
  return &self->_orderedParts->super;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_currentTextPart, 0);

  objc_storeStrong((id *)&self->_orderedParts, 0);
}

@end