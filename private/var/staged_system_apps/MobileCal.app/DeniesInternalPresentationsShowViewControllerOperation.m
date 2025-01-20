@interface DeniesInternalPresentationsShowViewControllerOperation
- (void)doInternalPresentation;
@end

@implementation DeniesInternalPresentationsShowViewControllerOperation

- (void)doInternalPresentation
{
  v3 = (void *)kCalUILogHandle;
  if (os_log_type_enabled((os_log_t)kCalUILogHandle, OS_LOG_TYPE_DEBUG))
  {
    v4 = v3;
    v5 = objc_opt_class();
    id v6 = v5;
    v7 = [(ShowViewControllerOperation *)self shownViewController];
    *(_DWORD *)buf = 138412546;
    v14 = v5;
    __int16 v15 = 2112;
    id v16 = (id)objc_opt_class();
    id v8 = v16;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEBUG, "%@ operation instructing non-internal modal presentation of %@.", buf, 0x16u);
  }
  v9 = [(ShowViewControllerOperation *)self shownViewController];
  [v9 setModalPresentationStyle:1];

  v10 = [(ShowViewControllerOperation *)self parentOfShownViewController];
  v11 = [(ShowViewControllerOperation *)self shownViewController];
  v12[0] = _NSConcreteStackBlock;
  v12[1] = 3221225472;
  v12[2] = sub_1000CC310;
  v12[3] = &unk_1001D2740;
  v12[4] = self;
  [v10 presentViewController:v11 animated:[self shouldShowWithAnimation] completion:v12];
}

@end