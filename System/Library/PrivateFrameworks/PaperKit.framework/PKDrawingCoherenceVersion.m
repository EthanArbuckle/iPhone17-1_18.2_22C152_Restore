@interface PKDrawingCoherenceVersion
+ (BOOL)supportsSecureCoding;
- (BOOL)isEqual:(id)a3;
- (PKDrawingCoherenceVersion)init;
- (PKDrawingCoherenceVersion)initWithCoder:(id)a3;
- (void)encodeWithCoder:(id)a3;
@end

@implementation PKDrawingCoherenceVersion

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  v5 = self;
  uint64_t v6 = UUID.data()();
  unint64_t v8 = v7;
  Class isa = Data._bridgeToObjectiveC()().super.isa;
  outlined consume of Data._Representation(v6, v8);
  objc_msgSend(v4, sel_encodeDataObject_, isa);
}

- (PKDrawingCoherenceVersion)initWithCoder:(id)a3
{
  return (PKDrawingCoherenceVersion *)PKDrawingCoherenceVersion.init(coder:)(a3);
}

- (BOOL)isEqual:(id)a3
{
  return @objc PKDrawingCoherenceVersion.isEqual(_:)(self, (uint64_t)a2, (uint64_t)a3, (uint64_t (*)(_OWORD *))PKDrawingCoherenceVersion.isEqual(_:));
}

- (PKDrawingCoherenceVersion)init
{
  result = (PKDrawingCoherenceVersion *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
}

@end