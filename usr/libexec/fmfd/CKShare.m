@interface CKShare
- (NSArray)fmf_otherParticipants;
- (void)setFmf_otherParticipants:(id)a3;
@end

@implementation CKShare

- (void)setFmf_otherParticipants:(id)a3
{
  id v4 = a3;
  v5 = [(CKShare *)self fmf_otherParticipants];
  v6 = [v5 fm_filter:&stru_1000A1530];

  v28[0] = _NSConcreteStackBlock;
  v28[1] = 3221225472;
  v28[2] = sub_10000ACB0;
  v28[3] = &unk_1000A1558;
  v28[4] = v6;
  v7 = [v4 fm_filter:v28];
  long long v24 = 0u;
  long long v25 = 0u;
  long long v26 = 0u;
  long long v27 = 0u;
  id v8 = [v7 countByEnumeratingWithState:&v24 objects:v30 count:16];
  if (v8)
  {
    id v9 = v8;
    uint64_t v10 = *(void *)v25;
    do
    {
      v11 = 0;
      do
      {
        if (*(void *)v25 != v10) {
          objc_enumerationMutation(v7);
        }
        [(CKShare *)self addParticipant:*(void *)(*((void *)&v24 + 1) + 8 * (void)v11)];
        v11 = (char *)v11 + 1;
      }
      while (v9 != v11);
      id v9 = [v7 countByEnumeratingWithState:&v24 objects:v30 count:16];
    }
    while (v9);
  }
  v22[0] = _NSConcreteStackBlock;
  v22[1] = 3221225472;
  v22[2] = sub_10000ACD4;
  v22[3] = &unk_1000A1558;
  id v12 = v4;
  id v23 = v12;
  v13 = [v6 fm_filter:v22];
  long long v18 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  id v14 = [v13 countByEnumeratingWithState:&v18 objects:v29 count:16];
  if (v14)
  {
    id v15 = v14;
    uint64_t v16 = *(void *)v19;
    do
    {
      v17 = 0;
      do
      {
        if (*(void *)v19 != v16) {
          objc_enumerationMutation(v13);
        }
        [(CKShare *)self removeParticipant:*(void *)(*((void *)&v18 + 1) + 8 * (void)v17)];
        v17 = (char *)v17 + 1;
      }
      while (v15 != v17);
      id v15 = [v13 countByEnumeratingWithState:&v18 objects:v29 count:16];
    }
    while (v15);
  }
}

- (NSArray)fmf_otherParticipants
{
  v2 = [(CKShare *)self participants];
  v3 = [v2 fm_filter:&stru_1000A1578];

  return (NSArray *)v3;
}

@end