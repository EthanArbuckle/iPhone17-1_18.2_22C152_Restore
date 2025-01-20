@interface PeerState
+ (id)fetchRequest;
- (BOOL)isFailureIgnoredForDate:(id)a3;
- (BOOL)isFailureResolvedAndSeenByDate:(id)a3;
- (BOOL)setCompletedVerification:(id)a3;
- (BOOL)setUnsigned:(SEL)a3 value:(unint64_t)a4;
- (BOOL)updateResultWithStaticKey:(id)a3 staticKeyStore:(id)a4 forDate:(id)a5;
- (TransparencyManagedDataStore)dataStore;
- (id)verificationWithinTTLOfDate:(id)a3;
- (id)verifierResultWithStaticKeyStore:(id)a3;
- (unint64_t)bestVerificationResultToUIStatusForDate:(id)a3;
- (unint64_t)getUIStatusForDate:(id)a3;
- (unint64_t)getUnsigned:(SEL)a3;
- (void)setDataStore:(id)a3;
@end

@implementation PeerState

- (BOOL)setCompletedVerification:(id)a3
{
  id v4 = a3;
  if ([v4 verificationResult] == (id)1)
  {
    uint64_t v5 = [(PeerState *)self mostRecentSuccess];
    if (!v5) {
      goto LABEL_4;
    }
    v6 = (void *)v5;
    v7 = [(PeerState *)self mostRecentSuccess];
    v8 = [v7 idsResponseTime];
    v9 = [v4 idsResponseTime];
    id v10 = [v8 compare:v9];

    if (v10 == (id)-1)
    {
LABEL_4:
      [(PeerState *)self setMostRecentSuccess:v4];
LABEL_11:
      BOOL v11 = 1;
      goto LABEL_12;
    }
  }
  else
  {
    if ([v4 verificationResult])
    {
      BOOL v11 = 0;
      goto LABEL_15;
    }
    uint64_t v12 = [(PeerState *)self failure];
    if (!v12) {
      goto LABEL_10;
    }
    v13 = (void *)v12;
    v14 = [(PeerState *)self failure];
    v15 = [v14 idsResponseTime];
    v16 = [v4 idsResponseTime];
    id v17 = [v15 compare:v16];

    if (v17 == (id)-1)
    {
LABEL_10:
      [(PeerState *)self setFailure:v4];
      [(PeerState *)self setSeenDate:0];
      goto LABEL_11;
    }
  }
  BOOL v11 = 0;
LABEL_12:
  uint64_t v18 = [(PeerState *)self mostRecentCompleted];
  if (!v18) {
    goto LABEL_14;
  }
  v19 = (void *)v18;
  v20 = [(PeerState *)self mostRecentCompleted];
  v21 = [v20 idsResponseTime];
  v22 = [v4 idsResponseTime];
  id v23 = [v21 compare:v22];

  if (v23 == (id)-1)
  {
LABEL_14:
    [(PeerState *)self setMostRecentCompleted:v4];
    BOOL v11 = 1;
  }
LABEL_15:

  return v11;
}

- (TransparencyManagedDataStore)dataStore
{
  return (TransparencyManagedDataStore *)objc_getAssociatedObject(self, @"dataStore");
}

- (void)setDataStore:(id)a3
{
}

- (unint64_t)bestVerificationResultToUIStatusForDate:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [(PeerState *)self verificationWithinTTLOfDate:v4];
  v6 = v5;
  if (v5)
  {
    id v7 = [v5 getUnsigned:"verificationResult"];
    if (v7 == (id)3)
    {
      unint64_t v8 = 8;
      goto LABEL_23;
    }
    if (v7 != (id)2)
    {
      if (v7)
      {
        unint64_t v8 = 4;
      }
      else if ([(PeerState *)self isFailureIgnoredForDate:v4])
      {
        unint64_t v8 = 8;
      }
      else
      {
        unint64_t v8 = 6;
      }
      goto LABEL_23;
    }
    if (qword_1003266C0 != -1) {
      dispatch_once(&qword_1003266C0, &stru_1002B7848);
    }
    uint64_t v12 = (void *)qword_1003266C8;
    if (os_log_type_enabled((os_log_t)qword_1003266C8, OS_LOG_TYPE_DEFAULT))
    {
      v13 = v12;
      v14 = [(PeerState *)self uri];
      v15 = [v6 verificationId];
      int v30 = 138412546;
      v31 = v14;
      __int16 v32 = 2114;
      v33 = v15;
      _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_DEFAULT, "PeerStateCalculator: %{mash.hash}@ most recent verification %{public}@ pending", (uint8_t *)&v30, 0x16u);
    }
    v16 = [v6 creationTime];
    [v16 timeIntervalSinceDate:v4];
    double v18 = v17;
    +[TransparencySettings queryJustMadeTimeout];
    double v20 = -v19;

    if (v18 > v20)
    {
      +[TransparencySettings queryJustMadeTimeout];
      double v22 = v21;
      id v23 = [v6 creationTime];
      [v23 timeIntervalSinceDate:v4];
      double v25 = v22 + v24;

      v26 = [(PeerState *)self dataStore];
      v27 = [(PeerState *)self uri];
      v28 = [(PeerState *)self application];
      [v26 recalculateVerifierResultForPeer:v27 application:v28 after:v25];

      unint64_t v8 = 3;
      goto LABEL_23;
    }
  }
  else
  {
    if (qword_1003266C0 != -1) {
      dispatch_once(&qword_1003266C0, &stru_1002B7828);
    }
    v9 = (void *)qword_1003266C8;
    if (os_log_type_enabled((os_log_t)qword_1003266C8, OS_LOG_TYPE_DEFAULT))
    {
      id v10 = v9;
      BOOL v11 = [(PeerState *)self uri];
      int v30 = 138412290;
      v31 = v11;
      _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "PeerStateCalculator: %{mash.hash}@ no verification within 7 days", (uint8_t *)&v30, 0xCu);
    }
  }
  if ([(PeerState *)self isFailureIgnoredForDate:v4]) {
    unint64_t v8 = 12;
  }
  else {
    unint64_t v8 = 0;
  }
LABEL_23:

  return v8;
}

- (unint64_t)getUIStatusForDate:(id)a3
{
  id v4 = a3;
  if ([(PeerState *)self everCompletedVerification])
  {
    if ([(PeerState *)self optedIn])
    {
      uint64_t v5 = [(PeerState *)self failure];

      if (!v5)
      {
LABEL_14:
        unint64_t v16 = [(PeerState *)self bestVerificationResultToUIStatusForDate:v4];
        goto LABEL_36;
      }
      v6 = [(PeerState *)self failure];
      id v7 = [v6 verificationResult];

      if (v7)
      {
        if (qword_1003266C0 != -1) {
          dispatch_once(&qword_1003266C0, &stru_1002B7888);
        }
        unint64_t v8 = (void *)qword_1003266C8;
        if (os_log_type_enabled((os_log_t)qword_1003266C8, OS_LOG_TYPE_ERROR))
        {
          v9 = v8;
          id v10 = [(PeerState *)self application];
          BOOL v11 = [(PeerState *)self uri];
          uint64_t v12 = [(PeerState *)self failure];
          int v28 = 138413058;
          v29 = v10;
          __int16 v30 = 2112;
          v31 = v11;
          __int16 v32 = 2048;
          id v33 = [v12 verificationResult];
          __int16 v34 = 2048;
          uint64_t v35 = 0;
          _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_ERROR, "There is a failed verification saved for peer (%@, %@) with verification result %lld. We only expect this value to be %lu. This may lead to issues later.", (uint8_t *)&v28, 0x2Au);
        }
      }
      if ([(PeerState *)self isFailureResolvedAndSeenByDate:v4])
      {
        if (qword_1003266C0 != -1) {
          dispatch_once(&qword_1003266C0, &stru_1002B78A8);
        }
        v13 = (void *)qword_1003266C8;
        if (os_log_type_enabled((os_log_t)qword_1003266C8, OS_LOG_TYPE_INFO))
        {
          v14 = v13;
          v15 = [(PeerState *)self failure];
          int v28 = 138412290;
          v29 = v15;
          _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_INFO, "getUIStatusForDate failure is resolved and seen (%@)", (uint8_t *)&v28, 0xCu);
        }
        goto LABEL_14;
      }
      if ([(PeerState *)self isFailureIgnoredForDate:v4])
      {
        if (qword_1003266C0 != -1) {
          dispatch_once(&qword_1003266C0, &stru_1002B78C8);
        }
        double v21 = (void *)qword_1003266C8;
        if (os_log_type_enabled((os_log_t)qword_1003266C8, OS_LOG_TYPE_INFO))
        {
          double v22 = v21;
          id v23 = [(PeerState *)self failure];
          int v28 = 138412290;
          v29 = v23;
          _os_log_impl((void *)&_mh_execute_header, v22, OS_LOG_TYPE_INFO, "getUIStatusForDate failure is ignored (%@)", (uint8_t *)&v28, 0xCu);
        }
        unint64_t v16 = 8;
      }
      else
      {
        if (qword_1003266C0 != -1) {
          dispatch_once(&qword_1003266C0, &stru_1002B78E8);
        }
        double v24 = (void *)qword_1003266C8;
        if (os_log_type_enabled((os_log_t)qword_1003266C8, OS_LOG_TYPE_INFO))
        {
          double v25 = v24;
          v26 = [(PeerState *)self failure];
          int v28 = 138412290;
          v29 = v26;
          _os_log_impl((void *)&_mh_execute_header, v25, OS_LOG_TYPE_INFO, "getUIStatusForDate PeerState failure (%@)", (uint8_t *)&v28, 0xCu);
        }
        unint64_t v16 = 6;
      }
    }
    else if ([(PeerState *)self everOptedIn])
    {
      if ([(PeerState *)self turnedOffIgnored]) {
        unint64_t v16 = 11;
      }
      else {
        unint64_t v16 = 10;
      }
    }
    else
    {
      unint64_t v16 = 2;
    }
  }
  else
  {
    if (qword_1003266C0 != -1) {
      dispatch_once(&qword_1003266C0, &stru_1002B7868);
    }
    double v17 = (void *)qword_1003266C8;
    if (os_log_type_enabled((os_log_t)qword_1003266C8, OS_LOG_TYPE_DEFAULT))
    {
      double v18 = v17;
      double v19 = [(PeerState *)self uri];
      unint64_t v16 = 3;
      double v20 = KTUIStatusGetString();
      int v28 = 138412546;
      v29 = v19;
      __int16 v30 = 2114;
      v31 = v20;
      _os_log_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_DEFAULT, "PeerStateCalculator: %{mash.hash}@ -> %{public}@ never completed verification", (uint8_t *)&v28, 0x16u);
    }
    else
    {
      unint64_t v16 = 3;
    }
  }
LABEL_36:

  return v16;
}

- (id)verificationWithinTTLOfDate:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [(PeerState *)self mostRecentSuccess];

  if (!v5) {
    goto LABEL_3;
  }
  v6 = [(PeerState *)self mostRecentSuccess];
  id v7 = [v6 creationTime];
  [v4 timeIntervalSinceDate:v7];
  double v9 = v8;

  +[TransparencySettings queryCacheHardTimeout];
  if (v9 < v10)
  {
    uint64_t v18 = [(PeerState *)self mostRecentSuccess];
  }
  else
  {
LABEL_3:
    BOOL v11 = [(PeerState *)self mostRecentVerification];

    if (!v11) {
      goto LABEL_5;
    }
    uint64_t v12 = [(PeerState *)self mostRecentVerification];
    v13 = [v12 creationTime];
    [v4 timeIntervalSinceDate:v13];
    double v15 = v14;

    +[TransparencySettings queryCacheHardTimeout];
    if (v15 >= v16)
    {
LABEL_5:
      double v17 = 0;
      goto LABEL_9;
    }
    uint64_t v18 = [(PeerState *)self mostRecentVerification];
  }
  double v17 = (void *)v18;
LABEL_9:

  return v17;
}

- (BOOL)isFailureResolvedAndSeenByDate:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [(PeerState *)self failure];

  if (!v5)
  {
    BOOL v12 = 1;
    goto LABEL_30;
  }
  v6 = [(PeerState *)self mostRecentVerification];

  if (v6)
  {
    id v7 = [(PeerState *)self failure];
    double v8 = [v7 creationTime];
    double v9 = [(PeerState *)self mostRecentVerification];
    double v10 = [v9 creationTime];
    id v11 = [v8 compare:v10];

    if (v11 == (id)-1)
    {
      v13 = [(PeerState *)self failure];
      double v14 = [v13 creationTime];
      double v15 = [v14 kt_toISO_8601_UTCString];

      if ((+[TransparencyAnalytics hasInternalDiagnostics] & 1) == 0)
      {
        double v16 = [(PeerState *)self failure];
        double v17 = [v16 creationTime];
        uint64_t v18 = [v17 kt_fuzzyDate];
        uint64_t v19 = [v18 kt_toISO_8601_UTCString];

        double v15 = (void *)v19;
      }
      double v20 = [(PeerState *)self ignoredFailureExpiry];

      if (v20)
      {
        if (qword_1003266C0 != -1) {
          dispatch_once(&qword_1003266C0, &stru_1002B7908);
        }
        double v21 = (void *)qword_1003266C8;
        if (!os_log_type_enabled((os_log_t)qword_1003266C8, OS_LOG_TYPE_DEFAULT)) {
          goto LABEL_28;
        }
        double v22 = v21;
        id v23 = [(PeerState *)self uri];
        double v24 = [(PeerState *)self failure];
        double v25 = [v24 verificationId];
        int v48 = 138412802;
        v49 = v23;
        __int16 v50 = 2114;
        v51 = v25;
        __int16 v52 = 2114;
        v53 = v15;
        v26 = "PeerStateCalculator: %{mash.hash}@ resolved failure %{public}@ (%{public}@) ignored";
        goto LABEL_13;
      }
      if ([(PeerState *)self optedIn])
      {
        v27 = [(PeerState *)self failure];
        if ([v27 optedIn])
        {
        }
        else
        {
          int v28 = [(PeerState *)self mostRecentVerification];
          id v29 = [v28 verificationResult];

          if (v29 == (id)1)
          {
            if (qword_1003266C0 != -1) {
              dispatch_once(&qword_1003266C0, &stru_1002B7928);
            }
            __int16 v30 = (void *)qword_1003266C8;
            if (!os_log_type_enabled((os_log_t)qword_1003266C8, OS_LOG_TYPE_DEFAULT)) {
              goto LABEL_28;
            }
            double v22 = v30;
            id v23 = [(PeerState *)self uri];
            double v24 = [(PeerState *)self failure];
            double v25 = [v24 verificationId];
            int v48 = 138412802;
            v49 = v23;
            __int16 v50 = 2114;
            v51 = v25;
            __int16 v52 = 2114;
            v53 = v15;
            v26 = "PeerStateCaculated: %{mash.hash}@ resolved failure %{public}@ from before opt-in (%{public}@)";
LABEL_13:
            _os_log_impl((void *)&_mh_execute_header, v22, OS_LOG_TYPE_DEFAULT, v26, (uint8_t *)&v48, 0x20u);

LABEL_28:
            BOOL v12 = 1;
LABEL_29:

            goto LABEL_30;
          }
        }
      }
      v31 = [(PeerState *)self seenDate];

      if (v31)
      {
        __int16 v32 = [(PeerState *)self seenDate];
        [v4 timeIntervalSinceDate:v32];
        double v34 = v33;

        +[TransparencySettings dismissFailureAfterSeenPeriod];
        if (v34 >= v35) {
          goto LABEL_28;
        }
        if (qword_1003266C0 != -1) {
          dispatch_once(&qword_1003266C0, &stru_1002B7968);
        }
        v36 = (void *)qword_1003266C8;
        BOOL v12 = 0;
        if (!os_log_type_enabled((os_log_t)qword_1003266C8, OS_LOG_TYPE_DEFAULT)) {
          goto LABEL_29;
        }
        v37 = v36;
        v38 = [(PeerState *)self uri];
        v39 = [(PeerState *)self failure];
        v40 = [v39 verificationId];
        v41 = [(PeerState *)self seenDate];
        v42 = [v41 kt_toISO_8601_UTCString];
        int v48 = 138413058;
        v49 = v38;
        __int16 v50 = 2114;
        v51 = v40;
        __int16 v52 = 2114;
        v53 = v15;
        __int16 v54 = 2112;
        v55 = v42;
        _os_log_impl((void *)&_mh_execute_header, v37, OS_LOG_TYPE_DEFAULT, "PeerStateCalculator: %{mash.hash}@ resolved failure %{public}@ (%{public}@) not seen for 1h (%@)", (uint8_t *)&v48, 0x2Au);
      }
      else
      {
        if (qword_1003266C0 != -1) {
          dispatch_once(&qword_1003266C0, &stru_1002B7948);
        }
        v44 = (void *)qword_1003266C8;
        BOOL v12 = 0;
        if (!os_log_type_enabled((os_log_t)qword_1003266C8, OS_LOG_TYPE_DEFAULT)) {
          goto LABEL_29;
        }
        v37 = v44;
        v45 = [(PeerState *)self uri];
        v46 = [(PeerState *)self failure];
        v47 = [v46 verificationId];
        int v48 = 138412802;
        v49 = v45;
        __int16 v50 = 2114;
        v51 = v47;
        __int16 v52 = 2114;
        v53 = v15;
        _os_log_impl((void *)&_mh_execute_header, v37, OS_LOG_TYPE_DEFAULT, "PeerStateCalculator: %{mash.hash}@ resolved failure %{public}@ (%{public}@) never seen", (uint8_t *)&v48, 0x20u);
      }
      BOOL v12 = 0;
      goto LABEL_29;
    }
  }
  BOOL v12 = 0;
LABEL_30:

  return v12;
}

- (BOOL)isFailureIgnoredForDate:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [(PeerState *)self ignoredFailureExpiry];

  if (v5)
  {
    v6 = [(PeerState *)self ignoredFailureExpiry];
    [v6 timeIntervalSinceDate:v4];
    double v8 = v7;

    if (v8 <= 0.0)
    {
      if (qword_1003266C0 != -1) {
        dispatch_once(&qword_1003266C0, &stru_1002B7988);
      }
      double v9 = (void *)qword_1003266C8;
      if (os_log_type_enabled((os_log_t)qword_1003266C8, OS_LOG_TYPE_DEFAULT))
      {
        double v10 = v9;
        id v11 = [(PeerState *)self uri];
        int v14 = 138412290;
        double v15 = v11;
        _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "PeerStateCalculator: %{mash.hash}@ failure ignore expired", (uint8_t *)&v14, 0xCu);
      }
    }
    BOOL v12 = v8 > 0.0;
  }
  else
  {
    BOOL v12 = 0;
  }

  return v12;
}

- (BOOL)updateResultWithStaticKey:(id)a3 staticKeyStore:(id)a4 forDate:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  id v11 = [v8 publicID];

  if (!v11)
  {
    if (qword_1003266C0 != -1) {
      dispatch_once(&qword_1003266C0, &stru_1002B79A8);
    }
    double v21 = (void *)qword_1003266C8;
    if (os_log_type_enabled((os_log_t)qword_1003266C8, OS_LOG_TYPE_ERROR))
    {
      double v22 = v21;
      id v23 = [v8 uri];
      *(_DWORD *)buf = 141558274;
      uint64_t v35 = 1752392040;
      __int16 v36 = 2112;
      v37 = v23;
      _os_log_impl((void *)&_mh_execute_header, v22, OS_LOG_TYPE_ERROR, "veriferResultForPeer static key: no public id for %{mask.hash}@", buf, 0x16u);
    }
    goto LABEL_26;
  }
  if (!v9)
  {
    if (qword_1003266C0 != -1) {
      dispatch_once(&qword_1003266C0, &stru_1002B79C8);
    }
    double v24 = qword_1003266C8;
    if (os_log_type_enabled((os_log_t)qword_1003266C8, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v24, OS_LOG_TYPE_ERROR, "veriferResultForPeer static key: no static key store", buf, 2u);
    }
LABEL_26:
    BOOL v25 = 0;
    goto LABEL_34;
  }
  id v12 = [v8 succeed];
  id v31 = [v8 staticAccountKeyStatus];
  v13 = [v8 publicID];
  int v14 = [v13 publicKeyInfo];

  double v15 = [v8 uri];
  double v16 = [v8 application];
  id v33 = 0;
  unint64_t v17 = +[KTContext validateStaticKeyForPeer:v15 accountKey:v14 application:v16 staticKeyStore:v9 error:&v33];
  id v18 = v33;
  [v8 setStaticAccountKeyStatus:v17];

  if (v18)
  {
    if (qword_1003266C0 != -1) {
      dispatch_once(&qword_1003266C0, &stru_1002B79E8);
    }
    uint64_t v19 = qword_1003266C8;
    if (os_log_type_enabled((os_log_t)qword_1003266C8, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      uint64_t v35 = (uint64_t)v18;
      _os_log_impl((void *)&_mh_execute_header, v19, OS_LOG_TYPE_ERROR, "veriferResultForPeer static key failed: %@", buf, 0xCu);
    }
    double v20 = [v8 failure];

    if (!v20) {
      [v8 setFailure:v18];
    }
  }
  if (([(PeerState *)self everOptedIn] & 1) != 0
    || [v8 staticAccountKeyStatus] != (id)2 && objc_msgSend(v8, "staticAccountKeyStatus"))
  {
    if (v12 == (id)2 && ![v8 staticAccountKeyStatus])
    {
      v26 = [v8 loggableDatas];
      id v32 = 0;
      unsigned __int8 v27 = +[KTContextVerifier verifyLoggableDataSignatures:v26 accountKey:v14 error:&v32];
      id v28 = v32;

      if ((v27 & 1) == 0)
      {
        [v8 setStaticAccountKeyStatus:4];
        id v29 = [v8 failure];

        if (!v29) {
          [v8 setFailure:v28];
        }
      }
    }
    else if (![v8 staticAccountKeyStatus] && v31 == (id)4)
    {
      [v8 setStaticAccountKeyStatus:4];
    }
    [v8 updateWithStaticKeyEnforced:[v8 staticAccountKeyStatus] isFailureIgnoredForDate:-[PeerState isFailureIgnoredForDate:](self, "isFailureIgnoredForDate:", v10)];
    BOOL v25 = 0;
  }
  else
  {
    BOOL v25 = 1;
    [(PeerState *)self setEverOptedIn:1];
    [v8 setEverOptedIn:1];
  }

LABEL_34:
  return v25;
}

- (id)verifierResultWithStaticKeyStore:(id)a3
{
  id v4 = a3;
  id v5 = objc_alloc((Class)KTVerifierResult);
  v6 = [(PeerState *)self uri];
  double v7 = [(PeerState *)self application];
  id v8 = [v5 initWithUri:v6 application:v7];

  [v8 setOptedIn:-[PeerState optedIn](self, "optedIn")];
  [v8 setEverOptedIn:-[PeerState everOptedIn](self, "everOptedIn")];
  id v9 = [(PeerState *)self mostRecentVerification];
  id v10 = v9;
  if (v9)
  {
    [v8 setSucceed:[v9 getUnsigned:verificationResult]];
    id v11 = [v10 accountKey];
    id v12 = +[KTAccountPublicID ktAccountPublicIDWithPublicKeyInfo:v11 error:0];
    [v8 setPublicID:v12];

    v13 = [v10 serverLoggableDatas];
    int v14 = [v13 loggableDatas];
    [v8 setLoggableDatas:v14];

    double v15 = [v10 failure];
    [v8 setFailure:v15];

    [v8 setStaticAccountKeyStatus:[v10 getUnsigned:staticKeyStatus]];
  }
  else
  {
    [v8 setSucceed:2];
  }
  double v16 = +[NSDate now];
  [v8 setUiStatus:-[PeerState getUIStatusForDate:](self, "getUIStatusForDate:", v16)];
  if (qword_1003266C0 != -1) {
    dispatch_once(&qword_1003266C0, &stru_1002B7A08);
  }
  unint64_t v17 = (void *)qword_1003266C8;
  if (os_log_type_enabled((os_log_t)qword_1003266C8, OS_LOG_TYPE_INFO))
  {
    id v18 = v17;
    [v8 uiStatus];
    uint64_t v19 = KTUIStatusGetString();
    int v22 = 138412290;
    id v23 = v19;
    _os_log_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_INFO, "verifierResultWithStaticKeyStore setting UI status to %@", (uint8_t *)&v22, 0xCu);
  }
  if ([(PeerState *)self updateResultWithStaticKey:v8 staticKeyStore:v4 forDate:v16])
  {
    uint64_t v20 = [(PeerState *)self verifierResultWithStaticKeyStore:v4];

    id v8 = (id)v20;
  }

  return v8;
}

- (BOOL)setUnsigned:(SEL)a3 value:(unint64_t)a4
{
  return 1;
}

- (unint64_t)getUnsigned:(SEL)a3
{
  return sub_1002131E4(self, a3);
}

+ (id)fetchRequest
{
  return +[NSFetchRequest fetchRequestWithEntityName:@"PeerState"];
}

@end