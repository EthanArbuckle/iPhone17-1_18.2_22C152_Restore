@interface UIView(Workflow)
- (id)wf_addConstraintsToFillLayoutGuide:()Workflow;
- (id)wf_addConstraintsToFillLayoutGuide:()Workflow insets:;
- (id)wf_addConstraintsToFillSuperview:()Workflow;
- (id)wf_addConstraintsToFillSuperview:()Workflow insets:;
- (uint64_t)wf_containsFirstResponder;
@end

@implementation UIView(Workflow)

- (id)wf_addConstraintsToFillLayoutGuide:()Workflow insets:
{
  return WFAddConstraintsToFillAnchorProvider(a1, a7, a2, a3, a4, a5);
}

- (id)wf_addConstraintsToFillLayoutGuide:()Workflow
{
  return WFAddConstraintsToFillAnchorProvider(a1, a3, *MEMORY[0x263F82250], *(double *)(MEMORY[0x263F82250] + 8), *(double *)(MEMORY[0x263F82250] + 16), *(double *)(MEMORY[0x263F82250] + 24));
}

- (id)wf_addConstraintsToFillSuperview:()Workflow insets:
{
  return WFAddConstraintsToFillAnchorProvider(a1, a7, a2, a3, a4, a5);
}

- (id)wf_addConstraintsToFillSuperview:()Workflow
{
  return WFAddConstraintsToFillAnchorProvider(a1, a3, *MEMORY[0x263F82250], *(double *)(MEMORY[0x263F82250] + 8), *(double *)(MEMORY[0x263F82250] + 16), *(double *)(MEMORY[0x263F82250] + 24));
}

- (uint64_t)wf_containsFirstResponder
{
  v2 = [a1 window];
  v3 = [v2 firstResponder];

  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    uint64_t v4 = [v3 isDescendantOfView:a1];
  }
  else {
    uint64_t v4 = 0;
  }

  return v4;
}

@end