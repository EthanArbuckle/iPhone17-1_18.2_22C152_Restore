@interface WebElementDictionary
+ (void)initializeLookupTable;
- (WebElementDictionary)initWithHitTestResult:(const void *)a3;
- (id)_absoluteImageURL;
- (id)_absoluteLinkURL;
- (id)_absoluteMediaURL;
- (id)_altDisplayString;
- (id)_domNode;
- (id)_isContentEditable;
- (id)_isInScrollBar;
- (id)_isLiveLink;
- (id)_isSelected;
- (id)_spellingToolTip;
- (id)_targetWebFrame;
- (id)_textContent;
- (id)_title;
- (id)_titleDisplayString;
- (id)_webFrame;
- (id)keyEnumerator;
- (id)objectForKey:(id)a3;
- (unint64_t)count;
- (void)_fillCache;
- (void)dealloc;
@end

@implementation WebElementDictionary

+ (void)initializeLookupTable
{
  if (_MergedGlobals_7)
  {
    if (qword_1EAD80138) {
      return;
    }
  }
  else
  {
    qword_1EAD80138 = 0;
    _MergedGlobals_7 = 1;
  }
  Mutable = CFDictionaryCreateMutable((CFAllocatorRef)*MEMORY[0x1E4F1CF80], 0, MEMORY[0x1E4F1D048], 0);
  if ((_MergedGlobals_7 & 1) == 0)
  {
    _MergedGlobals_7 = 1;
    qword_1EAD80138 = (uint64_t)Mutable;
    goto LABEL_10;
  }
  v3 = (const void *)qword_1EAD80138;
  qword_1EAD80138 = (uint64_t)Mutable;
  if (!v3)
  {
LABEL_10:
    v4 = WebElementDOMNodeKey;
    goto LABEL_11;
  }
  CFRelease(v3);
  v4 = WebElementDOMNodeKey;
  if (_MergedGlobals_7 == 1)
  {
    Mutable = (__CFDictionary *)qword_1EAD80138;
  }
  else
  {
    Mutable = 0;
    qword_1EAD80138 = 0;
    _MergedGlobals_7 = 1;
  }
LABEL_11:
  CFDictionaryAddValue(Mutable, v4, sel__domNode);
  if (_MergedGlobals_7 == 1)
  {
    v5 = (__CFDictionary *)qword_1EAD80138;
  }
  else
  {
    v5 = 0;
    qword_1EAD80138 = 0;
    _MergedGlobals_7 = 1;
  }
  CFDictionaryAddValue(v5, WebElementFrameKey, sel__webFrame);
  if (_MergedGlobals_7 == 1)
  {
    v6 = (__CFDictionary *)qword_1EAD80138;
  }
  else
  {
    v6 = 0;
    qword_1EAD80138 = 0;
    _MergedGlobals_7 = 1;
  }
  CFDictionaryAddValue(v6, WebElementImageAltStringKey, sel__altDisplayString);
  if (_MergedGlobals_7 == 1)
  {
    v7 = (__CFDictionary *)qword_1EAD80138;
  }
  else
  {
    v7 = 0;
    qword_1EAD80138 = 0;
    _MergedGlobals_7 = 1;
  }
  CFDictionaryAddValue(v7, WebElementImageURLKey, sel__absoluteImageURL);
  if (_MergedGlobals_7 == 1)
  {
    v8 = (__CFDictionary *)qword_1EAD80138;
  }
  else
  {
    v8 = 0;
    qword_1EAD80138 = 0;
    _MergedGlobals_7 = 1;
  }
  CFDictionaryAddValue(v8, WebElementIsSelectedKey, sel__isSelected);
  if (_MergedGlobals_7 == 1)
  {
    v9 = (__CFDictionary *)qword_1EAD80138;
  }
  else
  {
    v9 = 0;
    qword_1EAD80138 = 0;
    _MergedGlobals_7 = 1;
  }
  CFDictionaryAddValue(v9, WebElementMediaURLKey[0], sel__absoluteMediaURL);
  if (_MergedGlobals_7 == 1)
  {
    v10 = (__CFDictionary *)qword_1EAD80138;
  }
  else
  {
    v10 = 0;
    qword_1EAD80138 = 0;
    _MergedGlobals_7 = 1;
  }
  CFDictionaryAddValue(v10, WebElementSpellingToolTipKey[0], sel__spellingToolTip);
  if (_MergedGlobals_7 == 1)
  {
    v11 = (__CFDictionary *)qword_1EAD80138;
  }
  else
  {
    v11 = 0;
    qword_1EAD80138 = 0;
    _MergedGlobals_7 = 1;
  }
  CFDictionaryAddValue(v11, WebElementTitleKey[0], sel__title);
  if (_MergedGlobals_7 == 1)
  {
    v12 = (__CFDictionary *)qword_1EAD80138;
  }
  else
  {
    v12 = 0;
    qword_1EAD80138 = 0;
    _MergedGlobals_7 = 1;
  }
  CFDictionaryAddValue(v12, WebElementLinkURLKey, sel__absoluteLinkURL);
  if (_MergedGlobals_7 == 1)
  {
    v13 = (__CFDictionary *)qword_1EAD80138;
  }
  else
  {
    v13 = 0;
    qword_1EAD80138 = 0;
    _MergedGlobals_7 = 1;
  }
  CFDictionaryAddValue(v13, WebElementLinkTargetFrameKey, sel__targetWebFrame);
  if (_MergedGlobals_7 == 1)
  {
    v14 = (__CFDictionary *)qword_1EAD80138;
  }
  else
  {
    v14 = 0;
    qword_1EAD80138 = 0;
    _MergedGlobals_7 = 1;
  }
  CFDictionaryAddValue(v14, WebElementLinkTitleKey, sel__titleDisplayString);
  if (_MergedGlobals_7 == 1)
  {
    v15 = (__CFDictionary *)qword_1EAD80138;
  }
  else
  {
    v15 = 0;
    qword_1EAD80138 = 0;
    _MergedGlobals_7 = 1;
  }
  CFDictionaryAddValue(v15, WebElementLinkLabelKey, sel__textContent);
  if (_MergedGlobals_7 == 1)
  {
    v16 = (__CFDictionary *)qword_1EAD80138;
  }
  else
  {
    v16 = 0;
    qword_1EAD80138 = 0;
    _MergedGlobals_7 = 1;
  }
  CFDictionaryAddValue(v16, WebElementLinkIsLiveKey[0], sel__isLiveLink);
  if (_MergedGlobals_7 == 1)
  {
    v17 = (__CFDictionary *)qword_1EAD80138;
  }
  else
  {
    v17 = 0;
    qword_1EAD80138 = 0;
    _MergedGlobals_7 = 1;
  }
  CFDictionaryAddValue(v17, WebElementIsContentEditableKey[0], sel__isContentEditable);
  v18 = WebElementIsInScrollBarKey[0];
  if (_MergedGlobals_7 == 1)
  {
    v19 = (__CFDictionary *)qword_1EAD80138;
  }
  else
  {
    v19 = 0;
    qword_1EAD80138 = 0;
    _MergedGlobals_7 = 1;
  }
  CFDictionaryAddValue(v19, v18, sel__isInScrollBar);
}

- (WebElementDictionary)initWithHitTestResult:(const void *)a3
{
  [(id)objc_opt_class() initializeLookupTable];
  v8.receiver = self;
  v8.super_class = (Class)WebElementDictionary;
  v5 = [(WebElementDictionary *)&v8 init];
  if (v5)
  {
    uint64_t v6 = WTF::fastMalloc((WTF *)0x88);
    MEMORY[0x1E4E450E0](v6, a3);
    v5->_result = (void *)v6;
  }
  return v5;
}

- (void)dealloc
{
  v3 = (objc_class *)objc_opt_class();
  if ((WebCoreObjCScheduleDeallocateOnMainThread(v3, (objc_object *)self) & 1) == 0)
  {
    if (self->_result)
    {
      v4 = (WTF *)MEMORY[0x1E4E450F0]();
      WTF::fastFree(v4, v5);
    }

    v6.receiver = self;
    v6.super_class = (Class)WebElementDictionary;
    [(WebElementDictionary *)&v6 dealloc];
  }
}

- (void)_fillCache
{
  if (_MergedGlobals_7 == 1)
  {
    CFDictionaryRef v3 = (const __CFDictionary *)qword_1EAD80138;
  }
  else
  {
    CFDictionaryRef v3 = 0;
    qword_1EAD80138 = 0;
    _MergedGlobals_7 = 1;
  }
  CFDictionaryApplyFunction(v3, (CFDictionaryApplierFunction)cacheValueForKey, self);
  self->_cacheComplete = 1;
}

- (unint64_t)count
{
  if (!self->_cacheComplete) {
    [(WebElementDictionary *)self _fillCache];
  }
  cache = self->_cache;
  return [(NSMutableDictionary *)cache count];
}

- (id)keyEnumerator
{
  if (!self->_cacheComplete) {
    [(WebElementDictionary *)self _fillCache];
  }
  cache = self->_cache;
  return (id)[(NSMutableDictionary *)cache keyEnumerator];
}

- (id)objectForKey:(id)a3
{
  v5 = (void *)-[NSMutableDictionary objectForKey:](self->_cache, "objectForKey:");
  if (!v5)
  {
    if (!self->_cacheComplete && ([(NSMutableSet *)self->_nilValues containsObject:a3] & 1) == 0)
    {
      if (_MergedGlobals_7 == 1)
      {
        Value = CFDictionaryGetValue((CFDictionaryRef)qword_1EAD80138, a3);
        if (Value) {
          goto LABEL_6;
        }
      }
      else
      {
        qword_1EAD80138 = 0;
        _MergedGlobals_7 = 1;
        Value = CFDictionaryGetValue(0, a3);
        if (Value)
        {
LABEL_6:
          v5 = (void *)[(WebElementDictionary *)self performSelector:Value];
          if (_MergedGlobals_7 == 1)
          {
            CFIndex Count = CFDictionaryGetCount((CFDictionaryRef)qword_1EAD80138);
            if (v5)
            {
LABEL_8:
              cache = self->_cache;
              if (!cache)
              {
                cache = (NSMutableDictionary *)[objc_alloc(MEMORY[0x1E4F1CA60]) initWithCapacity:Count];
                self->_cache = cache;
              }
              [(NSMutableDictionary *)cache setObject:v5 forKey:a3];
LABEL_18:
              uint64_t v11 = [(NSMutableDictionary *)self->_cache count];
              self->_cacheComplete = [(NSMutableSet *)self->_nilValues count] + v11 == Count;
              return v5;
            }
          }
          else
          {
            qword_1EAD80138 = 0;
            _MergedGlobals_7 = 1;
            CFIndex Count = CFDictionaryGetCount(0);
            if (v5) {
              goto LABEL_8;
            }
          }
          nilValues = self->_nilValues;
          if (!nilValues)
          {
            nilValues = (NSMutableSet *)[objc_alloc(MEMORY[0x1E4F1CA80]) initWithCapacity:Count];
            self->_nilValues = nilValues;
          }
          [(NSMutableSet *)nilValues addObject:a3];
          goto LABEL_18;
        }
      }
    }
    return 0;
  }
  return v5;
}

- (id)_domNode
{
  return kit(*((WebCore::Node **)self->_result + 10));
}

- (id)_webFrame
{
  v2 = objc_msgSend(-[WebElementDictionary _domNode](self, "_domNode"), "ownerDocument");
  return (id)[v2 webFrame];
}

- (id)_altDisplayString
{
  WebCore::HitTestResult::altDisplayString((uint64_t *)&v6, (WebCore::HitTestResult *)self->_result);
  if (!v6) {
    return 0;
  }
  CFDictionaryRef v3 = (void *)WTF::StringImpl::operator NSString *();
  v4 = v6;
  objc_super v6 = 0;
  if (!v4) {
    return v3;
  }
  if (*(_DWORD *)v4 != 2)
  {
    *(_DWORD *)v4 -= 2;
    return v3;
  }
  WTF::StringImpl::destroy(v4, v2);
  return v3;
}

- (id)_spellingToolTip
{
  WebCore::HitTestResult::spellingToolTip();
  if (!v5) {
    return 0;
  }
  CFDictionaryRef v3 = (void *)WTF::StringImpl::operator NSString *();
  if (*(_DWORD *)v5 == 2)
  {
    WTF::StringImpl::destroy(v5, v2);
    return v3;
  }
  else
  {
    *(_DWORD *)v5 -= 2;
    return v3;
  }
}

- (id)_absoluteImageURL
{
  WebCore::HitTestResult::absoluteImageURL((uint64_t *)&v6, (WebCore::HitTestResult *)self->_result);
  CFDictionaryRef v3 = (void *)WTF::URL::operator NSURL *();
  v4 = v6;
  objc_super v6 = 0;
  if (!v4) {
    return v3;
  }
  if (*(_DWORD *)v4 != 2)
  {
    *(_DWORD *)v4 -= 2;
    return v3;
  }
  WTF::StringImpl::destroy(v4, v2);
  return v3;
}

- (id)_absoluteMediaURL
{
  WebCore::HitTestResult::absoluteMediaURL((uint64_t *)&v6, (WebCore::HitTestResult *)self->_result);
  CFDictionaryRef v3 = (void *)WTF::URL::operator NSURL *();
  v4 = v6;
  objc_super v6 = 0;
  if (!v4) {
    return v3;
  }
  if (*(_DWORD *)v4 != 2)
  {
    *(_DWORD *)v4 -= 2;
    return v3;
  }
  WTF::StringImpl::destroy(v4, v2);
  return v3;
}

- (id)_isSelected
{
  v2 = NSNumber;
  uint64_t isSelected = WebCore::HitTestResult::isSelected((WebCore::HitTestResult *)self->_result);
  return (id)[v2 numberWithBool:isSelected];
}

- (id)_title
{
  WebCore::HitTestResult::title();
  if (!v5) {
    return 0;
  }
  CFDictionaryRef v3 = (void *)WTF::StringImpl::operator NSString *();
  if (*(_DWORD *)v5 == 2)
  {
    WTF::StringImpl::destroy(v5, v2);
    return v3;
  }
  else
  {
    *(_DWORD *)v5 -= 2;
    return v3;
  }
}

- (id)_absoluteLinkURL
{
  WebCore::HitTestResult::absoluteLinkURL((uint64_t *)&v6, (WebCore::HitTestResult *)self->_result);
  CFDictionaryRef v3 = (void *)WTF::URL::operator NSURL *();
  v4 = v6;
  objc_super v6 = 0;
  if (!v4) {
    return v3;
  }
  if (*(_DWORD *)v4 != 2)
  {
    *(_DWORD *)v4 -= 2;
    return v3;
  }
  WTF::StringImpl::destroy(v4, v2);
  return v3;
}

- (id)_targetWebFrame
{
  id result = (id)WebCore::HitTestResult::targetFrame((WebCore::HitTestResult *)self->_result);
  if (result)
  {
    CFDictionaryRef v3 = *(id **)(*((void *)result + 35) + 16);
    if ((*((uint64_t (**)(id *))*v3 + 134))(v3)) {
      return 0;
    }
    else {
      return v3[2];
    }
  }
  return result;
}

- (id)_titleDisplayString
{
  WebCore::HitTestResult::titleDisplayString((uint64_t *)&v6, (WebCore::HitTestResult *)self->_result);
  if (!v6) {
    return 0;
  }
  CFDictionaryRef v3 = (void *)WTF::StringImpl::operator NSString *();
  v4 = v6;
  objc_super v6 = 0;
  if (!v4) {
    return v3;
  }
  if (*(_DWORD *)v4 != 2)
  {
    *(_DWORD *)v4 -= 2;
    return v3;
  }
  WTF::StringImpl::destroy(v4, v2);
  return v3;
}

- (id)_textContent
{
  WebCore::HitTestResult::textContent((uint64_t *)&v6, (WebCore::HitTestResult *)self->_result);
  if (!v6) {
    return 0;
  }
  CFDictionaryRef v3 = (void *)WTF::StringImpl::operator NSString *();
  v4 = v6;
  objc_super v6 = 0;
  if (!v4) {
    return v3;
  }
  if (*(_DWORD *)v4 != 2)
  {
    *(_DWORD *)v4 -= 2;
    return v3;
  }
  WTF::StringImpl::destroy(v4, v2);
  return v3;
}

- (id)_isLiveLink
{
  v2 = (WebCore *)*((void *)self->_result + 13);
  CFDictionaryRef v3 = NSNumber;
  if (v2)
  {
    uint64_t isDraggableLink = WebCore::isDraggableLink(v2, (const Element *)a2);
    v5 = v3;
  }
  else
  {
    uint64_t isDraggableLink = 0;
    v5 = NSNumber;
  }
  return (id)[v5 numberWithBool:isDraggableLink];
}

- (id)_isContentEditable
{
  v2 = NSNumber;
  uint64_t isContentEditable = WebCore::HitTestResult::isContentEditable((WebCore::HitTestResult *)self->_result);
  return (id)[v2 numberWithBool:isContentEditable];
}

- (id)_isInScrollBar
{
  return (id)[NSNumber numberWithBool:*((void *)self->_result + 14) != 0];
}

@end