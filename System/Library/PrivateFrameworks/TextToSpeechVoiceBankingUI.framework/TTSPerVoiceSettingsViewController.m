@interface TTSPerVoiceSettingsViewController
- (NSString)speechSource;
- (TTSPVSettingsWrapper)wrapper;
- (TTSPerVoiceSettingsViewController)init;
- (TTSPerVoiceSettingsViewControllerDelegate)dataDelegate;
- (void)reloadView;
- (void)setDataDelegate:(id)a3;
- (void)setSpeechSource:(id)a3;
- (void)setWrapper:(id)a3;
- (void)viewDidLoad;
@end

@implementation TTSPerVoiceSettingsViewController

- (TTSPerVoiceSettingsViewController)init
{
  v6.receiver = self;
  v6.super_class = (Class)TTSPerVoiceSettingsViewController;
  v2 = [(TTSPerVoiceSettingsViewController *)&v6 init];
  if (v2)
  {
    v3 = objc_alloc_init(TTSPVSettingsWrapper);
    wrapper = v2->_wrapper;
    v2->_wrapper = v3;
  }
  return v2;
}

- (void)setDataDelegate:(id)a3
{
  id v7 = a3;
  v4 = [(TTSPerVoiceSettingsViewController *)self wrapper];
  id v5 = [v4 dataDelegate];

  if (v5 != v7)
  {
    objc_super v6 = [(TTSPerVoiceSettingsViewController *)self wrapper];
    [v6 setDataDelegate:v7];

    [(TTSPerVoiceSettingsViewController *)self reloadView];
  }
}

- (void)setSpeechSource:(id)a3
{
}

- (NSString)speechSource
{
  return [(TTSPVSettingsWrapper *)self->_wrapper speechSource];
}

- (TTSPerVoiceSettingsViewControllerDelegate)dataDelegate
{
  v2 = [(TTSPerVoiceSettingsViewController *)self wrapper];
  v3 = [v2 dataDelegate];

  return (TTSPerVoiceSettingsViewControllerDelegate *)v3;
}

- (void)viewDidLoad
{
  v4.receiver = self;
  v4.super_class = (Class)TTSPerVoiceSettingsViewController;
  [(TTSPerVoiceSettingsViewController *)&v4 viewDidLoad];
  v3 = [(TTSPerVoiceSettingsViewController *)self wrapper];
  [v3 addViewToParent:self];
}

- (void)reloadView
{
  id v2 = [(TTSPerVoiceSettingsViewController *)self wrapper];
  [v2 reloadView];
}

- (TTSPVSettingsWrapper)wrapper
{
  return self->_wrapper;
}

- (void)setWrapper:(id)a3
{
}

- (void).cxx_destruct
{
}

@end