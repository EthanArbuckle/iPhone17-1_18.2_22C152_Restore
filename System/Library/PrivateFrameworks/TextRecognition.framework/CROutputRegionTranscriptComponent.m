@interface CROutputRegionTranscriptComponent
- (BOOL)isEqual:(id)a3;
- (CROutputRegion)outputRegion;
- (CROutputRegionTranscriptComponent)initWithOutputRegion:(id)a3 range:(_NSRange)a4;
- (_NSRange)representedRange;
- (id)copyWithZone:(_NSZone *)a3;
- (id)crCodableDataRepresentation;
@end

@implementation CROutputRegionTranscriptComponent

- (CROutputRegionTranscriptComponent)initWithOutputRegion:(id)a3 range:(_NSRange)a4
{
  NSUInteger length = a4.length;
  NSUInteger location = a4.location;
  id v8 = a3;
  v12.receiver = self;
  v12.super_class = (Class)CROutputRegionTranscriptComponent;
  v9 = [(CROutputRegionTranscriptComponent *)&v12 init];
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_outputRegion, a3);
    v10->_representedRange.NSUInteger location = location;
    v10->_representedRange.NSUInteger length = length;
  }

  return v10;
}

- (BOOL)isEqual:(id)a3
{
  v4 = (CROutputRegionTranscriptComponent *)a3;
  if (self == v4)
  {
    BOOL v12 = 1;
  }
  else
  {
    v5 = [(CROutputRegionTranscriptComponent *)self outputRegion];
    v6 = [(CROutputRegionTranscriptComponent *)v4 outputRegion];
    if ([v5 isEqual:v6])
    {
      uint64_t v7 = [(CROutputRegionTranscriptComponent *)self representedRange];
      uint64_t v9 = v8;
      BOOL v12 = v7 == [(CROutputRegionTranscriptComponent *)v4 representedRange] && v9 == v10;
    }
    else
    {
      BOOL v12 = 0;
    }
  }
  return v12;
}

- (id)copyWithZone:(_NSZone *)a3
{
  v4 = +[CROutputRegionTranscriptComponent allocWithZone:a3];
  v5 = [(CROutputRegionTranscriptComponent *)self outputRegion];
  uint64_t v6 = [(CROutputRegionTranscriptComponent *)self representedRange];
  uint64_t v8 = -[CROutputRegionTranscriptComponent initWithOutputRegion:range:](v4, "initWithOutputRegion:range:", v5, v6, v7);

  return v8;
}

- (id)crCodableDataRepresentation
{
  v3 = objc_opt_new();
  +[CRCodingUtilities appendInteger:11 toData:v3];
  v4 = [(CROutputRegionTranscriptComponent *)self outputRegion];
  +[CRCodingUtilities appendCodable:v4 toData:v3];

  uint64_t v5 = [(CROutputRegionTranscriptComponent *)self representedRange];
  +[CRCodingUtilities appendRange:toData:](CRCodingUtilities, "appendRange:toData:", v5, v6, v3);
  return v3;
}

- (CROutputRegion)outputRegion
{
  return (CROutputRegion *)objc_getProperty(self, a2, 8, 1);
}

- (_NSRange)representedRange
{
  objc_copyStruct(v4, &self->_representedRange, 16, 1, 0);
  NSUInteger v2 = v4[0];
  NSUInteger v3 = v4[1];
  result.NSUInteger length = v3;
  result.NSUInteger location = v2;
  return result;
}

- (void).cxx_destruct
{
}

@end