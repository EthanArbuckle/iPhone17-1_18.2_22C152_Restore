@interface ICCloudClientCollaborationEditParams
+ (BOOL)supportsSecureCoding;
+ (id)descriptionForPositionType:(int64_t)a3;
+ (id)newIdentifierString;
+ (id)paramsForAddingTrackWithAdamID:(unint64_t)a3 itemUUID:(id)a4 itemPositionUUID:(id)a5 afterReferencePositionUUD:(id)a6;
+ (id)paramsForAddingTrackWithAdamID:(unint64_t)a3 itemUUID:(id)a4 itemPositionUUID:(id)a5 atPosition:(int64_t)a6;
+ (id)paramsForMovingTrackWithItemUUID:(id)a3 withNewItemPositionUUID:(id)a4 afterReferencePositionUUD:(id)a5;
+ (id)paramsForMovingTrackWithItemUUID:(id)a3 withNewItemPositionUUID:(id)a4 toPosition:(int64_t)a5;
+ (id)paramsForRemovingTrackWithItemUUID:(id)a3;
+ (id)paramsForSettingReaction:(id)a3 onTrackWithItemUUID:(id)a4;
+ (id)paramsForUnsettingReaction:(id)a3 onTrackWithItemUUID:(id)a4;
- (ICCloudClientCollaborationEditParams)initWithCoder:(id)a3;
- (NSDate)timestamp;
- (NSString)itemPositionUUID;
- (NSString)itemUUID;
- (NSString)reactionString;
- (NSString)referencePositionUUID;
- (id)description;
- (int64_t)positionType;
- (int64_t)type;
- (unint64_t)itemAdamID;
- (void)encodeWithCoder:(id)a3;
- (void)setReactionString:(id)a3;
@end

@implementation ICCloudClientCollaborationEditParams

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_timestamp, 0);
  objc_storeStrong((id *)&self->_reactionString, 0);
  objc_storeStrong((id *)&self->_referencePositionUUID, 0);
  objc_storeStrong((id *)&self->_itemPositionUUID, 0);

  objc_storeStrong((id *)&self->_itemUUID, 0);
}

- (NSDate)timestamp
{
  return self->_timestamp;
}

- (void)setReactionString:(id)a3
{
}

- (NSString)reactionString
{
  return self->_reactionString;
}

- (unint64_t)itemAdamID
{
  return self->_itemAdamID;
}

- (int64_t)positionType
{
  return self->_positionType;
}

- (NSString)referencePositionUUID
{
  return self->_referencePositionUUID;
}

- (NSString)itemPositionUUID
{
  return self->_itemPositionUUID;
}

- (NSString)itemUUID
{
  return self->_itemUUID;
}

- (int64_t)type
{
  return self->_type;
}

- (void)encodeWithCoder:(id)a3
{
  uint64_t type_low = LODWORD(self->_type);
  id v5 = a3;
  [v5 encodeInt32:type_low forKey:@"ICCloudClientCollaborationEditParamsTypeKey"];
  [v5 encodeObject:self->_itemUUID forKey:@"ICCloudClientCollaborationEditParamsItemUUIDKey"];
  [v5 encodeObject:self->_itemPositionUUID forKey:@"ICCloudClientCollaborationEditParamsItemPositionUUIDKey"];
  [v5 encodeObject:self->_referencePositionUUID forKey:@"ICCloudClientCollaborationEditParamsReferencePositionUUIDKey"];
  [v5 encodeInt32:LODWORD(self->_positionType) forKey:@"ICCloudClientCollaborationEditParamsPositionTypeKey"];
  [v5 encodeInt64:self->_itemAdamID forKey:@"ICCloudClientCollaborationEditParamsItemAdamIDKey"];
  [v5 encodeObject:self->_reactionString forKey:@"ICCloudClientCollaborationEditParamsReactionStringKey"];
  [v5 encodeObject:self->_timestamp forKey:@"ICCloudClientCollaborationEditParamsTimestampKey"];
}

- (ICCloudClientCollaborationEditParams)initWithCoder:(id)a3
{
  id v4 = a3;
  id v5 = objc_alloc_init(ICCloudClientCollaborationEditParams);
  v5->_type = (int)[v4 decodeInt32ForKey:@"ICCloudClientCollaborationEditParamsTypeKey"];
  uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"ICCloudClientCollaborationEditParamsItemUUIDKey"];
  itemUUID = v5->_itemUUID;
  v5->_itemUUID = (NSString *)v6;

  uint64_t v8 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"ICCloudClientCollaborationEditParamsItemPositionUUIDKey"];
  itemPositionUUID = v5->_itemPositionUUID;
  v5->_itemPositionUUID = (NSString *)v8;

  uint64_t v10 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"ICCloudClientCollaborationEditParamsReferencePositionUUIDKey"];
  referencePositionUUID = v5->_referencePositionUUID;
  v5->_referencePositionUUID = (NSString *)v10;

  v5->_positionType = (int)[v4 decodeInt32ForKey:@"ICCloudClientCollaborationEditParamsPositionTypeKey"];
  v5->_itemAdamID = [v4 decodeInt64ForKey:@"ICCloudClientCollaborationEditParamsItemAdamIDKey"];
  uint64_t v12 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"ICCloudClientCollaborationEditParamsReactionStringKey"];
  reactionString = v5->_reactionString;
  v5->_reactionString = (NSString *)v12;

  uint64_t v14 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"ICCloudClientCollaborationEditParamsTimestampKey"];

  timestamp = v5->_timestamp;
  v5->_timestamp = (NSDate *)v14;

  return v5;
}

- (id)description
{
  switch(self->_type)
  {
    case 1:
      v3 = NSString;
      uint64_t v4 = objc_opt_class();
      uint64_t v5 = v4;
      unint64_t itemAdamID = self->_itemAdamID;
      itemUUID = self->_itemUUID;
      itemPositionUUID = self->_itemPositionUUID;
      referencePositionUUID = self->_referencePositionUUID;
      if (referencePositionUUID) {
        uint64_t v10 = "after";
      }
      else {
        uint64_t v10 = "to";
      }
      if (referencePositionUUID)
      {
        [v3 stringWithFormat:@"<%@ %p: [ADD %lld %@/%@ %s %@]>", v4, self, itemAdamID, itemUUID, itemPositionUUID, v10, referencePositionUUID];
        goto LABEL_16;
      }
      v20 = +[ICCloudClientCollaborationEditParams descriptionForPositionType:self->_positionType];
      [v3 stringWithFormat:@"<%@ %p: [ADD %lld %@/%@ %s %@]>", v5, self, itemAdamID, itemUUID, itemPositionUUID, v10, v20];
      goto LABEL_22;
    case 2:
      [NSString stringWithFormat:@"<%@ %p: [REMOVE %@]>", objc_opt_class(), self, self->_itemUUID, v21, v22, v23, v24];
      goto LABEL_16;
    case 3:
      v11 = NSString;
      uint64_t v12 = objc_opt_class();
      uint64_t v13 = v12;
      uint64_t v14 = self->_itemUUID;
      v15 = self->_itemPositionUUID;
      v16 = self->_referencePositionUUID;
      if (v16) {
        v17 = "after";
      }
      else {
        v17 = "to";
      }
      if (v16)
      {
        [v11 stringWithFormat:@"<%@ %p: [MOVE %@/%@ %s %@]>", v12, self, v14, v15, v17, v16, v24];
        v18 = LABEL_16:;
      }
      else
      {
        v20 = +[ICCloudClientCollaborationEditParams descriptionForPositionType:self->_positionType];
        [v11 stringWithFormat:@"<%@ %p: [MOVE %@/%@ %s %@]>", v13, self, v14, v15, v17, v20, v24];
        v18 = LABEL_22:;
      }
      return v18;
    case 4:
      [NSString stringWithFormat:@"<%@ %p: [SET REACTION '%@' on %@]>", objc_opt_class(), self, self->_reactionString, self->_itemUUID, v22, v23, v24];
      goto LABEL_16;
    case 5:
      [NSString stringWithFormat:@"<%@ %p: [UNSET REACTION '%@' on %@]>", objc_opt_class(), self, self->_reactionString, self->_itemUUID, v22, v23, v24];
      goto LABEL_16;
    default:
      [NSString stringWithFormat:@"<%@ %p: [Uknown param type %ld]>", objc_opt_class(), self, self->_type, v21, v22, v23, v24];
      goto LABEL_16;
  }
}

+ (id)descriptionForPositionType:(int64_t)a3
{
  v3 = @"Uknown";
  if (a3 == 2) {
    v3 = @"End";
  }
  if (a3 == 1) {
    return @"Beginning";
  }
  else {
    return v3;
  }
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

+ (id)newIdentifierString
{
  v2 = [MEMORY[0x1E4F29128] UUID];
  v3 = [v2 UUIDString];
  uint64_t v4 = [v3 lowercaseString];

  return v4;
}

+ (id)paramsForUnsettingReaction:(id)a3 onTrackWithItemUUID:(id)a4
{
  uint64_t v5 = (NSString *)a3;
  uint64_t v6 = (NSString *)a4;
  v7 = objc_alloc_init(ICCloudClientCollaborationEditParams);
  itemUUID = v7->_itemUUID;
  v7->_type = 5;
  v7->_itemUUID = v6;
  v9 = v6;

  reactionString = v7->_reactionString;
  v7->_reactionString = v5;

  return v7;
}

+ (id)paramsForSettingReaction:(id)a3 onTrackWithItemUUID:(id)a4
{
  uint64_t v5 = (NSString *)a3;
  uint64_t v6 = (NSString *)a4;
  v7 = objc_alloc_init(ICCloudClientCollaborationEditParams);
  itemUUID = v7->_itemUUID;
  v7->_type = 4;
  v7->_itemUUID = v6;
  v9 = v6;

  reactionString = v7->_reactionString;
  v7->_reactionString = v5;
  v11 = v5;

  uint64_t v12 = [MEMORY[0x1E4F1C9C8] date];
  timestamp = v7->_timestamp;
  v7->_timestamp = (NSDate *)v12;

  return v7;
}

+ (id)paramsForMovingTrackWithItemUUID:(id)a3 withNewItemPositionUUID:(id)a4 toPosition:(int64_t)a5
{
  v7 = (NSString *)a3;
  uint64_t v8 = (NSString *)a4;
  v9 = objc_alloc_init(ICCloudClientCollaborationEditParams);
  itemUUID = v9->_itemUUID;
  v9->_type = 3;
  v9->_itemUUID = v7;
  v11 = v7;

  itemPositionUUID = v9->_itemPositionUUID;
  v9->_itemPositionUUID = v8;

  v9->_positionType = a5;

  return v9;
}

+ (id)paramsForMovingTrackWithItemUUID:(id)a3 withNewItemPositionUUID:(id)a4 afterReferencePositionUUD:(id)a5
{
  v7 = (NSString *)a3;
  uint64_t v8 = (NSString *)a4;
  v9 = (NSString *)a5;
  uint64_t v10 = objc_alloc_init(ICCloudClientCollaborationEditParams);
  itemUUID = v10->_itemUUID;
  v10->_type = 3;
  v10->_itemUUID = v7;
  uint64_t v12 = v7;

  itemPositionUUID = v10->_itemPositionUUID;
  v10->_itemPositionUUID = v8;
  uint64_t v14 = v8;

  referencePositionUUID = v10->_referencePositionUUID;
  v10->_referencePositionUUID = v9;

  return v10;
}

+ (id)paramsForRemovingTrackWithItemUUID:(id)a3
{
  v3 = (NSString *)a3;
  uint64_t v4 = objc_alloc_init(ICCloudClientCollaborationEditParams);
  itemUUID = v4->_itemUUID;
  v4->_type = 2;
  v4->_itemUUID = v3;

  return v4;
}

+ (id)paramsForAddingTrackWithAdamID:(unint64_t)a3 itemUUID:(id)a4 itemPositionUUID:(id)a5 atPosition:(int64_t)a6
{
  v9 = (NSString *)a4;
  uint64_t v10 = (NSString *)a5;
  v11 = objc_alloc_init(ICCloudClientCollaborationEditParams);
  v11->_unint64_t itemAdamID = a3;
  itemUUID = v11->_itemUUID;
  v11->_type = 1;
  v11->_itemUUID = v9;
  uint64_t v13 = v9;

  itemPositionUUID = v11->_itemPositionUUID;
  v11->_itemPositionUUID = v10;

  v11->_positionType = a6;

  return v11;
}

+ (id)paramsForAddingTrackWithAdamID:(unint64_t)a3 itemUUID:(id)a4 itemPositionUUID:(id)a5 afterReferencePositionUUD:(id)a6
{
  v9 = (NSString *)a4;
  uint64_t v10 = (NSString *)a5;
  v11 = (NSString *)a6;
  uint64_t v12 = objc_alloc_init(ICCloudClientCollaborationEditParams);
  v12->_unint64_t itemAdamID = a3;
  itemUUID = v12->_itemUUID;
  v12->_type = 1;
  v12->_itemUUID = v9;
  uint64_t v14 = v9;

  itemPositionUUID = v12->_itemPositionUUID;
  v12->_itemPositionUUID = v10;
  v16 = v10;

  referencePositionUUID = v12->_referencePositionUUID;
  v12->_referencePositionUUID = v11;

  return v12;
}

@end