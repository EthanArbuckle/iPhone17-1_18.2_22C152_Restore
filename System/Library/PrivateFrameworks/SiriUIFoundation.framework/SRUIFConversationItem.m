@interface SRUIFConversationItem
- (BOOL)isImmersiveExperience;
- (BOOL)isSupplemental;
- (BOOL)isTransient;
- (BOOL)isVirgin;
- (NSString)description;
- (SRUIFConversationItem)initWithDelegateItem:(id)a3;
- (SRUIFConversationItem)initWithIdentifier:(id)a3 revisionIdentifier:(id)a4 type:(int64_t)a5 aceObject:(id)a6 dialogPhase:(id)a7 presentationState:(int64_t)a8 aceCommandIdentifier:(id)a9 virgin:(BOOL)a10 transient:(BOOL)a11 supplemental:(BOOL)a12 immersiveExperience:(BOOL)a13 associatedDataStore:(id)a14;
- (SRUIFConversationItem)initWithType:(int64_t)a3 aceObject:(id)a4 dialogPhase:(id)a5 presentationState:(int64_t)a6 aceCommandIdentifier:(id)a7 virgin:(BOOL)a8 transient:(BOOL)a9 supplemental:(BOOL)a10 immersiveExperience:(BOOL)a11 associatedDataStore:(id)a12;
- (id)aceCommandIdentifier;
- (id)aceObject;
- (id)associatedDataStore;
- (id)dialogPhase;
- (id)identifier;
- (id)revisionIdentifier;
- (int64_t)presentationState;
- (int64_t)type;
@end

@implementation SRUIFConversationItem

- (SRUIFConversationItem)initWithDelegateItem:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)SRUIFConversationItem;
  v6 = [(SRUIFConversationItem *)&v9 init];
  v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_delegateItem, a3);
  }

  return v7;
}

- (SRUIFConversationItem)initWithIdentifier:(id)a3 revisionIdentifier:(id)a4 type:(int64_t)a5 aceObject:(id)a6 dialogPhase:(id)a7 presentationState:(int64_t)a8 aceCommandIdentifier:(id)a9 virgin:(BOOL)a10 transient:(BOOL)a11 supplemental:(BOOL)a12 immersiveExperience:(BOOL)a13 associatedDataStore:(id)a14
{
  id v18 = a14;
  id v19 = a9;
  id v20 = a7;
  id v21 = a6;
  id v22 = a4;
  id v23 = a3;
  BYTE3(v27) = a13;
  BYTE2(v27) = a12;
  LOWORD(v27) = __PAIR16__(a11, a10);
  v24 = -[SRUIFMutableConversationItem initWithIdentifier:revisionIdentifier:type:aceObject:dialogPhase:presentationState:aceCommandIdentifier:virgin:transient:supplemental:immersiveExperience:associatedDataStore:]([SRUIFMutableConversationItem alloc], "initWithIdentifier:revisionIdentifier:type:aceObject:dialogPhase:presentationState:aceCommandIdentifier:virgin:transient:supplemental:immersiveExperience:associatedDataStore:", v23, v22, a5, v21, v20, a8, v19, v27, v18);

  v25 = [(SRUIFConversationItem *)self initWithDelegateItem:v24];
  return v25;
}

- (SRUIFConversationItem)initWithType:(int64_t)a3 aceObject:(id)a4 dialogPhase:(id)a5 presentationState:(int64_t)a6 aceCommandIdentifier:(id)a7 virgin:(BOOL)a8 transient:(BOOL)a9 supplemental:(BOOL)a10 immersiveExperience:(BOOL)a11 associatedDataStore:(id)a12
{
  v16 = (objc_class *)MEMORY[0x263F08C38];
  id v17 = a12;
  id v18 = a7;
  id v19 = a5;
  id v20 = a4;
  id v21 = objc_alloc_init(v16);
  id v22 = objc_alloc_init(MEMORY[0x263F08C38]);
  BYTE3(v25) = a11;
  BYTE2(v25) = a10;
  BYTE1(v25) = a9;
  LOBYTE(v25) = a8;
  id v23 = -[SRUIFConversationItem initWithIdentifier:revisionIdentifier:type:aceObject:dialogPhase:presentationState:aceCommandIdentifier:virgin:transient:supplemental:immersiveExperience:associatedDataStore:](self, "initWithIdentifier:revisionIdentifier:type:aceObject:dialogPhase:presentationState:aceCommandIdentifier:virgin:transient:supplemental:immersiveExperience:associatedDataStore:", v21, v22, a3, v20, v19, a6, v18, v25, v17);

  return v23;
}

- (NSString)description
{
  return [(SRUIFMutableConversationItem *)self->_delegateItem description];
}

- (id)identifier
{
  return [(SRUIFMutableConversationItem *)self->_delegateItem identifier];
}

- (id)revisionIdentifier
{
  return [(SRUIFMutableConversationItem *)self->_delegateItem revisionIdentifier];
}

- (int64_t)type
{
  return [(SRUIFMutableConversationItem *)self->_delegateItem type];
}

- (id)aceObject
{
  return [(SRUIFMutableConversationItem *)self->_delegateItem aceObject];
}

- (id)dialogPhase
{
  return [(SRUIFMutableConversationItem *)self->_delegateItem dialogPhase];
}

- (id)aceCommandIdentifier
{
  return [(SRUIFMutableConversationItem *)self->_delegateItem aceCommandIdentifier];
}

- (int64_t)presentationState
{
  return [(SRUIFMutableConversationItem *)self->_delegateItem presentationState];
}

- (BOOL)isVirgin
{
  return [(SRUIFMutableConversationItem *)self->_delegateItem isVirgin];
}

- (BOOL)isTransient
{
  return [(SRUIFMutableConversationItem *)self->_delegateItem isTransient];
}

- (BOOL)isSupplemental
{
  return [(SRUIFMutableConversationItem *)self->_delegateItem isSupplemental];
}

- (BOOL)isImmersiveExperience
{
  return [(SRUIFMutableConversationItem *)self->_delegateItem isImmersiveExperience];
}

- (id)associatedDataStore
{
  return [(SRUIFMutableConversationItem *)self->_delegateItem associatedDataStore];
}

- (void).cxx_destruct
{
}

@end