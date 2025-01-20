@interface ICMoveDataSource
- (ICMoveDataSource)initWithCollectionView:(id)a3 cellProvider:(id)a4 indexer:(id)a5;
- (ICMoveDataSource)initWithCollectionView:(id)a3 sourceObjectIds:(id)a4;
@end

@implementation ICMoveDataSource

- (ICMoveDataSource)initWithCollectionView:(id)a3 sourceObjectIds:(id)a4
{
  sub_100031418(0, (unint64_t *)&qword_10069E810);
  unint64_t v5 = static Array._unconditionallyBridgeFromObjectiveC(_:)();
  return (ICMoveDataSource *)sub_100380BD8(a3, v5);
}

- (ICMoveDataSource)initWithCollectionView:(id)a3 cellProvider:(id)a4 indexer:(id)a5
{
  v7 = _Block_copy(a4);
  id v8 = a3;
  id v9 = a5;
  _Block_release(v7);
  result = (ICMoveDataSource *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
}

@end