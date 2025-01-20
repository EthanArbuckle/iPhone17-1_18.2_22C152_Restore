@interface CLISuggest
+ (id)correctionForWord:(id)a3 fromCorpus:(id)a4;
- (CLISuggest)init;
- (CLISuggest)initWithDistanceFunction:(unint64_t)a3;
- (NSSet)corpus;
- (id)correctionForWord:(id)a3;
- (unint64_t)distanceFunction;
- (void)addCorpusWordsFromArray:(id)a3;
@end

@implementation CLISuggest

+ (id)correctionForWord:(id)a3 fromCorpus:(id)a4
{
  id v5 = a4;
  id v6 = a3;
  v7 = objc_opt_new();
  [v7 addCorpusWordsFromArray:v5];

  v8 = [v7 correctionForWord:v6];

  return v8;
}

- (CLISuggest)init
{
  return [(CLISuggest *)self initWithDistanceFunction:0];
}

- (CLISuggest)initWithDistanceFunction:(unint64_t)a3
{
  v8.receiver = self;
  v8.super_class = (Class)CLISuggest;
  v4 = [(CLISuggest *)&v8 init];
  if (v4)
  {
    uint64_t v5 = objc_opt_new();
    corpus = v4->_corpus;
    v4->_corpus = (NSSet *)v5;

    v4->_distanceFunction = a3;
  }
  return v4;
}

- (void)addCorpusWordsFromArray:(id)a3
{
  self->_corpus = [(NSSet *)self->_corpus setByAddingObjectsFromArray:a3];

  _objc_release_x1();
}

- (id)correctionForWord:(id)a3
{
  id v4 = a3;
  long long v20 = 0u;
  long long v21 = 0u;
  long long v22 = 0u;
  long long v23 = 0u;
  uint64_t v5 = self->_corpus;
  id v6 = [(NSSet *)v5 countByEnumeratingWithState:&v20 objects:v24 count:16];
  if (v6)
  {
    id v7 = v6;
    id v8 = 0;
    uint64_t v9 = *(void *)v21;
    uint64_t v10 = 0x7FFFFFFFLL;
    obj = v5;
    do
    {
      for (i = 0; i != v7; i = (char *)i + 1)
      {
        if (*(void *)v21 != v9) {
          objc_enumerationMutation(obj);
        }
        v12 = *(void **)(*((void *)&v20 + 1) + 8 * i);
        unint64_t v13 = sub_100011498((unint64_t)self, v12, v4);
        int64_t v14 = v13 - [v12 hasPrefix:v4];
        if (v14 >= v10)
        {
          if (v10 != v14) {
            continue;
          }
          id v16 = [v12 length];
          int64_t v14 = v10;
          if (v16 >= [v8 length]) {
            continue;
          }
        }
        id v15 = v12;

        uint64_t v10 = v14;
        id v8 = v15;
      }
      id v7 = [(NSSet *)obj countByEnumeratingWithState:&v20 objects:v24 count:16];
    }
    while (v7);

    if (v10 <= 2)
    {
      id v8 = v8;
      v17 = v8;
      goto LABEL_16;
    }
  }
  else
  {

    id v8 = 0;
  }
  v17 = 0;
LABEL_16:

  return v17;
}

- (unint64_t)distanceFunction
{
  return self->_distanceFunction;
}

- (NSSet)corpus
{
  return self->_corpus;
}

- (void).cxx_destruct
{
}

@end