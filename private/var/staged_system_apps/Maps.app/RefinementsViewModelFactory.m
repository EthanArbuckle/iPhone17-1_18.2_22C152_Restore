@interface RefinementsViewModelFactory
+ (id)barViewModelWith:(id)a3;
+ (id)multiSelectRefinementsViewModelWith:(id)a3 tappedAtIndex:(int64_t)a4;
+ (id)openOptionsRefinementsViewModelWith:(id)a3 tappedAtIndex:(int64_t)a4;
+ (id)refinementsViewModelWithGroup:(id)a3;
+ (id)refinementsViewModelWithRefinementView:(id)a3;
- (_TtC4Maps27RefinementsViewModelFactory)init;
@end

@implementation RefinementsViewModelFactory

+ (id)barViewModelWith:(id)a3
{
  return sub_100245C88((uint64_t)a1, (uint64_t)a2, a3, (uint64_t (*)(void))sub_1002438B4);
}

+ (id)refinementsViewModelWithGroup:(id)a3
{
  id v3 = a3;
  id v4 = [v3 resultRefinementView];
  if (v4)
  {
    v5 = v4;
    swift_getObjCClassMetadata();
    id v6 = sub_100244848(v5);
  }
  else
  {

    id v6 = 0;
  }

  return v6;
}

+ (id)refinementsViewModelWithRefinementView:(id)a3
{
  return sub_100245C88((uint64_t)a1, (uint64_t)a2, a3, (uint64_t (*)(void))sub_100244848);
}

+ (id)multiSelectRefinementsViewModelWith:(id)a3 tappedAtIndex:(int64_t)a4
{
  id v5 = a3;
  id v6 = (void *)sub_1002469E4(v5, a4);

  return v6;
}

+ (id)openOptionsRefinementsViewModelWith:(id)a3 tappedAtIndex:(int64_t)a4
{
  id v5 = a3;
  id v6 = sub_1002471C4(v5, a4);

  return v6;
}

- (_TtC4Maps27RefinementsViewModelFactory)init
{
  v3.receiver = self;
  v3.super_class = (Class)type metadata accessor for RefinementsViewModelFactory();
  return [(RefinementsViewModelFactory *)&v3 init];
}

@end