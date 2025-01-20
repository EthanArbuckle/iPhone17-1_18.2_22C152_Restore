@interface SRUIFConversationInsertion
- (AceObject)aceObject;
- (BOOL)isImmersiveExperience;
- (BOOL)isSupplemental;
- (BOOL)isTransient;
- (NSIndexPath)indexPath;
- (NSString)aceCommandIdentifier;
- (SRUIFConversationInsertion)initWithConversationItemType:(int64_t)a3 aceObject:(id)a4 aceCommandIdentifier:(id)a5 transient:(BOOL)a6 supplemental:(BOOL)a7 immersiveExperience:(BOOL)a8 indexPath:(id)a9;
- (int64_t)conversationItemType;
@end

@implementation SRUIFConversationInsertion

- (SRUIFConversationInsertion)initWithConversationItemType:(int64_t)a3 aceObject:(id)a4 aceCommandIdentifier:(id)a5 transient:(BOOL)a6 supplemental:(BOOL)a7 immersiveExperience:(BOOL)a8 indexPath:(id)a9
{
  id v16 = a4;
  id v17 = a5;
  id v18 = a9;
  v26.receiver = self;
  v26.super_class = (Class)SRUIFConversationInsertion;
  v19 = [(SRUIFConversationInsertion *)&v26 init];
  v20 = v19;
  if (v19)
  {
    v19->_conversationItemType = a3;
    objc_storeStrong((id *)&v19->_aceObject, a4);
    uint64_t v21 = [v17 copy];
    aceCommandIdentifier = v20->_aceCommandIdentifier;
    v20->_aceCommandIdentifier = (NSString *)v21;

    v20->_transient = a6;
    v20->_supplemental = a7;
    v20->_immersiveExperience = a8;
    uint64_t v23 = [v18 copy];
    indexPath = v20->_indexPath;
    v20->_indexPath = (NSIndexPath *)v23;
  }
  return v20;
}

- (int64_t)conversationItemType
{
  return self->_conversationItemType;
}

- (AceObject)aceObject
{
  return self->_aceObject;
}

- (NSString)aceCommandIdentifier
{
  return self->_aceCommandIdentifier;
}

- (BOOL)isTransient
{
  return self->_transient;
}

- (BOOL)isSupplemental
{
  return self->_supplemental;
}

- (BOOL)isImmersiveExperience
{
  return self->_immersiveExperience;
}

- (NSIndexPath)indexPath
{
  return self->_indexPath;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_indexPath, 0);
  objc_storeStrong((id *)&self->_aceCommandIdentifier, 0);
  objc_storeStrong((id *)&self->_aceObject, 0);
}

@end