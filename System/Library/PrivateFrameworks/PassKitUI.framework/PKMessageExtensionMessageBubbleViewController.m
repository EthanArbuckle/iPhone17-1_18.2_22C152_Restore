@interface PKMessageExtensionMessageBubbleViewController
- (PKMessageExtensionMessageBubbleView)bubbleView;
- (PKMessageExtensionMessageBubbleViewController)initWithDelegate:(id)a3;
- (double)heightThatFitsWidth:(double)a3;
- (void)didTapMessage;
- (void)setBubbleView:(id)a3;
- (void)viewDidLoad;
@end

@implementation PKMessageExtensionMessageBubbleViewController

- (PKMessageExtensionMessageBubbleViewController)initWithDelegate:(id)a3
{
  id v5 = a3;
  v11.receiver = self;
  v11.super_class = (Class)PKMessageExtensionMessageBubbleViewController;
  v6 = [(PKMessageExtensionMessageBubbleViewController *)&v11 init];
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_delegate, a3);
    v8 = objc_alloc_init(PKMessageExtensionMessageBubbleView);
    bubbleView = v7->_bubbleView;
    v7->_bubbleView = v8;
  }
  return v7;
}

- (void)viewDidLoad
{
  v8.receiver = self;
  v8.super_class = (Class)PKMessageExtensionMessageBubbleViewController;
  [(PKMessageExtensionMessageBubbleViewController *)&v8 viewDidLoad];
  v3 = [(PKMessageExtensionMessageBubbleViewController *)self view];
  v4 = (void *)[objc_alloc(MEMORY[0x1E4FB1D38]) initWithTarget:self action:sel_didDoubleTapMessage];
  [v4 setNumberOfTapsRequired:2];
  [v3 addGestureRecognizer:v4];
  id v5 = (void *)[objc_alloc(MEMORY[0x1E4FB1968]) initWithTarget:self action:sel_didLongPressMessage];
  [v3 addGestureRecognizer:v5];
  v6 = (void *)[objc_alloc(MEMORY[0x1E4FB1D38]) initWithTarget:self action:sel_didTapMessage];
  [v6 setNumberOfTapsRequired:1];
  [v6 requireGestureRecognizerToFail:v4];
  [v6 requireGestureRecognizerToFail:v5];
  [v3 addGestureRecognizer:v6];
  bubbleView = self->_bubbleView;
  [v3 bounds];
  -[PKMessageExtensionMessageBubbleView setFrame:](bubbleView, "setFrame:");
  [v3 addSubview:self->_bubbleView];
}

- (double)heightThatFitsWidth:(double)a3
{
  -[PKMessageExtensionMessageBubbleView sizeThatFits:](self->_bubbleView, "sizeThatFits:", a3, 1.79769313e308);
  return v3;
}

- (void)didTapMessage
{
  delegate = self->_delegate;
  if (!delegate)
  {
    v4 = PKLogFacilityTypeGetObject();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)id v5 = 0;
      _os_log_impl(&dword_19F450000, v4, OS_LOG_TYPE_DEFAULT, "ERROR: [PKMessageExtensionMessageBubbleViewController didTapmessage] called with nil delegate", v5, 2u);
    }

    delegate = self->_delegate;
  }
  [(PKMessageExtensionMessageBubbleViewControllerDelegate *)delegate messageExtensionMessageBubbleViewControllerDidTapMessage:self];
}

- (PKMessageExtensionMessageBubbleView)bubbleView
{
  return self->_bubbleView;
}

- (void)setBubbleView:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_bubbleView, 0);

  objc_storeStrong((id *)&self->_delegate, 0);
}

@end