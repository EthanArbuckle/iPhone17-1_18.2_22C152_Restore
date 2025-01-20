@interface UIAccessibilityBridgeElement
- (BOOL)isAXScrollAncestor;
- (NSArray)accessibilityActionsForRemoteDevice;
- (NSData)elementRefData;
- (UIAccessibilityBridgeAXActionHandler)axActionHandler;
- (void)overrideAccessibilityMethodsForRemoteDevice;
- (void)setAccessibilityActionsForRemoteDevice:(id)a3;
- (void)setAxActionHandler:(id)a3;
- (void)setElementRefData:(id)a3;
- (void)setIsAXScrollAncestor:(BOOL)a3;
@end

@implementation UIAccessibilityBridgeElement

- (void)overrideAccessibilityMethodsForRemoteDevice
{
  uint64_t v45 = *MEMORY[0x1E4F143B8];
  long long v38 = 0u;
  long long v39 = 0u;
  long long v40 = 0u;
  long long v41 = 0u;
  id obj = [(UIAccessibilityBridgeElement *)self accessibilityActionsForRemoteDevice];
  uint64_t v21 = [obj countByEnumeratingWithState:&v38 objects:v44 count:16];
  if (v21)
  {
    uint64_t v20 = *(void *)v39;
    v17 = v29;
    v18 = v26;
    v15 = v35;
    v16 = v32;
    do
    {
      uint64_t v3 = 0;
      do
      {
        if (*(void *)v39 != v20) {
          objc_enumerationMutation(obj);
        }
        uint64_t v4 = objc_msgSend(*(id *)(*((void *)&v38 + 1) + 8 * v3), "integerValue", v15, v16, v17, v18);
        v42[0] = &unk_1EF171C20;
        v5 = [NSNumber numberWithUnsignedInt:UIAccessibilityScrollToVisibleAction];
        v43[0] = v5;
        v42[1] = &unk_1EF171C38;
        v6 = [NSNumber numberWithUnsignedInt:UIAccessibilityScrollUpPageAction];
        v43[1] = v6;
        v42[2] = &unk_1EF171C50;
        v7 = [NSNumber numberWithUnsignedInt:UIAccessibilityScrollDownPageAction];
        v43[2] = v7;
        v42[3] = &unk_1EF171C68;
        v8 = [NSNumber numberWithUnsignedInt:UIAccessibilityScrollLeftPageAction];
        v43[3] = v8;
        v42[4] = &unk_1EF171C80;
        v9 = [NSNumber numberWithUnsignedInt:UIAccessibilityScrollRightPageAction];
        v43[4] = v9;
        v10 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v43 forKeys:v42 count:5];

        objc_initWeak(&location, self);
        switch((int)v4)
        {
          case 2003:
          case 2006:
          case 2007:
          case 2008:
          case 2009:
            v11 = [NSNumber numberWithUnsignedInt:v4];
            v12 = [v10 objectForKeyedSubscript:v11];

            if (v12)
            {
              [(UIAccessibilityBridgeElement *)self setIsAXScrollAncestor:1];
              uint64_t v13 = [v12 intValue];
              v22[0] = MEMORY[0x1E4F143A8];
              v22[1] = 3221225472;
              v22[2] = __75__UIAccessibilityBridgeElement_overrideAccessibilityMethodsForRemoteDevice__block_invoke_5;
              v22[3] = &unk_1E59B9C48;
              objc_copyWeak(&v23, &location);
              int v24 = v4;
              [self _accessibilitySetActionBlock:v22 withValue:0 forKey:v13];
              objc_destroyWeak(&v23);
            }

            break;
          case 2004:
            v28[0] = MEMORY[0x1E4F143A8];
            v28[1] = 3221225472;
            v29[0] = __75__UIAccessibilityBridgeElement_overrideAccessibilityMethodsForRemoteDevice__block_invoke_3;
            v29[1] = &unk_1E59B9BF8;
            objc_copyWeak(&v30, &location);
            [self _setAccessibilityIncrementBlock:v28];
            objc_destroyWeak(&v30);
            break;
          case 2005:
            v25[0] = MEMORY[0x1E4F143A8];
            v25[1] = 3221225472;
            v26[0] = __75__UIAccessibilityBridgeElement_overrideAccessibilityMethodsForRemoteDevice__block_invoke_4;
            v26[1] = &unk_1E59B9BF8;
            objc_copyWeak(&v27, &location);
            [self _setAccessibilityDecrementBlock:v25];
            objc_destroyWeak(&v27);
            break;
          case 2010:
            v34[0] = MEMORY[0x1E4F143A8];
            v34[1] = 3221225472;
            v35[0] = __75__UIAccessibilityBridgeElement_overrideAccessibilityMethodsForRemoteDevice__block_invoke;
            v35[1] = &unk_1E59B9C20;
            objc_copyWeak(&v36, &location);
            [self _setAccessibilityActivateBlock:v34];
            objc_destroyWeak(&v36);
            break;
          case 2013:
            v31[0] = MEMORY[0x1E4F143A8];
            v31[1] = 3221225472;
            v32[0] = __75__UIAccessibilityBridgeElement_overrideAccessibilityMethodsForRemoteDevice__block_invoke_2;
            v32[1] = &unk_1E59B9C20;
            objc_copyWeak(&v33, &location);
            [self _setAccessibilityPerformEscapeBlock:v31];
            objc_destroyWeak(&v33);
            break;
          default:
            break;
        }
        objc_destroyWeak(&location);

        ++v3;
      }
      while (v21 != v3);
      uint64_t v14 = [obj countByEnumeratingWithState:&v38 objects:v44 count:16];
      uint64_t v21 = v14;
    }
    while (v14);
  }
}

uint64_t __75__UIAccessibilityBridgeElement_overrideAccessibilityMethodsForRemoteDevice__block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v2 = [WeakRetained axActionHandler];
  uint64_t v3 = [v2 performAXAction:2010 withValue:0 onBridgeElement:WeakRetained];

  return v3;
}

uint64_t __75__UIAccessibilityBridgeElement_overrideAccessibilityMethodsForRemoteDevice__block_invoke_2(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v2 = [WeakRetained axActionHandler];
  uint64_t v3 = [v2 performAXAction:2013 withValue:0 onBridgeElement:WeakRetained];

  return v3;
}

void __75__UIAccessibilityBridgeElement_overrideAccessibilityMethodsForRemoteDevice__block_invoke_3(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v1 = [WeakRetained axActionHandler];
  [v1 performAXAction:2004 withValue:0 onBridgeElement:WeakRetained];
}

void __75__UIAccessibilityBridgeElement_overrideAccessibilityMethodsForRemoteDevice__block_invoke_4(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v1 = [WeakRetained axActionHandler];
  [v1 performAXAction:2005 withValue:0 onBridgeElement:WeakRetained];
}

uint64_t __75__UIAccessibilityBridgeElement_overrideAccessibilityMethodsForRemoteDevice__block_invoke_5(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  uint64_t v3 = [WeakRetained axActionHandler];
  uint64_t v4 = [v3 performAXAction:*(unsigned int *)(a1 + 40) withValue:0 onBridgeElement:WeakRetained];

  return v4;
}

- (NSData)elementRefData
{
  return self->_elementRefData;
}

- (void)setElementRefData:(id)a3
{
}

- (UIAccessibilityBridgeAXActionHandler)axActionHandler
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_axActionHandler);

  return (UIAccessibilityBridgeAXActionHandler *)WeakRetained;
}

- (void)setAxActionHandler:(id)a3
{
}

- (NSArray)accessibilityActionsForRemoteDevice
{
  return self->_accessibilityActionsForRemoteDevice;
}

- (void)setAccessibilityActionsForRemoteDevice:(id)a3
{
}

- (BOOL)isAXScrollAncestor
{
  return self->_isAXScrollAncestor;
}

- (void)setIsAXScrollAncestor:(BOOL)a3
{
  self->_isAXScrollAncestor = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_accessibilityActionsForRemoteDevice, 0);
  objc_destroyWeak((id *)&self->_axActionHandler);

  objc_storeStrong((id *)&self->_elementRefData, 0);
}

@end