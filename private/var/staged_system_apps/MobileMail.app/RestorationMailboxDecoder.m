@interface RestorationMailboxDecoder
+ (id)decoderWithDaemonInterface:(id)a3 log:(id)a4;
- (EMDaemonInterface)daemonInterface;
- (OS_os_log)log;
- (RestorationMailboxDecoder)initWithDaemonInterface:(id)a3 log:(id)a4;
- (id)_decodeGenericMailbox:(id)a3;
- (id)_decodeSmartMailbox:(id)a3;
- (id)_decodeUnifiedMailbox:(id)a3;
- (id)decodeMailboxData:(id)a3;
- (void)setDaemonInterface:(id)a3;
- (void)setLog:(id)a3;
@end

@implementation RestorationMailboxDecoder

+ (id)decoderWithDaemonInterface:(id)a3 log:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  v7 = [[RestorationMailboxDecoder alloc] initWithDaemonInterface:v5 log:v6];

  return v7;
}

- (RestorationMailboxDecoder)initWithDaemonInterface:(id)a3 log:(id)a4
{
  id v6 = a3;
  v11.receiver = self;
  v11.super_class = (Class)RestorationMailboxDecoder;
  v7 = [(RestorationMailboxDecoder *)&v11 init];
  v8 = v7;
  if (v7)
  {
    objc_storeWeak((id *)&v7->_daemonInterface, v6);
    if (a4)
    {
      v8->_log = (OS_os_log *)a4;
    }
    else
    {
      sub_10020FF58();
      v9 = (OS_os_log *)objc_claimAutoreleasedReturnValue();
      v8->_log = v9;
    }
  }

  return v8;
}

- (id)decodeMailboxData:(id)a3
{
  id v4 = a3;
  id v5 = v4;
  if (!v4 || ![v4 length])
  {
    id v14 = [(RestorationMailboxDecoder *)self log];
    v12 = +[NSError mf_restorationMailboxNotAvailableErrorWithUnderlyingError:0];
    v7 = v14;
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      [v12 ef_publicDescription];
      objc_claimAutoreleasedReturnValue();
      sub_10045DCC4();
    }

    v13 = +[EFFuture futureWithError:v12];
    v8 = v7;
    goto LABEL_14;
  }
  id v6 = [(RestorationMailboxDecoder *)self log];
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 134217984;
    id v21 = [v5 length];
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "RestorationMailboxDecoder: Decoding mailbox from data of length %lu", buf, 0xCu);
  }

  id v19 = 0;
  v7 = [objc_alloc((Class)NSKeyedUnarchiver) initForReadingFromData:v5 error:&v19];
  v8 = v19;
  if (v8)
  {
    v9 = [(RestorationMailboxDecoder *)self log];
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      [v8 ef_publicDescription];
      objc_claimAutoreleasedReturnValue();
      sub_10045DDB4();
    }

    id v10 = [(RestorationMailboxDecoder *)self log];
    objc_super v11 = +[NSError mf_restorationMailboxNotAvailableErrorWithUnderlyingError:0];
    v12 = v10;
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
    {
      [v11 ef_publicDescription];
      objc_claimAutoreleasedReturnValue();
      sub_10045DD64();
    }
LABEL_10:

    v13 = +[EFFuture futureWithError:v11];

LABEL_14:
    goto LABEL_15;
  }
  id v16 = [v7 decodeIntegerForKey:@"SerializationType"];
  if (v16 == (id)1)
  {
    uint64_t v17 = [(RestorationMailboxDecoder *)self _decodeGenericMailbox:v7];
  }
  else if (v16 == (id)2)
  {
    uint64_t v17 = [(RestorationMailboxDecoder *)self _decodeSmartMailbox:v7];
  }
  else
  {
    if (v16 != (id)3)
    {
      id v18 = [(RestorationMailboxDecoder *)self log];
      objc_super v11 = +[NSError mf_restorationMailboxNotAvailableErrorWithUnderlyingError:0];
      v12 = v18;
      if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
      {
        [v11 ef_publicDescription];
        objc_claimAutoreleasedReturnValue();
        sub_10045DD14();
      }
      goto LABEL_10;
    }
    uint64_t v17 = [(RestorationMailboxDecoder *)self _decodeUnifiedMailbox:v7];
  }
  v13 = (void *)v17;
LABEL_15:

  return v13;
}

- (id)_decodeGenericMailbox:(id)a3
{
  id v4 = a3;
  id v5 = [(RestorationMailboxDecoder *)self log];
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG)) {
    sub_10045DE70();
  }
  id v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"ObjectID"];
  if (v6)
  {
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG)) {
      sub_10045DE3C();
    }
    v7 = [(RestorationMailboxDecoder *)self daemonInterface];
    v8 = [v7 mailboxRepository];
    v9 = [v8 mailboxForObjectID:v6];

    v17[0] = _NSConcreteStackBlock;
    v17[1] = 3221225472;
    v17[2] = sub_100210FD0;
    v17[3] = &unk_10060C1D0;
    id v10 = v5;
    id v18 = v10;
    objc_super v11 = [v9 recover:v17];

    v15[0] = _NSConcreteStackBlock;
    v15[1] = 3221225472;
    v15[2] = sub_1002110EC;
    v15[3] = &unk_100606FF0;
    id v16 = v10;
    [v11 addSuccessBlock:v15];

    v12 = v18;
  }
  else
  {
    v12 = +[NSError mf_invalidRestorationDataErrorWithUnderlyingError:0];
    v13 = v5;
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
    {
      [v12 ef_publicDescription];
      objc_claimAutoreleasedReturnValue();
      sub_10045DDF8();
    }

    objc_super v11 = +[EFFuture futureWithError:v12];
  }

  return v11;
}

- (id)_decodeSmartMailbox:(id)a3
{
  id v4 = a3;
  id v5 = [(RestorationMailboxDecoder *)self log];
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG)) {
    sub_10045E084();
  }
  id v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"SmartMailboxSourceType"];
  v7 = v6;
  if (!v6)
  {
    id v14 = v5;
    objc_super v11 = +[NSError mf_restorationMailboxNotAvailableErrorWithUnderlyingError:0];
    id v10 = v14;
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      [v11 ef_publicDescription];
      objc_claimAutoreleasedReturnValue();
      sub_10045DF2C();
    }

    uint64_t v13 = +[EFFuture futureWithError:v11];
    goto LABEL_14;
  }
  id v8 = [v6 unsignedIntegerValue];
  if (_MSSourceTypeIsValid())
  {
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG)) {
      sub_10045E00C((uint64_t)v8, v5);
    }
    v9 = +[SharedMailboxController sharedInstanceForSourceType:v8];
    id v10 = v9;
    if (v9)
    {
      objc_super v11 = [v9 mailbox];
      v12 = v5;
      if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG))
      {
        [v11 ef_publicDescription];
        objc_claimAutoreleasedReturnValue();
        sub_10045DFC8();
      }

      uint64_t v13 = +[EFFuture futureWithResult:v11];
LABEL_14:
      v15 = (void *)v13;
      goto LABEL_22;
    }
    id v21 = +[NSString stringWithFormat:@"No SharedMailboxController found for source type (%lu)", v8];
    v22 = v5;
    id v19 = v21;
    v23 = +[NSError mf_restorationMailboxNotAvailableErrorWithUnderlyingError:0];
    id v18 = v22;
    if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
    {
      v24 = [v23 ef_publicDescription];
      sub_10045DF7C((uint64_t)v19, v24, (uint64_t)v26);
    }

    v15 = +[EFFuture futureWithError:v23];

    objc_super v11 = v19;
  }
  else
  {
    id v16 = +[NSString stringWithFormat:@"Decoded smart mailbox source type (%lu) is invalid.", v8];
    uint64_t v17 = v5;
    id v18 = v16;
    id v19 = +[NSError mf_restorationMailboxNotAvailableErrorWithUnderlyingError:0];
    objc_super v11 = v17;
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    {
      v20 = [v19 ef_publicDescription];
      sub_10045DF7C((uint64_t)v18, v20, (uint64_t)v26);
    }

    v15 = +[EFFuture futureWithError:v19];
    id v10 = v18;
  }

LABEL_22:

  return v15;
}

- (id)_decodeUnifiedMailbox:(id)a3
{
  id v4 = a3;
  id v5 = [(RestorationMailboxDecoder *)self log];
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG)) {
    sub_10045E248();
  }
  if ([v4 containsValueForKey:@"UnifiedMailboxType"])
  {
    id v6 = [v4 decodeIntegerForKey:@"UnifiedMailboxType"];
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG)) {
      sub_10045E180((uint64_t)v6, v5);
    }
    v7 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"UnifiedMailboxName"];
    if (v6 == (id)5)
    {
      if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG)) {
        sub_10045E14C();
      }
      id v8 = +[LocalAccount localAccount];
      v9 = [v8 transientDraftsFolder];
      id v10 = [v9 URL];

      objc_super v11 = +[EMMessageListItemPredicates predicateForExcludingMessagesInMailboxWithURL:v10];
    }
    else
    {
      objc_super v11 = 0;
    }
    id v14 = +[EMSmartMailbox unifiedMailboxOfType:v6 name:v7 additionalPredicate:v11];
    v15 = v5;
    id v16 = v15;
    if (v14)
    {
      if (os_log_type_enabled(v15, OS_LOG_TYPE_DEBUG))
      {
        [v14 ef_publicDescription];
        objc_claimAutoreleasedReturnValue();
        sub_10045E108();
      }

      uint64_t v13 = +[EFFuture futureWithResult:v14];
    }
    else
    {
      uint64_t v17 = +[NSError mf_restorationMailboxNotAvailableErrorWithUnderlyingError:0];
      id v18 = v16;
      if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
      {
        [v17 ef_publicDescription];
        objc_claimAutoreleasedReturnValue();
        sub_10045E0B8();
      }

      uint64_t v13 = +[EFFuture futureWithError:v17];
    }
  }
  else
  {
    v12 = v5;
    objc_super v11 = +[NSError mf_restorationMailboxNotAvailableErrorWithUnderlyingError:0];
    v7 = v12;
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      [v11 ef_publicDescription];
      objc_claimAutoreleasedReturnValue();
      sub_10045E1F8();
    }

    uint64_t v13 = +[EFFuture futureWithError:v11];
  }

  return v13;
}

- (OS_os_log)log
{
  return self->_log;
}

- (void)setLog:(id)a3
{
  self->_log = (OS_os_log *)a3;
}

- (EMDaemonInterface)daemonInterface
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_daemonInterface);

  return (EMDaemonInterface *)WeakRetained;
}

- (void)setDaemonInterface:(id)a3
{
}

- (void).cxx_destruct
{
}

@end