@interface TSTRichTextPayload
- (BOOL)requiresRichText;
- (TSTRichTextPayload)initWithContext:(id)a3 storage:(id)a4;
- (TSTRichTextPayload)initWithStorage:(id)a3;
- (TSWPStorage)storage;
- (id)copyWithContext:(id)a3;
- (id)string;
- (void)dealloc;
- (void)setStorage:(id)a3;
@end

@implementation TSTRichTextPayload

- (TSWPStorage)storage
{
  return self->mStorage;
}

- (void)setStorage:(id)a3
{
  [(TSPObject *)self willModify];
  id v5 = a3;

  self->mStorage = (TSWPStorage *)a3;
}

- (TSTRichTextPayload)initWithStorage:(id)a3
{
  uint64_t v5 = [a3 context];
  return [(TSTRichTextPayload *)self initWithContext:v5 storage:a3];
}

- (TSTRichTextPayload)initWithContext:(id)a3 storage:(id)a4
{
  v7.receiver = self;
  v7.super_class = (Class)TSTRichTextPayload;
  uint64_t v5 = [(TSPObject *)&v7 initWithContext:a3];
  if (v5) {
    v5->mStorage = (TSWPStorage *)a4;
  }
  return v5;
}

- (void)dealloc
{
  self->mStorage = 0;
  v3.receiver = self;
  v3.super_class = (Class)TSTRichTextPayload;
  [(TSTRichTextPayload *)&v3 dealloc];
}

- (id)copyWithContext:(id)a3
{
  id v5 = objc_alloc((Class)objc_opt_class());
  id v6 = [(TSWPStorage *)[(TSTRichTextPayload *)self storage] copyWithContext:a3];
  return (id)[v5 initWithStorage:v6];
}

- (id)string
{
  v2 = [(TSTRichTextPayload *)self storage];
  return [(TSWPStorage *)v2 stringValue];
}

- (BOOL)requiresRichText
{
  return ![(TSWPStorage *)[(TSTRichTextPayload *)self storage] canBeStoredInAStringValueCell];
}

@end