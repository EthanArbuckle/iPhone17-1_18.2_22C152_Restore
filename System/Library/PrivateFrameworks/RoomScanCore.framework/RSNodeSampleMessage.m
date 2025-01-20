@interface RSNodeSampleMessage
+ (id)new;
- (NSArray)keyFrames;
- (NSArray)mirrorPoints;
- (NSArray)objects;
- (NSDictionary)attachments;
- (RSFloorPlan)floorPlan;
- (RSFrame)frame;
- (RSGeometryMeta)geometryMeta;
- (RSNodeSampleMessage)init;
- (RSNodeSampleMessage)initWithFloorPlan:(id)a3;
- (RSNodeSampleMessage)initWithFrame:(id)a3;
- (RSNodeSampleMessage)initWithGeometryMeta:(id)a3;
- (RSNodeSampleMessage)initWithKeyFrames:(id)a3;
- (RSNodeSampleMessage)initWithMirrorPoints:(id)a3;
- (RSNodeSampleMessage)initWithObjects:(id)a3;
- (RSNodeSampleMessage)initWithPointCloud:(id)a3;
- (RSNodeSampleMessage)initWithSampleBuffer:(opaqueCMSampleBuffer *)a3 attachments:(id)a4;
- (RSNodeSampleMessage)initWithSemanticImage:(id)a3;
- (RSNodeSampleMessage)initWithTemporalMeta:(id)a3;
- (RSPointCloud)pointCloud;
- (RSSemanticImage)semanticImage;
- (RSTemporalMeta)temporalMeta;
- (opaqueCMSampleBuffer)sampleBuffer;
- (unint64_t)type;
- (void)dealloc;
@end

@implementation RSNodeSampleMessage

- (void).cxx_destruct
{
}

- (NSDictionary)attachments
{
  return self->_attachments;
}

- (opaqueCMSampleBuffer)sampleBuffer
{
  return self->_sampleBuffer;
}

- (void)dealloc
{
  sampleBuffer = self->_sampleBuffer;
  if (sampleBuffer)
  {
    CFRelease(sampleBuffer);
    self->_sampleBuffer = 0;
  }
  v4.receiver = self;
  v4.super_class = (Class)RSNodeSampleMessage;
  [(RSNodeSampleMessage *)&v4 dealloc];
}

- (RSNodeSampleMessage)initWithSampleBuffer:(opaqueCMSampleBuffer *)a3 attachments:(id)a4
{
  id v6 = a4;
  v13.receiver = self;
  v13.super_class = (Class)RSNodeSampleMessage;
  v9 = [(RSNodeSampleMessage *)&v13 init];
  if (v9)
  {
    if (a3) {
      v10 = (opaqueCMSampleBuffer *)CFRetain(a3);
    }
    else {
      v10 = 0;
    }
    v9->_sampleBuffer = v10;
    if (v6) {
      v11 = objc_msgSend_copy(v6, v7, v8);
    }
    else {
      v11 = 0;
    }
    objc_storeStrong((id *)&v9->_attachments, v11);
    if (v6) {
  }
    }
  return v9;
}

- (RSNodeSampleMessage)init
{
  result = (RSNodeSampleMessage *)objc_msgSend_doesNotRecognizeSelector_(self, a2, (uint64_t)a2);
  __break(1u);
  return result;
}

- (unint64_t)type
{
  return 1;
}

+ (id)new
{
  id result = (id)objc_msgSend_doesNotRecognizeSelector_(a1, a2, (uint64_t)a2);
  __break(1u);
  return result;
}

- (RSNodeSampleMessage)initWithMirrorPoints:(id)a3
{
  v12[1] = *MEMORY[0x263EF8340];
  v11 = @"_RSNodeSampleMessageMirrorPointsAttachmentKey";
  v12[0] = a3;
  objc_super v4 = NSDictionary;
  id v5 = a3;
  v7 = objc_msgSend_dictionaryWithObjects_forKeys_count_(v4, v6, (uint64_t)v12, &v11, 1);

  v9 = (RSNodeSampleMessage *)objc_msgSend_initWithSampleBuffer_attachments_(self, v8, 0, v7);
  return v9;
}

- (NSArray)mirrorPoints
{
  v3 = objc_msgSend_attachments(self, a2, v2);
  id v5 = v3;
  if (v3)
  {
    id v6 = objc_msgSend_objectForKeyedSubscript_(v3, v4, @"_RSNodeSampleMessageMirrorPointsAttachmentKey");
  }
  else
  {
    id v6 = 0;
  }

  return (NSArray *)v6;
}

- (RSNodeSampleMessage)initWithObjects:(id)a3
{
  v12[1] = *MEMORY[0x263EF8340];
  v11 = @"_RSNodeSampleMessageObjectsAttachmentKey";
  v12[0] = a3;
  objc_super v4 = NSDictionary;
  id v5 = a3;
  v7 = objc_msgSend_dictionaryWithObjects_forKeys_count_(v4, v6, (uint64_t)v12, &v11, 1);

  v9 = (RSNodeSampleMessage *)objc_msgSend_initWithSampleBuffer_attachments_(self, v8, 0, v7);
  return v9;
}

- (NSArray)objects
{
  v3 = objc_msgSend_attachments(self, a2, v2);
  id v5 = v3;
  if (v3)
  {
    id v6 = objc_msgSend_objectForKeyedSubscript_(v3, v4, @"_RSNodeSampleMessageObjectsAttachmentKey");
  }
  else
  {
    id v6 = 0;
  }

  return (NSArray *)v6;
}

- (RSNodeSampleMessage)initWithKeyFrames:(id)a3
{
  v12[1] = *MEMORY[0x263EF8340];
  v11 = @"_RSNodeSampleMessageKeyFramesAttachmentKey";
  v12[0] = a3;
  objc_super v4 = NSDictionary;
  id v5 = a3;
  v7 = objc_msgSend_dictionaryWithObjects_forKeys_count_(v4, v6, (uint64_t)v12, &v11, 1);

  v9 = (RSNodeSampleMessage *)objc_msgSend_initWithSampleBuffer_attachments_(self, v8, 0, v7);
  return v9;
}

- (NSArray)keyFrames
{
  v3 = objc_msgSend_attachments(self, a2, v2);
  id v5 = v3;
  if (v3)
  {
    id v6 = objc_msgSend_objectForKeyedSubscript_(v3, v4, @"_RSNodeSampleMessageKeyFramesAttachmentKey");
  }
  else
  {
    id v6 = 0;
  }

  return (NSArray *)v6;
}

- (RSNodeSampleMessage)initWithSemanticImage:(id)a3
{
  v12[1] = *MEMORY[0x263EF8340];
  v11 = @"_RSNodeSampleMessageSemanticImageAttachmentKey";
  v12[0] = a3;
  objc_super v4 = NSDictionary;
  id v5 = a3;
  v7 = objc_msgSend_dictionaryWithObjects_forKeys_count_(v4, v6, (uint64_t)v12, &v11, 1);

  v9 = (RSNodeSampleMessage *)objc_msgSend_initWithSampleBuffer_attachments_(self, v8, 0, v7);
  return v9;
}

- (RSSemanticImage)semanticImage
{
  v3 = objc_msgSend_attachments(self, a2, v2);
  id v5 = v3;
  if (v3)
  {
    id v6 = objc_msgSend_objectForKeyedSubscript_(v3, v4, @"_RSNodeSampleMessageSemanticImageAttachmentKey");
  }
  else
  {
    id v6 = 0;
  }

  return (RSSemanticImage *)v6;
}

- (RSNodeSampleMessage)initWithGeometryMeta:(id)a3
{
  v12[1] = *MEMORY[0x263EF8340];
  v11 = @"_RSNodeSampleMessageGeometryMetaAttachmentKey";
  v12[0] = a3;
  objc_super v4 = NSDictionary;
  id v5 = a3;
  v7 = objc_msgSend_dictionaryWithObjects_forKeys_count_(v4, v6, (uint64_t)v12, &v11, 1);

  v9 = (RSNodeSampleMessage *)objc_msgSend_initWithSampleBuffer_attachments_(self, v8, 0, v7);
  return v9;
}

- (RSGeometryMeta)geometryMeta
{
  v3 = objc_msgSend_attachments(self, a2, v2);
  id v5 = v3;
  if (v3)
  {
    id v6 = objc_msgSend_objectForKeyedSubscript_(v3, v4, @"_RSNodeSampleMessageGeometryMetaAttachmentKey");
  }
  else
  {
    id v6 = 0;
  }

  return (RSGeometryMeta *)v6;
}

- (RSNodeSampleMessage)initWithTemporalMeta:(id)a3
{
  v12[1] = *MEMORY[0x263EF8340];
  v11 = @"_RSNodeSampleMessageTemporalMetaAttachmentKey";
  v12[0] = a3;
  objc_super v4 = NSDictionary;
  id v5 = a3;
  v7 = objc_msgSend_dictionaryWithObjects_forKeys_count_(v4, v6, (uint64_t)v12, &v11, 1);

  v9 = (RSNodeSampleMessage *)objc_msgSend_initWithSampleBuffer_attachments_(self, v8, 0, v7);
  return v9;
}

- (RSTemporalMeta)temporalMeta
{
  v3 = objc_msgSend_attachments(self, a2, v2);
  id v5 = v3;
  if (v3)
  {
    id v6 = objc_msgSend_objectForKeyedSubscript_(v3, v4, @"_RSNodeSampleMessageTemporalMetaAttachmentKey");
  }
  else
  {
    id v6 = 0;
  }

  return (RSTemporalMeta *)v6;
}

- (RSNodeSampleMessage)initWithFloorPlan:(id)a3
{
  v12[1] = *MEMORY[0x263EF8340];
  v11 = @"_RSNodeSampleMessageFloorPlanAttachmentKey";
  v12[0] = a3;
  objc_super v4 = NSDictionary;
  id v5 = a3;
  v7 = objc_msgSend_dictionaryWithObjects_forKeys_count_(v4, v6, (uint64_t)v12, &v11, 1);

  v9 = (RSNodeSampleMessage *)objc_msgSend_initWithSampleBuffer_attachments_(self, v8, 0, v7);
  return v9;
}

- (RSFloorPlan)floorPlan
{
  v3 = objc_msgSend_attachments(self, a2, v2);
  id v5 = v3;
  if (v3)
  {
    id v6 = objc_msgSend_objectForKeyedSubscript_(v3, v4, @"_RSNodeSampleMessageFloorPlanAttachmentKey");
  }
  else
  {
    id v6 = 0;
  }

  return (RSFloorPlan *)v6;
}

- (RSNodeSampleMessage)initWithPointCloud:(id)a3
{
  v12[1] = *MEMORY[0x263EF8340];
  v11 = @"_RSNodeSampleMessagePointCloudAttachmentKey";
  v12[0] = a3;
  objc_super v4 = NSDictionary;
  id v5 = a3;
  v7 = objc_msgSend_dictionaryWithObjects_forKeys_count_(v4, v6, (uint64_t)v12, &v11, 1);

  v9 = (RSNodeSampleMessage *)objc_msgSend_initWithSampleBuffer_attachments_(self, v8, 0, v7);
  return v9;
}

- (RSPointCloud)pointCloud
{
  v3 = objc_msgSend_attachments(self, a2, v2);
  id v5 = v3;
  if (v3)
  {
    id v6 = objc_msgSend_objectForKeyedSubscript_(v3, v4, @"_RSNodeSampleMessagePointCloudAttachmentKey");
  }
  else
  {
    id v6 = 0;
  }

  return (RSPointCloud *)v6;
}

- (RSNodeSampleMessage)initWithFrame:(id)a3
{
  v12[1] = *MEMORY[0x263EF8340];
  v11 = @"_RSNodeSampleMessageFrameAttachmentKey";
  v12[0] = a3;
  objc_super v4 = NSDictionary;
  id v5 = a3;
  v7 = objc_msgSend_dictionaryWithObjects_forKeys_count_(v4, v6, (uint64_t)v12, &v11, 1);

  v9 = (RSNodeSampleMessage *)objc_msgSend_initWithSampleBuffer_attachments_(self, v8, 0, v7);
  return v9;
}

- (RSFrame)frame
{
  v3 = objc_msgSend_attachments(self, a2, v2);
  id v5 = v3;
  if (v3)
  {
    id v6 = objc_msgSend_objectForKeyedSubscript_(v3, v4, @"_RSNodeSampleMessageFrameAttachmentKey");
  }
  else
  {
    id v6 = 0;
  }

  return (RSFrame *)v6;
}

@end