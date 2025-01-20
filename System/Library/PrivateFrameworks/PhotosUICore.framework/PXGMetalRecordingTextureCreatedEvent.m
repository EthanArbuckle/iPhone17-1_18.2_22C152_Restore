@interface PXGMetalRecordingTextureCreatedEvent
+ (id)eventWithTexture:(id)a3 options:(id)a4 recordingComponent:(int64_t)a5;
- (PXGMetalRecordingTextureCreatedEvent)initWithTexture:(id)a3 options:(id)a4 recordingComponent:(int64_t)a5;
- (id)serializable;
@end

@implementation PXGMetalRecordingTextureCreatedEvent

- (void).cxx_destruct
{
}

- (id)serializable
{
  v3 = objc_alloc_init(PXGMetalRecordingTextureCreatedEventSerializable);
  v4 = [(PXGMetalRecordingMetalSpriteTexture *)self->_recordingTexture serializable];
  [(PXGMetalRecordingTextureCreatedEventSerializable *)v3 setTexture:v4];

  v5 = objc_alloc_init(PXGTextureConverterOptionsSerializable);
  [(PXGMetalRecordingTextureCreatedEventSerializable *)v3 setOptions:v5];

  $FA15997C902EC2271369254F9448C610 options = self->_options;
  v7 = [(PXGMetalRecordingTextureCreatedEventSerializable *)v3 options];
  [v7 setTextureConverterOptions:options];

  return v3;
}

- (PXGMetalRecordingTextureCreatedEvent)initWithTexture:(id)a3 options:(id)a4 recordingComponent:(int64_t)a5
{
  id v8 = a3;
  v13.receiver = self;
  v13.super_class = (Class)PXGMetalRecordingTextureCreatedEvent;
  v9 = [(PXGTungstenRecordingEvent *)&v13 initWithComponent:a5 eventName:@"textureCreated"];
  if (v9)
  {
    v10 = [[PXGMetalRecordingMetalSpriteTexture alloc] initWithTexture:v8];
    recordingTexture = v9->_recordingTexture;
    v9->_recordingTexture = v10;

    v9->_$FA15997C902EC2271369254F9448C610 options = ($FA15997C902EC2271369254F9448C610)a4;
  }

  return v9;
}

+ (id)eventWithTexture:(id)a3 options:(id)a4 recordingComponent:(int64_t)a5
{
  id v7 = a3;
  id v8 = [[PXGMetalRecordingTextureCreatedEvent alloc] initWithTexture:v7 options:a4 recordingComponent:a5];

  return v8;
}

@end