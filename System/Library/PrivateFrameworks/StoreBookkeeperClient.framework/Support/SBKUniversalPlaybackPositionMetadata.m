@interface SBKUniversalPlaybackPositionMetadata
+ (id)SBKPropertyValueForML3PropertyValue:(id)a3 ML3Property:(id)a4;
@end

@implementation SBKUniversalPlaybackPositionMetadata

+ (id)SBKPropertyValueForML3PropertyValue:(id)a3 ML3Property:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  if (qword_1000278A8 != -1) {
    dispatch_once(&qword_1000278A8, &stru_100020CA8);
  }
  uint64_t v7 = [(id)qword_1000278A0 objectForKey:v6];
  v8 = (void *)v7;
  if (v7)
  {
    (*(void (**)(uint64_t, id))(v7 + 16))(v7, v5);
    id v9 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    id v9 = v5;
  }
  v10 = v9;

  return v10;
}

@end