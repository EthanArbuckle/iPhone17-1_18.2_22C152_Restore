@interface FRArticlePrefetchRequest
- (FCHeadlineProviding)headline;
- (unint64_t)options;
- (unint64_t)priority;
- (void)addPrefetchOperationsToOrderedSet:(id)a3;
- (void)setHeadline:(id)a3;
- (void)setOptions:(unint64_t)a3;
- (void)setPriority:(unint64_t)a3;
@end

@implementation FRArticlePrefetchRequest

- (void)addPrefetchOperationsToOrderedSet:(id)a3
{
  id v23 = a3;
  v4 = [(FRArticlePrefetchRequest *)self headline];
  id v5 = [v4 contentType];

  if (v5 == (id)1)
  {
    v21 = [FRWebArticlePrefetchOperation alloc];
    v16 = [(FRArticlePrefetchRequest *)self headline];
    unint64_t v17 = [(FRArticlePrefetchRequest *)self priority];
    v18 = v21;
    v19 = v16;
    uint64_t v20 = 4;
    goto LABEL_6;
  }
  if (v5 == (id)2)
  {
    v6 = [FRFlintArticlePrefetchOperation alloc];
    v7 = [(FRArticlePrefetchRequest *)self headline];
    v8 = [(FRArticlePrefetchOperation *)v6 initWithHeadline:v7 component:0 priority:[(FRArticlePrefetchRequest *)self priority]];
    [v23 addObject:v8];

    v9 = [FRFlintArticlePrefetchOperation alloc];
    v10 = [(FRArticlePrefetchRequest *)self headline];
    v11 = [(FRArticlePrefetchOperation *)v9 initWithHeadline:v10 component:1 priority:[(FRArticlePrefetchRequest *)self priority]];
    [v23 addObject:v11];

    v12 = [FRFlintArticlePrefetchOperation alloc];
    v13 = [(FRArticlePrefetchRequest *)self headline];
    v14 = [(FRArticlePrefetchOperation *)v12 initWithHeadline:v13 component:2 priority:[(FRArticlePrefetchRequest *)self priority]];
    [v23 addObject:v14];

    if ([(FRArticlePrefetchRequest *)self options])
    {
      v15 = [FRFlintArticlePrefetchOperation alloc];
      v16 = [(FRArticlePrefetchRequest *)self headline];
      unint64_t v17 = [(FRArticlePrefetchRequest *)self priority];
      v18 = v15;
      v19 = v16;
      uint64_t v20 = 3;
LABEL_6:
      id v22 = [v18 initWithHeadline:v19 component:v20 priority:v17];
      [v23 addObject:v22];
    }
  }

  _objc_release_x1();
}

- (FCHeadlineProviding)headline
{
  return self->_headline;
}

- (void)setHeadline:(id)a3
{
}

- (unint64_t)priority
{
  return self->_priority;
}

- (void)setPriority:(unint64_t)a3
{
  self->_priority = a3;
}

- (unint64_t)options
{
  return self->_options;
}

- (void)setOptions:(unint64_t)a3
{
  self->_options = a3;
}

- (void).cxx_destruct
{
}

@end