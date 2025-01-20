@interface STMutableMediaStatusDomainData
- (BOOL)applyDiff:(id)a3;
- (STMutableListData)cameraAttributionListData;
- (STMutableListData)microphoneAttributionListData;
- (STMutableListData)mutedMicrophoneRecordingAttributionListData;
- (STMutableListData)screenCaptureAttributionListData;
- (STMutableListData)systemAudioRecordingAttributionListData;
- (STMutableMediaStatusDomainData)initWithMicrophoneAttributionListData:(id)a3 mutedMicrophoneRecordingAttributionListData:(id)a4 systemAudioRecordingAttributionListData:(id)a5 cameraAttributionListData:(id)a6 screenCaptureAttributionListData:(id)a7;
- (id)copyWithZone:(_NSZone *)a3;
- (void)addCameraAttribution:(id)a3;
- (void)addCameraCaptureAttribution:(id)a3;
- (void)addMicrophoneAttribution:(id)a3;
- (void)addMicrophoneRecordingAttribution:(id)a3;
- (void)addMutedMicrophoneRecordingAttribution:(id)a3;
- (void)addScreenCaptureAttribution:(id)a3;
- (void)addSystemAudioRecordingAttribution:(id)a3;
- (void)removeCameraAttribution:(id)a3;
- (void)removeCameraCaptureAttribution:(id)a3;
- (void)removeMicrophoneAttribution:(id)a3;
- (void)removeMicrophoneRecordingAttribution:(id)a3;
- (void)removeMutedMicrophoneRecordingAttribution:(id)a3;
- (void)removeScreenCaptureAttribution:(id)a3;
- (void)removeSystemAudioRecordingAttribution:(id)a3;
- (void)setAudioRecordingAttributions:(id)a3;
- (void)setCameraAttributions:(id)a3;
- (void)setCameraCaptureAttributionList:(id)a3;
- (void)setCameraCaptureAttributions:(id)a3;
- (void)setMicrophoneAttributions:(id)a3;
- (void)setMicrophoneRecordingAttributions:(id)a3;
- (void)setMutedAudioRecordingAttributions:(id)a3;
- (void)setMutedMicrophoneRecordingAttributions:(id)a3;
- (void)setScreenCaptureAttributions:(id)a3;
- (void)setSystemAudioRecordingAttributions:(id)a3;
@end

@implementation STMutableMediaStatusDomainData

- (void)setCameraCaptureAttributionList:(id)a3
{
  if (a3)
  {
    objc_msgSend(a3, "bs_map:", &__block_literal_global_165);
    id v4 = (id)objc_claimAutoreleasedReturnValue();
    [(STMutableMediaStatusDomainData *)self setCameraAttributions:v4];
  }
}

- (void)setCameraAttributions:(id)a3
{
  id v8 = a3;
  if (v8)
  {
    id v4 = [(STMediaStatusDomainData *)self cameraAttributions];
    char v5 = [v4 isEqualToArray:v8];

    if ((v5 & 1) == 0)
    {
      v6 = [(STMutableMediaStatusDomainData *)self cameraAttributionListData];
      v7 = (void *)[v8 copy];
      [v6 setObjects:v7];
    }
  }
}

- (void)setMutedAudioRecordingAttributions:(id)a3
{
  id v4 = [a3 allObjects];
  [(STMutableMediaStatusDomainData *)self setMutedAudioRecordingAttributionList:v4];
}

- (void)setMutedMicrophoneRecordingAttributions:(id)a3
{
  id v8 = a3;
  if (v8)
  {
    id v4 = [(STMediaStatusDomainData *)self mutedMicrophoneRecordingAttributions];
    char v5 = [v4 isEqualToArray:v8];

    if ((v5 & 1) == 0)
    {
      v6 = [(STMutableMediaStatusDomainData *)self mutedMicrophoneRecordingAttributionListData];
      v7 = (void *)[v8 copy];
      [v6 setObjects:v7];
    }
  }
}

- (void)setMicrophoneAttributions:(id)a3
{
  id v8 = a3;
  if (v8)
  {
    id v4 = [(STMediaStatusDomainData *)self microphoneAttributions];
    char v5 = [v4 isEqualToArray:v8];

    if ((v5 & 1) == 0)
    {
      v6 = [(STMutableMediaStatusDomainData *)self microphoneAttributionListData];
      v7 = (void *)[v8 copy];
      [v6 setObjects:v7];
    }
  }
}

- (STMutableListData)mutedMicrophoneRecordingAttributionListData
{
  v4.receiver = self;
  v4.super_class = (Class)STMutableMediaStatusDomainData;
  v2 = [(STMediaStatusDomainData *)&v4 mutedMicrophoneRecordingAttributionListData];

  return (STMutableListData *)v2;
}

- (STMutableListData)cameraAttributionListData
{
  v4.receiver = self;
  v4.super_class = (Class)STMutableMediaStatusDomainData;
  v2 = [(STMediaStatusDomainData *)&v4 cameraAttributionListData];

  return (STMutableListData *)v2;
}

- (STMutableListData)systemAudioRecordingAttributionListData
{
  v4.receiver = self;
  v4.super_class = (Class)STMutableMediaStatusDomainData;
  v2 = [(STMediaStatusDomainData *)&v4 systemAudioRecordingAttributionListData];

  return (STMutableListData *)v2;
}

- (STMutableListData)screenCaptureAttributionListData
{
  v4.receiver = self;
  v4.super_class = (Class)STMutableMediaStatusDomainData;
  v2 = [(STMediaStatusDomainData *)&v4 screenCaptureAttributionListData];

  return (STMutableListData *)v2;
}

- (STMutableListData)microphoneAttributionListData
{
  v4.receiver = self;
  v4.super_class = (Class)STMutableMediaStatusDomainData;
  v2 = [(STMediaStatusDomainData *)&v4 microphoneAttributionListData];

  return (STMutableListData *)v2;
}

- (STMutableMediaStatusDomainData)initWithMicrophoneAttributionListData:(id)a3 mutedMicrophoneRecordingAttributionListData:(id)a4 systemAudioRecordingAttributionListData:(id)a5 cameraAttributionListData:(id)a6 screenCaptureAttributionListData:(id)a7
{
  id v12 = a7;
  id v13 = a6;
  id v14 = a5;
  id v15 = a4;
  v16 = (void *)[a3 mutableCopy];
  v17 = (void *)[v15 mutableCopy];

  v18 = (void *)[v14 mutableCopy];
  v19 = (void *)[v13 mutableCopy];

  v20 = (void *)[v12 mutableCopy];
  v23.receiver = self;
  v23.super_class = (Class)STMutableMediaStatusDomainData;
  v21 = [(STMediaStatusDomainData *)&v23 _initWithMicrophoneAttributionListData:v16 mutedMicrophoneRecordingAttributionListData:v17 systemAudioRecordingAttributionListData:v18 cameraAttributionListData:v19 screenCaptureAttributionListData:v20];

  return v21;
}

- (id)copyWithZone:(_NSZone *)a3
{
  objc_super v4 = +[STMediaStatusDomainData allocWithZone:a3];

  return -[STMediaStatusDomainData initWithData:](v4, self);
}

- (BOOL)applyDiff:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();
  if (isKindOfClass) {
    [v4 applyToMutableData:self];
  }

  return isKindOfClass & 1;
}

STMediaStatusDomainCameraCaptureAttribution *__66__STMutableMediaStatusDomainData_setCameraCaptureAttributionList___block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  v3 = [STMediaStatusDomainCameraCaptureAttribution alloc];
  id v4 = objc_alloc_init(STMediaStatusDomainCameraDescriptor);
  char v5 = [(STMediaStatusDomainCameraCaptureAttribution *)v3 initWithCameraDescriptor:v4 activityAttribution:v2];

  return v5;
}

- (void)setSystemAudioRecordingAttributions:(id)a3
{
  id v8 = a3;
  if (v8)
  {
    id v4 = [(STMediaStatusDomainData *)self systemAudioRecordingAttributions];
    char v5 = [v4 isEqualToArray:v8];

    if ((v5 & 1) == 0)
    {
      v6 = [(STMutableMediaStatusDomainData *)self systemAudioRecordingAttributionListData];
      v7 = (void *)[v8 copy];
      [v6 setObjects:v7];
    }
  }
}

- (void)setScreenCaptureAttributions:(id)a3
{
  id v8 = a3;
  if (v8)
  {
    id v4 = [(STMediaStatusDomainData *)self screenCaptureAttributions];
    char v5 = [v4 isEqualToArray:v8];

    if ((v5 & 1) == 0)
    {
      v6 = [(STMutableMediaStatusDomainData *)self screenCaptureAttributionListData];
      v7 = (void *)[v8 copy];
      [v6 setObjects:v7];
    }
  }
}

- (void)setCameraCaptureAttributions:(id)a3
{
  id v4 = [a3 allObjects];
  [(STMutableMediaStatusDomainData *)self setCameraCaptureAttributionList:v4];
}

- (void)addCameraAttribution:(id)a3
{
  if (a3)
  {
    id v4 = a3;
    id v5 = [(STMutableMediaStatusDomainData *)self cameraAttributionListData];
    [v5 addObject:v4];
  }
}

- (void)removeCameraAttribution:(id)a3
{
  if (a3)
  {
    id v4 = a3;
    id v5 = [(STMutableMediaStatusDomainData *)self cameraAttributionListData];
    [v5 removeObject:v4];
  }
}

- (void)addScreenCaptureAttribution:(id)a3
{
  if (a3)
  {
    id v4 = a3;
    id v5 = [(STMutableMediaStatusDomainData *)self screenCaptureAttributionListData];
    [v5 addObject:v4];
  }
}

- (void)removeScreenCaptureAttribution:(id)a3
{
  if (a3)
  {
    id v4 = a3;
    id v5 = [(STMutableMediaStatusDomainData *)self screenCaptureAttributionListData];
    [v5 removeObject:v4];
  }
}

- (void)addMicrophoneAttribution:(id)a3
{
  if (a3)
  {
    id v4 = a3;
    id v5 = [(STMutableMediaStatusDomainData *)self microphoneAttributionListData];
    [v5 addObject:v4];
  }
}

- (void)removeMicrophoneAttribution:(id)a3
{
  if (a3)
  {
    id v4 = a3;
    id v5 = [(STMutableMediaStatusDomainData *)self microphoneAttributionListData];
    [v5 removeObject:v4];
  }
}

- (void)setMicrophoneRecordingAttributions:(id)a3
{
  if (a3)
  {
    objc_msgSend(a3, "bs_map:", &__block_literal_global_163);
    id v4 = (id)objc_claimAutoreleasedReturnValue();
    [(STMutableMediaStatusDomainData *)self setMicrophoneAttributions:v4];
  }
}

STMediaStatusDomainMicrophoneRecordingAttribution *__69__STMutableMediaStatusDomainData_setMicrophoneRecordingAttributions___block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  v3 = [[STMediaStatusDomainMicrophoneRecordingAttribution alloc] initWithActivityAttribution:v2];

  return v3;
}

- (void)addMicrophoneRecordingAttribution:(id)a3
{
  if (a3)
  {
    id v4 = a3;
    id v5 = [[STMediaStatusDomainMicrophoneRecordingAttribution alloc] initWithActivityAttribution:v4];

    [(STMutableMediaStatusDomainData *)self addMicrophoneAttribution:v5];
  }
}

- (void)removeMicrophoneRecordingAttribution:(id)a3
{
  if (a3)
  {
    id v4 = a3;
    id v5 = [[STMediaStatusDomainMicrophoneRecordingAttribution alloc] initWithActivityAttribution:v4];

    [(STMutableMediaStatusDomainData *)self removeMicrophoneAttribution:v5];
  }
}

- (void)addMutedMicrophoneRecordingAttribution:(id)a3
{
  if (a3)
  {
    id v4 = a3;
    id v5 = [(STMutableMediaStatusDomainData *)self mutedMicrophoneRecordingAttributionListData];
    [v5 addObject:v4];
  }
}

- (void)removeMutedMicrophoneRecordingAttribution:(id)a3
{
  if (a3)
  {
    id v4 = a3;
    id v5 = [(STMutableMediaStatusDomainData *)self mutedMicrophoneRecordingAttributionListData];
    [v5 removeObject:v4];
  }
}

- (void)addSystemAudioRecordingAttribution:(id)a3
{
  if (a3)
  {
    id v4 = a3;
    id v5 = [(STMutableMediaStatusDomainData *)self systemAudioRecordingAttributionListData];
    [v5 addObject:v4];
  }
}

- (void)removeSystemAudioRecordingAttribution:(id)a3
{
  if (a3)
  {
    id v4 = a3;
    id v5 = [(STMutableMediaStatusDomainData *)self systemAudioRecordingAttributionListData];
    [v5 removeObject:v4];
  }
}

- (void)setAudioRecordingAttributions:(id)a3
{
  id v4 = [a3 allObjects];
  [(STMutableMediaStatusDomainData *)self setAudioRecordingAttributionList:v4];
}

- (void)addCameraCaptureAttribution:(id)a3
{
  if (a3)
  {
    id v4 = a3;
    id v5 = [STMediaStatusDomainCameraCaptureAttribution alloc];
    v7 = objc_alloc_init(STMediaStatusDomainCameraDescriptor);
    v6 = [(STMediaStatusDomainCameraCaptureAttribution *)v5 initWithCameraDescriptor:v7 activityAttribution:v4];

    [(STMutableMediaStatusDomainData *)self addCameraAttribution:v6];
  }
}

- (void)removeCameraCaptureAttribution:(id)a3
{
  if (a3)
  {
    id v4 = a3;
    id v5 = [STMediaStatusDomainCameraCaptureAttribution alloc];
    v7 = objc_alloc_init(STMediaStatusDomainCameraDescriptor);
    v6 = [(STMediaStatusDomainCameraCaptureAttribution *)v5 initWithCameraDescriptor:v7 activityAttribution:v4];

    [(STMutableMediaStatusDomainData *)self removeCameraAttribution:v6];
  }
}

@end