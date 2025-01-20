@interface PKPassPresentationContext
+ (PKPassPresentationContext)contextWithAdditionalPassUniqueIdentifiers:(id)a3;
+ (PKPassPresentationContext)contextWithWasAutomaticallySelected:(BOOL)a3 additionalPassUniqueIdentifiers:(id)a4;
+ (PKPassPresentationContext)contextWithWasAutomaticallySelected:(BOOL)a3 additionalPassUniqueIdentifiers:(id)a4 userInfo:(id)a5;
+ (PKPassPresentationContext)contextWithWasAutomaticallySelected:(BOOL)a3 additionalPassUniqueIdentifiers:(id)a4 userInfo:(id)a5 terminalType:(int64_t)a6;
- (BOOL)isFieldDetect;
- (BOOL)isPostPayment;
- (BOOL)limitServerLoad;
- (BOOL)presentFanned;
- (BOOL)wantsForcedPayment;
- (BOOL)wantsPersistentCardEmulation;
- (BOOL)wasAutomaticallySelected;
- (BOOL)wasForcedFromButton;
- (NSArray)additionalPassUniqueIdentifiers;
- (NSCopying)userInfo;
- (NSData)externalizedAuthenticationContext;
- (PKBackgroundContactlessInterfaceSessionController)backgroundSession;
- (id)description;
- (int64_t)standaloneTransactionType;
- (int64_t)terminalType;
- (unint64_t)presentationSource;
- (void)setAdditionalPassUniqueIdentifiers:(id)a3;
- (void)setBackgroundSession:(id)a3;
- (void)setExternalizedAuthenticationContext:(id)a3;
- (void)setFieldDetect:(BOOL)a3;
- (void)setForcePayment:(BOOL)a3;
- (void)setForcedFromButton:(BOOL)a3;
- (void)setLimitServerLoad:(BOOL)a3;
- (void)setPersistentCardEmulation:(BOOL)a3;
- (void)setPostPayment:(BOOL)a3;
- (void)setPresentFanned:(BOOL)a3;
- (void)setPresentationSource:(unint64_t)a3;
- (void)setStandaloneTransactionType:(int64_t)a3;
- (void)setTerminalType:(int64_t)a3;
- (void)setUserInfo:(id)a3;
- (void)setWasAutomaticallySelected:(BOOL)a3;
@end

@implementation PKPassPresentationContext

+ (PKPassPresentationContext)contextWithAdditionalPassUniqueIdentifiers:(id)a3
{
  return (PKPassPresentationContext *)[a1 contextWithWasAutomaticallySelected:0 additionalPassUniqueIdentifiers:a3];
}

+ (PKPassPresentationContext)contextWithWasAutomaticallySelected:(BOOL)a3 additionalPassUniqueIdentifiers:(id)a4
{
  return (PKPassPresentationContext *)[a1 contextWithWasAutomaticallySelected:a3 additionalPassUniqueIdentifiers:a4 userInfo:0];
}

+ (PKPassPresentationContext)contextWithWasAutomaticallySelected:(BOOL)a3 additionalPassUniqueIdentifiers:(id)a4 userInfo:(id)a5
{
  return (PKPassPresentationContext *)[a1 contextWithWasAutomaticallySelected:a3 additionalPassUniqueIdentifiers:a4 userInfo:a5 terminalType:0];
}

+ (PKPassPresentationContext)contextWithWasAutomaticallySelected:(BOOL)a3 additionalPassUniqueIdentifiers:(id)a4 userInfo:(id)a5 terminalType:(int64_t)a6
{
  BOOL v8 = a3;
  id v9 = a5;
  id v10 = a4;
  v11 = objc_alloc_init(PKPassPresentationContext);
  [(PKPassPresentationContext *)v11 setAdditionalPassUniqueIdentifiers:v10];

  [(PKPassPresentationContext *)v11 setWasAutomaticallySelected:v8];
  [(PKPassPresentationContext *)v11 setUserInfo:v9];

  [(PKPassPresentationContext *)v11 setTerminalType:a6];

  return v11;
}

- (id)description
{
  v3 = NSString;
  uint64_t v4 = objc_opt_class();
  if (self->_wasAutomaticallySelected) {
    v5 = @"YES";
  }
  else {
    v5 = @"NO";
  }
  return (id)objc_msgSend(v3, "stringWithFormat:", @"<%@: %p; wasAutomaticallySelected: %@; additionalPassUniqueIdentifiers: %@; userInfo: %@; >",
               v4,
               self,
               v5,
               self->_additionalPassUniqueIdentifiers,
               self->_userInfo);
}

- (BOOL)isFieldDetect
{
  return self->_fieldDetect;
}

- (void)setFieldDetect:(BOOL)a3
{
  self->_fieldDetect = a3;
}

- (int64_t)terminalType
{
  return self->_terminalType;
}

- (void)setTerminalType:(int64_t)a3
{
  self->_terminalType = a3;
}

- (BOOL)isPostPayment
{
  return self->_postPayment;
}

- (void)setPostPayment:(BOOL)a3
{
  self->_postPayment = a3;
}

- (int64_t)standaloneTransactionType
{
  return self->_standaloneTransactionType;
}

- (void)setStandaloneTransactionType:(int64_t)a3
{
  self->_standaloneTransactionType = a3;
}

- (BOOL)wantsForcedPayment
{
  return self->_forcePayment;
}

- (void)setForcePayment:(BOOL)a3
{
  self->_forcePayment = a3;
}

- (BOOL)wantsPersistentCardEmulation
{
  return self->_persistentCardEmulation;
}

- (void)setPersistentCardEmulation:(BOOL)a3
{
  self->_persistentCardEmulation = a3;
}

- (NSArray)additionalPassUniqueIdentifiers
{
  return self->_additionalPassUniqueIdentifiers;
}

- (void)setAdditionalPassUniqueIdentifiers:(id)a3
{
}

- (BOOL)wasAutomaticallySelected
{
  return self->_wasAutomaticallySelected;
}

- (void)setWasAutomaticallySelected:(BOOL)a3
{
  self->_wasAutomaticallySelected = a3;
}

- (BOOL)wasForcedFromButton
{
  return self->_forcedFromButton;
}

- (void)setForcedFromButton:(BOOL)a3
{
  self->_forcedFromButton = a3;
}

- (NSCopying)userInfo
{
  return self->_userInfo;
}

- (void)setUserInfo:(id)a3
{
}

- (BOOL)limitServerLoad
{
  return self->_limitServerLoad;
}

- (void)setLimitServerLoad:(BOOL)a3
{
  self->_limitServerLoad = a3;
}

- (BOOL)presentFanned
{
  return self->_presentFanned;
}

- (void)setPresentFanned:(BOOL)a3
{
  self->_presentFanned = a3;
}

- (NSData)externalizedAuthenticationContext
{
  return self->_externalizedAuthenticationContext;
}

- (void)setExternalizedAuthenticationContext:(id)a3
{
}

- (PKBackgroundContactlessInterfaceSessionController)backgroundSession
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_backgroundSession);

  return (PKBackgroundContactlessInterfaceSessionController *)WeakRetained;
}

- (void)setBackgroundSession:(id)a3
{
}

- (unint64_t)presentationSource
{
  return self->_presentationSource;
}

- (void)setPresentationSource:(unint64_t)a3
{
  self->_presentationSource = a3;
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_backgroundSession);
  objc_storeStrong((id *)&self->_externalizedAuthenticationContext, 0);
  objc_storeStrong((id *)&self->_userInfo, 0);

  objc_storeStrong((id *)&self->_additionalPassUniqueIdentifiers, 0);
}

@end