@interface WDCitationTable
- (WDCitationTable)initWithDocument:(id)a3;
- (WDDocument)document;
- (id)citationFor:(id)a3;
- (id)citationIDs;
- (id)description;
- (unint64_t)count;
- (void)addCitation:(id)a3 forID:(id)a4;
@end

@implementation WDCitationTable

- (WDCitationTable)initWithDocument:(id)a3
{
  id v4 = a3;
  v10.receiver = self;
  v10.super_class = (Class)WDCitationTable;
  v5 = [(WDCitationTable *)&v10 init];
  v6 = v5;
  if (v5)
  {
    objc_storeWeak((id *)&v5->mDocument, v4);
    v7 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x263EFF9A0]);
    mCitations = v6->mCitations;
    v6->mCitations = v7;
  }
  return v6;
}

- (unint64_t)count
{
  return [(NSMutableDictionary *)self->mCitations count];
}

- (id)citationFor:(id)a3
{
  v3 = [(NSMutableDictionary *)self->mCitations objectForKey:a3];
  return v3;
}

- (void)addCitation:(id)a3 forID:(id)a4
{
}

- (id)citationIDs
{
  return (id)[(NSMutableDictionary *)self->mCitations allKeys];
}

- (id)description
{
  v4.receiver = self;
  v4.super_class = (Class)WDCitationTable;
  v2 = [(WDCitationTable *)&v4 description];
  return v2;
}

- (WDDocument)document
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->mDocument);
  return (WDDocument *)WeakRetained;
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->mDocument);
  objc_storeStrong((id *)&self->mCitations, 0);
}

@end