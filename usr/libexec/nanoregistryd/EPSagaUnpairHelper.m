@interface EPSagaUnpairHelper
- (BOOL)shouldFilePairingReport;
- (BOOL)startUnpairDueToError:(id)a3;
- (BOOL)unpairing;
- (EPSagaUnpairHelperDelegate)delegate;
- (NRPairingReport)pairingReport;
- (id)registry;
- (id)routingSlipEntry;
- (id)serviceRegistry;
- (void)addToOrCapOffRTCPairingMetric:(unsigned int)a3;
- (void)filePairingReportWithPairingID:(id)a3;
- (void)savePairingReport;
- (void)setDelegate:(id)a3;
- (void)setShouldFilePairingReport:(BOOL)a3;
@end

@implementation EPSagaUnpairHelper

- (id)routingSlipEntry
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  v3 = [WeakRetained routingSlipEntry];

  return v3;
}

- (id)serviceRegistry
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  v3 = [WeakRetained serviceRegistry];

  return v3;
}

- (id)registry
{
  v2 = [(EPSagaUnpairHelper *)self serviceRegistry];
  v3 = [v2 serviceFromClass:objc_opt_class()];

  return v3;
}

- (BOOL)startUnpairDueToError:(id)a3
{
  id v4 = a3;
  v5 = nr_daemon_log();
  BOOL v6 = os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT);

  if (v6)
  {
    v7 = nr_daemon_log();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      v8 = [(EPSagaUnpairHelper *)self routingSlipEntry];
      v9 = [v8 name];
      *(_DWORD *)buf = 138412546;
      v43 = v9;
      __int16 v44 = 2112;
      id v45 = v4;
      _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "routingSlipEntry:%@ cancelWithError: %@", buf, 0x16u);
    }
  }
  BOOL unpairing = self->_unpairing;
  if (!self->_unpairing)
  {
    self->_BOOL unpairing = 1;
    v14 = [(EPSagaUnpairHelper *)self routingSlipEntry];
    id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
    v16 = [WeakRetained routingSlipEntryPairingIDKey];
    v17 = [v14 objectForKeyedSubscript:v16];

    id v18 = objc_loadWeakRetained((id *)&self->_delegate);
    LOBYTE(WeakRetained) = objc_opt_respondsToSelector();

    if (WeakRetained)
    {
      id v19 = objc_loadWeakRetained((id *)&self->_delegate);
      v20 = [v19 routingSlipEntryPairingStartedIDKey];

      uint64_t v21 = [(EPSagaUnpairHelper *)self routingSlipEntry];
      v22 = [(id)v21 objectForKeyedSubscript:v20];

      LOBYTE(v21) = [v22 BOOLValue];
      char v23 = v21 ^ 1;
      if (!v4) {
        goto LABEL_13;
      }
    }
    else
    {
      char v23 = 0;
      if (!v4)
      {
LABEL_13:
        nrGetPairingError();
        id v4 = (id)objc_claimAutoreleasedReturnValue();
      }
    }
    v24 = [(EPSagaUnpairHelper *)self pairingReport];
    unsigned __int8 v25 = [v24 isErrorSet];

    if ((v25 & 1) == 0)
    {
      v26 = [(EPSagaUnpairHelper *)self pairingReport];
      [v26 setOriginalError:v4];
    }
    if (v17) {
      char v27 = v23;
    }
    else {
      char v27 = 1;
    }
    if ((v27 & 1) == 0)
    {
      v28 = [(EPSagaUnpairHelper *)self pairingReport];
      unsigned int v29 = [v28 isErrorSet];

      if (v29)
      {
        v30 = [(EPSagaUnpairHelper *)self routingSlipEntry];
        v31 = [v30 errors];
        v32 = [(EPSagaUnpairHelper *)self pairingReport];
        v33 = [v32 detailedError];
        [v31 addObject:v33];

        v34 = [(EPSagaUnpairHelper *)self pairingReport];
        -[EPSagaUnpairHelper addToOrCapOffRTCPairingMetric:](self, "addToOrCapOffRTCPairingMetric:", [v34 subreason]);

        [(EPSagaUnpairHelper *)self filePairingReportWithPairingID:v17];
      }
    }
    v35 = [(EPSagaUnpairHelper *)self pairingReport];
    v36 = +[NRQueue registryDaemonQueue];
    v39[0] = _NSConcreteStackBlock;
    v39[1] = 3221225472;
    v39[2] = sub_1000697B8;
    v39[3] = &unk_100165868;
    v39[4] = self;
    id v40 = v17;
    id v41 = v35;
    id v37 = v35;
    v13 = v17;
    [v36 dispatchAsync:v39];

    goto LABEL_23;
  }
  v11 = nr_daemon_log();
  BOOL v12 = os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT);

  if (v12)
  {
    v13 = nr_daemon_log();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_DEFAULT, "already unpairing", buf, 2u);
    }
LABEL_23:
  }
  return !unpairing;
}

- (void)addToOrCapOffRTCPairingMetric:(unsigned int)a3
{
  uint64_t v3 = *(void *)&a3;
  id v4 = +[NRRTCPairingReporter sharedInstance];
  [v4 addToOrCapOffRTCPairingMetric:v3];
}

- (NRPairingReport)pairingReport
{
  uint64_t v3 = [(EPSagaUnpairHelper *)self serviceRegistry];
  id v4 = [v3 optionalServiceFromClass:objc_opt_class()];

  if (!v4)
  {
    id v4 = objc_opt_new();
    v5 = [(EPSagaUnpairHelper *)self routingSlipEntry];
    BOOL v6 = [v5 objectForKeyedSubscript:@"extensiblePairingGizmoPairingVersion"];
    [v4 setGizmoMaxPairingVersion:[v6 integerValue]];

    v7 = [[EPSagaOperandPairingReport alloc] initWithPairingReport:v4];
    v8 = [(EPSagaUnpairHelper *)self routingSlipEntry];
    v9 = [v8 operands];
    [v9 setObject:v7 forKeyedSubscript:@"pairingReport"];

    v10 = [(EPSagaUnpairHelper *)self serviceRegistry];
    [v10 addService:v4];
  }
  v11 = [(EPSagaUnpairHelper *)self routingSlipEntry];
  BOOL v12 = [v11 objectForKeyedSubscript:@"pairingReport"];

  if (v12 != v4)
  {
    v13 = [[EPSagaOperandPairingReport alloc] initWithPairingReport:v4];
    v14 = [(EPSagaUnpairHelper *)self routingSlipEntry];
    v15 = [v14 operands];
    [v15 setObject:v13 forKeyedSubscript:@"pairingReport"];

    [(EPSagaUnpairHelper *)self savePairingReport];
  }

  return (NRPairingReport *)v4;
}

- (void)savePairingReport
{
  uint64_t v3 = [(EPSagaUnpairHelper *)self routingSlipEntry];
  id v5 = [v3 objectForKeyedSubscript:@"pairingReport"];

  if (v5)
  {
    id v4 = [(EPSagaUnpairHelper *)self routingSlipEntry];
    [v4 persist];
  }
}

- (void)filePairingReportWithPairingID:(id)a3
{
  id v4 = a3;
  id v5 = nr_daemon_log();
  BOOL v6 = os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT);

  if (v6)
  {
    v7 = nr_daemon_log();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      v8 = [(EPSagaUnpairHelper *)self routingSlipEntry];
      v9 = [v8 name];
      *(_DWORD *)buf = 138412290;
      v15 = v9;
      _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "Transaction: %@ file pairing report with pairing id called", buf, 0xCu);
    }
  }
  if (self->_shouldFilePairingReport)
  {
    v10 = [(EPSagaUnpairHelper *)self registry];
    v11[0] = _NSConcreteStackBlock;
    v11[1] = 3221225472;
    v11[2] = sub_100069C60;
    v11[3] = &unk_100167DC0;
    id v12 = v4;
    v13 = self;
    [v10 grabHistoryWithReadBlock:v11];
  }
}

- (BOOL)shouldFilePairingReport
{
  return self->_shouldFilePairingReport;
}

- (void)setShouldFilePairingReport:(BOOL)a3
{
  self->_shouldFilePairingReport = a3;
}

- (BOOL)unpairing
{
  return self->_unpairing;
}

- (EPSagaUnpairHelperDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (EPSagaUnpairHelperDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (void).cxx_destruct
{
}

@end