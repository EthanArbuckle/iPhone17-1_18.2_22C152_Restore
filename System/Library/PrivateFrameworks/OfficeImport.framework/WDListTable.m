@interface WDListTable
- (WDListTable)initWithDocument:(id)a3;
- (id)addListWithListId:(int)a3 listDefinitionId:(int)a4;
- (id)description;
- (id)listAt:(unint64_t)a3;
- (id)listWithListId:(int)a3;
- (id)lists;
- (unint64_t)listCount;
@end

@implementation WDListTable

- (WDListTable)initWithDocument:(id)a3
{
  id v4 = a3;
  v16.receiver = self;
  v16.super_class = (Class)WDListTable;
  v5 = [(WDListTable *)&v16 init];
  v6 = v5;
  if (v5)
  {
    objc_storeWeak((id *)&v5->mDocument, v4);
    v7 = (NSMutableArray *)objc_alloc_init(MEMORY[0x263EFF980]);
    mLists = v6->mLists;
    v6->mLists = v7;

    uint64_t v9 = objc_opt_new();
    mListMapById = v6->mListMapById;
    v6->mListMapById = (NSMutableDictionary *)v9;

    v11 = [[WDList alloc] initWithDocument:v4 listId:0 listDefinitionId:0xFFFFFFFFLL];
    mNullList = v6->mNullList;
    v6->mNullList = v11;

    v13 = [[WDList alloc] initWithDocument:v4 listId:2147483649 listDefinitionId:4294967294];
    mDefaultList = v6->mDefaultList;
    v6->mDefaultList = v13;
  }
  return v6;
}

- (unint64_t)listCount
{
  return [(NSMutableArray *)self->mLists count];
}

- (id)listAt:(unint64_t)a3
{
  return (id)[(NSMutableArray *)self->mLists objectAtIndex:a3];
}

- (id)lists
{
  return self->mLists;
}

- (id)addListWithListId:(int)a3 listDefinitionId:(int)a4
{
  uint64_t v4 = *(void *)&a4;
  uint64_t v5 = *(void *)&a3;
  if (a3 == 0x80000000) {
    uint64_t v5 = [(NSMutableArray *)self->mLists count] + 1;
  }
  v7 = [WDList alloc];
  id WeakRetained = objc_loadWeakRetained((id *)&self->mDocument);
  uint64_t v9 = [(WDList *)v7 initWithDocument:WeakRetained listId:v5 listDefinitionId:v4];

  if (v9)
  {
    [(NSMutableArray *)self->mLists addObject:v9];
    mListMapById = self->mListMapById;
    v11 = [NSNumber numberWithInt:v5];
    [(NSMutableDictionary *)mListMapById setObject:v9 forKeyedSubscript:v11];
  }
  return v9;
}

- (id)listWithListId:(int)a3
{
  if (a3)
  {
    mListMapById = self->mListMapById;
    uint64_t v5 = objc_msgSend(NSNumber, "numberWithInt:");
    id v6 = [(NSMutableDictionary *)mListMapById objectForKeyedSubscript:v5];

    if (v6) {
      goto LABEL_6;
    }
    uint64_t v7 = 40;
  }
  else
  {
    uint64_t v7 = 32;
  }
  id v6 = *(id *)((char *)&self->super.isa + v7);
LABEL_6:
  return v6;
}

- (id)description
{
  v4.receiver = self;
  v4.super_class = (Class)WDListTable;
  v2 = [(WDListTable *)&v4 description];
  return v2;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->mDefaultList, 0);
  objc_storeStrong((id *)&self->mNullList, 0);
  objc_storeStrong((id *)&self->mListMapById, 0);
  objc_storeStrong((id *)&self->mLists, 0);
  objc_destroyWeak((id *)&self->mDocument);
}

@end