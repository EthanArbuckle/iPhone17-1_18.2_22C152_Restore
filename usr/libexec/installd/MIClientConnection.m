@interface MIClientConnection
- (BOOL)_validateAppWithBundleID:(id)a3 isNotInstalledInDomain:(unint64_t)a4 error:(id *)a5;
- (BOOL)_validateArgsForMethodWithName:(const char *)a3 bundleIdentifier:(id)a4 data:(id)a5 optionalOptions:(id)a6 error:(id *)a7;
- (BOOL)_validateInstallRequestForURL:(id)a3 identity:(id)a4 targetingDomain:(unint64_t)a5 options:(id)a6 withError:(id *)a7;
- (NSString)clientName;
- (NSXPCConnection)xpcConnection;
- (unsigned)percentComplete;
- (void)_callBlockAfterDelegateMessagesSend:(const char *)a3 dispatchBlock:(id)a4;
- (void)_doInstallationForURL:(id)a3 identity:(id)a4 domain:(unint64_t)a5 options:(id)a6 operationType:(unint64_t)a7 completion:(id)a8;
- (void)_finalizeStagedUpdateForUUID:(id)a3 completion:(id)a4;
- (void)_installURL:(id)a3 identity:(id)a4 targetingDomain:(unint64_t)a5 options:(id)a6 operationType:(unint64_t)a7 completion:(id)a8;
- (void)_stageURL:(id)a3 identity:(id)a4 domain:(unint64_t)a5 options:(id)a6 completion:(id)a7;
- (void)_triggerRegistrationForContent:(unint64_t)a3 registrationOptions:(id)a4 writeLock:(BOOL)a5 withCompletion:(id)a6;
- (void)_uninstallIdentities:(id)a3 withOptions:(id)a4 completion:(id)a5;
- (void)acquireReferenceforInstalledAppWithIdentity:(id)a3 inDomain:(unint64_t)a4 matchingInstallSessionID:(id)a5 completion:(id)a6;
- (void)cancelUpdateForStagedUUID:(id)a3 completion:(id)a4;
- (void)checkCapabilities:(id)a3 withOptions:(id)a4 completion:(id)a5;
- (void)clearTestFlags:(unint64_t)a3 withCompletion:(id)a4;
- (void)clearUninstalledIdentifiers:(id)a3 withOptions:(id)a4 completion:(id)a5;
- (void)createSerializedPlaceholderForInstalledAppWithBundeID:(id)a3 personaUniqueString:(id)a4 atResultURL:(id)a5 onDevice:(int)a6 withCompletion:(id)a7;
- (void)dieForTesting;
- (void)endTestModeWithCompletion:(id)a3;
- (void)enumerateInstalledAppsWithOptions:(id)a3 completion:(id)a4;
- (void)fetchDiskUsageForIdentifiers:(id)a3 withOptions:(id)a4 completion:(id)a5;
- (void)fetchInfoForContainerizedAppWithIdentity:(id)a3 inDomain:(unint64_t)a4 options:(id)a5 completion:(id)a6;
- (void)fetchInfoForFrameworkAtURL:(id)a3 options:(id)a4 completion:(id)a5;
- (void)finalizeReference:(id)a3 completion:(id)a4;
- (void)finalizeStagedInstallForUUID:(id)a3 returningResultInfo:(BOOL)a4 completion:(id)a5;
- (void)getAppMetadataForApp:(id)a3 completion:(id)a4;
- (void)getPidForTestingWithCompletion:(id)a3;
- (void)getTestModeWithCompletion:(id)a3;
- (void)installURL:(id)a3 identity:(id)a4 targetingDomain:(unint64_t)a5 options:(id)a6 returningResultInfo:(BOOL)a7 completion:(id)a8;
- (void)invalidateReference:(id)a3 completion:(id)a4;
- (void)linkedBundleIDsForAppIdentity:(id)a3 withCompletion:(id)a4;
- (void)listSafeHarborsOfType:(unint64_t)a3 forPersona:(id)a4 withOptions:(id)a5 completion:(id)a6;
- (void)lookupSystemAppStateWithOptions:(id)a3 completion:(id)a4;
- (void)lookupUninstalledWithOptions:(id)a3 completion:(id)a4;
- (void)raiseExceptionWithCompletion:(id)a3;
- (void)referencesForBundleWithIdentifier:(id)a3 inDomain:(unint64_t)a4 completion:(id)a5;
- (void)registerContentsForDiskImageAtURL:(id)a3 completion:(id)a4;
- (void)registerPlaceholderForReference:(id)a3 completion:(id)a4;
- (void)registerSafeHarborAtPath:(id)a3 forIdentity:(id)a4 ofType:(unint64_t)a5 withOptions:(id)a6 completion:(id)a7;
- (void)releaseTerminationAssertion;
- (void)removeSafeHarborForIdentity:(id)a3 ofType:(unint64_t)a4 withOptions:(id)a5 completion:(id)a6;
- (void)revertForIXWithIdentity:(id)a3 withOptions:(id)a4 completion:(id)a5;
- (void)revertIdentity:(id)a3 withOptions:(id)a4 completion:(id)a5;
- (void)sendDelegateMessagesComplete;
- (void)sendProgressWithDictionary:(id)a3;
- (void)sendProgressWithStatus:(id)a3;
- (void)sendProgressWithStatus:(id)a3 percentComplete:(unsigned int)a4;
- (void)setEligibilityTestOverrides:(id)a3 withCompletion:(id)a4;
- (void)setLaunchWarningForApp:(id)a3 withUniqueInstallIdentifier:(id)a4 warningData:(id)a5 completion:(id)a6;
- (void)setSystemAppMigrationComplete:(id)a3;
- (void)setTestFlags:(unint64_t)a3 withCompletion:(id)a4;
- (void)setTestModeWithCompletion:(id)a3;
- (void)setXpcConnection:(id)a3;
- (void)snapshotWKAppInCompanionAppID:(id)a3 toURL:(id)a4 options:(id)a5 completion:(id)a6;
- (void)stageInstallURL:(id)a3 identity:(id)a4 targetingDomain:(unint64_t)a5 withOptions:(id)a6 completion:(id)a7;
- (void)systemAppMigratorHasCompleted:(id)a3;
- (void)triggerRegistrationForContainerizedContentForOptions:(id)a3 withCompletion:(id)a4;
- (void)triggerRegistrationForDiskImageContentForOptions:(id)a3 withCompletion:(id)a4;
- (void)uninstallIdentifiers:(id)a3 withOptions:(id)a4 completion:(id)a5;
- (void)uninstallIdentity:(id)a3 withOptions:(id)a4 completion:(id)a5;
- (void)unregisterContentsForDiskImageAtURL:(id)a3 completion:(id)a4;
- (void)updatePlaceholderMetadataForApp:(id)a3 installType:(unint64_t)a4 failureReason:(unint64_t)a5 underlyingError:(id)a6 failureSource:(unint64_t)a7 completion:(id)a8;
- (void)updateSinfForIXWithIdentifier:(id)a3 withOptions:(id)a4 sinfData:(id)a5 completion:(id)a6;
- (void)updateSystemAppStateForIdentifier:(id)a3 appState:(int)a4 completion:(id)a5;
- (void)updateiTunesMetadataForIXWithIdentifier:(id)a3 metadata:(id)a4 completion:(id)a5;
- (void)waitForSystemAppMigratorToComplete:(id)a3;
@end

@implementation MIClientConnection

- (NSString)clientName
{
  v2 = [(MIClientConnection *)self xpcConnection];
  v3 = v2;
  if (v2)
  {
    id v4 = [v2 processIdentifier];
    id v5 = [v3 effectiveUserIdentifier];
    id v6 = [v3 effectiveGroupIdentifier];
    v7 = MICopyProcessNameForPid();
    v8 = +[NSString stringWithFormat:@"%@ (pid %d (%u/%u))", v7, v4, v5, v6];
  }
  else
  {
    v8 = @"Unknown client";
  }

  return (NSString *)v8;
}

- (void)sendProgressWithDictionary:(id)a3
{
  id v7 = a3;
  id v4 = [(MIClientConnection *)self xpcConnection];
  id v5 = v4;
  if (v4)
  {
    id v6 = [v4 remoteObjectProxyWithErrorHandler:&stru_10008D170];
    [v6 reportProgress:v7];
  }
  else if (!qword_1000A60B8 || *(int *)(qword_1000A60B8 + 44) >= 3)
  {
    MOLogWrite();
  }
}

- (void)sendProgressWithStatus:(id)a3 percentComplete:(unsigned int)a4
{
  uint64_t percentComplete = self->_percentComplete;
  if (percentComplete < a4)
  {
    self->_uint64_t percentComplete = a4;
    uint64_t percentComplete = *(void *)&a4;
  }
  v9[0] = @"Status";
  v9[1] = @"PercentComplete";
  v10[0] = a3;
  id v6 = a3;
  id v7 = +[NSNumber numberWithUnsignedInt:percentComplete];
  v10[1] = v7;
  v8 = +[NSDictionary dictionaryWithObjects:v10 forKeys:v9 count:2];

  [(MIClientConnection *)self sendProgressWithDictionary:v8];
}

- (void)sendProgressWithStatus:(id)a3
{
}

- (void)sendDelegateMessagesComplete
{
  v2 = [(MIClientConnection *)self xpcConnection];
  v3 = v2;
  if (v2)
  {
    v5[0] = _NSConcreteStackBlock;
    v5[1] = 3221225472;
    v5[2] = sub_100015B7C;
    v5[3] = &unk_10008D198;
    id v6 = v2;
    id v4 = [v6 remoteObjectProxyWithErrorHandler:v5];
    [v4 delegateMessageDeliveryCompleteWithError:0];
  }
}

- (void)releaseTerminationAssertion
{
  v2 = [(MIClientConnection *)self xpcConnection];
  v3 = v2;
  if (v2)
  {
    v5[0] = _NSConcreteStackBlock;
    v5[1] = 3221225472;
    v5[2] = sub_100015CA8;
    v5[3] = &unk_10008D198;
    id v6 = v2;
    id v4 = [v6 synchronousRemoteObjectProxyWithErrorHandler:v5];
    [v4 releaseTerminationAssertion];
  }
}

- (void)_callBlockAfterDelegateMessagesSend:(const char *)a3 dispatchBlock:(id)a4
{
  id v5 = (void (**)(void))a4;
  id v6 = [(MIClientConnection *)self xpcConnection];
  if (v6)
  {
    v8[0] = _NSConcreteStackBlock;
    v8[1] = 3221225472;
    v8[2] = sub_100015E1C;
    v8[3] = &unk_10008D1C0;
    id v9 = (id)os_transaction_create();
    v10 = v5;
    id v7 = v9;
    [v6 addBarrierBlock:v8];
  }
  else
  {
    v5[2](v5);
  }
}

- (BOOL)_validateAppWithBundleID:(id)a3 isNotInstalledInDomain:(unint64_t)a4 error:(id *)a5
{
  id v7 = a3;
  v8 = +[MIAppReferenceManager defaultManager];
  id v9 = [v8 personaUniqueStringsForAppWithBundleID:v7 domain:a4 forUserWithID:sub_10000EB14() error:0];

  id v10 = [v9 count];
  if (v10)
  {
    v11 = (void *)MIInstallerErrorDomain;
    v15 = MIStringForInstallationDomain();
    sub_100014A08((uint64_t)"-[MIClientConnection _validateAppWithBundleID:isNotInstalledInDomain:error:]", 302, v11, 189, 0, 0, @"Found references (%@) for %@ in %@", v12, (uint64_t)v9);
    id v13 = (id)objc_claimAutoreleasedReturnValue();

    if (a5)
    {
      id v13 = v13;
      *a5 = v13;
    }
  }
  else
  {
    id v13 = 0;
  }

  return v10 == 0;
}

- (void)_doInstallationForURL:(id)a3 identity:(id)a4 domain:(unint64_t)a5 options:(id)a6 operationType:(unint64_t)a7 completion:(id)a8
{
  id v39 = a3;
  id v38 = a4;
  id v13 = a6;
  id v36 = a8;
  v37 = [v13 installTypeSummaryString];
  id v14 = [v13 lsInstallType];
  if (!qword_1000A60B8 || *(int *)(qword_1000A60B8 + 44) >= 5)
  {
    v15 = [v39 path];
    v16 = MIStringForInstallationDomain();
    [(MIClientConnection *)self clientName];
    v35 = v34 = v16;
    v32 = v37;
    id v33 = v14;
    v31 = v15;
    MOLogWrite();
  }
  v17 = +[MIInstaller installerForURL:identity:domain:options:operationType:forClient:](MIInstaller, "installerForURL:identity:domain:options:operationType:forClient:", v39, v38, a5, v13, 0, self, v31, v32, v33, v34, v35);
  v18 = v17;
  if (!v17)
  {
    v23 = [v39 path];
    uint64_t v25 = sub_100014A08((uint64_t)"-[MIClientConnection _doInstallationForURL:identity:domain:options:operationType:completion:]", 326, MIInstallerErrorDomain, 4, 0, &off_1000975D8, @"Failed to create installer for %@", v24, (uint64_t)v23);
LABEL_13:

    v22 = 0;
    v21 = 0;
    id v20 = (id)v25;
    goto LABEL_14;
  }
  id v45 = 0;
  unsigned int v19 = [v17 performInstallationWithError:&v45];
  id v20 = v45;
  if (!v19)
  {
    v22 = 0;
    v21 = 0;
    goto LABEL_14;
  }
  v21 = [v18 receipt];
  if (!v21)
  {
    v23 = [v39 path];
    uint64_t v25 = sub_100014A08((uint64_t)"-[MIClientConnection _doInstallationForURL:identity:domain:options:operationType:completion:]", 336, MIInstallerErrorDomain, 4, 0, &off_100097600, @"Failed to get receipt after installing %@", v26, (uint64_t)v23);

    goto LABEL_13;
  }
  v22 = [v18 recordPromise];
  if (qword_1000A60B8 && *(int *)(qword_1000A60B8 + 44) >= 7) {
    MOLogWrite();
  }
LABEL_14:

  [(MIClientConnection *)self sendDelegateMessagesComplete];
  v40[0] = _NSConcreteStackBlock;
  v40[1] = 3221225472;
  v40[2] = sub_100016400;
  v40[3] = &unk_10008D1E8;
  id v27 = v36;
  id v44 = v27;
  id v28 = v21;
  id v41 = v28;
  id v29 = v22;
  id v42 = v29;
  id v30 = v20;
  id v43 = v30;
  [(MIClientConnection *)self _callBlockAfterDelegateMessagesSend:"com.apple.installd.installation-for-url-complete" dispatchBlock:v40];
}

- (void)installURL:(id)a3 identity:(id)a4 targetingDomain:(unint64_t)a5 options:(id)a6 returningResultInfo:(BOOL)a7 completion:(id)a8
{
  v15[0] = _NSConcreteStackBlock;
  v15[1] = 3221225472;
  v15[2] = sub_1000164F0;
  v15[3] = &unk_10008D210;
  id v16 = a8;
  BOOL v17 = a7;
  id v14 = v16;
  [(MIClientConnection *)self _installURL:a3 identity:a4 targetingDomain:a5 options:a6 operationType:0 completion:v15];
}

- (void)cancelUpdateForStagedUUID:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = (void (**)(id, void, id))a4;
  if (+[ICLFeatureFlags twoStageAppInstallEnabled])
  {
    id v9 = +[MIJournal sharedInstance];
    sub_100016830(self, @"InstallForInstallCoordination");
    id v10 = (id)objc_claimAutoreleasedReturnValue();
    if (v10)
    {
LABEL_3:

      v11 = 0;
LABEL_4:
      v7[2](v7, 0, v10);
      goto LABEL_7;
    }
    uint64_t v12 = [v9 journalEntryForUniqueIdentifier:v6];
    id v14 = v12;
    if (!v12)
    {
      sub_100014A08((uint64_t)"-[MIClientConnection cancelUpdateForStagedUUID:completion:]", 398, MIInstallerErrorDomain, 218, 0, 0, @"Failed to find matching journal entry for %@", v13, (uint64_t)v6);
      id v10 = (id)objc_claimAutoreleasedReturnValue();
      goto LABEL_3;
    }
    v15 = [v12 identity];
    v11 = [v15 bundleID];

    sub_100054F88(v11);
    id v17 = 0;
    unsigned int v16 = [v9 purgeJournalEntry:v14 withError:&v17];
    id v10 = v17;

    sub_1000550D8(v11);
    if (!v16) {
      goto LABEL_4;
    }
    v7[2](v7, 1, 0);
  }
  else
  {
    sub_100014A08((uint64_t)"-[MIClientConnection cancelUpdateForStagedUUID:completion:]", 375, MIInstallerErrorDomain, 161, 0, 0, @"%s is not enabled", v8, (uint64_t)"-[MIClientConnection cancelUpdateForStagedUUID:completion:]");
    id v10 = (id)objc_claimAutoreleasedReturnValue();
    v7[2](v7, 0, v10);
    v11 = 0;
  }
LABEL_7:
}

- (void)registerPlaceholderForReference:(id)a3 completion:(id)a4
{
  id v5 = a3;
  v56 = (void (**)(id, void, uint64_t))a4;
  uint64_t v80 = 0;
  v81 = &v80;
  uint64_t v82 = 0x3032000000;
  v83 = sub_1000174F4;
  v84 = sub_100017504;
  id v85 = 0;
  uint64_t v74 = 0;
  v75 = &v74;
  uint64_t v76 = 0x3032000000;
  v77 = sub_1000174F4;
  v78 = sub_100017504;
  id v79 = 0;
  v57 = v5;
  v55 = [v5 identity];
  if ((+[ICLFeatureFlags appReferencesEnabled] & 1) == 0)
  {
    uint64_t v35 = sub_100014A08((uint64_t)"-[MIClientConnection registerPlaceholderForReference:completion:]", 449, MIInstallerErrorDomain, 161, 0, 0, @"%s is not enabled", v6, (uint64_t)"-[MIClientConnection registerPlaceholderForReference:completion:]");
    id v36 = (void *)v81[5];
    v81[5] = v35;

    id v22 = 0;
    v53 = 0;
    v54 = 0;
    id v33 = 0;
    v15 = 0;
    id v7 = 0;
    id v29 = 0;
LABEL_27:
    v56[2](v56, 0, v81[5]);
    goto LABEL_28;
  }
  id v7 = [v55 bundleID];
  sub_100054F80(v7);
  id v8 = [v5 domain];
  id v9 = (id *)(v81 + 5);
  id obj = (id)v81[5];
  v54 = +[MIBundleContainer appBundleContainerForIdentifier:v7 inDomain:v8 withError:&obj];
  objc_storeStrong(v9, obj);
  if (!v54)
  {
    uint64_t v37 = sub_100014A08((uint64_t)"-[MIClientConnection registerPlaceholderForReference:completion:]", 459, MIInstallerErrorDomain, 4, (void *)v81[5], 0, @"Failed to find bundle container when registering placeholder for %@", v10, (uint64_t)v5);
LABEL_21:
    id v38 = 0;
    v53 = 0;
    v15 = 0;
    goto LABEL_22;
  }
  char v72 = 0;
  uint64_t v12 = [v54 bundle];
  if (!v12)
  {
    uint64_t v37 = sub_100014A08((uint64_t)"-[MIClientConnection registerPlaceholderForReference:completion:]", 466, MIInstallerErrorDomain, 36, 0, 0, @"Failed to find bundle in bundle container %@", v11, (uint64_t)v54);
    goto LABEL_21;
  }
  uint64_t v13 = (id *)(v81 + 5);
  id v71 = (id)v81[5];
  unsigned int v14 = [v55 resolvePersonaWithError:&v71];
  v53 = (void *)v12;
  objc_storeStrong(v13, v71);
  if (!v14)
  {
    id v38 = 0;
    v15 = 0;
LABEL_25:
    id v29 = 0;
LABEL_26:
    id v33 = 0;
    id v22 = v38;
    id v39 = [v57 identity];
    v40 = [v39 bundleID];
    sub_1000550D8(v40);

    goto LABEL_27;
  }
  v15 = [v55 personaUniqueString];
  unsigned int v16 = (id *)(v81 + 5);
  id v70 = (id)v81[5];
  id v17 = +[MIDataContainer dataContainerForExecutableBundle:v53 forPersona:v15 createIfNeeded:1 temporary:0 created:&v72 error:&v70];
  objc_storeStrong(v16, v70);

  if (!v17)
  {
    uint64_t v37 = sub_100014A08((uint64_t)"-[MIClientConnection registerPlaceholderForReference:completion:]", 476, MIInstallerErrorDomain, 4, (void *)v81[5], 0, @"Failed to create data container when registering placeholder for %@", v18, (uint64_t)v57);
LABEL_32:
    id v38 = 0;
LABEL_22:
    id v22 = (id)v81[5];
    v81[5] = v37;
LABEL_23:

    goto LABEL_25;
  }
  unsigned int v19 = (id *)(v81 + 5);
  id v69 = (id)v81[5];
  id v20 = [v53 appExtensionBundlesWithError:&v69];
  objc_storeStrong(v19, v69);
  if (!v20)
  {
    uint64_t v37 = sub_100014A08((uint64_t)"-[MIClientConnection registerPlaceholderForReference:completion:]", 482, MIInstallerErrorDomain, 4, (void *)v81[5], 0, @"Failed to get app extensions when registering placeholder for %@", v21, (uint64_t)v57);
    goto LABEL_32;
  }
  long long v67 = 0u;
  long long v68 = 0u;
  long long v65 = 0u;
  long long v66 = 0u;
  id v22 = v20;
  id v23 = [v22 countByEnumeratingWithState:&v65 objects:v86 count:16];
  if (v23)
  {
    uint64_t v24 = *(void *)v66;
    while (2)
    {
      for (i = 0; i != v23; i = (char *)i + 1)
      {
        if (*(void *)v66 != v24) {
          objc_enumerationMutation(v22);
        }
        uint64_t v26 = *(void **)(*((void *)&v65 + 1) + 8 * i);
        id v27 = (id *)(v81 + 5);
        id v64 = (id)v81[5];
        id v28 = [v26 dataContainerCreatingIfNeeded:1 forPersona:v15 makeLive:1 created:0 error:&v64];
        objc_storeStrong(v27, v64);

        if (!v28)
        {
          id v41 = (void *)v81[5];
          id v42 = [v26 identifier];
          uint64_t v44 = sub_100014A08((uint64_t)"-[MIClientConnection registerPlaceholderForReference:completion:]", 488, MIInstallerErrorDomain, 4, v41, 0, @"Failed to create data container for app extension %@ when registering placeholder for %@", v43, (uint64_t)v42);
          id v45 = (void *)v81[5];
          v81[5] = v44;

          id v38 = v22;
          goto LABEL_23;
        }
      }
      id v23 = [v22 countByEnumeratingWithState:&v65 objects:v86 count:16];
      if (v23) {
        continue;
      }
      break;
    }
  }

  id v29 = [objc_alloc((Class)MIInstalledInfoGatherer) initWithBundleContainer:v54 forPersona:v15];
  id v30 = (id *)(v81 + 5);
  id v63 = (id)v81[5];
  v51 = [v29 bundleRecordWithError:&v63];
  objc_storeStrong(v30, v63);
  if (!v51)
  {
    id v38 = v22;
    goto LABEL_26;
  }
  [v51 setIsPlaceholder:1];
  v50 = [v57 identity];
  v31 = [v50 bundleID];
  sub_1000550D8(v31);

  v32 = sub_10000EC48();
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10001750C;
  block[3] = &unk_10008CF10;
  v61 = &v74;
  id v33 = v51;
  id v59 = v33;
  id v34 = v57;
  id v60 = v34;
  v62 = &v80;
  dispatch_sync(v32, block);

  if (!v75[5])
  {
    v52 = (void *)v81[5];
    v46 = [v34 identity];
    uint64_t v48 = sub_100014A08((uint64_t)"-[MIClientConnection registerPlaceholderForReference:completion:]", 513, MIInstallerErrorDomain, 4, v52, 0, @"Failed to register installation record for %@", v47, (uint64_t)v46);
    v49 = (void *)v81[5];
    v81[5] = v48;

    goto LABEL_27;
  }

  v56[2](v56, v75[5], 0);
LABEL_28:

  _Block_object_dispose(&v74, 8);
  _Block_object_dispose(&v80, 8);
}

- (BOOL)_validateInstallRequestForURL:(id)a3 identity:(id)a4 targetingDomain:(unint64_t)a5 options:(id)a6 withError:(id *)a7
{
  id v12 = a3;
  id v13 = a4;
  id v14 = a6;
  objc_opt_class();
  id v15 = v12;
  if (objc_opt_isKindOfClass()) {
    id v16 = v15;
  }
  else {
    id v16 = 0;
  }

  if (!v16)
  {
    sub_100014A08((uint64_t)"-[MIClientConnection _validateInstallRequestForURL:identity:targetingDomain:options:withError:]", 564, MIInstallerErrorDomain, 25, 0, &off_100097628, @"URL provided to install was not a URL or was nil", v17, v41);
    uint64_t v18 = LABEL_16:;
LABEL_17:
    id v28 = (id)v18;
    goto LABEL_18;
  }
  uint64_t v18 = sub_100016830(self, @"InstallForInstallCoordination");
  if (v18) {
    goto LABEL_17;
  }
  if ([v14 allowLocalProvisioned])
  {
    uint64_t v18 = sub_100016830(self, @"InstallLocalProvisioned");
    if (v18) {
      goto LABEL_17;
    }
  }
  unsigned int v19 = [v14 linkedParentBundleID];

  if (v19 && (sub_100017A60(self) & 1) == 0)
  {
    v31 = (void *)MIInstallerErrorDomain;
    v32 = [(MIClientConnection *)self clientName];
    sub_100014A08((uint64_t)"-[MIClientConnection _validateInstallRequestForURL:identity:targetingDomain:options:withError:]", 585, v31, 2, 0, &off_100097650, @"Process %@ tried to set an install option %@, but that option may only be passed from callers originating through InstallCoordination SPI.", v33, (uint64_t)v32);
    id v28 = (id)objc_claimAutoreleasedReturnValue();

    goto LABEL_18;
  }
  if ((MIIsValidInstallationDomain() & 1) == 0)
  {
    sub_100014A08((uint64_t)"-[MIClientConnection _validateInstallRequestForURL:identity:targetingDomain:options:withError:]", 599, MIInstallerErrorDomain, 25, 0, 0, @"Installation domain provided was not valid: %lu", v20, a5);
    goto LABEL_16;
  }
  uint64_t v21 = [v14 bundleIdentifier];

  if (!v21)
  {
    id v34 = (void *)MIInstallerErrorDomain;
    uint64_t v26 = [v15 path];
    sub_100014A08((uint64_t)"-[MIClientConnection _validateInstallRequestForURL:identity:targetingDomain:options:withError:]", 604, v34, 25, 0, 0, @"Install options did not specify a bundle identifier for the install of %@", v35, (uint64_t)v26);
    id v28 = (id)objc_claimAutoreleasedReturnValue();
    goto LABEL_25;
  }
  if (!v13)
  {
    id v36 = objc_alloc((Class)MIAppIdentity);
    uint64_t v37 = [v14 bundleIdentifier];
    id v13 = [v36 initWithBundleID:v37];

LABEL_27:
    if (+[ICLFeatureFlags appReferencesEnabled])
    {
      if (a5 == 3) {
        uint64_t v38 = 2;
      }
      else {
        uint64_t v38 = 3;
      }
      id v39 = [v13 bundleID];
      id v43 = 0;
      unsigned __int8 v40 = [(MIClientConnection *)self _validateAppWithBundleID:v39 isNotInstalledInDomain:v38 error:&v43];
      id v28 = v43;

      if ((v40 & 1) == 0) {
        goto LABEL_18;
      }
    }
    else
    {
      id v28 = 0;
    }
    BOOL v29 = 1;
    goto LABEL_21;
  }
  id v22 = [v13 bundleID];
  id v23 = [v14 bundleIdentifier];
  unsigned __int8 v24 = [v22 isEqualToString:v23];

  if (v24) {
    goto LABEL_27;
  }
  uint64_t v25 = (void *)MIInstallerErrorDomain;
  uint64_t v26 = [v14 bundleIdentifier];
  id v42 = [v13 bundleID];
  sub_100014A08((uint64_t)"-[MIClientConnection _validateInstallRequestForURL:identity:targetingDomain:options:withError:]", 609, v25, 25, 0, 0, @"Bundle identifier in install options (%@) did not match the one in application identity (%@)", v27, (uint64_t)v26);
  id v28 = (id)objc_claimAutoreleasedReturnValue();

LABEL_25:
LABEL_18:
  if (a7)
  {
    id v28 = v28;
    BOOL v29 = 0;
    *a7 = v28;
  }
  else
  {
    BOOL v29 = 0;
  }
LABEL_21:

  return v29;
}

- (void)_installURL:(id)a3 identity:(id)a4 targetingDomain:(unint64_t)a5 options:(id)a6 operationType:(unint64_t)a7 completion:(id)a8
{
  id v14 = a3;
  id v15 = a4;
  id v16 = a6;
  id v17 = a8;
  uint64_t v18 = sub_100017D94();
  v37[0] = 0;
  unsigned __int8 v19 = [(MIClientConnection *)self _validateInstallRequestForURL:v14 identity:v15 targetingDomain:a5 options:v16 withError:v37];
  id v20 = v37[0];
  if (v19)
  {
    uint64_t v21 = sub_100017DE8((int)[v16 isUserInitiated]);
    dispatch_semaphore_wait(v18, 0xFFFFFFFFFFFFFFFFLL);
    uint64_t v25 = _NSConcreteStackBlock;
    uint64_t v26 = 3221225472;
    uint64_t v27 = sub_100017EDC;
    id v28 = &unk_10008D238;
    BOOL v29 = self;
    id v30 = v14;
    id v31 = v15;
    unint64_t v35 = a5;
    id v32 = v16;
    unint64_t v36 = a7;
    id v34 = v17;
    uint64_t v33 = v18;
    MIRunTransactionalTask();
  }
  else
  {
    [(MIClientConnection *)self sendDelegateMessagesComplete];
    v22[0] = _NSConcreteStackBlock;
    v22[1] = 3221225472;
    v22[2] = sub_100017F28;
    v22[3] = &unk_10008D1C0;
    id v24 = v17;
    id v23 = v20;
    [(MIClientConnection *)self _callBlockAfterDelegateMessagesSend:"com.apple.installd.install-url-error" dispatchBlock:v22];

    uint64_t v21 = v24;
  }
}

- (void)_stageURL:(id)a3 identity:(id)a4 domain:(unint64_t)a5 options:(id)a6 completion:(id)a7
{
  id v37 = a3;
  id v35 = a4;
  id v11 = a6;
  id v34 = a7;
  id v12 = [v11 installTypeSummaryString];
  id v13 = [v11 lsInstallType];
  if (!qword_1000A60B8 || *(int *)(qword_1000A60B8 + 44) >= 5)
  {
    id v14 = [v37 path];
    id v15 = MIStringForInstallationDomain();
    [(MIClientConnection *)self clientName];
    uint64_t v33 = v32 = v15;
    id v30 = v12;
    id v31 = v13;
    BOOL v29 = v14;
    MOLogWrite();
  }
  id v16 = +[MIInstaller installerForURL:identity:domain:options:operationType:forClient:](MIInstaller, "installerForURL:identity:domain:options:operationType:forClient:", v37, v35, a5, v11, 1, self, v29, v30, v31, v32, v33);
  id v17 = v16;
  if (!v16)
  {
    uint64_t v21 = [v37 path];
    uint64_t v23 = sub_100014A08((uint64_t)"-[MIClientConnection _stageURL:identity:domain:options:completion:]", 730, MIInstallerErrorDomain, 4, 0, &off_100097678, @"Failed to create installer for %@", v22, (uint64_t)v21);
LABEL_13:

    uint64_t v20 = 0;
    id v19 = (id)v23;
    goto LABEL_14;
  }
  id v42 = 0;
  unsigned int v18 = [v16 performInstallationWithError:&v42];
  id v19 = v42;
  if (!v18)
  {
    uint64_t v20 = 0;
    goto LABEL_14;
  }
  uint64_t v20 = [v17 stagedJournalEntryUniqueID];
  if (!v20)
  {
    uint64_t v21 = [v37 path];
    uint64_t v23 = sub_100014A08((uint64_t)"-[MIClientConnection _stageURL:identity:domain:options:completion:]", 740, MIInstallerErrorDomain, 4, 0, &off_1000976A0, @"Failed to get receipt after installing %@", v24, (uint64_t)v21);

    goto LABEL_13;
  }
  if (qword_1000A60B8 && *(int *)(qword_1000A60B8 + 44) >= 7) {
    MOLogWrite();
  }
LABEL_14:

  uint64_t v25 = (void *)v20;
  v38[0] = _NSConcreteStackBlock;
  v38[1] = 3221225472;
  v38[2] = sub_1000183AC;
  v38[3] = &unk_10008D260;
  id v26 = v34;
  id v41 = v26;
  id v27 = v25;
  id v39 = v27;
  id v28 = v19;
  id v40 = v28;
  [(MIClientConnection *)self _callBlockAfterDelegateMessagesSend:"com.apple.installd.staging-url-complete" dispatchBlock:v38];
}

- (void)stageInstallURL:(id)a3 identity:(id)a4 targetingDomain:(unint64_t)a5 withOptions:(id)a6 completion:(id)a7
{
  id v12 = a3;
  id v13 = a4;
  id v14 = a6;
  id v15 = a7;
  id v16 = sub_100017D94();
  if (+[ICLFeatureFlags twoStageAppInstallEnabled])
  {
    v35[0] = 0;
    unsigned __int8 v18 = [(MIClientConnection *)self _validateInstallRequestForURL:v12 identity:v13 targetingDomain:a5 options:v14 withError:v35];
    id v19 = v35[0];
    if (v18)
    {
      uint64_t v20 = sub_100017DE8((int)[v14 isUserInitiated]);
      dispatch_semaphore_wait(v16, 0xFFFFFFFFFFFFFFFFLL);
      uint64_t v24 = _NSConcreteStackBlock;
      uint64_t v25 = 3221225472;
      id v26 = sub_1000186FC;
      id v27 = &unk_10008D288;
      id v28 = self;
      id v29 = v12;
      id v30 = v13;
      unint64_t v34 = a5;
      id v31 = v14;
      id v33 = v15;
      id v32 = v16;
      MIRunTransactionalTask();
    }
    else
    {
      v21[0] = _NSConcreteStackBlock;
      v21[1] = 3221225472;
      v21[2] = sub_100018744;
      v21[3] = &unk_10008D1C0;
      id v23 = v15;
      id v22 = v19;
      [(MIClientConnection *)self _callBlockAfterDelegateMessagesSend:"com.apple.installd.staging-url-error" dispatchBlock:v21];

      uint64_t v20 = v23;
    }
  }
  else
  {
    sub_100014A08((uint64_t)"-[MIClientConnection stageInstallURL:identity:targetingDomain:withOptions:completion:]", 766, MIInstallerErrorDomain, 161, 0, 0, @"%s is not enabled", v17, (uint64_t)"-[MIClientConnection stageInstallURL:identity:targetingDomain:withOptions:completion:]");
    id v19 = (id)objc_claimAutoreleasedReturnValue();
    (*((void (**)(id, void, id))v15 + 2))(v15, 0, v19);
  }
}

- (void)_finalizeStagedUpdateForUUID:(id)a3 completion:(id)a4
{
  id v5 = a3;
  id v37 = a4;
  id v39 = v5;
  unint64_t v36 = +[MIJournal sharedInstance];
  uint64_t v6 = [v36 journalEntryForUniqueIdentifier:v5];
  id v8 = v6;
  if (!v6)
  {
    uint64_t v24 = sub_100014A08((uint64_t)"-[MIClientConnection _finalizeStagedUpdateForUUID:completion:]", 827, MIInstallerErrorDomain, 218, 0, 0, @"Failed to find matching journal entry for %@", v7, (uint64_t)v5);
    uint64_t v23 = 0;
    uint64_t v17 = 0;
    id v22 = 0;
    uint64_t v10 = 0;
LABEL_13:
    id v20 = (id)v24;
    goto LABEL_16;
  }
  id v9 = [v6 installOptions];
  uint64_t v10 = v9;
  if (!qword_1000A60B8 || *(int *)(qword_1000A60B8 + 44) >= 5)
  {
    id v11 = [v9 installTypeSummaryString];
    id v12 = [v10 lsInstallType];
    [v8 installationDomain];
    id v13 = MIStringForInstallationDomain();
    [(MIClientConnection *)self clientName];
    v35 = unint64_t v34 = v13;
    id v32 = v11;
    id v33 = v12;
    id v31 = v39;
    MOLogWrite();
  }
  id v14 = [v8 identity:v31, v32, v33, v34, v35];
  id v15 = [v8 installationDomain];
  id v16 = [v8 installOptions];
  uint64_t v17 = +[MIInstaller installerForURL:0 identity:v14 domain:v15 options:v16 operationType:2 forClient:self];

  if (!v17)
  {
    uint64_t v24 = sub_100014A08((uint64_t)"-[MIClientConnection _finalizeStagedUpdateForUUID:completion:]", 836, MIInstallerErrorDomain, 4, 0, &off_1000976C8, @"Failed to create installer for installing staged update %@", v18, (uint64_t)v39);
    uint64_t v23 = 0;
    uint64_t v17 = 0;
    id v22 = 0;
    goto LABEL_13;
  }
  id v45 = 0;
  unsigned int v19 = [v17 applyStagedUpdateForUUID:v39 withError:&v45];
  id v20 = v45;
  if (v19)
  {
    id v22 = [v17 receipt];
    if (v22)
    {
      uint64_t v23 = [v17 recordPromise];
      if (qword_1000A60B8 && *(int *)(qword_1000A60B8 + 44) >= 7) {
        MOLogWrite();
      }
    }
    else
    {
      uint64_t v25 = sub_100014A08((uint64_t)"-[MIClientConnection _finalizeStagedUpdateForUUID:completion:]", 846, MIInstallerErrorDomain, 4, 0, &off_1000976F0, @"Failed to get receipt after installing staged update %@", v21, (uint64_t)v39);

      uint64_t v23 = 0;
      id v22 = 0;
      id v20 = (id)v25;
    }
  }
  else
  {
    uint64_t v23 = 0;
    id v22 = 0;
  }
LABEL_16:

  id v26 = (void *)v23;
  [(MIClientConnection *)self sendDelegateMessagesComplete];
  v40[0] = _NSConcreteStackBlock;
  v40[1] = 3221225472;
  v40[2] = sub_100018D18;
  v40[3] = &unk_10008D1E8;
  id v27 = v37;
  id v44 = v27;
  id v28 = v22;
  id v41 = v28;
  id v29 = v26;
  id v42 = v29;
  id v30 = v20;
  id v43 = v30;
  [(MIClientConnection *)self _callBlockAfterDelegateMessagesSend:"com.apple.installd.installation-for-staged-update-complete" dispatchBlock:v40];
}

- (void)finalizeStagedInstallForUUID:(id)a3 returningResultInfo:(BOOL)a4 completion:(id)a5
{
  id v8 = a3;
  id v9 = a5;
  if (+[ICLFeatureFlags twoStageAppInstallEnabled])
  {
    id v11 = sub_100017D94();
    id v12 = sub_100016830(self, @"InstallForInstallCoordination");
    if (v12)
    {
      [(MIClientConnection *)self sendDelegateMessagesComplete];
      v14[0] = _NSConcreteStackBlock;
      v14[1] = 3221225472;
      v14[2] = sub_1000190E8;
      v14[3] = &unk_10008D1C0;
      id v16 = v9;
      id v15 = v12;
      [(MIClientConnection *)self _callBlockAfterDelegateMessagesSend:"com.apple.installd.installation-for-staged-update" dispatchBlock:v14];

      id v13 = v16;
    }
    else
    {
      id v13 = sub_100017DE8(0);
      dispatch_semaphore_wait(v11, 0xFFFFFFFFFFFFFFFFLL);
      uint64_t v17 = _NSConcreteStackBlock;
      uint64_t v18 = 3221225472;
      unsigned int v19 = sub_10001901C;
      id v20 = &unk_10008D2B0;
      uint64_t v21 = self;
      id v22 = v8;
      id v24 = v9;
      BOOL v25 = a4;
      uint64_t v23 = v11;
      MIRunTransactionalTask();
    }
  }
  else
  {
    id v12 = sub_100014A08((uint64_t)"-[MIClientConnection finalizeStagedInstallForUUID:returningResultInfo:completion:]", 875, MIInstallerErrorDomain, 161, 0, 0, @"%s is not enabled", v10, (uint64_t)"-[MIClientConnection finalizeStagedInstallForUUID:returningResultInfo:completion:]");
    (*((void (**)(id, void, void, void, void *))v9 + 2))(v9, 0, 0, 0, v12);
  }
}

- (void)revertIdentity:(id)a3 withOptions:(id)a4 completion:(id)a5
{
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472;
  void v9[2] = sub_1000191B4;
  v9[3] = &unk_10008D2D8;
  id v10 = a5;
  id v8 = v10;
  [(MIClientConnection *)self revertForIXWithIdentity:a3 withOptions:a4 completion:v9];
}

- (void)revertForIXWithIdentity:(id)a3 withOptions:(id)a4 completion:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  id v32 = [v8 bundleID];
  id v11 = sub_100016830(self, @"RevertForInstallCoordination");
  if (v11)
  {
    id v12 = 0;
    id v13 = 0;
    id v14 = 0;
    goto LABEL_22;
  }
  if (v9)
  {
    objc_opt_class();
    id v15 = v9;
    id v16 = (objc_opt_isKindOfClass() & 1) != 0 ? v15 : 0;

    if (!v16)
    {
      id v13 = 0;
      uint64_t v24 = sub_100014A08((uint64_t)"-[MIClientConnection revertForIXWithIdentity:withOptions:completion:]", 960, MIInstallerErrorDomain, 25, 0, &off_100097718, @"Options provided was not a dictionary", v17, v29);
      goto LABEL_21;
    }
  }
  objc_opt_class();
  id v18 = v32;
  if (objc_opt_isKindOfClass()) {
    id v19 = v18;
  }
  else {
    id v19 = 0;
  }

  if (!v19)
  {
    id v13 = 0;
    uint64_t v24 = sub_100014A08((uint64_t)"-[MIClientConnection revertForIXWithIdentity:withOptions:completion:]", 965, MIInstallerErrorDomain, 25, 0, 0, @"Identifier provided to revert was not a string or was nil", v20, v29);
LABEL_21:
    id v11 = (void *)v24;
    id v12 = 0;
    id v14 = 0;
    goto LABEL_22;
  }
  if (!qword_1000A60B8 || *(int *)(qword_1000A60B8 + 44) >= 5)
  {
    id v30 = [(MIClientConnection *)self clientName];
    id v31 = v9;
    uint64_t v29 = (uint64_t)v18;
    MOLogWrite();
  }
  uint64_t v21 = +[MIReverter reverterForAppIdentity:withOptions:forClient:](MIReverter, "reverterForAppIdentity:withOptions:forClient:", v8, v9, self, v29, v30, v31);
  id v38 = 0;
  unsigned int v22 = [v21 performRevertWithError:&v38];
  id v23 = v38;
  if (v22)
  {
    id v14 = [v21 receipt];
    id v12 = [v21 recordPromise];
  }
  else
  {
    id v12 = 0;
    id v14 = 0;
  }
  id v11 = v23;
  id v13 = v21;
LABEL_22:

  [(MIClientConnection *)self sendDelegateMessagesComplete];
  v33[0] = _NSConcreteStackBlock;
  v33[1] = 3221225472;
  v33[2] = sub_10001963C;
  v33[3] = &unk_10008D1E8;
  id v25 = v10;
  id v37 = v25;
  id v26 = v14;
  id v34 = v26;
  id v27 = v12;
  id v35 = v27;
  id v28 = v11;
  id v36 = v28;
  [(MIClientConnection *)self _callBlockAfterDelegateMessagesSend:"com.apple.installd.revert-complete" dispatchBlock:v33];
}

- (void)uninstallIdentifiers:(id)a3 withOptions:(id)a4 completion:(id)a5
{
  id v7 = a3;
  id v8 = a4;
  id v9 = a5;
  id v10 = objc_opt_new();
  long long v19 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  long long v22 = 0u;
  id v11 = v7;
  id v12 = [v11 countByEnumeratingWithState:&v19 objects:v23 count:16];
  if (v12)
  {
    id v13 = v12;
    uint64_t v14 = *(void *)v20;
    do
    {
      id v15 = 0;
      do
      {
        if (*(void *)v20 != v14) {
          objc_enumerationMutation(v11);
        }
        id v16 = [objc_alloc((Class)MIAppIdentity) initWithBundleID:*(void *)(*((void *)&v19 + 1) + 8 * (void)v15) persona:@"PersonalPersonaPlaceholderString"];
        [v10 addObject:v16];

        id v15 = (char *)v15 + 1;
      }
      while (v13 != v15);
      id v13 = [v11 countByEnumeratingWithState:&v19 objects:v23 count:16];
    }
    while (v13);
  }

  id v17 = [v10 copy];
  [(MIClientConnection *)self _uninstallIdentities:v17 withOptions:v8 completion:v9];
}

- (void)_uninstallIdentities:(id)a3 withOptions:(id)a4 completion:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  id v11 = sub_100016830(self, @"UninstallForInstallCoordination");
  if (!v11)
  {
    objc_opt_class();
    id v14 = v8;
    if (objc_opt_isKindOfClass())
    {
      if (v14)
      {
        objc_opt_class();
        int v16 = sub_100014D8C(v14);

        if (v16)
        {
          if (!v9
            || ((objc_opt_class(), id v17 = v9, (objc_opt_isKindOfClass() & 1) == 0)
              ? (id v18 = 0)
              : (id v18 = v17),
                v17,
                v18,
                v18))
          {
            if ([v14 count] == (id)1)
            {
              if (qword_1000A60B8 && *(int *)(qword_1000A60B8 + 44) < 5) {
                goto LABEL_25;
              }
              id v26 = [(MIClientConnection *)self clientName];
              id v33 = [v14 objectAtIndexedSubscript:0];
              id v34 = v9;
              uint64_t v32 = (uint64_t)v26;
              MOLogWrite();
            }
            else
            {
              if (qword_1000A60B8 && *(int *)(qword_1000A60B8 + 44) < 5) {
                goto LABEL_25;
              }
              id v26 = [(MIClientConnection *)self clientName];
              id v33 = v14;
              id v34 = v9;
              uint64_t v32 = (uint64_t)v26;
              MOLogWrite();
            }

LABEL_25:
            id v27 = +[MIUninstaller uninstallerForIdentities:withOptions:forClient:](MIUninstaller, "uninstallerForIdentities:withOptions:forClient:", v14, v9, self, v32, v33, v34);
            id v12 = v27;
            if (v27)
            {
              id v39 = 0;
              unsigned int v29 = [v27 performUninstallationWithError:&v39];
              id v30 = v39;
              if (v29)
              {
                id v13 = [v12 receipt];
                if (!v13)
                {
                  id v11 = sub_100014A08((uint64_t)"-[MIClientConnection _uninstallIdentities:withOptions:completion:]", 1051, MIInstallerErrorDomain, 4, 0, &off_1000977B8, @"Failed to get receipt after uninstalling %@", v31, (uint64_t)v14);

                  goto LABEL_3;
                }
                if (qword_1000A60B8 && *(int *)(qword_1000A60B8 + 44) >= 7)
                {
                  MOLogWrite();
                  id v11 = v30;
                  goto LABEL_14;
                }
              }
              else
              {
                id v13 = 0;
              }
              id v11 = v30;
              goto LABEL_14;
            }
            uint64_t v22 = sub_100014A08((uint64_t)"-[MIClientConnection _uninstallIdentities:withOptions:completion:]", 1041, MIInstallerErrorDomain, 4, 0, &off_100097790, @"Failed to create uninstaller for %@", v28, (uint64_t)v14);
LABEL_13:
            id v11 = (void *)v22;
            id v12 = 0;
            id v13 = 0;
            goto LABEL_14;
          }
          long long v19 = @"Options provided was not a dictionary";
          uint64_t v20 = 1029;
          long long v21 = &off_100097768;
LABEL_12:
          uint64_t v22 = sub_100014A08((uint64_t)"-[MIClientConnection _uninstallIdentities:withOptions:completion:]", v20, MIInstallerErrorDomain, 25, 0, v21, v19, v15, v32);
          goto LABEL_13;
        }
      }
    }
    else
    {
    }
    long long v19 = @"Identifers provided was not an array of strings";
    uint64_t v20 = 1024;
    long long v21 = &off_100097740;
    goto LABEL_12;
  }
  id v12 = 0;
LABEL_3:
  id v13 = 0;
LABEL_14:

  [(MIClientConnection *)self sendDelegateMessagesComplete];
  v35[0] = _NSConcreteStackBlock;
  v35[1] = 3221225472;
  id v35[2] = sub_100019D78;
  v35[3] = &unk_10008D260;
  id v23 = v10;
  id v38 = v23;
  id v24 = v13;
  id v36 = v24;
  id v25 = v11;
  id v37 = v25;
  [(MIClientConnection *)self _callBlockAfterDelegateMessagesSend:"com.apple.installd.uninstall-identifiers-complete" dispatchBlock:v35];
}

- (void)uninstallIdentity:(id)a3 withOptions:(id)a4 completion:(id)a5
{
  id v8 = a5;
  id v15 = a3;
  id v9 = a4;
  id v10 = a3;
  id v11 = +[NSArray arrayWithObjects:&v15 count:1];
  v13[0] = _NSConcreteStackBlock;
  v13[1] = 3221225472;
  v13[2] = sub_100019EB4;
  v13[3] = &unk_10008D300;
  id v14 = v8;
  id v12 = v8;
  [(MIClientConnection *)self _uninstallIdentities:v11 withOptions:v9 completion:v13];
}

- (void)lookupUninstalledWithOptions:(id)a3 completion:(id)a4
{
  id v16 = a3;
  uint64_t v6 = (void (**)(id, void *, void *))a4;
  id v7 = sub_100016830(self, @"LookupUninstalled");
  if (!v7)
  {
    if (v16
      && ((objc_opt_class(), id v8 = v16, (objc_opt_isKindOfClass() & 1) == 0)
        ? (id v9 = 0)
        : (id v9 = v8),
          v8,
          v9,
          !v9))
    {
      uint64_t v13 = sub_100014A08((uint64_t)"-[MIClientConnection lookupUninstalledWithOptions:completion:]", 1094, MIInstallerErrorDomain, 25, 0, 0, @"Options provided was not a dictionary", v10, (uint64_t)v14);
    }
    else
    {
      if (!qword_1000A60B8 || *(int *)(qword_1000A60B8 + 44) >= 5)
      {
        id v14 = [(MIClientConnection *)self clientName];
        id v15 = v16;
        MOLogWrite();
      }
      id v11 = +[MIUninstalledAppList sharedList];
      id v12 = [v11 uninstalledDictionary];

      if (v12)
      {
        id v7 = 0;
        goto LABEL_19;
      }
      if (!qword_1000A60B8 || *(int *)(qword_1000A60B8 + 44) >= 3) {
        MOLogWrite();
      }
      uint64_t v13 = +[NSError errorWithDomain:MIInstallerErrorDomain code:1 userInfo:&off_1000977E0];
    }
    id v7 = (void *)v13;
  }
  id v12 = 0;
LABEL_19:
  v6[2](v6, v12, v7);
}

- (void)clearUninstalledIdentifiers:(id)a3 withOptions:(id)a4 completion:(id)a5
{
  id v22 = a3;
  id v8 = a4;
  id v9 = (void (**)(id, void *))a5;
  uint64_t v10 = sub_100016830(self, @"ClearUninstalled");
  if (v10) {
    goto LABEL_18;
  }
  if (v8)
  {
    objc_opt_class();
    id v11 = v8;
    id v12 = (objc_opt_isKindOfClass() & 1) != 0 ? v11 : 0;

    if (!v12)
    {
      id v17 = @"Options provided was not a dictionary";
      uint64_t v18 = 1131;
      goto LABEL_17;
    }
  }
  objc_opt_class();
  id v14 = v22;
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {

LABEL_15:
    id v17 = @"Identifers provided was not an array of strings";
    uint64_t v18 = 1136;
LABEL_17:
    uint64_t v10 = sub_100014A08((uint64_t)"-[MIClientConnection clearUninstalledIdentifiers:withOptions:completion:]", v18, MIInstallerErrorDomain, 25, 0, 0, v17, v13, (uint64_t)v19);
    goto LABEL_18;
  }
  if (!v14) {
    goto LABEL_15;
  }
  objc_opt_class();
  char v15 = sub_100014D8C(v14);

  if ((v15 & 1) == 0) {
    goto LABEL_15;
  }
  if (!qword_1000A60B8 || *(int *)(qword_1000A60B8 + 44) >= 5)
  {
    [(MIClientConnection *)self clientName];
    id v20 = v8;
    long long v19 = v21 = v14;
    MOLogWrite();
  }
  id v16 = +[MIUninstalledAppList sharedList];
  [v16 removeIdentifiers:v14];

  uint64_t v10 = 0;
LABEL_18:
  v9[2](v9, v10);
}

- (void)lookupSystemAppStateWithOptions:(id)a3 completion:(id)a4
{
  id v17 = a3;
  uint64_t v6 = (void (**)(id, void *, void *))a4;
  id v7 = sub_100016830(self, @"LookupSystemAppState");
  if (!v7)
  {
    if (v17
      && ((objc_opt_class(), id v8 = v17, (objc_opt_isKindOfClass() & 1) == 0)
        ? (id v9 = 0)
        : (id v9 = v8),
          v8,
          v9,
          !v9))
    {
      uint64_t v14 = sub_100014A08((uint64_t)"-[MIClientConnection lookupSystemAppStateWithOptions:completion:]", 1171, MIInstallerErrorDomain, 25, 0, 0, @"Options provided was not a dictionary", v10, (uint64_t)v15);
    }
    else
    {
      if (!qword_1000A60B8 || *(int *)(qword_1000A60B8 + 44) >= 5)
      {
        char v15 = [(MIClientConnection *)self clientName];
        id v16 = v17;
        MOLogWrite();
      }
      id v11 = +[MISystemAppState sharedList];
      id v12 = [v17 objectForKeyedSubscript:@"RestoreBackupAppState"];
      uint64_t v13 = [v11 systemAppStateDictionaryRestoringBackedUpState:sub_100014D34(v12, 0)];

      if (v13)
      {
        id v7 = 0;
        goto LABEL_19;
      }
      if (!qword_1000A60B8 || *(int *)(qword_1000A60B8 + 44) >= 3) {
        MOLogWrite();
      }
      uint64_t v14 = +[NSError errorWithDomain:MIInstallerErrorDomain code:1 userInfo:&off_100097808];
    }
    id v7 = (void *)v14;
  }
  uint64_t v13 = 0;
LABEL_19:
  v6[2](v6, v13, v7);
}

- (void)updateSystemAppStateForIdentifier:(id)a3 appState:(int)a4 completion:(id)a5
{
  uint64_t v6 = *(void *)&a4;
  id v8 = a3;
  id v9 = (void (**)(id, void *))a5;
  uint64_t v10 = sub_100016830(self, @"UpdateSystemAppState");
  if (!v10)
  {
    objc_opt_class();
    id v11 = v8;
    if (objc_opt_isKindOfClass()) {
      id v12 = v11;
    }
    else {
      id v12 = 0;
    }

    if (!v12)
    {
      uint64_t v14 = sub_100014A08((uint64_t)"-[MIClientConnection updateSystemAppStateForIdentifier:appState:completion:]", 1209, MIInstallerErrorDomain, 25, 0, 0, @"bundleID parameter was not a string", v13, v18);
      goto LABEL_9;
    }
    if (v6 >= 7)
    {
      uint64_t v14 = sub_100014A08((uint64_t)"-[MIClientConnection updateSystemAppStateForIdentifier:appState:completion:]", 1214, MIInstallerErrorDomain, 25, 0, 0, @"Unknown value for appState key : %lu", v13, v6);
LABEL_9:
      uint64_t v10 = (void *)v14;
      goto LABEL_10;
    }
    if (!qword_1000A60B8 || *(int *)(qword_1000A60B8 + 44) >= 5)
    {
      long long v19 = [(MIClientConnection *)self clientName];
      MOLogWrite();
    }
    +[MISystemAppState sharedList];
    if (v6) {
      char v15 = {;
    }
      [v15 addIdentifier:v11 withState:v6];
    }
    else {
      id v16 = {;
    }
      id v20 = v11;
      id v17 = +[NSArray arrayWithObjects:&v20 count:1];
      [v16 removeIdentifiers:v17];
    }
    uint64_t v10 = 0;
  }
LABEL_10:
  v9[2](v9, v10);
}

- (void)registerContentsForDiskImageAtURL:(id)a3 completion:(id)a4
{
  id v15 = a3;
  uint64_t v6 = (void (**)(id, void *))a4;
  if (sub_100017A60(self))
  {
    objc_opt_class();
    id v7 = v15;
    if (objc_opt_isKindOfClass()) {
      id v8 = v7;
    }
    else {
      id v8 = 0;
    }

    if (v8)
    {
      uint64_t v13 = +[MIDiskImageManager sharedInstance];
      [v13 registerContentsAtMountPoint:v7 completion:v6];

      id v11 = 0;
    }
    else
    {
      id v11 = sub_100014A08((uint64_t)"-[MIClientConnection registerContentsForDiskImageAtURL:completion:]", 1254, MIInstallerErrorDomain, 25, 0, 0, @"Disk image path for registering contents was not a URL.", v12, v14);
      v6[2](v6, v11);
    }
  }
  else
  {
    id v9 = [(MIClientConnection *)self clientName];
    id v11 = sub_100014A08((uint64_t)"-[MIClientConnection registerContentsForDiskImageAtURL:completion:]", 1248, MIInstallerErrorDomain, 2, 0, &off_100097830, @"Process %@ tried to register disk image, but disk registration can only be done by InstallCoordination.", v10, (uint64_t)v9);

    v6[2](v6, v11);
  }
}

- (void)unregisterContentsForDiskImageAtURL:(id)a3 completion:(id)a4
{
  id v15 = a3;
  uint64_t v6 = (void (**)(id, void *))a4;
  if (sub_100017A60(self))
  {
    objc_opt_class();
    id v7 = v15;
    if (objc_opt_isKindOfClass()) {
      id v8 = v7;
    }
    else {
      id v8 = 0;
    }

    if (v8)
    {
      uint64_t v13 = +[MIDiskImageManager sharedInstance];
      [v13 unregisterContentsAtMountPoint:v7 completion:v6];

      id v11 = 0;
    }
    else
    {
      id v11 = sub_100014A08((uint64_t)"-[MIClientConnection unregisterContentsForDiskImageAtURL:completion:]", 1285, MIInstallerErrorDomain, 25, 0, 0, @"Disk image path for unregistering content was not a URL.", v12, v14);
      v6[2](v6, v11);
    }
  }
  else
  {
    id v9 = [(MIClientConnection *)self clientName];
    id v11 = sub_100014A08((uint64_t)"-[MIClientConnection unregisterContentsForDiskImageAtURL:completion:]", 1279, MIInstallerErrorDomain, 2, 0, &off_100097858, @"Process %@ tried to unregister disk image, but disk registration can only be done by InstallCoordination.", v10, (uint64_t)v9);

    v6[2](v6, v11);
  }
}

- (void)enumerateInstalledAppsWithOptions:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if (qword_1000A5FC0 != -1) {
    dispatch_once(&qword_1000A5FC0, &stru_10008D3E0);
  }
  id v8 = qword_1000A5FC8;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10001B054;
  block[3] = &unk_10008D0A0;
  void block[4] = self;
  id v12 = v6;
  id v13 = v7;
  id v9 = v7;
  id v10 = v6;
  dispatch_async(v8, block);
}

- (void)fetchInfoForFrameworkAtURL:(id)a3 options:(id)a4 completion:(id)a5
{
  id v38 = a3;
  id v8 = a4;
  id v9 = (void (**)(id, id, id))a5;
  id v36 = objc_opt_new();
  id v37 = objc_opt_new();
  sub_100016830(self, @"CopyFrameworkInfoForLaunchServices");
  id v10 = (id)objc_claimAutoreleasedReturnValue();
  if (v10)
  {
    id v11 = 0;
    id v12 = 0;
LABEL_3:
    id v13 = 0;
    goto LABEL_26;
  }
  objc_opt_class();
  id v14 = v38;
  if (objc_opt_isKindOfClass()) {
    id v15 = v14;
  }
  else {
    id v15 = 0;
  }

  if (!v15)
  {
    long long v19 = @"frameworkBundleURL parameter was not a valid URL";
    uint64_t v20 = 1413;
LABEL_23:
    id v13 = 0;
    sub_100014A08((uint64_t)"-[MIClientConnection fetchInfoForFrameworkAtURL:options:completion:]", v20, MIInstallerErrorDomain, 25, 0, 0, v19, v16, v32);
    id v10 = (id)objc_claimAutoreleasedReturnValue();
    id v11 = 0;
    id v12 = 0;
    goto LABEL_26;
  }
  if (v8)
  {
    objc_opt_class();
    id v17 = v8;
    id v18 = (objc_opt_isKindOfClass() & 1) != 0 ? v17 : 0;

    if (!v18)
    {
      long long v19 = @"options parameter was not a dictionary";
      uint64_t v20 = 1418;
      goto LABEL_23;
    }
  }
  if (!qword_1000A60B8 || *(int *)(qword_1000A60B8 + 44) >= 5)
  {
    id v21 = [v14 path];
    id v33 = [(MIClientConnection *)self clientName];
    id v34 = v8;
    uint64_t v32 = (uint64_t)v21;
    MOLogWrite();
  }
  id v44 = 0;
  id v12 = +[MIExecutableBundle bundleForURL:error:](MIExecutableBundle, "bundleForURL:error:", v14, &v44, v32, v33, v34);
  id v22 = v44;
  id v23 = v22;
  if (!v12)
  {
    id v11 = 0;
    id v13 = 0;
    id v10 = v22;
    goto LABEL_26;
  }
  id v24 = +[MIGlobalConfiguration sharedInstance];
  id v25 = [v24 primaryPersonaString];
  id v43 = v23;
  id v11 = +[MILaunchServicesDatabaseGatherer entryForBundle:v12 inContainer:0 forPersona:v25 withError:&v43];
  id v10 = v43;

  if (!v11) {
    goto LABEL_3;
  }
  id v26 = [v12 identifier];
  [v37 setObject:v11 forKeyedSubscript:v26];

  [v36 addObject:v11];
  v40[0] = _NSConcreteStackBlock;
  v40[1] = 3221225472;
  v40[2] = sub_10001BB5C;
  v40[3] = &unk_10008D328;
  id v41 = v37;
  id v27 = v36;
  id v42 = v27;
  uint64_t v28 = objc_retainBlock(v40);
  unsigned int v29 = +[MIGlobalConfiguration sharedInstance];
  id v30 = [v29 primaryPersonaString];
  id v39 = v10;
  unsigned __int8 v31 = +[MILaunchServicesDatabaseGatherer enumerateAppExtensionsInBundle:v12 forPersona:v30 updatingAppExtensionParentID:0 ensureAppExtensionsAreExecutable:0 installProfiles:0 error:&v39 enumerator:v28];
  id v35 = v39;

  if (v31) {
    id v13 = v27;
  }
  else {
    id v13 = 0;
  }
  id v10 = v35;
LABEL_26:
  v9[2](v9, v13, v10);
}

- (void)fetchInfoForContainerizedAppWithIdentity:(id)a3 inDomain:(unint64_t)a4 options:(id)a5 completion:(id)a6
{
  id v10 = a3;
  id v11 = a5;
  id v12 = (void (**)(id, void *, void *))a6;
  id v13 = [v10 bundleID];
  id v15 = sub_100016830(self, @"CopyContainerizedAppInfoForLaunchServices");
  if (!v15)
  {
    if (v10)
    {
      if ((MIIsValidInstallationDomain() & 1) == 0)
      {
        uint64_t v16 = 0;
        uint64_t v22 = sub_100014A08((uint64_t)"-[MIClientConnection fetchInfoForContainerizedAppWithIdentity:inDomain:options:completion:]", 1488, MIInstallerErrorDomain, 25, 0, 0, @"domain %lu isn't valid", v17, a4);
        goto LABEL_11;
      }
      if (!v11
        || ((objc_opt_class(), id v18 = v11, (objc_opt_isKindOfClass() & 1) == 0)
          ? (id v19 = 0)
          : (id v19 = v18),
            v18,
            v19,
            v19))
      {
        if (!qword_1000A60B8 || *(int *)(qword_1000A60B8 + 44) >= 5)
        {
          uint64_t v32 = [(MIClientConnection *)self clientName];
          MOLogWrite();
        }
        sub_100054F88(v13);
        id v36 = 0;
        id v23 = +[MIBundleContainer appBundleContainerForIdentifier:v13 inDomain:a4 withError:&v36];
        id v24 = v36;
        if (!v23)
        {
          uint64_t v29 = 0;
          id v26 = 0;
LABEL_27:

          id v15 = v24;
          sub_1000550D8(v13);
          uint64_t v16 = (void *)v29;
          goto LABEL_28;
        }
        id v26 = [v23 bundle];
        if (v26)
        {
          id v35 = v24;
          unsigned int v27 = [v10 resolvePersonaWithError:&v35];
          id v28 = v35;

          if (!v27)
          {
            uint64_t v29 = 0;
            goto LABEL_26;
          }
          uint64_t v33 = [v10 personaUniqueString];
          id v34 = v28;
          uint64_t v29 = +[MILaunchServicesDatabaseGatherer fetchInfoForBundle:v26 forPersona:v33 inContainer:v23 withError:&v34];
          id v30 = v34;

          id v28 = v30;
          id v24 = (id)v33;
        }
        else
        {
          sub_100014A08((uint64_t)"-[MIClientConnection fetchInfoForContainerizedAppWithIdentity:inDomain:options:completion:]", 1510, MIInstallerErrorDomain, 36, 0, 0, @"Failed to find bundle in bundle container %@ for %@", v25, (uint64_t)v23);
          id v28 = (id)objc_claimAutoreleasedReturnValue();
          uint64_t v29 = 0;
          id v26 = 0;
        }

LABEL_26:
        id v24 = v28;
        goto LABEL_27;
      }
      uint64_t v20 = @"options parameter was not a dictionary";
      uint64_t v21 = 1493;
    }
    else
    {
      uint64_t v20 = @"identity parameter was nil";
      uint64_t v21 = 1483;
    }
    uint64_t v16 = 0;
    uint64_t v22 = sub_100014A08((uint64_t)"-[MIClientConnection fetchInfoForContainerizedAppWithIdentity:inDomain:options:completion:]", v21, MIInstallerErrorDomain, 25, 0, 0, v20, v14, v31);
LABEL_11:
    id v15 = (void *)v22;
    goto LABEL_28;
  }
  uint64_t v16 = 0;
LABEL_28:
  v12[2](v12, v16, v15);
}

- (BOOL)_validateArgsForMethodWithName:(const char *)a3 bundleIdentifier:(id)a4 data:(id)a5 optionalOptions:(id)a6 error:(id *)a7
{
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  objc_opt_class();
  id v14 = v11;
  if (objc_opt_isKindOfClass()) {
    id v15 = v14;
  }
  else {
    id v15 = 0;
  }

  if (v15)
  {
    objc_opt_class();
    id v17 = v12;
    if (objc_opt_isKindOfClass()) {
      id v18 = v17;
    }
    else {
      id v18 = 0;
    }

    if (v18)
    {
      if (!v13
        || ((objc_opt_class(), id v20 = v13, (objc_opt_isKindOfClass() & 1) == 0)
          ? (id v21 = 0)
          : (id v21 = v20),
            v20,
            v21,
            v21))
      {
        id v23 = 0;
        goto LABEL_21;
      }
      sub_100014A08((uint64_t)"-[MIClientConnection _validateArgsForMethodWithName:bundleIdentifier:data:optionalOptions:error:]", 1552, MIInstallerErrorDomain, 25, 0, 0, @"Parameter validation failed for: %s, options parameter was not a dictionary", v22, (uint64_t)a3);
    }
    else
    {
      sub_100014A08((uint64_t)"-[MIClientConnection _validateArgsForMethodWithName:bundleIdentifier:data:optionalOptions:error:]", 1547, MIInstallerErrorDomain, 25, 0, 0, @"Parameter validation failed for: %s, data parameter was not a data object", v19, (uint64_t)a3);
    }
  }
  else
  {
    sub_100014A08((uint64_t)"-[MIClientConnection _validateArgsForMethodWithName:bundleIdentifier:data:optionalOptions:error:]", 1542, MIInstallerErrorDomain, 25, 0, 0, @"Parameter validation failed for: %s, bundleIdentifier parameter was not a string", v16, (uint64_t)a3);
  }
  id v23 = (id)objc_claimAutoreleasedReturnValue();
  if (a7 && v23)
  {
    id v23 = v23;
    *a7 = v23;
  }
LABEL_21:
  BOOL v24 = v23 == 0;

  return v24;
}

- (void)updateSinfForIXWithIdentifier:(id)a3 withOptions:(id)a4 sinfData:(id)a5 completion:(id)a6
{
  id v55 = a3;
  id v54 = a4;
  id v53 = a5;
  id v10 = (void (**)(id, id, void))a6;
  uint64_t v74 = 0;
  v75 = (id *)&v74;
  uint64_t v76 = 0x3032000000;
  v77 = sub_1000174F4;
  v78 = sub_100017504;
  id v79 = 0;
  uint64_t v70 = 0;
  id v71 = &v70;
  uint64_t v72 = 0x2020000000;
  char v73 = 0;
  uint64_t v11 = sub_100016830(self, @"UpdateSinfForInstallCoordination");
  id v12 = v75[5];
  v75[5] = (id)v11;

  id v13 = v75 + 5;
  if (v75[5]
    || (id v69 = 0,
        unsigned int v14 = -[MIClientConnection _validateArgsForMethodWithName:bundleIdentifier:data:optionalOptions:error:](self, "_validateArgsForMethodWithName:bundleIdentifier:data:optionalOptions:error:", "-[MIClientConnection updateSinfForIXWithIdentifier:withOptions:sinfData:completion:]", v55, v53, v54, &v69), objc_storeStrong(v13, v69), !v14))
  {
    uint64_t v22 = 0;
    uint64_t v16 = 0;
    uint64_t v19 = 0;
    id v20 = 0;
    id v26 = 0;
    id v33 = 0;
    goto LABEL_27;
  }
  if (!qword_1000A60B8 || *(int *)(qword_1000A60B8 + 44) >= 5)
  {
    [(MIClientConnection *)self clientName];
    id v49 = v55;
    uint64_t v47 = v51 = v54;
    MOLogWrite();
  }
  sub_100054F88(v55);
  id v15 = v75;
  id obj = v75[5];
  uint64_t v16 = +[MIBundleContainer appBundleContainerWithIdentifier:v55 createIfNeeded:0 created:0 error:&obj];
  objc_storeStrong(v15 + 5, obj);
  if (!v16)
  {
    if (!qword_1000A60B8 || *(int *)(qword_1000A60B8 + 44) >= 3)
    {
      uint64_t v19 = 0;
      id v20 = 0;
      MOLogWrite();
      uint64_t v22 = 0;
      id v26 = 0;
LABEL_56:
      id v33 = 0;
      sub_1000550D8(v55);
      goto LABEL_27;
    }
    uint64_t v22 = 0;
    uint64_t v19 = 0;
    id v20 = 0;
LABEL_36:
    id v26 = 0;
    goto LABEL_56;
  }
  id v17 = [v16 bundle];
  uint64_t v19 = v17;
  if (!v17)
  {
    uint64_t v36 = sub_100014A08((uint64_t)"-[MIClientConnection updateSinfForIXWithIdentifier:withOptions:sinfData:completion:]", 1762, MIInstallerErrorDomain, 36, 0, 0, @"Failed to get app bundle in bundle container for %@", v18, (uint64_t)v55);
    uint64_t v22 = 0;
    uint64_t v19 = 0;
    id v20 = 0;
    id v26 = 0;
    id v35 = v75[5];
    v75[5] = (id)v36;
LABEL_55:

    goto LABEL_56;
  }
  id v20 = [v17 rootSinfURL];
  id v21 = v75;
  id v67 = v75[5];
  uint64_t v22 = +[NSData dataWithContentsOfURL:v20 options:2 error:&v67];
  objc_storeStrong(v21 + 5, v67);
  if (v22) {
    goto LABEL_9;
  }
  id v37 = [v75[5] domain];
  if (([v37 isEqualToString:NSCocoaErrorDomain] & 1) == 0)
  {

LABEL_38:
    id v39 = v75[5];
    [v20 path:v47, v49, v51];
    id v35 = (id)objc_claimAutoreleasedReturnValue();
    uint64_t v41 = sub_100014A08((uint64_t)"-[MIClientConnection updateSinfForIXWithIdentifier:withOptions:sinfData:completion:]", 1770, MIInstallerErrorDomain, 4, v39, 0, @"Failed to read SINF from %@", v40, (uint64_t)v35);
    id v42 = v75[5];
    v75[5] = (id)v41;

    uint64_t v22 = 0;
    id v26 = 0;
    goto LABEL_55;
  }
  id v38 = [v75[5] code];

  if (v38 != (id)260) {
    goto LABEL_38;
  }
LABEL_9:
  unsigned int v66 = 0;
  id v23 = v75;
  id v65 = v75[5];
  unsigned __int8 v24 = [v19 getSinfDataType:&v66 withError:&v65 v47, v49, v51];
  objc_storeStrong(v23 + 5, v65);
  if ((v24 & 1) == 0) {
    goto LABEL_36;
  }
  uint64_t v25 = [v54 objectForKeyedSubscript:@"ApplicationSINFDataType"];
  objc_opt_class();
  id v26 = sub_100017A04(v25);

  if (v26 && (id v27 = [v26 unsignedIntValue], v27 != v66))
  {
    id v44 = v75;
    id v64 = v75[5];
    unsigned __int8 v45 = [v19 setSinfDataType:v27 withError:&v64];
    objc_storeStrong(v44 + 5, v64);
    if ((v45 & 1) == 0)
    {
      if (!qword_1000A60B8 || *(int *)(qword_1000A60B8 + 44) >= 3) {
        MOLogWrite();
      }
      goto LABEL_56;
    }
    int v52 = 1;
  }
  else
  {
    int v52 = 0;
  }
  id v28 = v75;
  id v63 = v75[5];
  uint64_t v29 = [v19 updateAndValidateSinf:v53 error:&v63];
  objc_storeStrong(v28 + 5, v63);
  if (!v29)
  {
    if (!qword_1000A60B8 || *(int *)(qword_1000A60B8 + 44) >= 3) {
      MOLogWrite();
    }
    if (v52)
    {
      id v62 = 0;
      unsigned __int8 v43 = [v19 setSinfDataType:v66 withError:&v62];
      id v35 = v62;
      if ((v43 & 1) == 0 && (!qword_1000A60B8 || *(int *)(qword_1000A60B8 + 44) >= 3)) {
        MOLogWrite();
      }
    }
    else
    {
      id v35 = 0;
    }
    goto LABEL_55;
  }
  id v30 = v75[5];
  v75[5] = 0;

  if (qword_1000A60B8 && *(int *)(qword_1000A60B8 + 44) >= 7)
  {
    unint64_t v48 = (unint64_t)v29;
    MOLogWrite();
  }
  sub_1000550D8(v55);
  uint64_t v31 = sub_10000EC48();
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10001CD10;
  block[3] = &unk_10008CF10;
  id v60 = &v70;
  id v32 = v55;
  id v58 = v32;
  id v33 = v29;
  id v59 = v33;
  v61 = &v74;
  dispatch_sync(v31, block);

  if (!*((unsigned char *)v71 + 24))
  {
    if (!qword_1000A60B8 || *(int *)(qword_1000A60B8 + 44) >= 3)
    {
      unint64_t v48 = (unint64_t)v32;
      id v50 = v75[5];
      MOLogWrite();
    }

    sub_100054F88(v32);
    if (v52)
    {
      id v56 = 0;
      unsigned __int8 v34 = [v19 setSinfDataType:v66 withError:&v56];
      id v35 = v56;
      if ((v34 & 1) == 0 && (!qword_1000A60B8 || *(int *)(qword_1000A60B8 + 44) >= 3))
      {
        unint64_t v48 = v66;
        id v50 = v35;
        MOLogWrite();
      }
    }
    else
    {
      id v35 = 0;
    }
    v46 = [v16 bundle:v48 bundleIdentifier:v50];
    [v46 bestEffortRollbackSinfData:v22];

    goto LABEL_55;
  }
LABEL_27:
  ((void (**)(id, id, id))v10)[2](v10, v33, v75[5]);

  _Block_object_dispose(&v70, 8);
  _Block_object_dispose(&v74, 8);
}

- (void)updateiTunesMetadataForIXWithIdentifier:(id)a3 metadata:(id)a4 completion:(id)a5
{
  id v8 = a3;
  id v40 = a4;
  id v9 = (void (**)(id, void))a5;
  uint64_t v53 = 0;
  id v54 = (id *)&v53;
  uint64_t v55 = 0x3032000000;
  id v56 = sub_1000174F4;
  v57 = sub_100017504;
  id v58 = 0;
  uint64_t v49 = 0;
  id v50 = &v49;
  uint64_t v51 = 0x2020000000;
  char v52 = 0;
  uint64_t v10 = sub_100016830(self, @"UpdateiTunesMetadataForInstallCoordination");
  id v11 = v54[5];
  v54[5] = (id)v10;

  if (v54[5]) {
    goto LABEL_22;
  }
  objc_opt_class();
  id v12 = v8;
  if (objc_opt_isKindOfClass()) {
    id v13 = v12;
  }
  else {
    id v13 = 0;
  }

  if (!v13)
  {
    uint64_t v27 = sub_100014A08((uint64_t)"-[MIClientConnection updateiTunesMetadataForIXWithIdentifier:metadata:completion:]", 1869, MIInstallerErrorDomain, 25, 0, 0, @"Parameter validation failed: bundleIdentifier parameter was not a string", v14, (uint64_t)v36);
LABEL_21:
    id v28 = v54[5];
    v54[5] = (id)v27;

LABEL_22:
    id v26 = 0;
    id v17 = 0;
    uint64_t v18 = 0;
    goto LABEL_23;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    uint64_t v27 = sub_100014A08((uint64_t)"-[MIClientConnection updateiTunesMetadataForIXWithIdentifier:metadata:completion:]", 1874, MIInstallerErrorDomain, 25, 0, 0, @"Parameter validation failed: metadata parameter was not MIStoreMetadata instance", v15, (uint64_t)v36);
    goto LABEL_21;
  }
  if (!qword_1000A60B8 || *(int *)(qword_1000A60B8 + 44) >= 5)
  {
    uint64_t v36 = [(MIClientConnection *)self clientName];
    id v38 = v12;
    MOLogWrite();
  }
  sub_100054F88(v12);
  uint64_t v16 = v54;
  id obj = v54[5];
  id v17 = +[MIBundleContainer appBundleContainerWithIdentifier:v12 createIfNeeded:0 created:0 error:&obj];
  objc_storeStrong(v16 + 5, obj);
  if (!v17)
  {
    if (!qword_1000A60B8 || *(int *)(qword_1000A60B8 + 44) >= 3)
    {
      id v26 = 0;
      MOLogWrite();
      uint64_t v18 = 0;
      id v17 = 0;
LABEL_35:
      sub_1000550D8(v8);
      goto LABEL_23;
    }
    uint64_t v18 = 0;
    id v17 = 0;
LABEL_34:
    id v26 = 0;
    goto LABEL_35;
  }
  uint64_t v18 = [v17 iTunesMetadataURL];
  uint64_t v19 = v54;
  id v47 = v54[5];
  uint64_t v20 = +[NSData dataWithContentsOfURL:v18 options:2 error:&v47];
  objc_storeStrong(v19 + 5, v47);
  if (v20) {
    goto LABEL_12;
  }
  uint64_t v29 = [v54[5] domain];
  if (([v29 isEqualToString:NSCocoaErrorDomain] & 1) == 0)
  {

LABEL_33:
    id v31 = v54[5];
    id v32 = [v18 path:v36, v38];
    uint64_t v34 = sub_100014A08((uint64_t)"-[MIClientConnection updateiTunesMetadataForIXWithIdentifier:metadata:completion:]", 1893, MIInstallerErrorDomain, 4, v31, 0, @"Failed to read iTunesMetadata from %@", v33, (uint64_t)v32);
    id v35 = v54[5];
    v54[5] = (id)v34;

    goto LABEL_34;
  }
  id v30 = [v54[5] code];

  if (v30 != (id)260) {
    goto LABEL_33;
  }
LABEL_12:
  id v21 = v54;
  id v46 = v54[5];
  unsigned int v22 = [v17 writeiTunesMetadata:v40 error:&v46 v36, v38];
  objc_storeStrong(v21 + 5, v46);
  *((unsigned char *)v50 + 24) = v22;
  if (!v22)
  {
    id v26 = (void *)v20;
    goto LABEL_35;
  }
  id v23 = v54[5];
  v54[5] = 0;

  sub_1000550D8(v12);
  unsigned __int8 v24 = sub_10000EC48();
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10001D55C;
  block[3] = &unk_10008CF10;
  id v44 = &v49;
  id v25 = v12;
  id v42 = v25;
  id v43 = v40;
  unsigned __int8 v45 = &v53;
  dispatch_sync(v24, block);

  if (!*((unsigned char *)v50 + 24))
  {
    if (!qword_1000A60B8 || *(int *)(qword_1000A60B8 + 44) >= 3)
    {
      id v37 = v25;
      uint64_t v39 = (uint64_t)v54[5];
      MOLogWrite();
    }
    [v17 bestEffortRollbackiTunesMetadata:v20 error:v37, v39];
  }
  id v26 = (void *)v20;
LABEL_23:
  ((void (**)(id, id))v9)[2](v9, v54[5]);

  _Block_object_dispose(&v49, 8);
  _Block_object_dispose(&v53, 8);
}

- (void)fetchDiskUsageForIdentifiers:(id)a3 withOptions:(id)a4 completion:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  uint64_t v10 = (void (**)(id, void *, id))a5;
  sub_100016830(self, @"CopyDiskUsageForLaunchServices");
  id v11 = (id)objc_claimAutoreleasedReturnValue();
  if (v11) {
    goto LABEL_11;
  }
  objc_opt_class();
  id v12 = v8;
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {

LABEL_9:
    id v17 = @"Identifers provided was not an array of strings";
    uint64_t v18 = 1952;
LABEL_10:
    sub_100014A08((uint64_t)"-[MIClientConnection fetchDiskUsageForIdentifiers:withOptions:completion:]", v18, MIInstallerErrorDomain, 25, 0, 0, v17, v13, v21);
    id v11 = (id)objc_claimAutoreleasedReturnValue();
LABEL_11:
    uint64_t v19 = 0;
    goto LABEL_12;
  }
  if (!v12) {
    goto LABEL_9;
  }
  objc_opt_class();
  int v14 = sub_100014D8C(v12);

  if (!v14) {
    goto LABEL_9;
  }
  if (v9)
  {
    objc_opt_class();
    id v15 = v9;
    id v16 = (objc_opt_isKindOfClass() & 1) != 0 ? v15 : 0;

    if (!v16)
    {
      id v17 = @"Options provided was not a dictionary";
      uint64_t v18 = 1957;
      goto LABEL_10;
    }
  }
  if (qword_1000A60B8 && *(int *)(qword_1000A60B8 + 44) >= 7)
  {
    unsigned int v22 = [(MIClientConnection *)self clientName];
    MOLogWrite();
  }
  uint64_t v20 = [[MIDiskUsageGatherer alloc] initWithIdentifiers:v12 options:v9];
  id v23 = 0;
  uint64_t v19 = [(MIDiskUsageGatherer *)v20 gatherUsageInfoWithError:&v23];
  id v11 = v23;

LABEL_12:
  v10[2](v10, v19, v11);
}

- (void)registerSafeHarborAtPath:(id)a3 forIdentity:(id)a4 ofType:(unint64_t)a5 withOptions:(id)a6 completion:(id)a7
{
  id v12 = a3;
  id v13 = a4;
  id v14 = a6;
  id v15 = (void (**)(id, id))a7;
  sub_100016830(self, @"RegisterSafeHarbor");
  id v16 = (id)objc_claimAutoreleasedReturnValue();
  if (!v16)
  {
    objc_opt_class();
    id v17 = v12;
    if (objc_opt_isKindOfClass()) {
      id v18 = v17;
    }
    else {
      id v18 = 0;
    }

    if (!v18)
    {
      sub_100014A08((uint64_t)"-[MIClientConnection registerSafeHarborAtPath:forIdentity:ofType:withOptions:completion:]", 1991, MIInstallerErrorDomain, 25, 0, 0, @"Path parameter was not a string", v19, (uint64_t)v33);
      id v16 = (id)objc_claimAutoreleasedReturnValue();
      goto LABEL_2;
    }
    id v41 = 0;
    unsigned int v20 = +[MIAppIdentity validateAppIdentity:v13 withError:&v41];
    id v21 = v41;
    id v16 = v21;
    if (v20)
    {
      id v40 = v21;
      unsigned int v22 = [v13 resolvePersonaWithError:&v40];
      id v23 = v40;

      if (!v22)
      {
        id v16 = v23;
        goto LABEL_2;
      }
      if (a5 - 15 <= 0xFFFFFFFFFFFFFFF1)
      {
        uint64_t v25 = sub_100014A08((uint64_t)"-[MIClientConnection registerSafeHarborAtPath:forIdentity:ofType:withOptions:completion:]", 2004, MIInstallerErrorDomain, 25, 0, 0, @"Container type parameter did not correspond to a defined container content class.", v24, (uint64_t)v33);
LABEL_11:
        id v16 = (id)v25;

        goto LABEL_2;
      }
      if (v14)
      {
        objc_opt_class();
        id v26 = sub_100017A04(v14);

        if (!v26)
        {
          uint64_t v25 = sub_100014A08((uint64_t)"-[MIClientConnection registerSafeHarborAtPath:forIdentity:ofType:withOptions:completion:]", 2009, MIInstallerErrorDomain, 25, 0, 0, @"Options parameter was not a dictionary", v27, (uint64_t)v33);
          goto LABEL_11;
        }
      }
      if (!qword_1000A60B8 || *(int *)(qword_1000A60B8 + 44) >= 5)
      {
        [(MIClientConnection *)self clientName];
        unint64_t v36 = a5;
        id v37 = v14;
        id v34 = v17;
        uint64_t v33 = v35 = v13;
        MOLogWrite();
      }
      id v28 = +[MISafeHarborManager defaultManager];
      uint64_t v29 = +[NSURL fileURLWithPath:v17];
      id v30 = [v13 bundleID];
      id v31 = [v13 personaUniqueString];
      id v39 = v23;
      unsigned __int8 v38 = [v28 registerSafeHarborAtURL:v29 withOptions:v14 forIdentifier:v30 forPersona:v31 ofType:a5 error:&v39];
      id v32 = v28;
      id v16 = v39;

      if ((v38 & 1) == 0 && (!qword_1000A60B8 || *(int *)(qword_1000A60B8 + 44) >= 3)) {
        MOLogWrite();
      }
    }
  }
LABEL_2:
  v15[2](v15, v16);
}

- (void)removeSafeHarborForIdentity:(id)a3 ofType:(unint64_t)a4 withOptions:(id)a5 completion:(id)a6
{
  id v10 = a3;
  id v11 = a5;
  id v12 = (void (**)(id, id))a6;
  sub_100016830(self, @"RemoveSafeHarbor");
  id v13 = (id)objc_claimAutoreleasedReturnValue();
  if (!v13)
  {
    id v33 = 0;
    unsigned int v14 = +[MIAppIdentity validateAppIdentity:v10 withError:&v33];
    id v15 = v33;
    id v13 = v15;
    if (v14)
    {
      id v32 = v15;
      unsigned int v16 = [v10 resolvePersonaWithError:&v32];
      id v17 = v32;

      if (!v16)
      {
        id v13 = v17;
        goto LABEL_20;
      }
      if (a4 - 15 <= 0xFFFFFFFFFFFFFFF1)
      {
        uint64_t v19 = sub_100014A08((uint64_t)"-[MIClientConnection removeSafeHarborForIdentity:ofType:withOptions:completion:]", 2054, MIInstallerErrorDomain, 25, 0, 0, @"Container type parameter did not correspond to a defined container content class.", v18, (uint64_t)v27);
LABEL_6:
        id v13 = (id)v19;

        goto LABEL_20;
      }
      if (v11)
      {
        objc_opt_class();
        id v20 = v11;
        id v21 = (objc_opt_isKindOfClass() & 1) != 0 ? v20 : 0;

        if (!v21)
        {
          uint64_t v19 = sub_100014A08((uint64_t)"-[MIClientConnection removeSafeHarborForIdentity:ofType:withOptions:completion:]", 2059, MIInstallerErrorDomain, 25, 0, 0, @"Options parameter was not a dictionary", v22, (uint64_t)v27);
          goto LABEL_6;
        }
      }
      if (!qword_1000A60B8 || *(int *)(qword_1000A60B8 + 44) >= 5)
      {
        [(MIClientConnection *)self clientName];
        unint64_t v29 = a4;
        uint64_t v27 = v30 = v11;
        id v28 = v10;
        MOLogWrite();
      }
      id v23 = +[MISafeHarborManager defaultManager];
      uint64_t v24 = [v10 bundleID];
      uint64_t v25 = [v10 personaUniqueString];
      id v31 = v17;
      unsigned __int8 v26 = [v23 removeSafeHarborWithIdentifier:v24 forPersona:v25 ofType:a4 options:v11 error:&v31];
      id v13 = v31;

      if ((v26 & 1) == 0 && (!qword_1000A60B8 || *(int *)(qword_1000A60B8 + 44) >= 3)) {
        MOLogWrite();
      }
    }
  }
LABEL_20:
  v12[2](v12, v13);
}

- (void)listSafeHarborsOfType:(unint64_t)a3 forPersona:(id)a4 withOptions:(id)a5 completion:(id)a6
{
  id v10 = a4;
  id v11 = a5;
  id v12 = (void (**)(id, void *, void *))a6;
  unsigned int v14 = sub_100016830(self, @"CopySafeHarbors");
  if (v14) {
    goto LABEL_2;
  }
  if (v11)
  {
    objc_opt_class();
    id v16 = v11;
    id v17 = (objc_opt_isKindOfClass() & 1) != 0 ? v16 : 0;

    if (!v17)
    {
      uint64_t v18 = @"Options parameter was not a dictionary";
      uint64_t v19 = 2097;
      goto LABEL_16;
    }
  }
  if (a3 - 15 <= 0xFFFFFFFFFFFFFFF1)
  {
    uint64_t v18 = @"Container type parameter did not correspond to a defined container content class.";
    uint64_t v19 = 2102;
LABEL_16:
    id v15 = 0;
    unsigned int v14 = sub_100014A08((uint64_t)"-[MIClientConnection listSafeHarborsOfType:forPersona:withOptions:completion:]", v19, MIInstallerErrorDomain, 25, 0, 0, v18, v13, (uint64_t)v23);
    goto LABEL_17;
  }
  if (qword_1000A60B8 && *(int *)(qword_1000A60B8 + 44) >= 7)
  {
    [(MIClientConnection *)self clientName];
    unint64_t v24 = a3;
    v23 = id v25 = v11;
    MOLogWrite();
  }
  id v20 = +[MISafeHarborManager defaultManager];
  id v26 = 0;
  uint64_t v21 = [v20 safeHarborListForType:a3 forPersona:v10 withError:&v26];
  id v22 = v26;

  if (v21)
  {
    unsigned int v14 = v22;
    id v15 = (void *)v21;
    goto LABEL_17;
  }
  if (!qword_1000A60B8 || *(int *)(qword_1000A60B8 + 44) >= 3) {
    MOLogWrite();
  }
  unsigned int v14 = v22;
LABEL_2:
  id v15 = 0;
LABEL_17:
  v12[2](v12, v15, v14);
}

- (void)checkCapabilities:(id)a3 withOptions:(id)a4 completion:(id)a5
{
  id v7 = a3;
  id v8 = a4;
  id v9 = (void (**)(id, id, void *))a5;
  if (v8)
  {
    objc_opt_class();
    id v10 = v8;
    id v11 = (objc_opt_isKindOfClass() & 1) != 0 ? v10 : 0;

    if (!v11)
    {
      id v16 = sub_100014A08((uint64_t)"-[MIClientConnection checkCapabilities:withOptions:completion:]", 2141, MIInstallerErrorDomain, 25, 0, 0, @"Options parameter was not a dictionary", v12, v19);
      goto LABEL_19;
    }
  }
  uint64_t v13 = +[MICapabilitiesManager defaultManager];
  id v20 = 0;
  uint64_t v14 = [v13 checkCapabilities:v7 withOptions:v8 error:&v20];
  id v15 = v20;

  if (v14)
  {
    id v16 = v15;
LABEL_8:
    id v11 = (id)v14;
    goto LABEL_19;
  }
  if (v15)
  {
    id v17 = [v15 domain];
    if ([v17 isEqualToString:MIInstallerErrorDomain])
    {
      BOOL v18 = [v15 code] == (id)66;

      if (v18)
      {
        v21[0] = @"CapabilitiesMatch";
        v21[1] = @"MismatchedCapabilities";
        v22[0] = &__kCFBooleanFalse;
        v22[1] = &off_100097880;
        uint64_t v14 = +[NSDictionary dictionaryWithObjects:v22 forKeys:v21 count:2];

        id v16 = 0;
        goto LABEL_8;
      }
    }
    else
    {
    }
  }
  if (!qword_1000A60B8 || *(int *)(qword_1000A60B8 + 44) >= 3) {
    MOLogWrite();
  }
  id v16 = +[NSError errorWithDomain:MIInstallerErrorDomain code:1 userInfo:&off_1000978A8];

  id v11 = 0;
LABEL_19:
  v9[2](v9, v11, v16);
}

- (void)updatePlaceholderMetadataForApp:(id)a3 installType:(unint64_t)a4 failureReason:(unint64_t)a5 underlyingError:(id)a6 failureSource:(unint64_t)a7 completion:(id)a8
{
  id v13 = a3;
  id v43 = a6;
  uint64_t v14 = (void (**)(id, void))a8;
  uint64_t v59 = 0;
  id v60 = (id *)&v59;
  uint64_t v61 = 0x3032000000;
  id v62 = sub_1000174F4;
  id v63 = sub_100017504;
  id v64 = 0;
  uint64_t v55 = 0;
  id v56 = &v55;
  uint64_t v57 = 0x2020000000;
  char v58 = 0;
  uint64_t v15 = sub_100016830(self, @"UpdatePlaceholderMetadata");
  id v16 = v60[5];
  v60[5] = (id)v15;

  if (v60[5]) {
    goto LABEL_2;
  }
  objc_opt_class();
  id v23 = v13;
  if (objc_opt_isKindOfClass()) {
    id v24 = v23;
  }
  else {
    id v24 = 0;
  }

  if (!v24)
  {
    uint64_t v34 = sub_100014A08((uint64_t)"-[MIClientConnection updatePlaceholderMetadataForApp:installType:failureReason:underlyingError:failureSource:completion:]", 2189, MIInstallerErrorDomain, 25, 0, 0, @"bundleID parameter was not a string", v25, (uint64_t)v36);
    id v35 = v60[5];
    v60[5] = (id)v34;

LABEL_2:
    id v17 = 0;
    id v18 = 0;
    uint64_t v19 = 0;
LABEL_3:
    int v20 = 0;
    goto LABEL_4;
  }
  if (!qword_1000A60B8 || *(int *)(qword_1000A60B8 + 44) >= 5)
  {
    [(MIClientConnection *)self clientName];
    id v40 = v43;
    unint64_t v41 = a7;
    unint64_t v38 = a4;
    unint64_t v36 = v39 = a5;
    id v37 = v23;
    MOLogWrite();
  }
  sub_100054F88(v23);
  id v26 = v60;
  id obj = v60[5];
  int v20 = 1;
  uint64_t v19 = +[MIBundleContainer appBundleContainerWithIdentifier:v23 createIfNeeded:0 created:0 error:&obj];
  objc_storeStrong(v26 + 5, obj);
  if (!v19)
  {
    id v17 = 0;
    goto LABEL_32;
  }
  uint64_t v27 = v60;
  id v53 = v60[5];
  id v17 = [v19 bundleMetadataWithError:&v53];
  objc_storeStrong(v27 + 5, v53);
  if (!v17)
  {
LABEL_32:
    id v18 = 0;
    goto LABEL_4;
  }
  id v18 = [v17 copy];
  [v18 setPlaceholderFailureReason:a5];
  [v18 setPlaceholderFailureUnderlyingError:v43];
  [v18 setPlaceholderFailureUnderlyingErrorSource:a7];
  if (a4) {
    [v18 setInstallType:a4];
  }
  id v28 = v60;
  id v52 = v60[5];
  unsigned int v29 = [v19 saveBundleMetadata:v18 withError:&v52, v36, v37, v38, v39, v40, v41];
  objc_storeStrong(v28 + 5, v52);
  if (v29)
  {
    sub_1000550D8(v23);
    id v30 = objc_opt_new();
    id v31 = +[NSNumber numberWithUnsignedInt:sub_10000EB14()];
    [v30 setTargetUserID:v31];

    id v32 = sub_10000EC48();
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_10001EE1C;
    block[3] = &unk_10008D350;
    unint64_t v48 = &v55;
    id v46 = v23;
    id v47 = v30;
    unint64_t v50 = a4;
    unint64_t v51 = a5;
    uint64_t v49 = &v59;
    id v33 = v30;
    dispatch_sync(v32, block);

    if (*((unsigned char *)v56 + 24) || qword_1000A60B8 && *(int *)(qword_1000A60B8 + 44) < 3) {
      goto LABEL_3;
    }
    int v20 = 0;
    MOLogWrite();
  }
LABEL_4:

  if (*((unsigned char *)v56 + 24))
  {
    if (!v20) {
      goto LABEL_13;
    }
    goto LABEL_12;
  }
  id v44 = 0;
  unsigned __int8 v21 = [v19 saveBundleMetadata:v17 withError:&v44];
  id v22 = v44;
  if ((v21 & 1) == 0 && (!qword_1000A60B8 || *(int *)(qword_1000A60B8 + 44) >= 3)) {
    MOLogWrite();
  }

  if (v20) {
LABEL_12:
  }
    sub_1000550D8(v13);
LABEL_13:
  ((void (**)(id, id))v14)[2](v14, v60[5]);

  _Block_object_dispose(&v55, 8);
  _Block_object_dispose(&v59, 8);
}

- (void)getAppMetadataForApp:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = (void (**)(id, void *, void *))a4;
  id v8 = sub_100016830(self, @"GetAppMetadata");
  if (!v8)
  {
    objc_opt_class();
    id v10 = v6;
    if (objc_opt_isKindOfClass()) {
      id v11 = v10;
    }
    else {
      id v11 = 0;
    }

    if (!v11)
    {
      id v8 = sub_100014A08((uint64_t)"-[MIClientConnection getAppMetadataForApp:completion:]", 2283, MIInstallerErrorDomain, 25, 0, 0, @"bundleID parameter was not a string", v12, (uint64_t)v26);
      id v9 = 0;
      goto LABEL_36;
    }
    if (!qword_1000A60B8 || *(int *)(qword_1000A60B8 + 44) >= 5)
    {
      id v26 = [(MIClientConnection *)self clientName];
      id v27 = v10;
      MOLogWrite();
    }
    sub_100054F80(v10);
    id v32 = 0;
    id v13 = +[MIBundleContainer appBundleContainerWithIdentifier:v10 createIfNeeded:0 created:0 error:&v32];
    id v14 = v32;
    uint64_t v15 = v14;
    if (!v13)
    {
      id v9 = 0;
LABEL_35:

      id v8 = v15;
      sub_1000550D8(v6);
      goto LABEL_36;
    }
    id v31 = v14;
    id v9 = [v13 bundleMetadataWithError:&v31];
    id v16 = v31;

    if (!v9
      || ([v9 watchKitAppExecutableHash],
          id v17 = objc_claimAutoreleasedReturnValue(),
          v17,
          v17))
    {
LABEL_34:
      uint64_t v15 = v16;
      goto LABEL_35;
    }
    sub_1000550D8(v10);
    sub_100054F88(v10);
    id v18 = [v13 bundle];
    id v30 = v16;
    uint64_t v19 = [v18 watchKitAppExecutableHashWithError:&v30];
    id v20 = v30;

    if (v19)
    {
      [v9 setWatchKitAppExecutableHash:v19];
      id v29 = v20;
      unsigned __int8 v21 = [v13 saveBundleMetadata:v9 withError:&v29];
      id v16 = v29;

      if ((v21 & 1) != 0 || qword_1000A60B8 && *(int *)(qword_1000A60B8 + 44) < 3) {
        goto LABEL_33;
      }
      id v28 = [v13 bundle:v26 bundleIdentifier:v27];
      id v22 = [v28 identifier];
      MOLogWrite();
      goto LABEL_30;
    }
    id v28 = [v20 domain];
    uint64_t v23 = MIInstallerErrorDomain;
    if ([v28 isEqualToString:MIInstallerErrorDomain]
      && [v20 code] == (id)85)
    {
      id v16 = v20;
LABEL_31:

LABEL_33:
      goto LABEL_34;
    }
    id v24 = [v20 domain:v26, v27];
    if ([v24 isEqualToString:v23])
    {
      id v25 = [v20 code];

      if (v25 == (id)139) {
        goto LABEL_32;
      }
    }
    else
    {
    }
    if (!qword_1000A60B8 || *(int *)(qword_1000A60B8 + 44) >= 3)
    {
      id v28 = [v13 bundle];
      id v22 = [v28 identifier];
      id v16 = v20;
      MOLogWrite();
LABEL_30:

      goto LABEL_31;
    }
LABEL_32:
    id v16 = v20;
    goto LABEL_33;
  }
  id v9 = 0;
LABEL_36:
  v7[2](v7, v9, v8);
}

- (void)snapshotWKAppInCompanionAppID:(id)a3 toURL:(id)a4 options:(id)a5 completion:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = (void (**)(id, void *, void *))a6;
  id v14 = sub_100016830(self, @"SnapshotWKApp");
  if (v14) {
    goto LABEL_28;
  }
  objc_opt_class();
  id v15 = v10;
  if (objc_opt_isKindOfClass()) {
    id v16 = v15;
  }
  else {
    id v16 = 0;
  }

  if (!v16)
  {
    id v20 = @"bundleID parameter was not a string";
    uint64_t v21 = 2405;
LABEL_27:
    id v14 = sub_100014A08((uint64_t)"-[MIClientConnection snapshotWKAppInCompanionAppID:toURL:options:completion:]", v21, MIInstallerErrorDomain, 25, 0, 0, v20, v17, v33);
LABEL_28:
    id v32 = 0;
    id v30 = 0;
    id v27 = 0;
    goto LABEL_29;
  }
  objc_opt_class();
  id v18 = v11;
  if (objc_opt_isKindOfClass()) {
    id v19 = v18;
  }
  else {
    id v19 = 0;
  }

  if (!v19)
  {
    id v20 = @"destURL parameter was not a URL";
    uint64_t v21 = 2410;
    goto LABEL_27;
  }
  if (v12)
  {
    objc_opt_class();
    id v22 = v12;
    id v23 = (objc_opt_isKindOfClass() & 1) != 0 ? v22 : 0;

    if (!v23)
    {
      id v20 = @"Options parameter was not a dictionary";
      uint64_t v21 = 2415;
      goto LABEL_27;
    }
  }
  if (!qword_1000A60B8 || *(int *)(qword_1000A60B8 + 44) >= 5)
  {
    id v24 = [(MIClientConnection *)self clientName];
    id v35 = [v18 path];
    id v36 = v12;
    uint64_t v33 = (uint64_t)v15;
    uint64_t v34 = v24;
    MOLogWrite();
  }
  id v25 = [v12 objectForKeyedSubscript:kMIWatchKitSnapshotOptionMaxWKAppVersion, v33, v34, v35, v36];
  objc_opt_class();
  id v26 = v25;
  if (objc_opt_isKindOfClass()) {
    id v27 = v26;
  }
  else {
    id v27 = 0;
  }

  id v28 = [v12 objectForKeyedSubscript:kMIWatchKitSnapshotOptionCreatePlaceholder];
  id v29 = sub_100014D34(v28, 0);

  id v30 = -[MIWatchKitAppSnapshot initWithBundleID:snapshotTo:onlyV1AppIfPresent:placeholderOnly:]([MIWatchKitAppSnapshot alloc], "initWithBundleID:snapshotTo:onlyV1AppIfPresent:placeholderOnly:", v15, v18, [v27 isEqualToString:@"1.0"], v29);
  id v37 = 0;
  LODWORD(v29) = [(MIWatchKitAppSnapshot *)v30 createSnapshotWithError:&v37];
  id v31 = v37;
  id v14 = v31;
  if (v29)
  {

    id v32 = [(MIWatchKitAppSnapshot *)v30 resultDict];
    id v14 = 0;
  }
  else
  {
    id v32 = 0;
  }
LABEL_29:

  v13[2](v13, v32, v14);
}

- (void)setSystemAppMigrationComplete:(id)a3
{
  id v7 = (void (**)(id, void *))a3;
  id v4 = sub_100016830(self, @"SetSystemAppMigrationComplete");
  if (!v4)
  {
    if (!qword_1000A60B8 || *(int *)(qword_1000A60B8 + 44) >= 5)
    {
      id v6 = [(MIClientConnection *)self clientName];
      MOLogWrite();
    }
    id v5 = +[MISystemAppMigrationState defaultManager];
    [v5 setSystemAppMigrationComplete:1];

    id v4 = 0;
  }
  v7[2](v7, v4);
}

- (void)waitForSystemAppMigratorToComplete:(id)a3
{
  exc_buf = (void (**)(id, void *))a3;
  id v4 = sub_100016830(self, @"WaitForSystemAppMigrationToComplete");
  if (v4)
  {
    exc_buf[2](exc_buf, v4);
  }
  else
  {
    if (!qword_1000A60B8 || *(int *)(qword_1000A60B8 + 44) >= 5)
    {
      id v6 = [(MIClientConnection *)self clientName];
      MOLogWrite();
    }
    id v5 = +[MISystemAppMigrationState defaultManager];
    [v5 waitForSystemAppMigrationToComplete:exc_buf];

    id v4 = 0;
  }
}

- (void)systemAppMigratorHasCompleted:(id)a3
{
  id v8 = (void (**)(id, id, void *))a3;
  id v4 = sub_100016830(self, @"GetSystemAppMigrationStatus");
  if (v4)
  {
    id v5 = 0;
  }
  else
  {
    if (!qword_1000A60B8 || *(int *)(qword_1000A60B8 + 44) >= 5)
    {
      id v7 = [(MIClientConnection *)self clientName];
      MOLogWrite();
    }
    id v6 = +[MISystemAppMigrationState defaultManager];
    id v5 = [v6 systemAppMigrationComplete];

    id v4 = 0;
  }
  v8[2](v8, v5, v4);
}

- (void)finalizeReference:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = (void (**)(id, uint64_t, void))a4;
  uint64_t v56 = 0;
  uint64_t v57 = (id *)&v56;
  uint64_t v58 = 0x3032000000;
  uint64_t v59 = sub_1000174F4;
  id v60 = sub_100017504;
  id v61 = 0;
  uint64_t v50 = 0;
  unint64_t v51 = &v50;
  uint64_t v52 = 0x3032000000;
  id v53 = sub_1000174F4;
  id v54 = sub_100017504;
  id v55 = 0;
  id v8 = [v6 identity];
  id v9 = [v8 bundleID];
  uint64_t v10 = sub_100016830(self, @"InstallForInstallCoordination");
  id v11 = v57[5];
  v57[5] = (id)v10;

  if (v57[5]) {
    goto LABEL_2;
  }
  if ((+[ICLFeatureFlags appReferencesEnabled] & 1) == 0)
  {
    uint64_t v29 = sub_100014A08((uint64_t)"-[MIClientConnection finalizeReference:completion:]", 2554, MIInstallerErrorDomain, 161, 0, 0, @"%s is not enabled", v15, (uint64_t)"-[MIClientConnection finalizeReference:completion:]");
    id v12 = 0;
    id v13 = 0;
    id v14 = 0;
    id v28 = v57[5];
    v57[5] = (id)v29;
LABEL_16:

    goto LABEL_21;
  }
  id v16 = v57;
  id obj = v57[5];
  unsigned int v17 = +[MIAppReference validateAppReference:v6 withError:&obj];
  objc_storeStrong(v16 + 5, obj);
  if (!v17)
  {
LABEL_2:
    id v12 = 0;
    id v13 = 0;
    id v14 = 0;
    goto LABEL_21;
  }
  sub_100054F80(v9);
  id v18 = [v6 domain];
  id v19 = v57;
  id v48 = v57[5];
  id v13 = +[MIBundleContainer appBundleContainerForIdentifier:v9 inDomain:v18 withError:&v48];
  objc_storeStrong(v19 + 5, v48);
  if (!v13) {
    goto LABEL_18;
  }
  id v12 = [v13 bundle];
  if (!v12)
  {
    uint64_t v30 = sub_100014A08((uint64_t)"-[MIClientConnection finalizeReference:completion:]", 2572, MIInstallerErrorDomain, 36, 0, 0, @"Failed to find bundle in bundle container %@ for %@", v20, (uint64_t)v13);
    id v31 = v57[5];
    v57[5] = (id)v30;

LABEL_18:
    id v12 = 0;
    goto LABEL_19;
  }
  uint64_t v21 = v57;
  id v47 = v57[5];
  unsigned int v22 = [v8 resolvePersonaWithError:&v47];
  objc_storeStrong(v21 + 5, v47);
  if (!v22)
  {
LABEL_19:
    id v27 = 0;
    id v24 = 0;
    goto LABEL_20;
  }
  location = [v8 personaUniqueString];
  id v23 = v57;
  id v46 = v57[5];
  id v24 = +[MILaunchServicesDatabaseGatherer fetchInfoForBundle:v12 forPersona:location inContainer:v13 withError:&v46];
  objc_storeStrong(v23 + 5, v46);

  if (v24)
  {
    id v25 = +[MIAppReferenceManager defaultManager];
    locationa = v57 + 5;
    id v44 = v57[5];
    id v45 = 0;
    unsigned int v33 = [v25 finalizeTemporaryReference:v6 resultingPersonaUniqueStrings:&v45 error:&v44];
    id v26 = v25;
    id v27 = v45;
    objc_storeStrong(locationa, v44);

    if (v33)
    {
      sub_1000550D8(v9);
      locationb = sub_10000EC48();
      block[0] = _NSConcreteStackBlock;
      block[1] = 3221225472;
      block[2] = sub_100020494;
      block[3] = &unk_10008D378;
      id v42 = &v50;
      id v14 = v24;
      id v38 = v14;
      id v39 = v9;
      id v28 = v27;
      id v40 = v28;
      id v41 = v6;
      id v43 = &v56;
      dispatch_sync(locationb, block);

      if (!v51[5] && (!qword_1000A60B8 || *(int *)(qword_1000A60B8 + 44) >= 3)) {
        MOLogWrite();
      }

      goto LABEL_16;
    }
  }
  else
  {
    id v27 = 0;
  }
LABEL_20:

  id v14 = v24;
  sub_1000550D8(v9);
LABEL_21:
  uint64_t v32 = v51[5];
  if (v32) {
    v7[2](v7, v32, 0);
  }
  else {
    ((void (**)(id, uint64_t, id))v7)[2](v7, 0, v57[5]);
  }

  _Block_object_dispose(&v50, 8);
  _Block_object_dispose(&v56, 8);
}

- (void)acquireReferenceforInstalledAppWithIdentity:(id)a3 inDomain:(unint64_t)a4 matchingInstallSessionID:(id)a5 completion:(id)a6
{
  id v10 = a3;
  id v51 = a5;
  id v11 = (void (**)(id, void, id))a6;
  sub_100016830(self, @"InstallForInstallCoordination");
  id v12 = (id)objc_claimAutoreleasedReturnValue();
  if (v12)
  {
    id v13 = 0;
    id v14 = 0;
    uint64_t v15 = 0;
LABEL_31:
    v11[2](v11, 0, v12);
    id v42 = 0;
    goto LABEL_32;
  }
  if ((+[ICLFeatureFlags appReferencesEnabled] & 1) == 0)
  {
    sub_100014A08((uint64_t)"-[MIClientConnection acquireReferenceforInstalledAppWithIdentity:inDomain:matchingInstallSessionID:completion:]", 2643, MIInstallerErrorDomain, 161, 0, 0, @"%s is not enabled", v16, (uint64_t)"-[MIClientConnection acquireReferenceforInstalledAppWithIdentity:inDomain:matchingInstallSessionID:completion:]");
    id v12 = (id)objc_claimAutoreleasedReturnValue();
    id v13 = 0;
    id v14 = 0;
    uint64_t v15 = 0;
    goto LABEL_31;
  }
  id v56 = 0;
  unsigned int v17 = +[MIAppIdentity validateAppIdentity:v10 withError:&v56];
  id v18 = v56;
  id v19 = v18;
  if (!v17)
  {
    id v13 = 0;
    id v14 = 0;
    uint64_t v15 = 0;
    id v12 = v18;
    goto LABEL_31;
  }
  uint64_t v20 = [v10 bundleID];
  sub_100054F80(v20);
  id v55 = v19;
  unsigned int v21 = [v10 resolvePersonaWithError:&v55];
  uint64_t v50 = (void *)v20;
  id v12 = v55;

  if (!v21)
  {
    id v42 = 0;
    uint64_t v15 = 0;
    id v14 = 0;
    id v13 = 0;
    goto LABEL_27;
  }
  uint64_t v22 = [v10 bundleID];
  if (a4 == 3) {
    uint64_t v23 = 2;
  }
  else {
    uint64_t v23 = 3;
  }
  id v54 = v12;
  unsigned __int8 v24 = [(MIClientConnection *)self _validateAppWithBundleID:v22 isNotInstalledInDomain:v23 error:&v54];
  id v25 = (void *)v22;
  id v26 = v54;

  if ((v24 & 1) == 0)
  {
    id v42 = 0;
    uint64_t v15 = 0;
    id v14 = 0;
    id v13 = 0;
    id v12 = v26;
    goto LABEL_27;
  }
  if (a4 == 1) {
    unint64_t v27 = 2;
  }
  else {
    unint64_t v27 = a4;
  }
  v53[1] = v26;
  unint64_t v48 = v27;
  id v28 = +[MIBundleContainer appBundleContainerForIdentifier:inDomain:withError:](MIBundleContainer, "appBundleContainerForIdentifier:inDomain:withError:", v20);
  id v29 = v26;

  if (v28)
  {
    id v31 = [v28 bundle];
    v53[0] = v29;
    uint64_t v32 = [v31 installationIdentitySettingIfNotSet:0 withError:v53];
    uint64_t v49 = v28;
    id v33 = v53[0];

    if (v32)
    {
      id v46 = v33;
      id v13 = [v32 installSessionID];
      id v35 = v32;
      if (([v13 isEqualToData:v51] & 1) == 0)
      {
        sub_100014A08((uint64_t)"-[MIClientConnection acquireReferenceforInstalledAppWithIdentity:inDomain:matchingInstallSessionID:completion:]", 2686, MIInstallerErrorDomain, 184, 0, 0, @"Installation session IDs did not match for %@", v34, (uint64_t)v10);
        id v39 = (id)objc_claimAutoreleasedReturnValue();
        id v43 = 0;
        id v29 = v46;
        goto LABEL_25;
      }
      id v47 = +[MIAppReferenceManager defaultManager];
      id v36 = [(MIClientConnection *)self xpcConnection];
      id v52 = v33;
      uint64_t v37 = [v47 addTemporaryReferenceForIdentity:v10 inDomain:v48 forUserWithID:[v36 effectiveUserIdentifier] error:&v52];
      id v38 = v36;
      id v39 = v52;

      id v40 = v38;
      uint64_t v41 = v37;
    }
    else
    {
      id v40 = v33;
      id v47 = [v28 bundle];
      uint64_t v41 = 0;
      sub_100014A08((uint64_t)"-[MIClientConnection acquireReferenceforInstalledAppWithIdentity:inDomain:matchingInstallSessionID:completion:]", 2680, MIInstallerErrorDomain, 4, v33, 0, @"Failed to fetch installation identity for %@", v45, (uint64_t)v47);
      id v39 = (id)objc_claimAutoreleasedReturnValue();
      id v35 = 0;
      id v13 = 0;
    }

    id v29 = v47;
    id v43 = (void *)v41;
LABEL_25:
    id v44 = v49;
    goto LABEL_26;
  }
  id v43 = 0;
  sub_100014A08((uint64_t)"-[MIClientConnection acquireReferenceforInstalledAppWithIdentity:inDomain:matchingInstallSessionID:completion:]", 2673, MIInstallerErrorDomain, 26, v29, 0, @"Could not find installed app with identity %@ in domain %lu", v30, (uint64_t)v10);
  id v39 = (id)objc_claimAutoreleasedReturnValue();
  id v44 = 0;
  id v35 = 0;
  id v13 = 0;
LABEL_26:

  id v12 = v39;
  id v42 = v43;
  uint64_t v15 = v44;
  id v14 = v35;
LABEL_27:
  if (v50)
  {
    sub_1000550D8(v50);
  }
  if (!v42) {
    goto LABEL_31;
  }
  ((void (**)(id, void *, id))v11)[2](v11, v42, 0);
LABEL_32:
}

- (void)invalidateReference:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = (void (**)(id, uint64_t))a4;
  uint64_t v8 = sub_100016830(self, @"InstallForInstallCoordination");
  if (v8) {
    goto LABEL_6;
  }
  if ((+[ICLFeatureFlags appReferencesEnabled] & 1) == 0)
  {
    uint64_t v8 = sub_100014A08((uint64_t)"-[MIClientConnection invalidateReference:completion:]", 2726, MIInstallerErrorDomain, 161, 0, 0, @"%s is not enabled", v9, (uint64_t)"-[MIClientConnection invalidateReference:completion:]");
LABEL_6:
    id v14 = (void *)v8;
    v7[2](v7, v8);
    goto LABEL_7;
  }
  id v10 = [v6 identity];
  uint64_t v16 = v10;
  id v11 = +[NSArray arrayWithObjects:&v16 count:1];
  id v12 = +[MIUninstaller uninstallerForIdentities:v11 withOptions:0 forClient:self];

  id v15 = 0;
  LODWORD(v11) = [v12 performUninstallationByRevokingTemporaryReference:v6 error:&v15];
  id v13 = v15;
  id v14 = v13;
  if (v11)
  {

    id v14 = 0;
  }
  else if (!qword_1000A60B8 || *(int *)(qword_1000A60B8 + 44) >= 3)
  {
    MOLogWrite();
  }
  v7[2](v7, (uint64_t)v14);

LABEL_7:
}

- (void)referencesForBundleWithIdentifier:(id)a3 inDomain:(unint64_t)a4 completion:(id)a5
{
  id v7 = a3;
  uint64_t v8 = (void (**)(id, void, id))a5;
  if ((+[ICLFeatureFlags appReferencesEnabled] & 1) == 0)
  {
    sub_100014A08((uint64_t)"-[MIClientConnection referencesForBundleWithIdentifier:inDomain:completion:]", 2747, MIInstallerErrorDomain, 161, 0, 0, @"%s is not enabled", v9, (uint64_t)"-[MIClientConnection referencesForBundleWithIdentifier:inDomain:completion:]");
    id v12 = (id)objc_claimAutoreleasedReturnValue();
    goto LABEL_5;
  }
  id v10 = +[MIAppReferenceManager defaultManager];
  id v13 = 0;
  id v11 = [v10 referencesForIdentifier:v7 inDomain:a4 error:&v13];
  id v12 = v13;

  if (!v11)
  {
LABEL_5:
    v8[2](v8, 0, v12);
    goto LABEL_6;
  }
  ((void (**)(id, void *, id))v8)[2](v8, v11, 0);

LABEL_6:
}

- (void)linkedBundleIDsForAppIdentity:(id)a3 withCompletion:(id)a4
{
  id v6 = a3;
  id v7 = (void (**)(id, void *, id))a4;
  if (sub_100017A60(self))
  {
    uint64_t v9 = [v6 bundleID];
    sub_100054F88(v9);
    id v20 = 0;
    unsigned int v10 = [v6 resolvePersonaWithError:&v20];
    id v11 = v20;
    if (v10)
    {
      id v12 = +[MIContainerLinkManager sharedInstanceForDomain:2];
      id v19 = v11;
      id v13 = [v12 childrenForParentBundleID:v9 error:&v19];
      id v14 = v19;

      if (v13)
      {
        id v11 = v14;
      }
      else
      {
        uint64_t v17 = sub_100014A08((uint64_t)"-[MIClientConnection linkedBundleIDsForAppIdentity:withCompletion:]", 2979, MIInstallerErrorDomain, 4, v14, 0, @"Failed to query linked children for %@", v15, (uint64_t)v6);

        id v13 = 0;
        id v11 = (id)v17;
      }
    }
    else
    {
      id v13 = 0;
    }
    uint64_t v16 = (void *)v9;
    sub_1000550D8(v9);
  }
  else
  {
    uint64_t v16 = 0;
    sub_100014A08((uint64_t)"-[MIClientConnection linkedBundleIDsForAppIdentity:withCompletion:]", 2965, MIInstallerErrorDomain, 2, 0, &off_1000978D0, &stru_10008EEE8, v8, v18);
    id v11 = (id)objc_claimAutoreleasedReturnValue();
    id v13 = 0;
  }
  v7[2](v7, v13, v11);
}

- (void)getPidForTestingWithCompletion:(id)a3
{
  id v5 = a3;
  uint64_t v4 = getpid();
  (*((void (**)(id, uint64_t))a3 + 2))(v5, v4);
}

- (void)dieForTesting
{
  v3 = sub_100016830(self, @"UnitTestRunner");
  if (!v3)
  {
    if (!qword_1000A60B8 || *(int *)(qword_1000A60B8 + 44) >= 5)
    {
      uint64_t v4 = [(MIClientConnection *)self clientName];
      MOLogWrite();
    }
    exit(1);
  }
}

- (void)raiseExceptionWithCompletion:(id)a3
{
  id v7 = (void (**)(id, uint64_t))a3;
  uint64_t v4 = sub_100016830(self, @"UnitTestRunner");
  if (!v4)
  {
    id v6 = objc_alloc((Class)NSException);
    objc_exception_throw([v6 initWithName:NSGenericException reason:MITestExceptionReasonString userInfo:0]);
  }
  id v5 = (void *)v4;
  v7[2](v7, v4);
}

- (void)setTestModeWithCompletion:(id)a3
{
  uint64_t v4 = (void (**)(id, id))a3;
  sub_100016830(self, @"UnitTestRunner");
  id v5 = (id)objc_claimAutoreleasedReturnValue();
  if (!v5)
  {
    id v6 = +[MITestManager sharedInstance];
    id v7 = [(MIClientConnection *)self xpcConnection];
    id v9 = 0;
    unsigned int v8 = [v6 setIsRunningInTestModeForProcessWithPID:[v7 processIdentifier] withError:&v9];
    id v5 = v9;

    if (v8)
    {

      id v5 = 0;
    }
  }
  v4[2](v4, v5);
}

- (void)endTestModeWithCompletion:(id)a3
{
  uint64_t v4 = (void (**)(id, id))a3;
  sub_100016830(self, @"UnitTestRunner");
  id v5 = (id)objc_claimAutoreleasedReturnValue();
  if (!v5)
  {
    id v6 = +[MITestManager sharedInstance];
    id v7 = [(MIClientConnection *)self xpcConnection];
    id v9 = 0;
    unsigned int v8 = [v6 clearIsRunningInTestModeForProcessWithPID:[v7 processIdentifier] withError:&v9];
    id v5 = v9;

    if (v8)
    {

      id v5 = 0;
    }
  }
  v4[2](v4, v5);
}

- (void)getTestModeWithCompletion:(id)a3
{
  uint64_t v4 = (void (**)(id, void, id))a3;
  unsigned __int8 v9 = 0;
  sub_100016830(self, @"UnitTestRunner");
  id v5 = (id)objc_claimAutoreleasedReturnValue();
  if (!v5)
  {
    id v6 = +[MITestManager sharedInstance];
    id v8 = 0;
    unsigned int v7 = [v6 isRunningInTestMode:&v9 outError:&v8];
    id v5 = v8;

    if (v7)
    {

      id v5 = 0;
    }
  }
  v4[2](v4, v9, v5);
}

- (void)setTestFlags:(unint64_t)a3 withCompletion:(id)a4
{
  id v6 = (void (**)(id, id))a4;
  unsigned int v7 = +[MITestManager sharedInstance];
  sub_100016830(self, @"UnitTestRunner");
  id v8 = (id)objc_claimAutoreleasedReturnValue();
  if (!v8)
  {
    char v13 = 0;
    id v12 = 0;
    unsigned int v9 = [v7 isRunningInTestMode:&v13 outError:&v12];
    id v8 = v12;
    if (v9)
    {
      if (v13)
      {
        [v7 setTestFlags:a3];
      }
      else
      {
        uint64_t v11 = sub_100014A08((uint64_t)"-[MIClientConnection setTestFlags:withCompletion:]", 3099, MIInstallerErrorDomain, 4, 0, 0, @"Can't set test flags because installd is not in test mode.", v10, (uint64_t)v12);

        id v8 = (id)v11;
      }
    }
  }
  v6[2](v6, v8);
}

- (void)clearTestFlags:(unint64_t)a3 withCompletion:(id)a4
{
  id v6 = (void (**)(id, id))a4;
  unsigned int v7 = +[MITestManager sharedInstance];
  sub_100016830(self, @"UnitTestRunner");
  id v8 = (id)objc_claimAutoreleasedReturnValue();
  if (!v8)
  {
    char v13 = 0;
    id v12 = 0;
    unsigned int v9 = [v7 isRunningInTestMode:&v13 outError:&v12];
    id v8 = v12;
    if (v9)
    {
      if (v13)
      {
        [v7 clearTestFlags:a3];
      }
      else
      {
        uint64_t v11 = sub_100014A08((uint64_t)"-[MIClientConnection clearTestFlags:withCompletion:]", 3128, MIInstallerErrorDomain, 4, 0, 0, @"Can't clear test flags because installd is not in test mode.", v10, (uint64_t)v12);

        id v8 = (id)v11;
      }
    }
  }
  v6[2](v6, v8);
}

- (void)setEligibilityTestOverrides:(id)a3 withCompletion:(id)a4
{
  id v13 = a3;
  id v6 = (void (**)(id, void *))a4;
  unsigned int v7 = sub_100016830(self, @"UnitTestRunner");
  if (!v7)
  {
    uint64_t v8 = objc_opt_class();
    uint64_t v9 = objc_opt_class();
    if (sub_100014FF4(v13, v8, v9))
    {
      uint64_t v11 = +[MIEligibilityManager sharedInstance];
      [v11 setTestOverrides:v13];

      unsigned int v7 = 0;
    }
    else
    {
      unsigned int v7 = sub_100014A08((uint64_t)"-[MIClientConnection setEligibilityTestOverrides:withCompletion:]", 3150, MIInstallerErrorDomain, 25, 0, 0, @"Supplied dictionary had non-number keys or values.", v10, v12);
    }
  }
  v6[2](v6, v7);
}

- (void)_triggerRegistrationForContent:(unint64_t)a3 registrationOptions:(id)a4 writeLock:(BOOL)a5 withCompletion:(id)a6
{
  BOOL v7 = a5;
  id v9 = a4;
  uint64_t v10 = (void (**)(id, void))a6;
  uint64_t v31 = 0;
  uint64_t v32 = &v31;
  uint64_t v33 = 0x3032000000;
  uint64_t v34 = sub_1000174F4;
  id v35 = sub_100017504;
  id v36 = 0;
  id v11 = [v9 targetUID];
  uint64_t v12 = +[MITestManager sharedInstance];
  char v30 = 0;
  unsigned int v13 = [v12 isRunningInTestMode:&v30 outError:0];
  if (v30) {
    unsigned int v14 = v13;
  }
  else {
    unsigned int v14 = 0;
  }
  if (v14 == 1)
  {
    if ([v12 testFlagsAreSet:2])
    {
      uint64_t v16 = sub_100014A08((uint64_t)"-[MIClientConnection _triggerRegistrationForContent:registrationOptions:writeLock:withCompletion:]", 3178, MIInstallerErrorDomain, 4, 0, 0, @"Triggering registration with test mode enabled", v15, v26);
      uint64_t v17 = (void *)v32[5];
      v32[5] = v16;

LABEL_18:
      v10[2](v10, v32[5]);
      goto LABEL_19;
    }
    if ([v12 testFlagsAreSet:16])
    {
      uint64_t v18 = +[MIDaemonConfiguration sharedInstance];
      id v19 = [v18 testFileSentinelForSyncURL];

      id v20 = +[MIFileManager defaultManager];
      [v20 removeItemAtURL:v19 error:0];
    }
  }
  if (v7) {
    sub_100055710();
  }
  if (!qword_1000A60B8 || *(int *)(qword_1000A60B8 + 44) >= 5) {
    MOLogWrite();
  }
  v28[0] = _NSConcreteStackBlock;
  v28[1] = 3221225472;
  v28[2] = sub_100021E04;
  v28[3] = &unk_10008D3A0;
  int v29 = (int)v11;
  v28[4] = &v31;
  unsigned int v21 = [[MIReferenceAwareLSDatabaseGatherer alloc] initWithOptions:a3 forTargetUID:v11 enumerator:v28];
  uint64_t v22 = (id *)(v32 + 5);
  id obj = (id)v32[5];
  unsigned int v23 = [(MIReferenceAwareLSDatabaseGatherer *)v21 performGatherWithError:&obj];
  objc_storeStrong(v22, obj);

  if (v7) {
    sub_100055718(v24, v25);
  }
  if (!v23) {
    goto LABEL_18;
  }
  v10[2](v10, 0);
LABEL_19:
  _Block_object_dispose(&v31, 8);
}

- (void)triggerRegistrationForContainerizedContentForOptions:(id)a3 withCompletion:(id)a4
{
}

- (void)triggerRegistrationForDiskImageContentForOptions:(id)a3 withCompletion:(id)a4
{
}

- (void)createSerializedPlaceholderForInstalledAppWithBundeID:(id)a3 personaUniqueString:(id)a4 atResultURL:(id)a5 onDevice:(int)a6 withCompletion:(id)a7
{
  uint64_t v8 = *(void *)&a6;
  id v12 = a3;
  id v30 = a4;
  id v13 = a5;
  unsigned int v14 = (void (**)(id, id))a7;
  sub_100016830(self, @"CreateSerializedPlaceholder");
  id v15 = (id)objc_claimAutoreleasedReturnValue();
  if (v15)
  {
    uint64_t v16 = 0;
LABEL_22:
    v14[2](v14, v15);
    goto LABEL_23;
  }
  objc_opt_class();
  id v17 = v12;
  if (objc_opt_isKindOfClass()) {
    id v18 = v17;
  }
  else {
    id v18 = 0;
  }

  if (!v18)
  {
    uint64_t v22 = @"Bundle ID parameter was not a string or was set to nil";
    uint64_t v23 = 3263;
LABEL_15:
    uint64_t v16 = 0;
    sub_100014A08((uint64_t)"-[MIClientConnection createSerializedPlaceholderForInstalledAppWithBundeID:personaUniqueString:atResultURL:onDevice:withCompletion:]", v23, MIInstallerErrorDomain, 25, 0, 0, v22, v19, v28);
    id v15 = (id)objc_claimAutoreleasedReturnValue();
    goto LABEL_22;
  }
  objc_opt_class();
  id v20 = v13;
  if (objc_opt_isKindOfClass()) {
    id v21 = v20;
  }
  else {
    id v21 = 0;
  }

  if (!v21)
  {
    uint64_t v22 = @"Resultant IPA URL parameter was not a URL or was set to nil";
    uint64_t v23 = 3268;
    goto LABEL_15;
  }
  if (v30)
  {
    uint64_t v16 = 0;
  }
  else
  {
    uint64_t v24 = +[MIGlobalConfiguration sharedInstance];
    uint64_t v29 = [v24 primaryPersonaString];

    uint64_t v16 = (void *)v29;
  }
  sub_100054F80(v17);
  uint64_t v25 = [(MIClientConnection *)self xpcConnection];
  uint64_t v26 = v25;
  if (v25) {
    [v25 auditToken];
  }
  else {
    memset(v32, 0, sizeof(v32));
  }
  id v31 = 0;
  unsigned __int8 v27 = +[MIPlaceholderSerializer serializedPlaceholderForInstalledAppWithBundeID:v17 personaUniqueString:v16 atResultURL:v20 onDevice:v8 onBehalfOf:v32 withError:&v31];
  id v15 = v31;

  sub_1000550D8(v12);
  if ((v27 & 1) == 0) {
    goto LABEL_22;
  }
  v14[2](v14, 0);
LABEL_23:
}

- (void)setLaunchWarningForApp:(id)a3 withUniqueInstallIdentifier:(id)a4 warningData:(id)a5 completion:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = (void (**)(id, void))a6;
  sub_100016830(self, @"SetLaunchWarning");
  id v15 = (id)objc_claimAutoreleasedReturnValue();
  if (v15)
  {
    char v16 = 0;
    id v17 = 0;
    unsigned int v18 = 0;
    goto LABEL_9;
  }
  if (!v10 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
  {
    char v16 = 0;
    sub_100014A08((uint64_t)"-[MIClientConnection setLaunchWarningForApp:withUniqueInstallIdentifier:warningData:completion:]", 3325, MIInstallerErrorDomain, 25, 0, 0, @"App identity was nil or the wrong type for request to set launch warning", v14, v32);
    id v15 = (id)objc_claimAutoreleasedReturnValue();
    id v17 = 0;
LABEL_8:
    unsigned int v18 = 0;
    goto LABEL_9;
  }
  id v17 = [v10 bundleID];
  objc_opt_class();
  id v19 = v11;
  if (objc_opt_isKindOfClass()) {
    id v20 = v19;
  }
  else {
    id v20 = 0;
  }

  if (!v20)
  {
    uint64_t v24 = @"Unique install identifier was nil or the wrong type for request to set launch warning for %@";
    uint64_t v25 = 3332;
LABEL_34:
    char v16 = 0;
    sub_100014A08((uint64_t)"-[MIClientConnection setLaunchWarningForApp:withUniqueInstallIdentifier:warningData:completion:]", v25, MIInstallerErrorDomain, 25, 0, 0, v24, v21, (uint64_t)v10);
    id v15 = (id)objc_claimAutoreleasedReturnValue();
    goto LABEL_8;
  }
  if (!v12)
  {
    if (!qword_1000A60B8 || *(int *)(qword_1000A60B8 + 44) >= 5) {
      goto LABEL_26;
    }
    goto LABEL_27;
  }
  objc_opt_class();
  id v22 = v12;
  if (objc_opt_isKindOfClass()) {
    id v23 = v22;
  }
  else {
    id v23 = 0;
  }

  if (!v23)
  {
    uint64_t v24 = @"Warning data was of the wrong type for request to set launch warning for %@";
    uint64_t v25 = 3337;
    goto LABEL_34;
  }
  if (!qword_1000A60B8 || *(int *)(qword_1000A60B8 + 44) > 4) {
LABEL_26:
  }
    MOLogWrite();
LABEL_27:
  sub_100054F88(v17);
  id v39 = 0;
  char v16 = 1;
  id v36 = +[MIBundleContainer appBundleContainerWithIdentifier:v17 createIfNeeded:0 created:0 error:&v39];
  id v26 = v39;
  if (v36)
  {
    unsigned __int8 v27 = [v36 bundle];
    id v35 = v27;
    if (v27)
    {
      id v38 = v26;
      uint64_t v34 = [v27 installationIdentitySettingIfNotSet:0 withError:&v38];
      id v29 = v38;

      if (v34)
      {
        uint64_t v33 = [v34 uniqueInstallID];
        if ([v19 isEqualToData:v33])
        {
          id v37 = v29;
          unsigned int v18 = [v35 setLaunchWarningData:v12 withError:&v37];
          id v15 = v37;
        }
        else
        {
          sub_100014A08((uint64_t)"-[MIClientConnection setLaunchWarningForApp:withUniqueInstallIdentifier:warningData:completion:]", 3371, MIInstallerErrorDomain, 200, 0, 0, @"Installed app with identity %@ does not have supplied unique install identifier %@ (found %@)", v31, (uint64_t)v10);
          id v15 = (id)objc_claimAutoreleasedReturnValue();
          unsigned int v18 = 0;
        }

        id v29 = v34;
      }
      else
      {
        sub_100014A08((uint64_t)"-[MIClientConnection setLaunchWarningForApp:withUniqueInstallIdentifier:warningData:completion:]", 3364, MIInstallerErrorDomain, 200, v29, 0, @"Failed to get installation identity for %@", v30, (uint64_t)v10);
        id v15 = (id)objc_claimAutoreleasedReturnValue();
        unsigned int v18 = 0;
      }

      id v26 = v35;
    }
    else
    {
      sub_100014A08((uint64_t)"-[MIClientConnection setLaunchWarningForApp:withUniqueInstallIdentifier:warningData:completion:]", 3357, MIInstallerErrorDomain, 4, 0, 0, @"Failed to locate app bundle in container for %@", v28, (uint64_t)v10);
      id v15 = (id)objc_claimAutoreleasedReturnValue();
      unsigned int v18 = 0;
    }
  }
  else
  {
    unsigned int v18 = 0;
    id v15 = v26;
  }
LABEL_9:
  if (v16) {
    sub_1000550D8(v17);
  }
  if (v18) {
    v13[2](v13, 0);
  }
  else {
    ((void (**)(id, id))v13)[2](v13, v15);
  }
}

- (NSXPCConnection)xpcConnection
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_xpcConnection);

  return (NSXPCConnection *)WeakRetained;
}

- (void)setXpcConnection:(id)a3
{
}

- (unsigned)percentComplete
{
  return self->_percentComplete;
}

- (void).cxx_destruct
{
}

@end