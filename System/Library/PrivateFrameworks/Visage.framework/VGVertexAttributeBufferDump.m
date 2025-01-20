@interface VGVertexAttributeBufferDump
+ (BOOL)supportsSecureCoding;
- (IOSurface)iosurface;
- (VGVertexAttributeBufferDump)initWithCoder:(id)a3;
- (unint64_t)elementCount;
- (unint64_t)numBytes;
- (unint64_t)vertexFormat;
- (void)encodeWithCoder:(id)a3;
- (void)setElementCount:(unint64_t)a3;
- (void)setIosurface:(id)a3;
- (void)setVertexFormat:(unint64_t)a3;
@end

@implementation VGVertexAttributeBufferDump

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  id v10 = a3;
  unint64_t v4 = [(VGVertexAttributeBufferDump *)self vertexFormat];
  v5 = NSStringFromSelector(sel_vertexFormat);
  [v10 encodeInt:v4 forKey:v5];

  unint64_t v6 = [(VGVertexAttributeBufferDump *)self elementCount];
  v7 = NSStringFromSelector(sel_elementCount);
  [v10 encodeInt:v6 forKey:v7];

  iosurface = self->_iosurface;
  v9 = NSStringFromSelector(sel_iosurface);
  objc_msgSend(v10, "vg_encodeSurface:forKey:", iosurface, v9);
}

- (VGVertexAttributeBufferDump)initWithCoder:(id)a3
{
  id v4 = a3;
  v13.receiver = self;
  v13.super_class = (Class)VGVertexAttributeBufferDump;
  v5 = [(VGVertexAttributeBufferDump *)&v13 init];
  if (v5)
  {
    unint64_t v6 = NSStringFromSelector(sel_vertexFormat);
    v5->_vertexFormat = (int)[v4 decodeIntForKey:v6];

    v7 = NSStringFromSelector(sel_elementCount);
    v5->_elementCount = (int)[v4 decodeIntForKey:v7];

    v8 = NSStringFromSelector(sel_iosurface);
    uint64_t v9 = objc_msgSend(v4, "vg_decodeSurfaceForKey:", v8);
    iosurface = v5->_iosurface;
    v5->_iosurface = (IOSurface *)v9;

    v11 = v5;
  }

  return v5;
}

- (unint64_t)numBytes
{
  uint64_t v2 = 4;
  switch(self->_vertexFormat)
  {
    case 3uLL:
    case 6uLL:
    case 0x10uLL:
    case 0x19uLL:
    case 0x1CuLL:
    case 0x24uLL:
      return self->_elementCount * v2;
    case 0x11uLL:
    case 0x1AuLL:
      uint64_t v2 = 6;
      break;
    case 0x12uLL:
    case 0x1BuLL:
    case 0x1DuLL:
    case 0x25uLL:
      uint64_t v2 = 8;
      break;
    case 0x1EuLL:
    case 0x26uLL:
      uint64_t v2 = 12;
      break;
    case 0x1FuLL:
    case 0x27uLL:
      uint64_t v2 = 16;
      break;
    default:
      uint64_t v2 = 0;
      break;
  }
  return self->_elementCount * v2;
}

- (unint64_t)vertexFormat
{
  return self->_vertexFormat;
}

- (void)setVertexFormat:(unint64_t)a3
{
  self->_vertexFormat = a3;
}

- (unint64_t)elementCount
{
  return self->_elementCount;
}

- (void)setElementCount:(unint64_t)a3
{
  self->_elementCount = a3;
}

- (IOSurface)iosurface
{
  return self->_iosurface;
}

- (void)setIosurface:(id)a3
{
}

- (void).cxx_destruct
{
}

@end