@interface VFXREBindingMeshData
- (MTLBuffer)buffer;
- (VFXREBindingMeshData)init;
- (unint64_t)format;
- (unsigned)length;
- (unsigned)offset;
- (unsigned)stride;
- (void)setBuffer:(id)a3;
- (void)setFormat:(unint64_t)a3;
- (void)setLength:(unsigned int)a3;
- (void)setOffset:(unsigned __int16)a3;
- (void)setStride:(unsigned __int16)a3;
@end

@implementation VFXREBindingMeshData

- (MTLBuffer)buffer
{
  v2 = (void *)swift_unknownObjectRetain();

  return (MTLBuffer *)v2;
}

- (void)setBuffer:(id)a3
{
  *(Class *)((char *)&self->super.isa + OBJC_IVAR___VFXREBindingMeshData_buffer) = (Class)a3;
  swift_unknownObjectRetain();

  swift_unknownObjectRelease();
}

- (unsigned)length
{
  return *(_DWORD *)((char *)&self->super.isa + OBJC_IVAR___VFXREBindingMeshData_length);
}

- (void)setLength:(unsigned int)a3
{
  *(_DWORD *)((char *)&self->super.isa + OBJC_IVAR___VFXREBindingMeshData_length) = a3;
}

- (unint64_t)format
{
  return *(unint64_t *)((char *)&self->super.isa + OBJC_IVAR___VFXREBindingMeshData_format);
}

- (void)setFormat:(unint64_t)a3
{
  *(Class *)((char *)&self->super.isa + OBJC_IVAR___VFXREBindingMeshData_format) = (Class)a3;
}

- (unsigned)offset
{
  return *(_WORD *)((char *)&self->super.isa + OBJC_IVAR___VFXREBindingMeshData_offset);
}

- (void)setOffset:(unsigned __int16)a3
{
  *(_WORD *)((char *)&self->super.isa + OBJC_IVAR___VFXREBindingMeshData_offset) = a3;
}

- (unsigned)stride
{
  return *(_WORD *)((char *)&self->super.isa + OBJC_IVAR___VFXREBindingMeshData_stride);
}

- (void)setStride:(unsigned __int16)a3
{
  *(_WORD *)((char *)&self->super.isa + OBJC_IVAR___VFXREBindingMeshData_stride) = a3;
}

- (VFXREBindingMeshData)init
{
  *(Class *)((char *)&self->super.isa + OBJC_IVAR___VFXREBindingMeshData_buffer) = 0;
  *(_DWORD *)((char *)&self->super.isa + OBJC_IVAR___VFXREBindingMeshData_length) = 0;
  *(Class *)((char *)&self->super.isa + OBJC_IVAR___VFXREBindingMeshData_format) = 0;
  *(_WORD *)((char *)&self->super.isa + OBJC_IVAR___VFXREBindingMeshData_offset) = 0;
  *(_WORD *)((char *)&self->super.isa + OBJC_IVAR___VFXREBindingMeshData_stride) = 0;
  v3.receiver = self;
  v3.super_class = (Class)type metadata accessor for VFXREBindingMeshData();
  return [(VFXREBindingMeshData *)&v3 init];
}

- (void).cxx_destruct
{
}

@end