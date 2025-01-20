@interface MFUIStateCaptor
+ (id)sharedCaptor;
- (BOOL)isCapturingUIState;
- (MFUIStateCaptor)init;
- (NSArray)redactedFieldNames;
- (id)_captureUIStateWithTitle:(id)a3 captureBlock:(id)a4;
- (id)mailSceneHierarchy:(id)a3;
- (id)redactedStringForString:(id)a3;
- (id)viewControllerDescriptions;
- (id)viewControllerHierarchy;
- (void)setIsCapturingUIState:(BOOL)a3;
@end

@implementation MFUIStateCaptor

+ (id)sharedCaptor
{
  if (qword_100699DB8 != -1) {
    dispatch_once(&qword_100699DB8, &stru_10060D7B8);
  }
  v2 = (void *)qword_100699DB0;

  return v2;
}

- (MFUIStateCaptor)init
{
  v6.receiver = self;
  v6.super_class = (Class)MFUIStateCaptor;
  v2 = [(MFUIStateCaptor *)&v6 init];
  v3 = v2;
  if (v2)
  {
    redactedFieldNames = v2->_redactedFieldNames;
    v2->_redactedFieldNames = (NSArray *)&off_10062B498;
  }
  return v3;
}

- (id)viewControllerHierarchy
{
  return [(MFUIStateCaptor *)self _captureUIStateWithTitle:@"UIVC Hierarchy" captureBlock:&stru_10060D7F8];
}

- (id)viewControllerDescriptions
{
  return [(MFUIStateCaptor *)self _captureUIStateWithTitle:@"All UIVC Descriptions" captureBlock:&stru_10060D818];
}

- (id)mailSceneHierarchy:(id)a3
{
  id v4 = a3;
  v5 = [v4 session];
  objc_super v6 = [v5 persistentIdentifier];
  v10[0] = _NSConcreteStackBlock;
  v10[1] = 3221225472;
  v10[2] = sub_1001FCDF8;
  v10[3] = &unk_10060D840;
  id v7 = v4;
  id v11 = v7;
  v8 = [(MFUIStateCaptor *)self _captureUIStateWithTitle:v6 captureBlock:v10];

  return v8;
}

- (id)redactedStringForString:(id)a3
{
  id v4 = a3;
  if ([(MFUIStateCaptor *)self isCapturingUIState])
  {
    [v4 mf_fancyRedactedString];
    id v5 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    id v5 = v4;
  }
  objc_super v6 = v5;

  return v6;
}

- (id)_captureUIStateWithTitle:(id)a3 captureBlock:(id)a4
{
  id v6 = a3;
  id v7 = (void (**)(void))a4;
  [(MFUIStateCaptor *)self setIsCapturingUIState:1];
  v8 = +[NSString stringWithFormat:@"\n- Begin %@ --------------------------------------------------\n", v6];
  v9 = +[NSString stringWithFormat:@"\n- End %@ --------------------------------------------------\n", v6];
  v10 = v7[2](v7);
  [(MFUIStateCaptor *)self setIsCapturingUIState:0];
  id v11 = +[NSString stringWithFormat:@"%@%@%@", v8, v10, v9];

  return v11;
}

- (BOOL)isCapturingUIState
{
  return self->_isCapturingUIState;
}

- (void)setIsCapturingUIState:(BOOL)a3
{
  self->_isCapturingUIState = a3;
}

- (NSArray)redactedFieldNames
{
  return self->_redactedFieldNames;
}

- (void).cxx_destruct
{
}

@end