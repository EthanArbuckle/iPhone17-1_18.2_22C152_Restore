@interface SGSMMutableSearchState
- (BOOL)isFirstTimeSeeingResult:(id)a3;
- (BOOL)justEngaged;
- (SGSMMutableSearchState)init;
- (id)description;
- (void)commit;
- (void)resetConversionCounts;
- (void)resetCounts;
- (void)resetJustEngaged;
- (void)scoreAsContactConversion;
- (void)scoreAsContactLoss;
- (void)scoreAsContactOpportunity;
- (void)scoreAsContactResult;
- (void)scoreAsCuratedOrPseudoContactOpportunity;
- (void)scoreAsNonOpportunity;
- (void)scoreAsOtherConversion;
- (void)setJustEngaged;
@end

@implementation SGSMMutableSearchState

- (SGSMMutableSearchState)init
{
  v5.receiver = self;
  v5.super_class = (Class)SGSMMutableSearchState;
  v2 = [(SGSMMutableSearchState *)&v5 init];
  v3 = v2;
  if (v2)
  {
    [(SGSMMutableSearchState *)v2 resetCounts];
    [(SGSMMutableSearchState *)v3 resetJustEngaged];
  }
  return v3;
}

- (void)resetCounts
{
  [(SGSMMutableSearchState *)self resetConversionCounts];
  *(_DWORD *)&self->_contactResultCount = 0;
  self->_curatedOrPseudoContactOpportunityCount = 0;
  obj = self;
  objc_sync_enter(obj);
  uint64_t v3 = objc_opt_new();
  resultsSeen = obj->_resultsSeen;
  obj->_resultsSeen = (NSMutableSet *)v3;

  objc_sync_exit(obj);
}

- (void)resetConversionCounts
{
  *(_WORD *)&self->_otherSelectedCount = 0;
  *(_WORD *)&self->_contactConversionCount = 0;
}

- (void)resetJustEngaged
{
  self->_justEngaged = 0;
}

- (void).cxx_destruct
{
}

- (id)description
{
  v2 = objc_msgSend([NSString alloc], "initWithFormat:", @"<SGSMSearchState c:%d,%d,%d,%d,%d n:%d o:%d>", self->_contactResultCount, self->_curatedOrPseudoContactOpportunityCount, self->_contactOpportunityCount, self->_contactConversionCount, self->_contactLossCount, self->_nonOpportunityCount, self->_otherSelectedCount);
  return v2;
}

- (void)commit
{
  if (os_log_type_enabled(MEMORY[0x263EF8438], OS_LOG_TYPE_DEBUG))
  {
    *(_WORD *)buf = 0;
    _os_log_debug_impl(&dword_224D4A000, MEMORY[0x263EF8438], OS_LOG_TYPE_DEBUG, "SGSM: committing", buf, 2u);
  }
  if (self->_contactResultCount && os_log_type_enabled(MEMORY[0x263EF8438], OS_LOG_TYPE_DEBUG))
  {
    *(_WORD *)v6 = 0;
    _os_log_debug_impl(&dword_224D4A000, MEMORY[0x263EF8438], OS_LOG_TYPE_DEBUG, "SGSM: committing as contact results", v6, 2u);
  }
  if (!self->_otherSelectedCount && !self->_nonOpportunityCount)
  {
    if (self->_contactOpportunityCount
      && (self->_contactLossCount || self->_contactConversionCount)
      && os_log_type_enabled(MEMORY[0x263EF8438], OS_LOG_TYPE_DEBUG))
    {
      *(_WORD *)objc_super v5 = 0;
      _os_log_debug_impl(&dword_224D4A000, MEMORY[0x263EF8438], OS_LOG_TYPE_DEBUG, "SGSM: committing as contact opportunity", v5, 2u);
    }
    if (self->_curatedOrPseudoContactOpportunityCount
      && (self->_contactLossCount || self->_contactConversionCount)
      && os_log_type_enabled(MEMORY[0x263EF8438], OS_LOG_TYPE_DEBUG))
    {
      *(_WORD *)v4 = 0;
      _os_log_debug_impl(&dword_224D4A000, MEMORY[0x263EF8438], OS_LOG_TYPE_DEBUG, "SGSM: committing as curated or pseudo contact opportunity", v4, 2u);
    }
    if (self->_contactConversionCount)
    {
      if (os_log_type_enabled(MEMORY[0x263EF8438], OS_LOG_TYPE_DEBUG))
      {
        *(_WORD *)uint64_t v3 = 0;
        _os_log_debug_impl(&dword_224D4A000, MEMORY[0x263EF8438], OS_LOG_TYPE_DEBUG, "SGSM: committing as contact conversion", v3, 2u);
      }
    }
  }
}

- (BOOL)justEngaged
{
  return self->_justEngaged;
}

- (void)setJustEngaged
{
  self->_justEngaged = 1;
}

- (void)scoreAsContactLoss
{
}

- (void)scoreAsContactConversion
{
}

- (void)scoreAsCuratedOrPseudoContactOpportunity
{
}

- (void)scoreAsContactOpportunity
{
}

- (void)scoreAsContactResult
{
}

- (void)scoreAsOtherConversion
{
  self->_otherSelectedCount = 1;
}

- (void)scoreAsNonOpportunity
{
  self->_nonOpportunityCount = 1;
}

- (BOOL)isFirstTimeSeeingResult:(id)a3
{
  id v4 = a3;
  objc_super v5 = [v4 identifier];
  if (v5)
  {
    v6 = self;
    objc_sync_enter(v6);
    char v7 = [(NSMutableSet *)v6->_resultsSeen containsObject:v5];
    if ((v7 & 1) == 0) {
      [(NSMutableSet *)v6->_resultsSeen addObject:v5];
    }
    char v8 = v7 ^ 1;
    objc_sync_exit(v6);
  }
  else
  {
    char v8 = 1;
  }

  return v8;
}

@end