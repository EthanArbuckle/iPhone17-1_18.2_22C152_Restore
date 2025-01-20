@interface IKAppDocument(TVMLKit)
- (double)tv_adjustedWindowSize;
- (id)tv_featuresManager;
- (id)tv_interactionPreviewControllerForViewController:()TVMLKit presentingView:presentingElement:;
- (uint64_t)tv_handleEvent:()TVMLKit targetResponder:viewElement:extraInfo:;
- (uint64_t)tv_isPresentedModal;
@end

@implementation IKAppDocument(TVMLKit)

- (double)tv_adjustedWindowSize
{
  v2 = [a1 delegate];
  if (([v2 conformsToProtocol:&unk_26E5D10E0] & 1) == 0)
  {

    goto LABEL_5;
  }
  v3 = [a1 delegate];

  if (!v3)
  {
LABEL_5:
    v3 = [(id)*MEMORY[0x263F1D020] keyWindow];
    [v3 size];
    goto LABEL_6;
  }
  objc_msgSend(v3, "tv_adjustedWindowSizeForDocument:", a1);
LABEL_6:
  double v5 = v4;

  return v5;
}

- (uint64_t)tv_handleEvent:()TVMLKit targetResponder:viewElement:extraInfo:
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  v13 = [a1 delegate];
  if ([v13 conformsToProtocol:&unk_26E5D10E0])
  {
    v14 = [a1 delegate];
  }
  else
  {
    v14 = 0;
  }

  if (objc_opt_respondsToSelector()) {
    uint64_t v15 = objc_msgSend(v14, "tv_handleEventForDocument:eventName:targetResponder:viewElement:extraInfo:", a1, v10, v11, v12, a6);
  }
  else {
    uint64_t v15 = 0;
  }

  return v15;
}

- (id)tv_featuresManager
{
  v2 = [a1 delegate];
  if ([v2 conformsToProtocol:&unk_26E5D10E0])
  {
    v3 = [a1 delegate];
  }
  else
  {
    v3 = 0;
  }

  if (objc_opt_respondsToSelector())
  {
    double v4 = objc_msgSend(v3, "tv_featuresManagerForDocument:", a1);
  }
  else
  {
    double v4 = 0;
  }

  return v4;
}

- (uint64_t)tv_isPresentedModal
{
  v2 = [a1 delegate];
  if (objc_opt_respondsToSelector())
  {
    v3 = [a1 delegate];
    uint64_t v4 = objc_msgSend(v3, "tv_isPresentedModalForDocument:", a1);
  }
  else
  {
    uint64_t v4 = 0;
  }

  return v4;
}

- (id)tv_interactionPreviewControllerForViewController:()TVMLKit presentingView:presentingElement:
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  id v11 = [a1 delegate];
  if ([v11 conformsToProtocol:&unk_26E5D10E0])
  {
    id v12 = [a1 delegate];
  }
  else
  {
    id v12 = 0;
  }

  if (objc_opt_respondsToSelector())
  {
    v13 = objc_msgSend(v12, "tv_interactionPreviewControllerForViewController:presentingView:presentingElement:", v8, v9, v10);
  }
  else
  {
    v13 = 0;
  }

  return v13;
}

@end