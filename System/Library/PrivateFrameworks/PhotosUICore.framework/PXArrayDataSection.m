@interface PXArrayDataSection
- (NSArray)sectionContent;
- (PXArrayDataSection)initWithOutlineObject:(id)a3;
- (PXArrayDataSection)initWithOutlineObject:(id)a3 sectionContent:(id)a4;
- (PXArrayDataSection)initWithSectionContent:(id)a3;
- (id)objectAtIndex:(int64_t)a3;
- (int64_t)count;
- (int64_t)indexOfObject:(id)a3;
- (int64_t)validatedIndexOfObject:(id)a3 hintIndex:(int64_t)a4;
- (unint64_t)countByEnumeratingWithState:(id *)a3 objects:(id *)a4 count:(unint64_t)a5;
@end

@implementation PXArrayDataSection

- (void).cxx_destruct
{
}

- (NSArray)sectionContent
{
  return self->_sectionContent;
}

- (int64_t)validatedIndexOfObject:(id)a3 hintIndex:(int64_t)a4
{
  id v6 = a3;
  if (a4 == 0x7FFFFFFFFFFFFFFFLL
    || ([(PXArrayDataSection *)self objectAtIndex:a4],
        v7 = objc_claimAutoreleasedReturnValue(),
        char v8 = [v7 isEqual:v6],
        v7,
        (v8 & 1) == 0))
  {
    a4 = [(PXArrayDataSection *)self indexOfObject:v6];
  }

  return a4;
}

- (int64_t)indexOfObject:(id)a3
{
  id v4 = a3;
  v5 = [(PXArrayDataSection *)self sectionContent];
  int64_t v6 = [v5 indexOfObject:v4];

  return v6;
}

- (unint64_t)countByEnumeratingWithState:(id *)a3 objects:(id *)a4 count:(unint64_t)a5
{
  char v8 = [(PXArrayDataSection *)self sectionContent];
  unint64_t v9 = [v8 countByEnumeratingWithState:a3 objects:a4 count:a5];

  return v9;
}

- (id)objectAtIndex:(int64_t)a3
{
  id v4 = [(PXArrayDataSection *)self sectionContent];
  v5 = [v4 objectAtIndex:a3];

  return v5;
}

- (int64_t)count
{
  v2 = [(PXArrayDataSection *)self sectionContent];
  int64_t v3 = [v2 count];

  return v3;
}

- (PXArrayDataSection)initWithOutlineObject:(id)a3
{
  id v5 = a3;
  int64_t v6 = [MEMORY[0x1E4F28B00] currentHandler];
  objc_msgSend(v6, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, @"PXDataSection.m", 90, @"%s is not available as initializer", "-[PXArrayDataSection initWithOutlineObject:]");

  abort();
}

- (PXArrayDataSection)initWithSectionContent:(id)a3
{
  return [(PXArrayDataSection *)self initWithOutlineObject:0 sectionContent:a3];
}

- (PXArrayDataSection)initWithOutlineObject:(id)a3 sectionContent:(id)a4
{
  id v6 = a4;
  v11.receiver = self;
  v11.super_class = (Class)PXArrayDataSection;
  v7 = [(PXDataSection *)&v11 initWithOutlineObject:a3];
  if (v7)
  {
    uint64_t v8 = [v6 copy];
    sectionContent = v7->_sectionContent;
    v7->_sectionContent = (NSArray *)v8;
  }
  return v7;
}

@end