@interface WDRevisionAuthorTable
- (WDRevisionAuthorTable)initWithDocument:(id)a3;
- (id)authorAt:(unint64_t)a3;
- (id)authors;
- (id)description;
- (unint64_t)authorAddLookup:(id)a3;
- (unint64_t)authorCount;
- (void)addAuthor:(id)a3;
@end

@implementation WDRevisionAuthorTable

- (WDRevisionAuthorTable)initWithDocument:(id)a3
{
  id v4 = a3;
  v10.receiver = self;
  v10.super_class = (Class)WDRevisionAuthorTable;
  v5 = [(WDRevisionAuthorTable *)&v10 init];
  v6 = v5;
  if (v5)
  {
    objc_storeWeak((id *)&v5->mDocument, v4);
    v7 = (NSMutableArray *)objc_alloc_init(MEMORY[0x263EFF980]);
    mAuthors = v6->mAuthors;
    v6->mAuthors = v7;
  }
  return v6;
}

- (id)authors
{
  return self->mAuthors;
}

- (unint64_t)authorCount
{
  return [(NSMutableArray *)self->mAuthors count];
}

- (id)authorAt:(unint64_t)a3
{
  if ([(NSMutableArray *)self->mAuthors count] <= a3)
  {
    v6 = TCBundle();
    v5 = [v6 localizedStringForKey:@"Unknown" value:&stru_26EBF24D8 table:@"TCCompatibility"];
  }
  else
  {
    v5 = [(NSMutableArray *)self->mAuthors objectAtIndex:a3];
  }
  return v5;
}

- (void)addAuthor:(id)a3
{
}

- (unint64_t)authorAddLookup:(id)a3
{
  id v4 = a3;
  if (v4 && ([(NSMutableArray *)self->mAuthors containsObject:v4] & 1) == 0) {
    [(WDRevisionAuthorTable *)self addAuthor:v4];
  }
  unint64_t v5 = [(NSMutableArray *)self->mAuthors indexOfObject:v4];

  return v5;
}

- (id)description
{
  v4.receiver = self;
  v4.super_class = (Class)WDRevisionAuthorTable;
  v2 = [(WDRevisionAuthorTable *)&v4 description];
  return v2;
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->mDocument);
  objc_storeStrong((id *)&self->mAuthors, 0);
}

@end