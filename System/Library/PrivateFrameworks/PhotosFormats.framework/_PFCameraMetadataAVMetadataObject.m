@interface _PFCameraMetadataAVMetadataObject
+ (id)catBodyObjectWithFigEmbeddedCaptureDeviceObjectDictionary:(id)a3;
+ (id)dogBodyObjectWithFigEmbeddedCaptureDeviceObjectDictionary:(id)a3;
+ (id)humanBodyObjectWithFigEmbeddedCaptureDeviceObjectDictionary:(id)a3;
+ (id)humanFaceObjectWithFigEmbeddedCaptureDeviceObjectDictionary:(id)a3;
+ (id)objectWithFigEmbeddedCaptureDeviceObjectDictionary:(id)a3 type:(id)a4;
+ (id)salientObjectWithFigEmbeddedCaptureDeviceObjectDictionary:(id)a3;
- ($3CC8671D27C23BF42ADDB32F2B5E48AE)duration;
- ($3CC8671D27C23BF42ADDB32F2B5E48AE)time;
- (CGRect)bounds;
- (NSString)type;
- (_PFCameraMetadataAVMetadataObject)initWithType:(id)a3 bounds:(CGRect)a4 confidence:(int)a5;
- (int)confidence;
@end

@implementation _PFCameraMetadataAVMetadataObject

- (void).cxx_destruct
{
}

- (int)confidence
{
  return self->_confidence;
}

- (NSString)type
{
  return (NSString *)objc_getProperty(self, a2, 16, 1);
}

- (CGRect)bounds
{
  objc_copyStruct(v6, &self->_bounds, 32, 1, 0);
  double v2 = *(double *)v6;
  double v3 = *(double *)&v6[1];
  double v4 = *(double *)&v6[2];
  double v5 = *(double *)&v6[3];
  result.size.height = v5;
  result.size.width = v4;
  result.origin.y = v3;
  result.origin.x = v2;
  return result;
}

- ($3CC8671D27C23BF42ADDB32F2B5E48AE)duration
{
  *retstr = *($3CC8671D27C23BF42ADDB32F2B5E48AE *)*(void *)&MEMORY[0x1E4F1F9F8];
  return self;
}

- ($3CC8671D27C23BF42ADDB32F2B5E48AE)time
{
  *retstr = *($3CC8671D27C23BF42ADDB32F2B5E48AE *)*(void *)&MEMORY[0x1E4F1FA48];
  return self;
}

- (_PFCameraMetadataAVMetadataObject)initWithType:(id)a3 bounds:(CGRect)a4 confidence:(int)a5
{
  CGFloat height = a4.size.height;
  CGFloat width = a4.size.width;
  CGFloat y = a4.origin.y;
  CGFloat x = a4.origin.x;
  id v12 = a3;
  v16.receiver = self;
  v16.super_class = (Class)_PFCameraMetadataAVMetadataObject;
  v13 = [(_PFCameraMetadataAVMetadataObject *)&v16 init];
  v14 = v13;
  if (v13)
  {
    v13->_bounds.origin.CGFloat x = x;
    v13->_bounds.origin.CGFloat y = y;
    v13->_bounds.size.CGFloat width = width;
    v13->_bounds.size.CGFloat height = height;
    objc_storeStrong((id *)&v13->_type, a3);
    v14->_confidence = a5;
  }

  return v14;
}

+ (id)salientObjectWithFigEmbeddedCaptureDeviceObjectDictionary:(id)a3
{
  return (id)[a1 objectWithFigEmbeddedCaptureDeviceObjectDictionary:a3 type:*MEMORY[0x1E4F15E40]];
}

+ (id)dogBodyObjectWithFigEmbeddedCaptureDeviceObjectDictionary:(id)a3
{
  return (id)[a1 objectWithFigEmbeddedCaptureDeviceObjectDictionary:a3 type:*MEMORY[0x1E4F15E20]];
}

+ (id)catBodyObjectWithFigEmbeddedCaptureDeviceObjectDictionary:(id)a3
{
  return (id)[a1 objectWithFigEmbeddedCaptureDeviceObjectDictionary:a3 type:*MEMORY[0x1E4F15E18]];
}

+ (id)humanBodyObjectWithFigEmbeddedCaptureDeviceObjectDictionary:(id)a3
{
  return (id)[a1 objectWithFigEmbeddedCaptureDeviceObjectDictionary:a3 type:*MEMORY[0x1E4F15E38]];
}

+ (id)humanFaceObjectWithFigEmbeddedCaptureDeviceObjectDictionary:(id)a3
{
  return (id)[a1 objectWithFigEmbeddedCaptureDeviceObjectDictionary:a3 type:*MEMORY[0x1E4F15E30]];
}

+ (id)objectWithFigEmbeddedCaptureDeviceObjectDictionary:(id)a3 type:(id)a4
{
  CGSize v5 = *(CGSize *)(MEMORY[0x1E4F1DB28] + 16);
  v15.origin = (CGPoint)*MEMORY[0x1E4F1DB28];
  v15.size = v5;
  uint64_t v6 = *MEMORY[0x1E4F523F8];
  id v7 = a4;
  id v8 = a3;
  CFDictionaryRef v9 = [v8 objectForKeyedSubscript:v6];
  CGRectMakeWithDictionaryRepresentation(v9, &v15);

  v10 = [v8 objectForKeyedSubscript:*MEMORY[0x1E4F52390]];

  uint64_t v11 = [v10 intValue];
  id v12 = [_PFCameraMetadataAVMetadataObject alloc];
  v13 = -[_PFCameraMetadataAVMetadataObject initWithType:bounds:confidence:](v12, "initWithType:bounds:confidence:", v7, v11, *(_OWORD *)&v15.origin, *(_OWORD *)&v15.size);

  return v13;
}

@end