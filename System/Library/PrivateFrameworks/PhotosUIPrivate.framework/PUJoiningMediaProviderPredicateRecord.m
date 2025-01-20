@interface PUJoiningMediaProviderPredicateRecord
- (PUJoiningMediaProviderPredicateRecord)initWithMediaProvider:(id)a3 predicate:(id)a4;
- (PUMediaProvider)mediaProvider;
- (id)predicate;
@end

@implementation PUJoiningMediaProviderPredicateRecord

- (void).cxx_destruct
{
  objc_storeStrong(&self->_predicate, 0);
  objc_storeStrong((id *)&self->_mediaProvider, 0);
}

- (id)predicate
{
  return self->_predicate;
}

- (PUMediaProvider)mediaProvider
{
  return self->_mediaProvider;
}

- (PUJoiningMediaProviderPredicateRecord)initWithMediaProvider:(id)a3 predicate:(id)a4
{
  id v8 = a3;
  id v9 = a4;
  v16.receiver = self;
  v16.super_class = (Class)PUJoiningMediaProviderPredicateRecord;
  v10 = [(PUJoiningMediaProviderPredicateRecord *)&v16 init];
  if (v10)
  {
    if (v8)
    {
      if (v9)
      {
LABEL_4:
        objc_storeStrong((id *)&v10->_mediaProvider, a3);
        uint64_t v11 = [v9 copy];
        id predicate = v10->_predicate;
        v10->_id predicate = (id)v11;

        goto LABEL_5;
      }
    }
    else
    {
      v14 = [MEMORY[0x1E4F28B00] currentHandler];
      [v14 handleFailureInMethod:a2, v10, @"PUJoiningMediaProvider.m", 153, @"Invalid parameter not satisfying: %@", @"mediaProvider != nil" object file lineNumber description];

      if (v9) {
        goto LABEL_4;
      }
    }
    v15 = [MEMORY[0x1E4F28B00] currentHandler];
    [v15 handleFailureInMethod:a2, v10, @"PUJoiningMediaProvider.m", 154, @"Invalid parameter not satisfying: %@", @"predicate != nil" object file lineNumber description];

    goto LABEL_4;
  }
LABEL_5:

  return v10;
}

@end