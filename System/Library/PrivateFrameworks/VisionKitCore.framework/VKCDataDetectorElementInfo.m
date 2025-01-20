@interface VKCDataDetectorElementInfo
+ (id)infoFromDataDetectorElement:(id)a3 analysis:(id)a4;
- (NSArray)boundingQuads;
- (NSString)text;
- (NSUUID)correlationIdentifier;
- (VKQuad)boundingQuad;
- (_NSRange)range;
- (id)debugDescription;
- (id)description;
- (unint64_t)types;
- (void)setBoundingQuad:(id)a3;
- (void)setBoundingQuads:(id)a3;
- (void)setCorrelationIdentifier:(id)a3;
- (void)setRange:(_NSRange)a3;
- (void)setText:(id)a3;
- (void)setTypes:(unint64_t)a3;
@end

@implementation VKCDataDetectorElementInfo

+ (id)infoFromDataDetectorElement:(id)a3 analysis:(id)a4
{
  id v5 = a3;
  v6 = [a4 imageAnalysisResult];
  v7 = objc_alloc_init(VKCDataDetectorElementInfo);
  -[VKCDataDetectorElementInfo setTypes:](v7, "setTypes:", [v5 dataDetectorTypes]);
  v8 = [v5 boundingQuads];
  [(VKCDataDetectorElementInfo *)v7 setBoundingQuads:v8];

  v9 = [(VKCDataDetectorElementInfo *)v7 boundingQuads];
  v10 = [(VKCDataDetectorElementInfo *)v7 boundingQuads];
  v11 = [v10 firstObject];
  [v11 averagedAngleFromBottomAndTopEdges];
  v12 = +[VKQuad quadFromUnionOfQuads:baselineAngle:](VKQuad, "quadFromUnionOfQuads:baselineAngle:", v9);
  [(VKCDataDetectorElementInfo *)v7 setBoundingQuad:v12];

  v13 = [v5 uuid];
  [(VKCDataDetectorElementInfo *)v7 setCorrelationIdentifier:v13];

  uint64_t v14 = objc_opt_class();
  v15 = VKDynamicCast(v14, (uint64_t)v5);

  if (v15)
  {
    v16 = [v6 text];
    uint64_t v17 = [v15 characterRange];
    v19 = objc_msgSend(v16, "vk_substringWithRange:", v17, v18);
    [(VKCDataDetectorElementInfo *)v7 setText:v19];

    uint64_t v20 = [v15 characterRange];
    uint64_t v22 = v21;
  }
  else
  {
    uint64_t v22 = 0;
    uint64_t v20 = 0x7FFFFFFFFFFFFFFFLL;
  }
  -[VKCDataDetectorElementInfo setRange:](v7, "setRange:", v20, v22);

  return v7;
}

- (id)description
{
  v3 = NSString;
  v4 = VKMUIStringForDDTypes([(VKCDataDetectorElementInfo *)self types]);
  id v5 = [(VKCDataDetectorElementInfo *)self boundingQuad];
  v6 = [(VKCDataDetectorElementInfo *)self boundingQuads];
  v7 = [v3 stringWithFormat:@"Data Detector Element: type: %@ \n boundingQuad: %@ \n boundingQuads: %@ ", v4, v5, v6];

  return v7;
}

- (id)debugDescription
{
  v3 = NSString;
  v4 = VKMUIStringForDDTypes([(VKCDataDetectorElementInfo *)self types]);
  id v5 = [(VKCDataDetectorElementInfo *)self text];
  v6 = [(VKCDataDetectorElementInfo *)self boundingQuad];
  v7 = [(VKCDataDetectorElementInfo *)self boundingQuads];
  v8 = [v3 stringWithFormat:@"Data Detector Element: type: %@ \n text: %@ \n boundingQuad: %@ \n boundingQuads: %@ ", v4, v5, v6, v7];

  return v8;
}

- (unint64_t)types
{
  return self->_types;
}

- (void)setTypes:(unint64_t)a3
{
  self->_types = a3;
}

- (NSString)text
{
  return self->_text;
}

- (void)setText:(id)a3
{
}

- (_NSRange)range
{
  NSUInteger length = self->_range.length;
  NSUInteger location = self->_range.location;
  result.NSUInteger length = length;
  result.NSUInteger location = location;
  return result;
}

- (void)setRange:(_NSRange)a3
{
  self->_range = a3;
}

- (VKQuad)boundingQuad
{
  return self->_boundingQuad;
}

- (void)setBoundingQuad:(id)a3
{
}

- (NSArray)boundingQuads
{
  return self->_boundingQuads;
}

- (void)setBoundingQuads:(id)a3
{
}

- (NSUUID)correlationIdentifier
{
  return self->_correlationIdentifier;
}

- (void)setCorrelationIdentifier:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_correlationIdentifier, 0);
  objc_storeStrong((id *)&self->_boundingQuads, 0);
  objc_storeStrong((id *)&self->_boundingQuad, 0);
  objc_storeStrong((id *)&self->_text, 0);
}

@end