@interface PhotosURLRedirectRequest
- (BOOL)_checkAndAlertSubscribedStreamsLimitReached;
- (PhotosURLRedirectRequest)initWithDestinationURL:(id)a3 rootController:(id)a4;
- (void)_navigateToSharedAlbumActivityFeed;
- (void)_showAlertForError:(unint64_t)a3;
- (void)performRequest;
@end

@implementation PhotosURLRedirectRequest

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_rootController, 0);

  objc_storeStrong((id *)&self->_invitationToken, 0);
}

- (void)performRequest
{
  if (!PLIsLockdownMode())
  {
    v3 = +[PLPhotoSharingHelper sharingPersonID];
    v4 = +[PLAccountStore pl_sharedAccountStore];
    v5 = [v4 cachedPrimaryAppleAccount];

    if (v5)
    {
      v6 = +[PHPhotoLibrary px_deprecated_appPhotoLibrary];
      v7 = [v6 photoLibraryURL];
      unsigned __int8 v8 = +[PLPhotoSharingHelper sharedStreamsEnabledForPhotoLibraryURL:v7];

      if (v8)
      {
        if ([v3 length])
        {
          if ([(PhotosURLRedirectRequest *)self _checkAndAlertSubscribedStreamsLimitReached])
          {
            [(PhotosURLRedirectRequest *)self _navigateToSharedAlbumActivityFeed];
          }
          else
          {
            v12 = +[MSASConnection sharedConnection];
            invitationToken = self->_invitationToken;
            v15[0] = _NSConcreteStackBlock;
            v15[1] = 3221225472;
            v15[2] = sub_100041460;
            v15[3] = &unk_100064738;
            v15[4] = self;
            [v12 acceptInvitationWithToken:invitationToken personID:v3 completionBlock:v15];
          }
        }
        else
        {
          v11 = PLPhotoSharingGetLog();
          if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
          {
            *(_WORD *)v14 = 0;
            _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_ERROR, "ERROR: Failed to subscribe to shared stream because the personID was nil", v14, 2u);
          }
        }
        goto LABEL_13;
      }
      v9 = self;
      uint64_t v10 = 2;
    }
    else
    {
      v9 = self;
      uint64_t v10 = 1;
    }
    [(PhotosURLRedirectRequest *)v9 _showAlertForError:v10];
LABEL_13:

    return;
  }

  [(PhotosURLRedirectRequest *)self _showAlertForError:0];
}

- (BOOL)_checkAndAlertSubscribedStreamsLimitReached
{
  v2 = +[PLPhotoLibrary systemPhotoLibrary];
  unsigned int v3 = +[PLPhotoSharingHelper hasReachedLimitOfSubscribedStreamsInLibrary:v2];

  if (v3)
  {
    v4 = PLServicesLocalizedFrameworkString();
    v5 = PLServicesLocalizedFrameworkString();
    id v13 = +[PLPhotoSharingHelper maxSubscribedStreams];
    v6 = PFLocalizedStringWithValidatedFormat();

    v7 = +[UIAlertController alertControllerWithTitle:message:preferredStyle:](UIAlertController, "alertControllerWithTitle:message:preferredStyle:", v4, v6, 1, v13);
    unsigned __int8 v8 = PLLocalizedFrameworkString();
    v9 = +[UIAlertAction actionWithTitle:v8 style:1 handler:0];
    [v7 addAction:v9];

    uint64_t v10 = +[UIApplication sharedApplication];
    v11 = [v10 px_firstKeyWindow];
    [v11 pl_presentViewController:v7 animated:1];
  }
  return v3;
}

- (void)_navigateToSharedAlbumActivityFeed
{
  id v3 = [objc_alloc((Class)PXProgrammaticNavigationDestination) initWithType:19 revealMode:3];
  if ([(PXProgrammaticNavigationParticipant *)self->_rootController routingOptionsForDestination:v3])
  {
    rootController = self->_rootController;
    v7[0] = _NSConcreteStackBlock;
    v7[1] = 3221225472;
    v7[2] = sub_100041910;
    v7[3] = &unk_1000646E8;
    unsigned __int8 v8 = v3;
    [(PXProgrammaticNavigationParticipant *)rootController navigateToDestination:v8 options:0 completionHandler:v7];
    v4 = v8;
  }
  else
  {
    v4 = PLPhotoSharingGetLog();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    {
      v5 = [v3 publicDescription];
      *(_DWORD *)buf = 138543362;
      uint64_t v10 = v5;
      _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_ERROR, "Failed to programmatically navigate to %{public}@", buf, 0xCu);
    }
  }
}

- (void)_showAlertForError:(unint64_t)a3
{
  switch(a3)
  {
    case 0uLL:
      v4 = PXLocalizedString();
      v5 = PXLocalizedString();
      uint64_t v37 = 0;
      uint64_t v38 = 0;
      int v6 = PXSharedAlbumURLHandlingParseInvitationToken();
      id v7 = 0;
      id v8 = 0;
      if (v6)
      {
        v9 = PXLocalizedString();
        id v33 = v7;
        id v34 = v8;
        uint64_t v10 = PXLocalizedStringWithValidatedFormat();

        v5 = (void *)v10;
      }
      v11 = +[UIAlertController alertControllerWithTitle:message:preferredStyle:](UIAlertController, "alertControllerWithTitle:message:preferredStyle:", v4, v5, 1, v33, v34);
      v12 = PLLocalizedFrameworkString();
      id v13 = +[UIAlertAction actionWithTitle:v12 style:1 handler:0];
      [v11 addAction:v13];

      break;
    case 1uLL:
      v26 = PLLocalizedFrameworkString();
      v27 = PLLocalizedFrameworkString();
      v11 = +[UIAlertController alertControllerWithTitle:v26 message:v27 preferredStyle:1];

      v28 = PLLocalizedFrameworkString();
      v29 = +[UIAlertAction actionWithTitle:v28 style:1 handler:0];
      [v11 addAction:v29];

      v18 = PLLocalizedFrameworkString();
      v19 = &stru_100064678;
      goto LABEL_11;
    case 2uLL:
      v14 = PLLocalizedFrameworkString();
      v15 = PLLocalizedFrameworkString();
      v11 = +[UIAlertController alertControllerWithTitle:v14 message:v15 preferredStyle:1];

      v16 = PLLocalizedFrameworkString();
      v17 = +[UIAlertAction actionWithTitle:v16 style:1 handler:0];
      [v11 addAction:v17];

      v18 = PLLocalizedFrameworkString();
      v19 = &stru_100064698;
LABEL_11:
      v22 = v18;
      uint64_t v23 = 0;
      goto LABEL_12;
    case 3uLL:
      v20 = PLLocalizedFrameworkString();
      v21 = PLLocalizedFrameworkString();
      v11 = +[UIAlertController alertControllerWithTitle:v20 message:v21 preferredStyle:1];

      goto LABEL_8;
    case 4uLL:
      v20 = PLLocalizedFrameworkString();
      v11 = +[UIAlertController alertControllerWithTitle:v20 message:0 preferredStyle:1];
LABEL_8:

      v18 = PLLocalizedFrameworkString();
      v22 = v18;
      uint64_t v23 = 1;
      v19 = 0;
LABEL_12:
      v30 = +[UIAlertAction actionWithTitle:v22 style:v23 handler:v19];
      [v11 addAction:v30];

      break;
    default:
      v25 = +[NSAssertionHandler currentHandler];
      [v25 handleFailureInMethod:a2 object:self file:@"PhotosURLRedirectRequest.m" lineNumber:133 description:@"Unknown Request Error"];

      v11 = 0;
      break;
  }
  dispatch_time_t v31 = dispatch_time(0, 1000000000);
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100041F58;
  block[3] = &unk_1000646C0;
  id v36 = v11;
  id v32 = v11;
  dispatch_after(v31, (dispatch_queue_t)&_dispatch_main_q, block);
}

- (PhotosURLRedirectRequest)initWithDestinationURL:(id)a3 rootController:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v9 = v8;
  if (v7)
  {
    if (v8) {
      goto LABEL_3;
    }
  }
  else
  {
    v17 = +[NSAssertionHandler currentHandler];
    [v17 handleFailureInMethod:a2, self, @"PhotosURLRedirectRequest.m", 54, @"Invalid parameter not satisfying: %@", @"URL" object file lineNumber description];

    if (v9) {
      goto LABEL_3;
    }
  }
  v18 = +[NSAssertionHandler currentHandler];
  [v18 handleFailureInMethod:a2, self, @"PhotosURLRedirectRequest.m", 55, @"Invalid parameter not satisfying: %@", @"rootController" object file lineNumber description];

LABEL_3:
  uint64_t v10 = PXSharedAlbumURLHandlingInvitationTokenForURL();
  if (v10)
  {
    v19.receiver = self;
    v19.super_class = (Class)PhotosURLRedirectRequest;
    v11 = [(PhotosURLRedirectRequest *)&v19 init];
    if (v11)
    {
      v12 = (NSString *)[v10 copy];
      invitationToken = v11->_invitationToken;
      v11->_invitationToken = v12;

      objc_storeStrong((id *)&v11->_rootController, a4);
    }
    self = v11;
    v14 = self;
  }
  else
  {
    v15 = PLPhotoSharingGetLog();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      id v21 = v7;
      _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_ERROR, "Invalid URL: %@", buf, 0xCu);
    }

    v14 = 0;
  }

  return v14;
}

@end