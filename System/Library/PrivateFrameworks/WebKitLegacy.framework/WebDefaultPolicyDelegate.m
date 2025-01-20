@interface WebDefaultPolicyDelegate
+ (id)sharedPolicyDelegate;
- (BOOL)webView:(id)a3 shouldGoToHistoryItem:(id)a4;
- (void)webView:(id)a3 decidePolicyForMIMEType:(id)a4 request:(id)a5 frame:(id)a6 decisionListener:(id)a7;
- (void)webView:(id)a3 decidePolicyForNavigationAction:(id)a4 request:(id)a5 frame:(id)a6 decisionListener:(id)a7;
- (void)webView:(id)a3 decidePolicyForNewWindowAction:(id)a4 request:(id)a5 newFrameName:(id)a6 decisionListener:(id)a7;
@end

@implementation WebDefaultPolicyDelegate

+ (id)sharedPolicyDelegate
{
  id result = (id)sharedDelegate;
  if (!sharedDelegate)
  {
    id result = objc_alloc_init(WebDefaultPolicyDelegate);
    sharedDelegate = (uint64_t)result;
  }
  return result;
}

- (void)webView:(id)a3 decidePolicyForMIMEType:(id)a4 request:(id)a5 frame:(id)a6 decisionListener:(id)a7
{
  if (objc_msgSend((id)objc_msgSend(a5, "URL"), "isFileURL"))
  {
    char v12 = 0;
    if (objc_msgSend((id)objc_msgSend(MEMORY[0x1E4F28CB8], "defaultManager"), "fileExistsAtPath:isDirectory:", objc_msgSend((id)objc_msgSend(a5, "URL"), "path"), &v12))BOOL v11 = v12 == 0; {
    else
    }
      BOOL v11 = 0;
    if (v11 && [a3 _canShowMIMEType:a4]) {
      [a7 use];
    }
    else {
      [a7 ignore];
    }
  }
  else if ([a3 _canShowMIMEType:a4])
  {
    [a7 use];
  }
  else
  {
    [a7 ignore];
  }
}

- (void)webView:(id)a3 decidePolicyForNavigationAction:(id)a4 request:(id)a5 frame:(id)a6 decisionListener:(id)a7
{
  int v11 = objc_msgSend((id)objc_msgSend(a4, "objectForKey:", WebActionNavigationTypeKey), "intValue");
  if (+[WebView _canHandleRequest:forMainFrame:](WebView, "_canHandleRequest:forMainFrame:", a5, [a3 mainFrame] == (void)a6)|| v11 == 6)
  {
    [a7 use];
  }
  else
  {
    objc_msgSend((id)objc_msgSend(a5, "URL"), "isFileURL");
    [a7 ignore];
  }
}

- (void)webView:(id)a3 decidePolicyForNewWindowAction:(id)a4 request:(id)a5 newFrameName:(id)a6 decisionListener:(id)a7
{
}

- (BOOL)webView:(id)a3 shouldGoToHistoryItem:(id)a4
{
  return 1;
}

@end