@interface SGTypeDescription
+ (id)typeDescriptionRepresenting:(unint64_t)a3 error:(id *)a4;
- (BOOL)getMTLDataType:(unint64_t *)a3;
- (BOOL)getMTLTextureType:(unint64_t *)a3;
- (BOOL)isEqual:(id)a3;
- (NSArray)properties;
- (NSString)description;
- (SGTypeDescription)init;
- (unsigned)alignment;
- (unsigned)offset;
- (unsigned)size;
- (void)setOffset:(unsigned int)a3;
@end

@implementation SGTypeDescription

- (NSArray)properties
{
  type metadata accessor for SGPropertyDescription();
  swift_bridgeObjectRetain();
  v2.super.isa = Array._bridgeToObjectiveC()().super.isa;
  swift_bridgeObjectRelease();
  return (NSArray *)v2.super.isa;
}

- (unsigned)size
{
  return (*(_DWORD **)((char *)&self->super.isa + OBJC_IVAR___SGTypeDescription_type))[14];
}

- (unsigned)alignment
{
  return (*(_DWORD **)((char *)&self->super.isa + OBJC_IVAR___SGTypeDescription_type))[15];
}

- (unsigned)offset
{
  NSArray v2 = (unsigned int *)((char *)self + OBJC_IVAR___SGTypeDescription_offset);
  swift_beginAccess();
  return *v2;
}

- (void)setOffset:(unsigned int)a3
{
  v4 = (unsigned int *)((char *)self + OBJC_IVAR___SGTypeDescription_offset);
  swift_beginAccess();
  unsigned int *v4 = a3;
}

- (BOOL)getMTLTextureType:(unint64_t *)a3
{
  return @objc SGTypeDescription.getMTLTextureType(_:)(self, (uint64_t)a2, (uint64_t *)a3, MetalDataType.MTLTextureType.getter);
}

- (BOOL)getMTLDataType:(unint64_t *)a3
{
  return @objc SGTypeDescription.getMTLTextureType(_:)(self, (uint64_t)a2, (uint64_t *)a3, MetalDataType.MTLDataType.getter);
}

- (BOOL)isEqual:(id)a3
{
  return @objc SGTypeDescription.isEqual(_:)(self, (uint64_t)a2, (uint64_t)a3, (uint64_t (*)(_OWORD *))SGTypeDescription.isEqual(_:));
}

+ (id)typeDescriptionRepresenting:(unint64_t)a3 error:(id *)a4
{
  id v4 = specialized static SGTypeDescription.create(_:)(a3);
  return v4;
}

- (NSString)description
{
  return (NSString *)@objc SGTypeDescription.description.getter(self, (uint64_t)a2, (void (*)(void *__return_ptr, void **, id))closure #1 in SGTypeDescription.description.getter);
}

- (SGTypeDescription)init
{
  result = (SGTypeDescription *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  swift_release();
  swift_bridgeObjectRelease();
}

@end