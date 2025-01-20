@interface BKAugmentedExperienceData
- (BCAugmentedExperience)experience;
- (BCBookSection)sectionContainingExperience;
- (BOOL)autoExpand;
- (BOOL)isOnExperiencePage;
- (BOOL)isPresented;
- (NSTimer)delayTimer;
- (int64_t)state;
- (int64_t)triggeredLocation;
- (void)setAutoExpand:(BOOL)a3;
- (void)setDelayTimer:(id)a3;
- (void)setExperience:(id)a3;
- (void)setIsOnExperiencePage:(BOOL)a3;
- (void)setIsPresented:(BOOL)a3;
- (void)setSectionContainingExperience:(id)a3;
- (void)setState:(int64_t)a3;
- (void)setTriggeredLocation:(int64_t)a3;
@end

@implementation BKAugmentedExperienceData

- (BCAugmentedExperience)experience
{
  return self->_experience;
}

- (void)setExperience:(id)a3
{
}

- (NSTimer)delayTimer
{
  return self->_delayTimer;
}

- (void)setDelayTimer:(id)a3
{
}

- (BCBookSection)sectionContainingExperience
{
  return self->_sectionContainingExperience;
}

- (void)setSectionContainingExperience:(id)a3
{
}

- (int64_t)state
{
  return self->_state;
}

- (void)setState:(int64_t)a3
{
  self->_state = a3;
}

- (int64_t)triggeredLocation
{
  return self->_triggeredLocation;
}

- (void)setTriggeredLocation:(int64_t)a3
{
  self->_triggeredLocation = a3;
}

- (BOOL)isPresented
{
  return self->_isPresented;
}

- (void)setIsPresented:(BOOL)a3
{
  self->_isPresented = a3;
}

- (BOOL)isOnExperiencePage
{
  return self->_isOnExperiencePage;
}

- (void)setIsOnExperiencePage:(BOOL)a3
{
  self->_isOnExperiencePage = a3;
}

- (BOOL)autoExpand
{
  return self->_autoExpand;
}

- (void)setAutoExpand:(BOOL)a3
{
  self->_autoExpand = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_sectionContainingExperience, 0);
  objc_storeStrong((id *)&self->_delayTimer, 0);

  objc_storeStrong((id *)&self->_experience, 0);
}

@end