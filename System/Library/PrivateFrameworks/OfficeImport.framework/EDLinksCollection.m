@interface EDLinksCollection
- (BOOL)convertLinkReferenceIndex:(unint64_t)a3 firstSheetIndex:(unint64_t *)a4 lastSheetIndex:(unint64_t *)a5;
- (EDLinksCollection)init;
- (id)description;
- (id)linkAtIndex:(unint64_t)a3;
- (id)referenceAtIndex:(unint64_t)a3;
- (unint64_t)addLink:(id)a3;
- (unint64_t)addOrEquivalentInternalLinkReferenceWithFirstSheetIndex:(unint64_t)a3 lastSheetIndex:(unint64_t)a4;
- (unint64_t)addOrEquivalentLinkReferenceOfType:(int)a3 firstSheetIndex:(unint64_t)a4 lastSheetIndex:(unint64_t)a5;
- (unint64_t)addReference:(id)a3;
- (unint64_t)indexOfFirstLinkWithType:(int)a3;
- (unint64_t)indexOfReference:(id)a3;
- (unint64_t)linkIndexCreateIfNeededWithType:(int)a3;
- (unint64_t)linksCount;
- (unint64_t)referencesCount;
- (void)addOrEquivalentExternalAddInName:(id)a3 linkReferenceIndex:(unint64_t *)a4 nameIndex:(unint64_t *)a5;
@end

@implementation EDLinksCollection

- (EDLinksCollection)init
{
  v8.receiver = self;
  v8.super_class = (Class)EDLinksCollection;
  v2 = [(EDLinksCollection *)&v8 init];
  if (v2)
  {
    v3 = (NSMutableArray *)objc_alloc_init(MEMORY[0x263EFF980]);
    mLinks = v2->mLinks;
    v2->mLinks = v3;

    v5 = (NSMutableArray *)objc_alloc_init(MEMORY[0x263EFF980]);
    mReferences = v2->mReferences;
    v2->mReferences = v5;
  }
  return v2;
}

- (unint64_t)addReference:(id)a3
{
  id v4 = a3;
  if (v4)
  {
    [(NSMutableArray *)self->mReferences addObject:v4];
    unint64_t v5 = [(NSMutableArray *)self->mReferences count] - 1;
  }
  else
  {
    unint64_t v5 = -1;
  }

  return v5;
}

- (unint64_t)addLink:(id)a3
{
  id v4 = a3;
  if (v4)
  {
    [(NSMutableArray *)self->mLinks addObject:v4];
    unint64_t v5 = [(NSMutableArray *)self->mLinks count] - 1;
  }
  else
  {
    unint64_t v5 = -1;
  }

  return v5;
}

- (id)referenceAtIndex:(unint64_t)a3
{
  if ([(EDLinksCollection *)self referencesCount] <= a3)
  {
    unint64_t v5 = 0;
  }
  else
  {
    unint64_t v5 = [(NSMutableArray *)self->mReferences objectAtIndex:a3];
  }
  return v5;
}

- (unint64_t)referencesCount
{
  return [(NSMutableArray *)self->mReferences count];
}

- (id)linkAtIndex:(unint64_t)a3
{
  if ([(EDLinksCollection *)self linksCount] <= a3)
  {
    unint64_t v5 = 0;
  }
  else
  {
    unint64_t v5 = [(NSMutableArray *)self->mLinks objectAtIndex:a3];
  }
  return v5;
}

- (unint64_t)linksCount
{
  return [(NSMutableArray *)self->mLinks count];
}

- (BOOL)convertLinkReferenceIndex:(unint64_t)a3 firstSheetIndex:(unint64_t *)a4 lastSheetIndex:(unint64_t *)a5
{
  *a4 = -1;
  *a5 = -1;
  objc_super v8 = [(EDLinksCollection *)self referenceAtIndex:a3];
  v9 = -[EDLinksCollection linkAtIndex:](self, "linkAtIndex:", [v8 linkIndex]);
  v10 = v9;
  if (v9 && [v9 type] == 1)
  {
    *a4 = [v8 firstSheetIndex];
    *a5 = [v8 lastSheetIndex];
    BOOL v11 = 1;
  }
  else
  {
    BOOL v11 = 0;
  }

  return v11;
}

- (unint64_t)addOrEquivalentLinkReferenceOfType:(int)a3 firstSheetIndex:(unint64_t)a4 lastSheetIndex:(unint64_t)a5
{
  v6 = +[EDLinkReference linkReferenceWithLinkIndex:[(EDLinksCollection *)self linkIndexCreateIfNeededWithType:*(void *)&a3] firstSheetIndex:a4 lastSheetIndex:a5];
  unint64_t v7 = [(EDLinksCollection *)self indexOfReference:v6];
  if (v7 == -1) {
    unint64_t v7 = [(EDLinksCollection *)self addReference:v6];
  }

  return v7;
}

- (unint64_t)linkIndexCreateIfNeededWithType:(int)a3
{
  uint64_t v3 = *(void *)&a3;
  unint64_t v5 = -[EDLinksCollection indexOfFirstLinkWithType:](self, "indexOfFirstLinkWithType:");
  if (v5 == -1)
  {
    v6 = +[EDLink linkWithType:v3];
    unint64_t v5 = [(EDLinksCollection *)self addLink:v6];
  }
  return v5;
}

- (unint64_t)indexOfFirstLinkWithType:(int)a3
{
  uint64_t v5 = [(NSMutableArray *)self->mLinks count];
  if (!v5) {
    return -1;
  }
  uint64_t v6 = v5;
  unint64_t v7 = 0;
  while (1)
  {
    objc_super v8 = [(NSMutableArray *)self->mLinks objectAtIndex:v7];
    if (v8)
    {
      v9 = v8;
      int v10 = [v8 type];

      if (v10 == a3) {
        break;
      }
    }
    if (v6 == ++v7) {
      return -1;
    }
  }
  return v7;
}

- (unint64_t)indexOfReference:(id)a3
{
  unint64_t result = [(NSMutableArray *)self->mReferences indexOfObject:a3];
  if (result == 0x7FFFFFFFFFFFFFFFLL) {
    return -1;
  }
  return result;
}

- (unint64_t)addOrEquivalentInternalLinkReferenceWithFirstSheetIndex:(unint64_t)a3 lastSheetIndex:(unint64_t)a4
{
  return [(EDLinksCollection *)self addOrEquivalentLinkReferenceOfType:1 firstSheetIndex:a3 lastSheetIndex:a4];
}

- (void)addOrEquivalentExternalAddInName:(id)a3 linkReferenceIndex:(unint64_t *)a4 nameIndex:(unint64_t *)a5
{
  id v13 = a3;
  unint64_t v8 = [(EDLinksCollection *)self addOrEquivalentLinkReferenceOfType:3 firstSheetIndex:65534 lastSheetIndex:65534];
  *a4 = v8;
  if (v8 == -1)
  {
    *a5 = -1;
  }
  else
  {
    v9 = [(EDLinksCollection *)self referenceAtIndex:v8];
    int v10 = -[EDLinksCollection linkAtIndex:](self, "linkAtIndex:", [v9 linkIndex]);
    BOOL v11 = [v10 externalNames];
    v12 = +[EDString edStringWithString:v13];
    *a5 = [v11 addOrEquivalentObject:v12];
  }
}

- (id)description
{
  v4.receiver = self;
  v4.super_class = (Class)EDLinksCollection;
  v2 = [(EDLinksCollection *)&v4 description];
  return v2;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->mReferences, 0);
  objc_storeStrong((id *)&self->mLinks, 0);
}

@end