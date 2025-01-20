@interface RBAssertionIntransientState
- (BOOL)definesRelativeStartTime;
- (BOOL)hasDomainAttribute;
- (BOOL)hasHereditaryGrant;
- (BOOL)invalidatesSynchronously;
- (BOOL)isEqual:(id)a3;
- (BOOL)isPersistent;
- (BOOL)preventsSuspension;
- (BOOL)suspendsOnOriginatorSuspension;
- (BOOL)terminateTargetOnOriginatorExit;
- (NSMutableDictionary)invalidatesOnConditions;
- (NSMutableSet)sourceEnvironments;
- (NSString)domainAttributes;
- (double)invalidationDuration;
- (double)warningDuration;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (unint64_t)endPolicy;
- (unint64_t)legacyReason;
- (unint64_t)runningReason;
- (unint64_t)startPolicy;
- (void)setDefinesRelativeStartTime:(BOOL)a3;
- (void)setDomainAttributes:(id)a3;
- (void)setEndPolicy:(unint64_t)a3;
- (void)setHasDomainAttribute:(BOOL)a3;
- (void)setHasHereditaryGrant:(BOOL)a3;
- (void)setInvalidatesOnConditions:(id)a3;
- (void)setInvalidatesSynchronously:(BOOL)a3;
- (void)setInvalidationDuration:(double)a3;
- (void)setIsPersistent:(BOOL)a3;
- (void)setLegacyReason:(unint64_t)a3;
- (void)setPreventsSuspension:(BOOL)a3;
- (void)setRunningReason:(unint64_t)a3;
- (void)setStartPolicy:(unint64_t)a3;
- (void)setSuspendsOnOriginatorSuspension:(BOOL)a3;
- (void)setTerminateTargetOnOriginatorExit:(BOOL)a3;
- (void)setWarningDuration:(double)a3;
@end

@implementation RBAssertionIntransientState

- (void)setHasDomainAttribute:(BOOL)a3
{
  self->_hasDomainAttribute = a3;
}

- (void)setDomainAttributes:(id)a3
{
}

- (BOOL)hasHereditaryGrant
{
  return self->_hasHereditaryGrant;
}

- (double)invalidationDuration
{
  return self->_invalidationDuration;
}

- (unint64_t)endPolicy
{
  return self->_endPolicy;
}

- (BOOL)isPersistent
{
  return self->_isPersistent;
}

- (unint64_t)startPolicy
{
  return self->_startPolicy;
}

- (NSString)domainAttributes
{
  return self->_domainAttributes;
}

- (unint64_t)runningReason
{
  return self->_runningReason;
}

- (unint64_t)legacyReason
{
  return self->_legacyReason;
}

- (BOOL)definesRelativeStartTime
{
  return self->_definesRelativeStartTime;
}

- (void)setPreventsSuspension:(BOOL)a3
{
  self->_preventsSuspension = a3;
}

- (BOOL)hasDomainAttribute
{
  return self->_hasDomainAttribute;
}

- (void)setRunningReason:(unint64_t)a3
{
  self->_runningReason = a3;
}

- (void)setSuspendsOnOriginatorSuspension:(BOOL)a3
{
  self->_suspendsOnOriginatorSuspension = a3;
}

- (void)setDefinesRelativeStartTime:(BOOL)a3
{
  self->_definesRelativeStartTime = a3;
}

- (double)warningDuration
{
  return self->_warningDuration;
}

- (void)setStartPolicy:(unint64_t)a3
{
  self->_startPolicy = a3;
}

- (void)setInvalidationDuration:(double)a3
{
  self->_invalidationDuration = a3;
}

- (void)setEndPolicy:(unint64_t)a3
{
  self->_endPolicy = a3;
}

- (void)setWarningDuration:(double)a3
{
  self->_warningDuration = a3;
}

- (void)setLegacyReason:(unint64_t)a3
{
  self->_legacyReason = a3;
}

- (void)setInvalidatesOnConditions:(id)a3
{
}

- (NSMutableDictionary)invalidatesOnConditions
{
  return self->_invalidatesOnConditions;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_invalidatesOnConditions, 0);
  objc_storeStrong((id *)&self->_domainAttributes, 0);
  objc_storeStrong((id *)&self->_sourceEnvironments, 0);
}

- (BOOL)suspendsOnOriginatorSuspension
{
  return self->_suspendsOnOriginatorSuspension;
}

- (BOOL)preventsSuspension
{
  return self->_preventsSuspension;
}

- (NSMutableSet)sourceEnvironments
{
  sourceEnvironments = self->_sourceEnvironments;
  if (!sourceEnvironments)
  {
    v4 = (NSMutableSet *)objc_alloc_init(MEMORY[0x263EFF9C0]);
    v5 = self->_sourceEnvironments;
    self->_sourceEnvironments = v4;

    sourceEnvironments = self->_sourceEnvironments;
  }
  return sourceEnvironments;
}

- (void)setHasHereditaryGrant:(BOOL)a3
{
  self->_hasHereditaryGrant = a3;
}

- (BOOL)invalidatesSynchronously
{
  return self->_invalidatesSynchronously;
}

- (id)description
{
  id v3 = [NSString alloc];
  v4 = [(id)objc_opt_class() description];
  v5 = NSStringFromRBSDurationStartPolicy();
  uint64_t v6 = NSStringFromRBSDurationEndPolicy();
  v7 = (void *)v6;
  v8 = @"susp";
  v9 = &stru_26DA9D688;
  if (!self->_suspendsOnOriginatorSuspension) {
    v8 = &stru_26DA9D688;
  }
  if (self->_definesRelativeStartTime) {
    v10 = @"drel";
  }
  else {
    v10 = &stru_26DA9D688;
  }
  if (self->_hasHereditaryGrant) {
    v11 = @"herd";
  }
  else {
    v11 = &stru_26DA9D688;
  }
  if (self->_hasDomainAttribute) {
    v12 = @"dom";
  }
  else {
    v12 = &stru_26DA9D688;
  }
  if (self->_terminateTargetOnOriginatorExit) {
    v13 = @"term";
  }
  else {
    v13 = &stru_26DA9D688;
  }
  if (self->_invalidatesSynchronously) {
    v14 = @"invalSync";
  }
  else {
    v14 = &stru_26DA9D688;
  }
  if (self->_preventsSuspension) {
    v9 = @" prevSus";
  }
  v15 = (void *)[v3 initWithFormat:@"<%@| strt:%@ end:%@ nvld:%.2f warn:%.2f%@%@%@%@%@%@%@ runningReason:%lu legRes:%lu doms:%@ invOnConds:%@>", v4, v5, v6, *(void *)&self->_invalidationDuration, *(void *)&self->_warningDuration, v8, v10, v11, v12, v13, v14, v9, self->_runningReason, self->_legacyReason, self->_domainAttributes, self->_invalidatesOnConditions];

  return v15;
}

- (id)copyWithZone:(_NSZone *)a3
{
  v4 = [+[RBAssertionIntransientState allocWithZone:a3] init];
  v4->_endPolicy = self->_endPolicy;
  v4->_startPolicy = self->_startPolicy;
  v4->_warningDuration = self->_warningDuration;
  v4->_invalidationDuration = self->_invalidationDuration;
  v4->_suspendsOnOriginatorSuspension = self->_suspendsOnOriginatorSuspension;
  v4->_terminateTargetOnOriginatorExit = self->_terminateTargetOnOriginatorExit;
  v4->_invalidatesSynchronously = self->_invalidatesSynchronously;
  v4->_definesRelativeStartTime = self->_definesRelativeStartTime;
  v4->_preventsSuspension = self->_preventsSuspension;
  v4->_hasHereditaryGrant = self->_hasHereditaryGrant;
  v4->_hasDomainAttribute = self->_hasDomainAttribute;
  uint64_t v5 = [(NSMutableSet *)self->_sourceEnvironments mutableCopy];
  sourceEnvironments = v4->_sourceEnvironments;
  v4->_sourceEnvironments = (NSMutableSet *)v5;

  v4->_runningReason = self->_runningReason;
  v4->_legacyReason = self->_legacyReason;
  uint64_t v7 = [(NSString *)self->_domainAttributes copy];
  domainAttributes = v4->_domainAttributes;
  v4->_domainAttributes = (NSString *)v7;

  uint64_t v9 = [(NSMutableDictionary *)self->_invalidatesOnConditions mutableCopy];
  invalidatesOnConditions = v4->_invalidatesOnConditions;
  v4->_invalidatesOnConditions = (NSMutableDictionary *)v9;

  return v4;
}

- (BOOL)isEqual:(id)a3
{
  v4 = (RBAssertionIntransientState *)a3;
  if (self == v4) {
    goto LABEL_27;
  }
  uint64_t v5 = objc_opt_class();
  if (v5 != objc_opt_class()
    || self->_definesRelativeStartTime != v4->_definesRelativeStartTime
    || self->_endPolicy != v4->_endPolicy
    || self->_invalidationDuration != v4->_invalidationDuration
    || self->_startPolicy != v4->_startPolicy
    || self->_suspendsOnOriginatorSuspension != v4->_suspendsOnOriginatorSuspension
    || self->_warningDuration != v4->_warningDuration
    || self->_hasHereditaryGrant != v4->_hasHereditaryGrant
    || self->_terminateTargetOnOriginatorExit != v4->_terminateTargetOnOriginatorExit
    || self->_invalidatesSynchronously != v4->_invalidatesSynchronously
    || self->_preventsSuspension != v4->_preventsSuspension)
  {
    goto LABEL_26;
  }
  sourceEnvironments = self->_sourceEnvironments;
  uint64_t v7 = v4->_sourceEnvironments;
  if (sourceEnvironments != v7)
  {
    char v8 = 0;
    CFSetRef theSet = (const __CFSet *)self->_sourceEnvironments;
    if (!sourceEnvironments) {
      goto LABEL_28;
    }
    CFSetRef v14 = (const __CFSet *)v4->_sourceEnvironments;
    if (!v7) {
      goto LABEL_28;
    }
    CFIndex Count = CFSetGetCount(theSet);
    if (Count != CFSetGetCount(v14) || ![(__CFSet *)theSet isEqualToSet:v14]) {
      goto LABEL_26;
    }
  }
  if (self->_runningReason != v4->_runningReason
    || self->_legacyReason != v4->_legacyReason
    || (domainAttributes = self->_domainAttributes, domainAttributes != v4->_domainAttributes)
    && !-[NSString isEqualToString:](domainAttributes, "isEqualToString:"))
  {
LABEL_26:
    char v8 = 0;
    goto LABEL_28;
  }
  invalidatesOnConditions = self->_invalidatesOnConditions;
  v12 = v4->_invalidatesOnConditions;
  if (invalidatesOnConditions == v12)
  {
LABEL_27:
    char v8 = 1;
    goto LABEL_28;
  }
  char v8 = 0;
  if (invalidatesOnConditions && v12) {
    char v8 = -[NSMutableDictionary isEqual:](invalidatesOnConditions, "isEqual:");
  }
LABEL_28:

  return v8;
}

- (void)setInvalidatesSynchronously:(BOOL)a3
{
  self->_invalidatesSynchronously = a3;
}

- (void)setIsPersistent:(BOOL)a3
{
  self->_isPersistent = a3;
}

- (BOOL)terminateTargetOnOriginatorExit
{
  return self->_terminateTargetOnOriginatorExit;
}

- (void)setTerminateTargetOnOriginatorExit:(BOOL)a3
{
  self->_terminateTargetOnOriginatorExit = a3;
}

@end