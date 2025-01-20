@interface NTKDSyncMessage
- (BOOL)isPartial;
- (id)copyWithoutPayload;
@end

@implementation NTKDSyncMessage

- (BOOL)isPartial
{
  v2 = [(NTKDSyncMessage *)self wideLoadId];
  BOOL v3 = v2 != 0;

  return v3;
}

- (id)copyWithoutPayload
{
  BOOL v3 = +[NTKDSyncMessage messageOfType:[(NTKDSyncMessage *)self messageType]];
  v4 = [(NTKDSyncMessage *)self faceUUID];
  [v3 setFaceUUID:v4];

  v5 = [(NTKDSyncMessage *)self label];
  [v3 setLabel:v5];

  [(NTKDSyncMessage *)self progress];
  objc_msgSend(v3, "setProgress:");
  v6 = [(NTKDSyncMessage *)self complicationCollectionIdentifier];
  [v3 setComplicationCollectionIdentifier:v6];

  v7 = [(NTKDSyncMessage *)self complicationClientID];
  [v3 setComplicationClientID:v7];

  v8 = [(NTKDSyncMessage *)self complicationDescriptor];
  [v3 setComplicationDescriptor:v8];

  v9 = [(NTKDSyncMessage *)self complicationFamily];
  [v3 setComplicationFamily:v9];

  v10 = [(NTKDSyncMessage *)self wideLoadId];
  [v3 setWideLoadId:v10];

  objc_msgSend(v3, "setNumberOfParts:", -[NTKDSyncMessage numberOfParts](self, "numberOfParts"));
  objc_msgSend(v3, "setPartNumber:", -[NTKDSyncMessage partNumber](self, "partNumber"));
  objc_msgSend(v3, "setMaxPartSize:", -[NTKDSyncMessage maxPartSize](self, "maxPartSize"));
  return v3;
}

@end