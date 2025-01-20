@interface SBZStackResolverTestRecipe
- (BOOL)wantsHomeGesture;
- (SBFZStackParticipant)participant;
- (SBWindowScene)windowScene;
- (id)title;
- (void)handleVolumeDecrease;
- (void)handleVolumeIncrease;
- (void)setParticipant:(id)a3;
- (void)setWantsHomeGesture:(BOOL)a3;
- (void)setWindowScene:(id)a3;
- (void)windowSceneDidUpdate:(id)a3;
- (void)zStackParticipant:(id)a3 updatePreferences:(id)a4;
- (void)zStackParticipantDidChange:(id)a3;
@end

@implementation SBZStackResolverTestRecipe

- (id)title
{
  return @"Take Home Gesture Ownership using Z Stack Resolver";
}

- (void)windowSceneDidUpdate:(id)a3
{
}

- (void)handleVolumeIncrease
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  v3 = [(SBZStackResolverTestRecipe *)self participant];

  if (!v3)
  {
    id WeakRetained = objc_loadWeakRetained((id *)&self->_windowScene);
    v5 = [WeakRetained zStackResolver];

    v6 = [v5 acquireParticipantWithIdentifier:31 delegate:self];
    [(SBZStackResolverTestRecipe *)self setParticipant:v6];

    v7 = SBLogZStack();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      v8 = [(SBZStackResolverTestRecipe *)self participant];
      int v11 = 138412546;
      v12 = self;
      __int16 v13 = 2112;
      v14 = v8;
      _os_log_impl(&dword_1D85BA000, v7, OS_LOG_TYPE_DEFAULT, "%@ acquired participant: %@", (uint8_t *)&v11, 0x16u);
    }
  }
  v9 = SBLogZStack();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    int v11 = 138412290;
    v12 = self;
    _os_log_impl(&dword_1D85BA000, v9, OS_LOG_TYPE_DEFAULT, "%@ setting wantsHomeGesture=YES", (uint8_t *)&v11, 0xCu);
  }

  [(SBZStackResolverTestRecipe *)self setWantsHomeGesture:1];
  v10 = [(SBZStackResolverTestRecipe *)self participant];
  [v10 setNeedsUpdatePreferencesWithReason:@"User pressed volume up"];
}

- (void)handleVolumeDecrease
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  v3 = SBLogZStack();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    int v5 = 138412290;
    v6 = self;
    _os_log_impl(&dword_1D85BA000, v3, OS_LOG_TYPE_DEFAULT, "%@ setting wantsHomeGesture=NO", (uint8_t *)&v5, 0xCu);
  }

  [(SBZStackResolverTestRecipe *)self setWantsHomeGesture:0];
  v4 = [(SBZStackResolverTestRecipe *)self participant];
  [v4 setNeedsUpdatePreferencesWithReason:@"User pressed volume down"];
}

- (void)zStackParticipantDidChange:(id)a3
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  int v5 = SBLogZStack();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    int v6 = 138412546;
    uint64_t v7 = self;
    __int16 v8 = 2112;
    id v9 = v4;
    _os_log_impl(&dword_1D85BA000, v5, OS_LOG_TYPE_DEFAULT, "%@ got zStackParticipantDidChange: %@", (uint8_t *)&v6, 0x16u);
  }
}

- (void)zStackParticipant:(id)a3 updatePreferences:(id)a4
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  id v5 = a4;
  [v5 setActivationPolicyForParticipantsBelow:0];
  objc_msgSend(v5, "setHomeGestureConsumption:", -[SBZStackResolverTestRecipe wantsHomeGesture](self, "wantsHomeGesture"));
  int v6 = SBLogZStack();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    int v7 = 138412546;
    __int16 v8 = self;
    __int16 v9 = 2112;
    id v10 = v5;
    _os_log_impl(&dword_1D85BA000, v6, OS_LOG_TYPE_DEFAULT, "%@ updating preferences to: %@", (uint8_t *)&v7, 0x16u);
  }
}

- (SBFZStackParticipant)participant
{
  return self->_participant;
}

- (void)setParticipant:(id)a3
{
}

- (BOOL)wantsHomeGesture
{
  return self->_wantsHomeGesture;
}

- (void)setWantsHomeGesture:(BOOL)a3
{
  self->_wantsHomeGesture = a3;
}

- (SBWindowScene)windowScene
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_windowScene);
  return (SBWindowScene *)WeakRetained;
}

- (void)setWindowScene:(id)a3
{
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_windowScene);
  objc_storeStrong((id *)&self->_participant, 0);
}

@end