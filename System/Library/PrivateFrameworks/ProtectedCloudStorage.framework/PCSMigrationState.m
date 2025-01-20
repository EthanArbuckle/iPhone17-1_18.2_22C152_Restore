@interface PCSMigrationState
- (BOOL)BOOLOption:(__CFString *)a3;
- (BOOL)brokenEncryptedMetadatakeys;
- (BOOL)done;
- (BOOL)dropHSM;
- (BOOL)escrowMissing;
- (BOOL)iCDP;
- (BOOL)iCDPArmed;
- (BOOL)iCDPHSM;
- (BOOL)iCDPHSMArmed;
- (BOOL)iCDPHSMPlesio;
- (BOOL)iCDPHSMWalrus;
- (BOOL)iCDPPlesio;
- (BOOL)modified;
- (BOOL)needPassword;
- (BOOL)newIdentity;
- (BOOL)requireIdentityInHSM;
- (BOOL)restart;
- (BOOL)restoreHSM;
- (BOOL)triggerUpdate;
- (_PCSIdentityData)escrowIdentity;
- (_PCSIdentitySetData)set;
- (_PCSMigrationStep)currentStep;
- (_PCSMigrationStep)firstStep;
- (__CFArray)limitLocalStoring;
- (__CFArray)missingFromRegistry;
- (__CFArray)removeFromRegistry;
- (__CFData)classicContent;
- (__CFData)escrowMergeNeeded;
- (__CFData)newHSMContent;
- (__CFDictionary)metadata;
- (__CFDictionary)oldRegistry;
- (__CFDictionary)options;
- (__CFDictionary)stableMetadata;
- (__CFString)type;
- (__PCSLogContext)log;
- (id)description;
- (unsigned)numberIdentityMissing;
- (unsigned)restartCounter;
- (void)clearMetadata;
- (void)clearOldRegistry;
- (void)clearSet;
- (void)clearStableMetadata;
- (void)dealloc;
- (void)setBrokenEncryptedMetadatakeys:(BOOL)a3;
- (void)setClassicContent:(__CFData *)a3;
- (void)setCurrentStep:(_PCSMigrationStep *)a3;
- (void)setDone:(BOOL)a3;
- (void)setDropHSM:(BOOL)a3;
- (void)setEscrowIdentity:(_PCSIdentityData *)a3;
- (void)setEscrowMergeNeeded:(__CFData *)a3;
- (void)setEscrowMissing:(BOOL)a3;
- (void)setFirstStep:(_PCSMigrationStep *)a3;
- (void)setICDP:(BOOL)a3;
- (void)setICDPArmed:(BOOL)a3;
- (void)setICDPHSM:(BOOL)a3;
- (void)setICDPHSMArmed:(BOOL)a3;
- (void)setICDPHSMPlesio:(BOOL)a3;
- (void)setICDPHSMWalrus:(BOOL)a3;
- (void)setICDPPlesio:(BOOL)a3;
- (void)setLimitLocalStoring:(__CFArray *)a3;
- (void)setLog:(__PCSLogContext *)a3;
- (void)setMetadata:(__CFDictionary *)a3;
- (void)setMissingFromRegistry:(__CFArray *)a3;
- (void)setModified:(BOOL)a3;
- (void)setNeedPassword:(BOOL)a3;
- (void)setNewHSMContent:(__CFData *)a3;
- (void)setNewIdentity:(BOOL)a3;
- (void)setNumberIdentityMissing:(unsigned int)a3;
- (void)setOldRegistry:(__CFDictionary *)a3;
- (void)setOptions:(__CFDictionary *)a3;
- (void)setRemoveFromRegistry:(__CFArray *)a3;
- (void)setRequireIdentityInHSM:(BOOL)a3;
- (void)setRestart:(BOOL)a3;
- (void)setRestartCounter:(unsigned int)a3;
- (void)setRestoreHSM:(BOOL)a3;
- (void)setSet:(_PCSIdentitySetData *)a3;
- (void)setStableMetadata:(__CFDictionary *)a3;
- (void)setTriggerUpdate:(BOOL)a3;
- (void)setType:(__CFString *)a3;
- (void)softReset;
@end

@implementation PCSMigrationState

- (void)clearMetadata
{
  metadata = self->_metadata;
  if (metadata)
  {
    self->_metadata = 0;
    CFRelease(metadata);
  }
}

- (void)clearOldRegistry
{
  oldRegistry = self->_oldRegistry;
  if (oldRegistry)
  {
    self->_oldRegistry = 0;
    CFRelease(oldRegistry);
  }
}

- (void)clearStableMetadata
{
  stableMetadata = self->_stableMetadata;
  if (stableMetadata)
  {
    self->_stableMetadata = 0;
    CFRelease(stableMetadata);
  }
}

- (void)clearSet
{
  set = self->_set;
  if (set)
  {
    self->_set = 0;
    CFRelease(set);
  }
}

- (void)softReset
{
  self->_modified = 0;
  self->_restart = 0;
  set = self->_set;
  if (set)
  {
    self->_set = 0;
    CFRelease(set);
  }
  escrowIdentity = self->_escrowIdentity;
  if (escrowIdentity)
  {
    self->_escrowIdentity = 0;
    CFRelease(escrowIdentity);
  }
  newHSMContent = self->_newHSMContent;
  if (newHSMContent)
  {
    self->_newHSMContent = 0;
    CFRelease(newHSMContent);
  }
  metadata = self->_metadata;
  if (metadata)
  {
    self->_metadata = 0;
    CFRelease(metadata);
  }
  classicContent = self->_classicContent;
  if (classicContent)
  {
    self->_classicContent = 0;
    CFRelease(classicContent);
  }
  escrowMergeNeeded = self->_escrowMergeNeeded;
  if (escrowMergeNeeded)
  {
    self->_escrowMergeNeeded = 0;
    CFRelease(escrowMergeNeeded);
  }
  stableMetadata = self->_stableMetadata;
  if (stableMetadata)
  {
    self->_stableMetadata = 0;
    CFRelease(stableMetadata);
  }
  oldRegistry = self->_oldRegistry;
  if (oldRegistry)
  {
    self->_oldRegistry = 0;
    CFRelease(oldRegistry);
  }
  missingFromRegistry = self->_missingFromRegistry;
  if (missingFromRegistry)
  {
    self->_missingFromRegistry = 0;
    CFRelease(missingFromRegistry);
  }
  removeFromRegistry = self->_removeFromRegistry;
  if (removeFromRegistry)
  {
    self->_removeFromRegistry = 0;
    CFRelease(removeFromRegistry);
  }
}

- (void)dealloc
{
  [(PCSMigrationState *)self softReset];
  options = self->_options;
  if (options)
  {
    self->_options = 0;
    CFRelease(options);
  }
  limitLocalStoring = self->_limitLocalStoring;
  if (limitLocalStoring)
  {
    self->_limitLocalStoring = 0;
    CFRelease(limitLocalStoring);
  }
  type = self->_type;
  if (type)
  {
    self->_type = 0;
    CFRelease(type);
  }
  log = self->_log;
  if (log)
  {
    self->_log = 0;
    CFRelease(log);
  }
  v7.receiver = self;
  v7.super_class = (Class)PCSMigrationState;
  [(PCSMigrationState *)&v7 dealloc];
}

- (id)description
{
  return (id)objc_msgSend(NSString, "stringWithFormat:", @"<PCSMigrationState: %p>", self);
}

- (BOOL)BOOLOption:(__CFString *)a3
{
  v3 = [(__CFDictionary *)[(PCSMigrationState *)self options] objectForKeyedSubscript:a3];
  char v4 = [v3 BOOLValue];

  return v4;
}

- (BOOL)done
{
  return self->_done;
}

- (void)setDone:(BOOL)a3
{
  self->_done = a3;
}

- (_PCSMigrationStep)firstStep
{
  return self->_firstStep;
}

- (void)setFirstStep:(_PCSMigrationStep *)a3
{
  self->_firstStep = a3;
}

- (_PCSMigrationStep)currentStep
{
  return self->_currentStep;
}

- (void)setCurrentStep:(_PCSMigrationStep *)a3
{
  self->_currentStep = a3;
}

- (__CFDictionary)options
{
  return self->_options;
}

- (void)setOptions:(__CFDictionary *)a3
{
  self->_options = a3;
}

- (__PCSLogContext)log
{
  return self->_log;
}

- (void)setLog:(__PCSLogContext *)a3
{
  self->_log = a3;
}

- (_PCSIdentitySetData)set
{
  return self->_set;
}

- (void)setSet:(_PCSIdentitySetData *)a3
{
  self->_set = a3;
}

- (_PCSIdentityData)escrowIdentity
{
  return self->_escrowIdentity;
}

- (void)setEscrowIdentity:(_PCSIdentityData *)a3
{
  self->_escrowIdentity = a3;
}

- (__CFData)newHSMContent
{
  return self->_newHSMContent;
}

- (void)setNewHSMContent:(__CFData *)a3
{
  self->_newHSMContent = a3;
}

- (__CFDictionary)metadata
{
  return self->_metadata;
}

- (void)setMetadata:(__CFDictionary *)a3
{
  self->_metadata = a3;
}

- (__CFData)classicContent
{
  return self->_classicContent;
}

- (void)setClassicContent:(__CFData *)a3
{
  self->_classicContent = a3;
}

- (__CFDictionary)stableMetadata
{
  return self->_stableMetadata;
}

- (void)setStableMetadata:(__CFDictionary *)a3
{
  self->_stableMetadata = a3;
}

- (__CFDictionary)oldRegistry
{
  return self->_oldRegistry;
}

- (void)setOldRegistry:(__CFDictionary *)a3
{
  self->_oldRegistry = a3;
}

- (__CFString)type
{
  return self->_type;
}

- (void)setType:(__CFString *)a3
{
  self->_type = a3;
}

- (__CFArray)missingFromRegistry
{
  return self->_missingFromRegistry;
}

- (void)setMissingFromRegistry:(__CFArray *)a3
{
  self->_missingFromRegistry = a3;
}

- (__CFArray)removeFromRegistry
{
  return self->_removeFromRegistry;
}

- (void)setRemoveFromRegistry:(__CFArray *)a3
{
  self->_removeFromRegistry = a3;
}

- (__CFArray)limitLocalStoring
{
  return self->_limitLocalStoring;
}

- (void)setLimitLocalStoring:(__CFArray *)a3
{
  self->_limitLocalStoring = a3;
}

- (BOOL)iCDP
{
  return self->_iCDP;
}

- (void)setICDP:(BOOL)a3
{
  self->_iCDP = a3;
}

- (BOOL)iCDPArmed
{
  return self->_iCDPArmed;
}

- (void)setICDPArmed:(BOOL)a3
{
  self->_iCDPArmed = a3;
}

- (BOOL)iCDPPlesio
{
  return self->_iCDPPlesio;
}

- (void)setICDPPlesio:(BOOL)a3
{
  self->_iCDPPlesio = a3;
}

- (BOOL)iCDPHSM
{
  return self->_iCDPHSM;
}

- (void)setICDPHSM:(BOOL)a3
{
  self->_iCDPHSM = a3;
}

- (BOOL)iCDPHSMArmed
{
  return self->_iCDPHSMArmed;
}

- (void)setICDPHSMArmed:(BOOL)a3
{
  self->_iCDPHSMArmed = a3;
}

- (BOOL)iCDPHSMWalrus
{
  return self->_iCDPHSMWalrus;
}

- (void)setICDPHSMWalrus:(BOOL)a3
{
  self->_iCDPHSMWalrus = a3;
}

- (BOOL)iCDPHSMPlesio
{
  return self->_iCDPHSMPlesio;
}

- (void)setICDPHSMPlesio:(BOOL)a3
{
  self->_iCDPHSMPlesio = a3;
}

- (BOOL)dropHSM
{
  return self->_dropHSM;
}

- (void)setDropHSM:(BOOL)a3
{
  self->_dropHSM = a3;
}

- (BOOL)restoreHSM
{
  return self->_restoreHSM;
}

- (void)setRestoreHSM:(BOOL)a3
{
  self->_restoreHSM = a3;
}

- (BOOL)needPassword
{
  return self->_needPassword;
}

- (void)setNeedPassword:(BOOL)a3
{
  self->_needPassword = a3;
}

- (BOOL)requireIdentityInHSM
{
  return self->_requireIdentityInHSM;
}

- (void)setRequireIdentityInHSM:(BOOL)a3
{
  self->_requireIdentityInHSM = a3;
}

- (BOOL)triggerUpdate
{
  return self->_triggerUpdate;
}

- (void)setTriggerUpdate:(BOOL)a3
{
  self->_triggerUpdate = a3;
}

- (BOOL)newIdentity
{
  return self->_newIdentity;
}

- (void)setNewIdentity:(BOOL)a3
{
  self->_newIdentity = a3;
}

- (BOOL)modified
{
  return self->_modified;
}

- (void)setModified:(BOOL)a3
{
  self->_modified = a3;
}

- (unsigned)numberIdentityMissing
{
  return self->_numberIdentityMissing;
}

- (void)setNumberIdentityMissing:(unsigned int)a3
{
  self->_numberIdentityMissing = a3;
}

- (BOOL)brokenEncryptedMetadatakeys
{
  return self->_brokenEncryptedMetadatakeys;
}

- (void)setBrokenEncryptedMetadatakeys:(BOOL)a3
{
  self->_brokenEncryptedMetadatakeys = a3;
}

- (BOOL)restart
{
  return self->_restart;
}

- (void)setRestart:(BOOL)a3
{
  self->_restart = a3;
}

- (unsigned)restartCounter
{
  return self->_restartCounter;
}

- (void)setRestartCounter:(unsigned int)a3
{
  self->_restartCounter = a3;
}

- (BOOL)escrowMissing
{
  return self->_escrowMissing;
}

- (void)setEscrowMissing:(BOOL)a3
{
  self->_escrowMissing = a3;
}

- (__CFData)escrowMergeNeeded
{
  return self->_escrowMergeNeeded;
}

- (void)setEscrowMergeNeeded:(__CFData *)a3
{
  self->_escrowMergeNeeded = a3;
}

@end