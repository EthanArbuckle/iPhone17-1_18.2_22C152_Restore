@interface NIServerNBAMMSSession
- (BOOL)_encryptAndUpdateAidingAndSignallingPayload;
- (BOOL)_encryptAndUpdateMutualAuthPayload;
- (BOOL)_isCryptoDisabled;
- (BOOL)_shouldEncodeSignallingDataInMessageID;
- (BOOL)_shouldSendMutualAuthMessage;
- (BOOL)_shouldUseFinderToken:(id)a3 findeeToken:(id)a4;
- (BOOL)_validateTokensAndRangingParameters;
- (BOOL)sessionRegistered;
- (NIServerNBAMMSSession)initWithQueue:(id)a3 identityString:(id)a4 stateUpdateHandler:(id)a5 mutualAuthHandler:(id)a6;
- (SessionClientsStatus)sessionClientsStatus;
- (id).cxx_construct;
- (id)_decrypt:(id)a3;
- (id)_encrypt:(id)a3;
- (id)_getState;
- (id)identityString;
- (id)printableState;
- (id)registerNBAMMSSessionWithToken:(id)a3 isFinder:(BOOL)a4 client:(id)a5 serviceRequest:(const void *)a6 startRangingOptions:(const void *)a7 sharedProtocol:(int)a8;
- (id)sessionClientForFinder:(BOOL)a3;
- (id)sessionTokenForFinder:(BOOL)a3;
- (int)sessionState;
- (int)sharedProtocol;
- (optional<rose::RoseServiceRequest>)sessionServiceRequestForFinder:(SEL)a3;
- (optional<rose::RoseStartRangingOptions>)sessionStartRangingOptionsForFinder:(SEL)a3;
- (shared_ptr<rose::objects::NBAMMSSession>)_buildNbammsSession:(const void *)a3;
- (unsigned)_encodeSignallingDataInMessageID:(unsigned __int8)a3;
- (vector<NMISessionRole,)attachedRoles;
- (void)_armMutualAuthTimerForFinder:(BOOL)a3;
- (void)_didReceiveInvalidation:(int)a3;
- (void)_didReceiveNewSolution:(const void *)a3;
- (void)_didReceivePeerData:(const void *)a3;
- (void)_didReceiveUnsuccessfulSolution:(const void *)a3;
- (void)_handleCryptoFailure;
- (void)_handleNonMutualAuthMessage;
- (void)_initializeEncryptionSessionIfNecessary;
- (void)_logStatisticsIfNecessary;
- (void)_processNonMutualAuthMessageForFinder:(BOOL)a3;
- (void)_processPeerMessage:(void *)a3 machAbsTimestamp:(double)a4 wasEncrypted:(BOOL)a5;
- (void)_processPeerMutualAuthState:(const MutualAuthState *)a3 peerIsFinder:(BOOL)a4;
- (void)_receivedAidingAndSignallingMessage:(const void *)a3 machAbsTimestamp:(double)a4;
- (void)_receivedCryptoSessionConfigMessage:(const void *)a3;
- (void)_receivedMutualAuthMessage:(const void *)a3;
- (void)_reportMutualAuthStates;
- (void)_resetCryptoStateIncludingFailures:(BOOL)a3;
- (void)_resetStatistics;
- (void)_serviceRequestStatusUpdate:(const ServiceRequestStatusUpdate *)a3;
- (void)_updateCryptoSessionConfigPayload;
- (void)_updateSessionPayload;
- (void)informMutualAuthFailuresToClients;
- (void)refreshRangingForToken:(id)a3;
- (void)setSharedProtocol:(int)a3;
- (void)unregisterNBAMMSSessionForToken:(id)a3;
- (void)updateAlgorithmAidingData:(const void *)a3 token:(id)a4;
- (void)updateSignallingData:(const void *)a3 token:(id)a4;
@end

@implementation NIServerNBAMMSSession

- (NIServerNBAMMSSession)initWithQueue:(id)a3 identityString:(id)a4 stateUpdateHandler:(id)a5 mutualAuthHandler:(id)a6
{
  id v11 = a3;
  id v12 = a4;
  id v13 = a5;
  id v14 = a6;
  v36.receiver = self;
  v36.super_class = (Class)NIServerNBAMMSSession;
  v15 = [(NIServerNBAMMSSession *)&v36 init];
  v16 = v15;
  v17 = v15;
  if (v15)
  {
    objc_storeStrong((id *)&v15->_internalQueue, a3);
    objc_storeStrong((id *)&v16->_identityString, a4);
    cntrl = (std::__shared_weak_count *)v17->_nbammsSession.__cntrl_;
    v17->_nbammsSession.__ptr_ = 0;
    v17->_nbammsSession.__cntrl_ = 0;
    if (cntrl) {
      sub_10001A970(cntrl);
    }
    v17->_sessionState = 0;
    sessionToken = v17->_sessionToken;
    v17->_sessionToken = 0;

    if (v17->_sessionStartRangingOptions.__engaged_) {
      v17->_sessionStartRangingOptions.__engaged_ = 0;
    }
    v17->_sharedProtocol = -1;
    v20 = sub_1002F6464();
    v22 = (Logger *)v20[20];
    uint64_t v21 = v20[21];
    if (v21) {
      atomic_fetch_add_explicit((atomic_ullong *volatile)(v21 + 8), 1uLL, memory_order_relaxed);
    }
    v23 = (std::__shared_weak_count *)v17->_pbLogger.__cntrl_;
    v17->_pbLogger.__ptr_ = v22;
    v17->_pbLogger.__cntrl_ = (__shared_weak_count *)v21;
    if (v23) {
      sub_10001A970(v23);
    }
    v17->_measurementsReceived = 0;
    selfEncryptionSession = v17->_selfEncryptionSession;
    v17->_selfEncryptionSession = 0;

    peerDecryptionSession = v17->_peerDecryptionSession;
    v17->_peerDecryptionSession = 0;

    if ([(NIServerNBAMMSSession *)v17 _isCryptoDisabled]) {
      char v26 = 3;
    }
    else {
      char v26 = 0;
    }
    v17->_cryptoSessionState = v26;
    v17->_cryptoFailures = 0;
    v17->_finderAttached = 0;
    objc_storeWeak((id *)&v16->_finderClient, 0);
    sub_100242058((uint64_t)&v16->_finderMutualAuthState);
    secondary_scheduling_delay_usec = (void *)v17->_finderStartRangingOptions.var0.__val_.secondary_scheduling_delay_usec;
    v17->_finderStartRangingOptions.var0.__val_.secondary_scheduling_delay_usec = 0;

    v17->_finderStartRangingOptions.var0.__val_.secondary_scheduling_interval_usec.var0.__null_state_ = 0;
    finderToken = v17->_finderToken;
    v17->_finderToken = 0;

    if (v17->_finderRoseServiceRequest.var0.__val_.range_enable_params.nbamms.mms_pkt_type.__engaged_) {
      v17->_finderRoseServiceRequest.var0.__val_.range_enable_params.nbamms.mms_pkt_type.__engaged_ = 0;
    }
    if (LOBYTE(v17->_finderStartRangingOptions.var0.__val_.scheduling_interval_usec)) {
      LOBYTE(v17->_finderStartRangingOptions.var0.__val_.scheduling_interval_usec) = 0;
    }
    if (v17->_finderStartRangingOptions.var0.__val_.dither_constant_msec.__engaged_) {
      v17->_finderStartRangingOptions.var0.__val_.dither_constant_msec.__engaged_ = 0;
    }
    if (BYTE2(v17->_finderStartRangingOptions.var0.__val_.secondary_scheduling_interval_usec.var0.__val_)) {
      BYTE2(v17->_finderStartRangingOptions.var0.__val_.secondary_scheduling_interval_usec.var0.__val_) = 0;
    }
    HIBYTE(v17->_finderStartRangingOptions.var0.__val_.secondary_scheduling_interval_usec.var0.__val_) = 0;
    objc_storeWeak((id *)&v16->_finderStartRangingOptions.var0.__val_.secondary_duty_cycle, 0);
    sub_100242058((uint64_t)&v16->_finderStartRangingOptions.__engaged_);
    double velocityChangeH2 = v17->_findeeAlgorithmAidingData.var0.__val_.measured_velocity_change.var0.__val_.velocityChangeH2;
    v17->_findeeAlgorithmAidingData.var0.__val_.measured_velocity_change.var0.__val_.double velocityChangeH2 = 0.0;

    v17->_findeeAlgorithmAidingData.var0.__val_.measured_velocity_change.__engaged_ = 0;
    outboundChallenge = v17->_findeeMutualAuthState.outboundChallenge;
    v17->_findeeMutualAuthState.outboundChallenge = 0;

    if (v17->_findeeRoseServiceRequest.var0.__val_.range_enable_params.fira.local_addr.__engaged_) {
      v17->_findeeRoseServiceRequest.var0.__val_.range_enable_params.fira.local_addr.__engaged_ = 0;
    }
    if (v17->_findeeStartRangingOptions.var0.__val_.peer.var0.__val_.uuid.var0.__val_.__elems_[12]) {
      v17->_findeeStartRangingOptions.var0.__val_.peer.var0.__val_.uuid.var0.__val_.__elems_[12] = 0;
    }
    if (v17->_findeeAlgorithmAidingData.var0.__val_.measured_velocity_change.var0.__null_state_) {
      v17->_findeeAlgorithmAidingData.var0.__val_.measured_velocity_change.var0.__null_state_ = 0;
    }
    if (BYTE1(v17->_findeeAlgorithmAidingData.var0.__val_.measured_velocity_change.var0.__val_.velocityChangeH1)) {
      BYTE1(v17->_findeeAlgorithmAidingData.var0.__val_.measured_velocity_change.var0.__val_.velocityChangeH1) = 0;
    }
    if (*(&v17->_findeeAlgorithmAidingData.var0.__val_.measured_velocity_change.__engaged_ + 2)) {
      *(&v17->_findeeAlgorithmAidingData.var0.__val_.measured_velocity_change.__engaged_ + 2) = 0;
    }
    id v31 = objc_retainBlock(v13);
    double val = v17->_findeeAlgorithmAidingData.var0.__val_.mach_absolute_receipt_timestamp.var0.__val_;
    *(void *)&v17->_findeeAlgorithmAidingData.var0.__val_.mach_absolute_receipt_timestamp.var0.__val_ = v31;

    id v33 = objc_retainBlock(v14);
    v34 = *(void **)&v17->_findeeAlgorithmAidingData.var0.__val_.mach_absolute_receipt_timestamp.__engaged_;
    *(void *)&v17->_findeeAlgorithmAidingData.var0.__val_.mach_absolute_receipt_timestamp.__engaged_ = v33;

    *(_DWORD *)&v17->_findeeAlgorithmAidingData.var0.__val_.location_data.__engaged_ = 0;
    *(void *)&v17->_findeeAlgorithmAidingData.var0.__val_.location_data.var0.__val_.uncertainty = 0;
    *(_OWORD *)&v16->_findeeAlgorithmAidingData.var0.__val_.location_data.var0.__null_state_ = 0u;
  }

  return v17;
}

- (id)registerNBAMMSSessionWithToken:(id)a3 isFinder:(BOOL)a4 client:(id)a5 serviceRequest:(const void *)a6 startRangingOptions:(const void *)a7 sharedProtocol:(int)a8
{
  BOOL v12 = a4;
  uint64_t v13 = (uint64_t)a3;
  id v98 = a3;
  id v15 = a5;
  v97 = self;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_internalQueue);
  v16 = (id)qword_1008ABDE0;
  if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
  {
    id v17 = v15;
    identityString = self->_identityString;
    v19 = [v98 descriptionInternal];
    *(_DWORD *)buf = 138412802;
    v111 = identityString;
    __int16 v112 = 2112;
    v113 = v19;
    __int16 v114 = 2080;
    v115 = sub_1002E0FBC(v12);
    _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_DEFAULT, "#find-range,Registering %@ with token %@, role %s", buf, 0x20u);

    id v15 = v17;
  }

  if (!v98)
  {
    if (os_log_type_enabled((os_log_t)qword_1008ABDE0, OS_LOG_TYPE_ERROR)) {
      sub_100424DB4();
    }
    goto LABEL_14;
  }
  if (!v15)
  {
    if (os_log_type_enabled((os_log_t)qword_1008ABDE0, OS_LOG_TYPE_ERROR)) {
      sub_100424DE8();
    }
    NSErrorUserInfoKey v108 = NSLocalizedFailureReasonErrorKey;
    CFStringRef v109 = @"Client is nil";
    v20 = +[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v109, &v108, 1, self);
    uint64_t v21 = +[NSError errorWithDomain:@"com.apple.NearbyInteraction" code:-10020 userInfo:v20];
    goto LABEL_26;
  }
  if (self->_nbammsSession.__ptr_)
  {
    if (self->_sharedProtocol == a8)
    {
      if (!self->_finderAttached && !self->_finderToken && v12)
      {
        self->_finderAttached = 1;
        objc_storeWeak((id *)&self->_finderClient, v15);
        sub_100242058((uint64_t)&self->_finderMutualAuthState);
        if (BYTE2(self->_finderStartRangingOptions.var0.__val_.secondary_scheduling_interval_usec.var0.__val_)) {
          BYTE2(self->_finderStartRangingOptions.var0.__val_.secondary_scheduling_interval_usec.var0.__val_) = 0;
        }
        self->_finderStartRangingOptions.var0.__val_.secondary_scheduling_interval_usec.var0.__null_state_ = 1;
        objc_storeStrong((id *)&self->_finderToken, (id)v13);
        v27 = self;
        BOOL engaged = self->_finderRoseServiceRequest.var0.__val_.range_enable_params.nbamms.mms_pkt_type.__engaged_;
        memcpy(&self->_finderRoseServiceRequest, a6, 0x1F8uLL);
        if (!engaged) {
          self->_finderRoseServiceRequest.var0.__val_.range_enable_params.nbamms.mms_pkt_type.__engaged_ = 1;
        }
        int scheduling_interval_usec_low = LOBYTE(self->_finderStartRangingOptions.var0.__val_.scheduling_interval_usec);
        long long v31 = *((_OWORD *)a7 + 1);
        long long v30 = *((_OWORD *)a7 + 2);
        *(_OWORD *)&self->_finderRoseServiceRequest.var0.__val_.range_enable_params.nbamms.mms_bch.var0.__null_state_ = *(_OWORD *)a7;
        *(_OWORD *)self->_finderRoseServiceRequest.var0.__val_.range_enable_params.nbamms.irk = v31;
        *(_OWORD *)&self->_finderRoseServiceRequest.var0.__val_.range_enable_params.nbamms.antenna_diversity_mask.var0.__null_state_ = v30;
        long long v32 = *((_OWORD *)a7 + 6);
        long long v34 = *((_OWORD *)a7 + 3);
        $B8AA82CD8D4AFFAE0D229AEE9D5E519E v33 = *(($B8AA82CD8D4AFFAE0D229AEE9D5E519E *)a7 + 4);
        *(_OWORD *)&self->_finderStartRangingOptions.var0.__val_.peer.var0.__val_.bt_adv_address.var0.__val_.__elems_[2] = *((_OWORD *)a7 + 5);
        *(_OWORD *)&self->_finderStartRangingOptions.var0.__val_.start_time_or_offset_usec = v32;
        *(_OWORD *)&self->_finderStartRangingOptions.var0.__null_state_ = v34;
        *($B8AA82CD8D4AFFAE0D229AEE9D5E519E *)((char *)&self->_finderStartRangingOptions.var0.__val_.peer.var0.__val_.uuid.var0
                                             + 12) = v33;
        if (!scheduling_interval_usec_low) {
          LOBYTE(self->_finderStartRangingOptions.var0.__val_.scheduling_interval_usec) = 1;
        }
        if (self->_finderStartRangingOptions.var0.__val_.dither_constant_msec.__engaged_)
        {
          p_BOOL engaged = &self->_finderStartRangingOptions.var0.__val_.dither_constant_msec.__engaged_;
LABEL_53:
          *p_BOOL engaged = 0;
          v27 = self;
          goto LABEL_54;
        }
        goto LABEL_54;
      }
      if (!HIBYTE(self->_finderStartRangingOptions.var0.__val_.secondary_scheduling_interval_usec.var0.__val_)
        && !self->_findeeMutualAuthState.outboundChallenge
        && !v12)
      {
        HIBYTE(self->_finderStartRangingOptions.var0.__val_.secondary_scheduling_interval_usec.var0.__val_) = 1;
        objc_storeWeak((id *)&self->_finderStartRangingOptions.var0.__val_.secondary_duty_cycle, v15);
        sub_100242058((uint64_t)&self->_finderStartRangingOptions.__engaged_);
        if (*(&self->_findeeAlgorithmAidingData.var0.__val_.measured_velocity_change.__engaged_ + 2)) {
          *(&self->_findeeAlgorithmAidingData.var0.__val_.measured_velocity_change.__engaged_ + 2) = 0;
        }
        self->_findeeAlgorithmAidingData.var0.__val_.measured_velocity_change.__engaged_ = 1;
        objc_storeStrong((id *)&self->_findeeMutualAuthState.outboundChallenge, (id)v13);
        v27 = self;
        BOOL v36 = self->_findeeRoseServiceRequest.var0.__val_.range_enable_params.fira.local_addr.__engaged_;
        memcpy(&self->_findeeMutualAuthState.outboundResponse, a6, 0x1F8uLL);
        if (!v36) {
          self->_findeeRoseServiceRequest.var0.__val_.range_enable_params.fira.local_addr.__engaged_ = 1;
        }
        int v37 = self->_findeeStartRangingOptions.var0.__val_.peer.var0.__val_.uuid.var0.__val_.__elems_[12];
        long long v39 = *((_OWORD *)a7 + 1);
        long long v38 = *((_OWORD *)a7 + 2);
        self->_findeeRoseServiceRequest.var0.__val_.range_enable_params.fira.peer_addr = *(optional<unsigned long long> *)a7;
        *(_OWORD *)&self->_findeeRoseServiceRequest.var0.__val_.range_enable_params.fira.contention_based_ranging_type.var0.__null_state_ = v39;
        *(_OWORD *)&self->_findeeRoseServiceRequest.var0.__val_.range_enable_params.nbamms.nb_bch.var0.__null_state_ = v38;
        long long v40 = *((_OWORD *)a7 + 6);
        long long v42 = *((_OWORD *)a7 + 3);
        long long v41 = *((_OWORD *)a7 + 4);
        *(_OWORD *)&self->_findeeRoseServiceRequest.var0.__val_.range_enable_params.nbamms.antenna_diversity_mask.var0.__null_state_ = *((_OWORD *)a7 + 5);
        *(_OWORD *)&self->_findeeStartRangingOptions.var0.__null_state_ = v40;
        *(_OWORD *)&self->_findeeRoseServiceRequest.var0.__val_.range_enable_params.nbamms.mms_bch.var0.__null_state_ = v42;
        *(_OWORD *)self->_findeeRoseServiceRequest.var0.__val_.range_enable_params.nbamms.irk = v41;
        if (!v37) {
          self->_findeeStartRangingOptions.var0.__val_.peer.var0.__val_.uuid.var0.__val_.__elems_[12] = 1;
        }
        if (self->_findeeAlgorithmAidingData.var0.__val_.measured_velocity_change.var0.__null_state_) {
          self->_findeeAlgorithmAidingData.var0.__val_.measured_velocity_change.var0.__null_state_ = 0;
        }
        if (BYTE1(self->_findeeAlgorithmAidingData.var0.__val_.measured_velocity_change.var0.__val_.velocityChangeH1))
        {
          p_BOOL engaged = (BOOL *)&self->_findeeAlgorithmAidingData.var0.__val_.measured_velocity_change.var0.__val_.velocityChangeH1
                    + 1;
          goto LABEL_53;
        }
LABEL_54:
        if (!v27->_finderAttached
          || !HIBYTE(self->_finderStartRangingOptions.var0.__val_.secondary_scheduling_interval_usec.var0.__val_))
        {
          goto LABEL_93;
        }
        if (self->_measurementsReceived)
        {
          v43 = qword_1008ABDE0;
          if (os_log_type_enabled((os_log_t)qword_1008ABDE0, OS_LOG_TYPE_DEFAULT))
          {
            *(_WORD *)buf = 0;
            _os_log_impl((void *)&_mh_execute_header, v43, OS_LOG_TYPE_DEFAULT, "#find-range,Reciprocal finding, measurements already received, do nothing", buf, 2u);
          }
          v20 = (id)qword_1008ABDE0;
          if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
          {
            v44 = [(NIServerNBAMMSSession *)self _getState];
            *(_DWORD *)buf = 138412290;
            v111 = v44;
            _os_log_impl((void *)&_mh_execute_header, v20, OS_LOG_TYPE_DEFAULT, "#find-range,NBAMMS session state (after register): %@", buf, 0xCu);
          }
LABEL_95:
          uint64_t v13 = 0;
          goto LABEL_96;
        }
        if ([(NIServerNBAMMSSession *)self _validateTokensAndRangingParameters])
        {
          uint64_t v13 = [(NIServerNBAMMSSession *)self _shouldUseFinderToken:self->_finderToken findeeToken:self->_findeeMutualAuthState.outboundChallenge];
          uint64_t v71 = 1040;
          if (v13) {
            uint64_t v71 = 304;
          }
          v72 = *(Class *)((char *)&self->super.isa + v71);
          v20 = v72;
          unsigned int v73 = [(NIDiscoveryToken *)self->_sessionToken isEqual:v20];
          v74 = qword_1008ABDE0;
          if (v73)
          {
            if (os_log_type_enabled((os_log_t)qword_1008ABDE0, OS_LOG_TYPE_DEFAULT))
            {
              *(_WORD *)buf = 0;
              _os_log_impl((void *)&_mh_execute_header, v74, OS_LOG_TYPE_DEFAULT, "#find-range,Reciprocal finding, ranging started with the right token, do nothing", buf, 2u);
            }
            v75 = (id)qword_1008ABDE0;
            if (os_log_type_enabled(v75, OS_LOG_TYPE_DEFAULT))
            {
              v76 = [(NIServerNBAMMSSession *)self _getState];
              *(_DWORD *)buf = 138412290;
              v111 = v76;
              _os_log_impl((void *)&_mh_execute_header, v75, OS_LOG_TYPE_DEFAULT, "#find-range,NBAMMS session state (after register): %@", buf, 0xCu);
            }
            goto LABEL_95;
          }
          v77 = (id)qword_1008ABDE0;
          if (os_log_type_enabled(v77, OS_LOG_TYPE_DEFAULT))
          {
            v78 = [v20 descriptionInternal];
            *(_DWORD *)buf = 138412290;
            v111 = v78;
            _os_log_impl((void *)&_mh_execute_header, v77, OS_LOG_TYPE_DEFAULT, "#find-range,Reciprocal finding, re-configuring with new token %@", buf, 0xCu);
          }
          self->_measurementsReceived = 0;
          ptr = self->_nbammsSession.__ptr_;
          if (ptr)
          {
            sub_1002D8288((uint64_t)ptr);
            cntrl = (std::__shared_weak_count *)self->_nbammsSession.__cntrl_;
            self->_nbammsSession.__ptr_ = 0;
            self->_nbammsSession.__cntrl_ = 0;
            if (cntrl) {
              sub_10001A970(cntrl);
            }
            sessionToken = self->_sessionToken;
            self->_sessionToken = 0;

            if (self->_sessionStartRangingOptions.__engaged_) {
              self->_sessionStartRangingOptions.__engaged_ = 0;
            }
            [(NIServerNBAMMSSession *)self _resetStatistics];
            [(NIServerNBAMMSSession *)v97 _resetCryptoStateIncludingFailures:1];
          }
          if (v13)
          {
            v82 = v97;
            if (v97->_finderRoseServiceRequest.var0.__val_.range_enable_params.nbamms.mms_pkt_type.__engaged_)
            {
              p_finderRoseServiceRequest = &v97->_finderRoseServiceRequest;
              goto LABEL_122;
            }
          }
          else
          {
            v82 = v97;
            if (v97->_findeeRoseServiceRequest.var0.__val_.range_enable_params.fira.local_addr.__engaged_)
            {
              p_finderRoseServiceRequest = &v97->_findeeMutualAuthState.outboundResponse;
LABEL_122:
              -[NIServerNBAMMSSession _buildNbammsSession:](v82, "_buildNbammsSession:", p_finderRoseServiceRequest, v97);
              if (!(void)v107)
              {
                if (os_log_type_enabled((os_log_t)qword_1008ABDE0, OS_LOG_TYPE_ERROR)) {
                  sub_100424E1C();
                }
                NSErrorUserInfoKey v99 = NSLocalizedFailureReasonErrorKey;
                CFStringRef v100 = @"Could not build ranging session";
                v85 = +[NSDictionary dictionaryWithObjects:&v100 forKeys:&v99 count:1];
                uint64_t v13 = +[NSError errorWithDomain:@"com.apple.NearbyInteraction" code:-10020 userInfo:v85];

                goto LABEL_135;
              }
              if (v13)
              {
                if (LOBYTE(v97->_finderStartRangingOptions.var0.__val_.scheduling_interval_usec))
                {
                  p_null_state = (long long *)&v97->_finderRoseServiceRequest.var0.__val_.range_enable_params.nbamms.mms_bch.var0.__null_state_;
LABEL_131:
                  int v86 = sub_1002DB434(v107, p_null_state);
                  if (!v86)
                  {
                    v89 = (__shared_weak_count *)*((void *)&v107 + 1);
                    if (*((void *)&v107 + 1)) {
                      atomic_fetch_add_explicit((atomic_ullong *volatile)(*((void *)&v107 + 1) + 8), 1uLL, memory_order_relaxed);
                    }
                    v90 = (std::__shared_weak_count *)v97->_nbammsSession.__cntrl_;
                    v97->_nbammsSession.__ptr_ = (NBAMMSSession *)v107;
                    v97->_nbammsSession.__cntrl_ = v89;
                    if (v90) {
                      sub_10001A970(v90);
                    }
                    objc_storeStrong((id *)&self->_sessionToken, v72);
                    v97->_sessionState = 1;
                    double val = v97->_findeeAlgorithmAidingData.var0.__val_.mach_absolute_receipt_timestamp.var0.__val_;
                    if (val != 0.0) {
                      (*(void (**)(double, NIServerNBAMMSSession *, uint64_t))(*(void *)&val + 16))(COERCE_DOUBLE(*(void *)&val), v97, 1);
                    }
                    uint64_t v92 = 1560;
                    if (v13) {
                      uint64_t v92 = 824;
                    }
                    v93 = (char *)v97 + v92;
                    long long v94 = *((_OWORD *)v93 + 5);
                    *(_OWORD *)&v97->_sessionStartRangingOptions.var0.__val_.scheduling_interval_usec = *((_OWORD *)v93 + 4);
                    *(_OWORD *)&v97->_sessionStartRangingOptions.var0.__val_.dither_constant_msec.var0.__null_state_ = v94;
                    *(_OWORD *)&v97->_sessionStartRangingOptions.var0.__val_.secondary_scheduling_interval_usec.var0.__null_state_ = *((_OWORD *)v93 + 6);
                    $B8AA82CD8D4AFFAE0D229AEE9D5E519E v95 = *(($B8AA82CD8D4AFFAE0D229AEE9D5E519E *)v93 + 1);
                    *(_OWORD *)&v97->_sessionStartRangingOptions.var0.__null_state_ = *(_OWORD *)v93;
                    *($B8AA82CD8D4AFFAE0D229AEE9D5E519E *)((char *)&v97->_sessionStartRangingOptions.var0.__val_.peer.var0.__val_.uuid.var0
                                                         + 12) = v95;
                    long long v96 = *((_OWORD *)v93 + 3);
                    *(_OWORD *)&v97->_sessionStartRangingOptions.var0.__val_.peer.var0.__val_.bt_adv_address.var0.__val_.__elems_[2] = *((_OWORD *)v93 + 2);
                    v97->_sessionStartRangingOptions.__engaged_ = v93[112];
                    *(_OWORD *)&v97->_sessionStartRangingOptions.var0.__val_.start_time_or_offset_usec = v96;
                    [(NIServerNBAMMSSession *)v97 _resetStatistics];
                    [(NIServerNBAMMSSession *)v97 _resetCryptoStateIncludingFailures:1];
                    [(NIServerNBAMMSSession *)v97 _updateSessionPayload];
                    char v88 = 1;
LABEL_145:
                    if (*((void *)&v107 + 1)) {
                      sub_10001A970(*((std::__shared_weak_count **)&v107 + 1));
                    }

                    if ((v88 & 1) == 0) {
                      goto LABEL_97;
                    }
LABEL_93:
                    v20 = (id)qword_1008ABDE0;
                    if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
                    {
                      v69 = [(NIServerNBAMMSSession *)v97 _getState];
                      LODWORD(v107) = 138412290;
                      *(void *)((char *)&v107 + 4) = v69;
                      _os_log_impl((void *)&_mh_execute_header, v20, OS_LOG_TYPE_DEFAULT, "#find-range,NBAMMS session state (after register): %@", (uint8_t *)&v107, 0xCu);
                    }
                    goto LABEL_95;
                  }
                  v87 = (id)qword_1008ABDE0;
                  if (os_log_type_enabled(v87, OS_LOG_TYPE_ERROR))
                  {
                    sub_1002DE064(v86, buf);
                    sub_100424E50();
                  }

                  uint64_t v13 = +[NSError errorWithDomain:@"com.apple.NearbyInteraction" code:-5887 userInfo:0];
LABEL_135:
                  char v88 = 0;
                  goto LABEL_145;
                }
              }
              else if (v97->_findeeStartRangingOptions.var0.__val_.peer.var0.__val_.uuid.var0.__val_.__elems_[12])
              {
                p_null_state = (long long *)&v97->_findeeRoseServiceRequest.var0.__val_.range_enable_params.fira.peer_addr.var0;
                goto LABEL_131;
              }
              sub_10000AE44();
            }
          }
          sub_10000AE44();
        }
LABEL_14:
        uint64_t v13 = +[NSError errorWithDomain:@"com.apple.NearbyInteraction", -10012, 0, self code userInfo];
        goto LABEL_97;
      }
      if (os_log_type_enabled((os_log_t)qword_1008ABDE0, OS_LOG_TYPE_ERROR)) {
        sub_100424EAC();
      }
      NSErrorUserInfoKey v101 = NSLocalizedFailureReasonErrorKey;
      CFStringRef v102 = @"Could not attache to existing NBAMMS session";
      v20 = +[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v102, &v101, 1, self);
      uint64_t v21 = +[NSError errorWithDomain:@"com.apple.NearbyInteraction" code:-10020 userInfo:v20];
    }
    else
    {
      v24 = qword_1008ABDE0;
      if (os_log_type_enabled((os_log_t)qword_1008ABDE0, OS_LOG_TYPE_ERROR)) {
        sub_100424EE0(&self->_sharedProtocol, a8, v24);
      }
      NSErrorUserInfoKey v103 = NSLocalizedFailureReasonErrorKey;
      CFStringRef v104 = @"Shared protocols not matching";
      v20 = +[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v104, &v103, 1, self);
      uint64_t v21 = +[NSError errorWithDomain:@"com.apple.NearbyInteraction" code:-10020 userInfo:v20];
    }
LABEL_26:
    uint64_t v13 = v21;
LABEL_96:

    goto LABEL_97;
  }
  [(NIServerNBAMMSSession *)self _buildNbammsSession:a6];
  if (!(void)v107)
  {
    if (os_log_type_enabled((os_log_t)qword_1008ABDE0, OS_LOG_TYPE_ERROR)) {
      sub_100424E1C();
    }
    NSErrorUserInfoKey v105 = NSLocalizedFailureReasonErrorKey;
    CFStringRef v106 = @"Could not build ranging session";
    v25 = +[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v106, &v105, 1, self);
    uint64_t v13 = +[NSError errorWithDomain:@"com.apple.NearbyInteraction" code:-10020 userInfo:v25];

    goto LABEL_30;
  }
  int v22 = sub_1002DB434(v107, (long long *)a7);
  if (v22)
  {
    v23 = (id)qword_1008ABDE0;
    if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR))
    {
      sub_1002DE064(v22, buf);
      sub_100424E50();
    }

    uint64_t v13 = +[NSError errorWithDomain:@"com.apple.NearbyInteraction" code:-5887 userInfo:0];
LABEL_30:
    char v26 = 0;
    goto LABEL_90;
  }
  if (v12)
  {
    self->_finderAttached = 1;
    objc_storeWeak((id *)&self->_finderClient, v15);
    objc_storeStrong((id *)&self->_finderToken, (id)v13);
    BOOL v45 = self->_finderRoseServiceRequest.var0.__val_.range_enable_params.nbamms.mms_pkt_type.__engaged_;
    memcpy(&self->_finderRoseServiceRequest, a6, 0x1F8uLL);
    if (!v45) {
      self->_finderRoseServiceRequest.var0.__val_.range_enable_params.nbamms.mms_pkt_type.__engaged_ = 1;
    }
    int v46 = LOBYTE(self->_finderStartRangingOptions.var0.__val_.scheduling_interval_usec);
    long long v48 = *((_OWORD *)a7 + 1);
    long long v47 = *((_OWORD *)a7 + 2);
    *(_OWORD *)&self->_finderRoseServiceRequest.var0.__val_.range_enable_params.nbamms.mms_bch.var0.__null_state_ = *(_OWORD *)a7;
    *(_OWORD *)self->_finderRoseServiceRequest.var0.__val_.range_enable_params.nbamms.irk = v48;
    *(_OWORD *)&self->_finderRoseServiceRequest.var0.__val_.range_enable_params.nbamms.antenna_diversity_mask.var0.__null_state_ = v47;
    long long v49 = *((_OWORD *)a7 + 6);
    long long v51 = *((_OWORD *)a7 + 3);
    $B8AA82CD8D4AFFAE0D229AEE9D5E519E v50 = *(($B8AA82CD8D4AFFAE0D229AEE9D5E519E *)a7 + 4);
    *(_OWORD *)&self->_finderStartRangingOptions.var0.__val_.peer.var0.__val_.bt_adv_address.var0.__val_.__elems_[2] = *((_OWORD *)a7 + 5);
    *(_OWORD *)&self->_finderStartRangingOptions.var0.__val_.start_time_or_offset_usec = v49;
    *(_OWORD *)&self->_finderStartRangingOptions.var0.__null_state_ = v51;
    *($B8AA82CD8D4AFFAE0D229AEE9D5E519E *)((char *)&self->_finderStartRangingOptions.var0.__val_.peer.var0.__val_.uuid.var0
                                         + 12) = v50;
    if (!v46) {
      LOBYTE(self->_finderStartRangingOptions.var0.__val_.scheduling_interval_usec) = 1;
    }
    if (self->_finderStartRangingOptions.var0.__val_.dither_constant_msec.__engaged_) {
      self->_finderStartRangingOptions.var0.__val_.dither_constant_msec.__engaged_ = 0;
    }
    sub_100242058((uint64_t)&self->_finderMutualAuthState);
    self->_finderMutualAuthState.outboundAuthState = 1;
    if (!BYTE2(self->_finderStartRangingOptions.var0.__val_.secondary_scheduling_interval_usec.var0.__val_)) {
      goto LABEL_81;
    }
    v52 = (BOOL *)&self->_finderStartRangingOptions.var0.__val_.secondary_scheduling_interval_usec + 2;
  }
  else
  {
    HIBYTE(self->_finderStartRangingOptions.var0.__val_.secondary_scheduling_interval_usec.var0.__val_) = 1;
    objc_storeWeak((id *)&self->_finderStartRangingOptions.var0.__val_.secondary_duty_cycle, v15);
    objc_storeStrong((id *)&self->_findeeMutualAuthState.outboundChallenge, (id)v13);
    BOOL v53 = self->_findeeRoseServiceRequest.var0.__val_.range_enable_params.fira.local_addr.__engaged_;
    memcpy(&self->_findeeMutualAuthState.outboundResponse, a6, 0x1F8uLL);
    if (!v53) {
      self->_findeeRoseServiceRequest.var0.__val_.range_enable_params.fira.local_addr.__engaged_ = 1;
    }
    int v54 = self->_findeeStartRangingOptions.var0.__val_.peer.var0.__val_.uuid.var0.__val_.__elems_[12];
    long long v56 = *((_OWORD *)a7 + 1);
    long long v55 = *((_OWORD *)a7 + 2);
    self->_findeeRoseServiceRequest.var0.__val_.range_enable_params.fira.peer_addr = *(optional<unsigned long long> *)a7;
    *(_OWORD *)&self->_findeeRoseServiceRequest.var0.__val_.range_enable_params.fira.contention_based_ranging_type.var0.__null_state_ = v56;
    *(_OWORD *)&self->_findeeRoseServiceRequest.var0.__val_.range_enable_params.nbamms.nb_bch.var0.__null_state_ = v55;
    long long v57 = *((_OWORD *)a7 + 6);
    long long v59 = *((_OWORD *)a7 + 3);
    long long v58 = *((_OWORD *)a7 + 4);
    *(_OWORD *)&self->_findeeRoseServiceRequest.var0.__val_.range_enable_params.nbamms.antenna_diversity_mask.var0.__null_state_ = *((_OWORD *)a7 + 5);
    *(_OWORD *)&self->_findeeStartRangingOptions.var0.__null_state_ = v57;
    *(_OWORD *)&self->_findeeRoseServiceRequest.var0.__val_.range_enable_params.nbamms.mms_bch.var0.__null_state_ = v59;
    *(_OWORD *)self->_findeeRoseServiceRequest.var0.__val_.range_enable_params.nbamms.irk = v58;
    if (!v54) {
      self->_findeeStartRangingOptions.var0.__val_.peer.var0.__val_.uuid.var0.__val_.__elems_[12] = 1;
    }
    if (self->_findeeAlgorithmAidingData.var0.__val_.measured_velocity_change.var0.__null_state_) {
      self->_findeeAlgorithmAidingData.var0.__val_.measured_velocity_change.var0.__null_state_ = 0;
    }
    if (BYTE1(self->_findeeAlgorithmAidingData.var0.__val_.measured_velocity_change.var0.__val_.velocityChangeH1)) {
      BYTE1(self->_findeeAlgorithmAidingData.var0.__val_.measured_velocity_change.var0.__val_.velocityChangeH1) = 0;
    }
    sub_100242058((uint64_t)&self->_finderStartRangingOptions.__engaged_);
    self->_finderStartRangingOptions.__engaged_ = 1;
    if (!*(&self->_findeeAlgorithmAidingData.var0.__val_.measured_velocity_change.__engaged_ + 2)) {
      goto LABEL_81;
    }
    v52 = &self->_findeeAlgorithmAidingData.var0.__val_.measured_velocity_change.__engaged_ + 2;
  }
  BOOL *v52 = 0;
LABEL_81:
  v60 = (__shared_weak_count *)*((void *)&v107 + 1);
  if (*((void *)&v107 + 1)) {
    atomic_fetch_add_explicit((atomic_ullong *volatile)(*((void *)&v107 + 1) + 8), 1uLL, memory_order_relaxed);
  }
  v61 = (std::__shared_weak_count *)self->_nbammsSession.__cntrl_;
  self->_nbammsSession.__ptr_ = (NBAMMSSession *)v107;
  self->_nbammsSession.__cntrl_ = v60;
  if (v61) {
    sub_10001A970(v61);
  }
  self->_sharedProtocol = a8;
  objc_storeStrong((id *)&self->_sessionToken, (id)v13);
  self->_sessionState = 1;
  double v62 = self->_findeeAlgorithmAidingData.var0.__val_.mach_absolute_receipt_timestamp.var0.__val_;
  if (v62 != 0.0) {
    (*(void (**)(double, NIServerNBAMMSSession *, uint64_t))(*(void *)&v62 + 16))(COERCE_DOUBLE(*(void *)&v62), self, 1);
  }
  BOOL v63 = self->_sessionStartRangingOptions.__engaged_;
  $B8AA82CD8D4AFFAE0D229AEE9D5E519E v65 = *(($B8AA82CD8D4AFFAE0D229AEE9D5E519E *)a7 + 1);
  long long v64 = *((_OWORD *)a7 + 2);
  *(_OWORD *)&self->_sessionStartRangingOptions.var0.__null_state_ = *(_OWORD *)a7;
  *($B8AA82CD8D4AFFAE0D229AEE9D5E519E *)((char *)&self->_sessionStartRangingOptions.var0.__val_.peer.var0.__val_.uuid.var0
                                       + 12) = v65;
  *(_OWORD *)&self->_sessionStartRangingOptions.var0.__val_.peer.var0.__val_.bt_adv_address.var0.__val_.__elems_[2] = v64;
  long long v66 = *((_OWORD *)a7 + 5);
  long long v67 = *((_OWORD *)a7 + 6);
  long long v68 = *((_OWORD *)a7 + 4);
  *(_OWORD *)&self->_sessionStartRangingOptions.var0.__val_.start_time_or_offset_usec = *((_OWORD *)a7 + 3);
  *(_OWORD *)&self->_sessionStartRangingOptions.var0.__val_.secondary_scheduling_interval_usec.var0.__null_state_ = v67;
  *(_OWORD *)&self->_sessionStartRangingOptions.var0.__val_.dither_constant_msec.var0.__null_state_ = v66;
  *(_OWORD *)&self->_sessionStartRangingOptions.var0.__val_.scheduling_interval_usec = v68;
  if (!v63) {
    self->_sessionStartRangingOptions.__engaged_ = 1;
  }
  [(NIServerNBAMMSSession *)self _resetStatistics];
  [(NIServerNBAMMSSession *)v97 _resetCryptoStateIncludingFailures:1];
  [(NIServerNBAMMSSession *)v97 _updateSessionPayload];
  char v26 = 1;
LABEL_90:
  if (*((void *)&v107 + 1)) {
    sub_10001A970(*((std::__shared_weak_count **)&v107 + 1));
  }
  if (v26) {
    goto LABEL_93;
  }
LABEL_97:

  return (id)v13;
}

- (void)unregisterNBAMMSSessionForToken:(id)a3
{
  id v4 = a3;
  v5 = (id)qword_1008ABDE0;
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    identityString = self->_identityString;
    v7 = [v4 descriptionInternal];
    *(_DWORD *)buf = 138412546;
    *(void *)&uint8_t buf[4] = identityString;
    *(_WORD *)&buf[12] = 2112;
    *(void *)&buf[14] = v7;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "#find-range,Unregistering session %@ with token %@", buf, 0x16u);
  }
  dispatch_assert_queue_V2((dispatch_queue_t)self->_internalQueue);
  if ([v4 isEqual:self->_finderToken])
  {
    finderToken = self->_finderToken;
    self->_finderToken = 0;

    objc_storeWeak((id *)&self->_finderClient, 0);
    self->_BOOL finderAttached = 0;
    sub_100242058((uint64_t)&self->_finderMutualAuthState);
    if (BYTE2(self->_finderStartRangingOptions.var0.__val_.secondary_scheduling_interval_usec.var0.__val_)) {
      BYTE2(self->_finderStartRangingOptions.var0.__val_.secondary_scheduling_interval_usec.var0.__val_) = 0;
    }
    self->_finderStartRangingOptions.var0.__val_.secondary_scheduling_interval_usec.var0.__null_state_ = 0;
    secondary_scheduling_delay_usec = self->_finderStartRangingOptions.var0.__val_.secondary_scheduling_delay_usec;
    if (secondary_scheduling_delay_usec)
    {
      dispatch_source_cancel(secondary_scheduling_delay_usec);
      v10 = (void *)self->_finderStartRangingOptions.var0.__val_.secondary_scheduling_delay_usec;
      self->_finderStartRangingOptions.var0.__val_.secondary_scheduling_delay_usec = 0;
    }
    if (self->_finderRoseServiceRequest.var0.__val_.range_enable_params.nbamms.mms_pkt_type.__engaged_) {
      self->_finderRoseServiceRequest.var0.__val_.range_enable_params.nbamms.mms_pkt_type.__engaged_ = 0;
    }
    if (LOBYTE(self->_finderStartRangingOptions.var0.__val_.scheduling_interval_usec)) {
      LOBYTE(self->_finderStartRangingOptions.var0.__val_.scheduling_interval_usec) = 0;
    }
    if (self->_finderStartRangingOptions.var0.__val_.dither_constant_msec.__engaged_) {
      self->_finderStartRangingOptions.var0.__val_.dither_constant_msec.__engaged_ = 0;
    }
    id v11 = qword_1008ABDE0;
    if (os_log_type_enabled((os_log_t)qword_1008ABDE0, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      *(void *)&uint8_t buf[4] = v4;
      BOOL v12 = "#find-range,Finder role with token %@ is detached";
LABEL_31:
      _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, v12, buf, 0xCu);
    }
  }
  else
  {
    if (![v4 isEqual:self->_findeeMutualAuthState.outboundChallenge])
    {
      v18 = (id)qword_1008ABDE0;
      if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
      {
        v19 = [v4 descriptionInternal];
        *(_DWORD *)buf = 138412290;
        *(void *)&uint8_t buf[4] = v19;
        _os_log_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_DEFAULT, "#find-range,Not ranging with token %@, return", buf, 0xCu);
      }
      goto LABEL_88;
    }
    outboundChallenge = self->_findeeMutualAuthState.outboundChallenge;
    self->_findeeMutualAuthState.outboundChallenge = 0;

    objc_storeWeak((id *)&self->_finderStartRangingOptions.var0.__val_.secondary_duty_cycle, 0);
    HIBYTE(self->_finderStartRangingOptions.var0.__val_.secondary_scheduling_interval_usec.var0.__val_) = 0;
    sub_100242058((uint64_t)&self->_finderStartRangingOptions.__engaged_);
    if (*(&self->_findeeAlgorithmAidingData.var0.__val_.measured_velocity_change.__engaged_ + 2)) {
      *(&self->_findeeAlgorithmAidingData.var0.__val_.measured_velocity_change.__engaged_ + 2) = 0;
    }
    self->_findeeAlgorithmAidingData.var0.__val_.measured_velocity_change.__engaged_ = 0;
    double velocityChangeH2 = self->_findeeAlgorithmAidingData.var0.__val_.measured_velocity_change.var0.__val_.velocityChangeH2;
    if (velocityChangeH2 != 0.0)
    {
      dispatch_source_cancel(*(dispatch_source_t *)&velocityChangeH2);
      double v15 = self->_findeeAlgorithmAidingData.var0.__val_.measured_velocity_change.var0.__val_.velocityChangeH2;
      self->_findeeAlgorithmAidingData.var0.__val_.measured_velocity_change.var0.__val_.double velocityChangeH2 = 0.0;
    }
    if (self->_findeeRoseServiceRequest.var0.__val_.range_enable_params.fira.local_addr.__engaged_) {
      self->_findeeRoseServiceRequest.var0.__val_.range_enable_params.fira.local_addr.__engaged_ = 0;
    }
    if (self->_findeeStartRangingOptions.var0.__val_.peer.var0.__val_.uuid.var0.__val_.__elems_[12]) {
      self->_findeeStartRangingOptions.var0.__val_.peer.var0.__val_.uuid.var0.__val_.__elems_[12] = 0;
    }
    if (self->_findeeAlgorithmAidingData.var0.__val_.measured_velocity_change.var0.__null_state_) {
      self->_findeeAlgorithmAidingData.var0.__val_.measured_velocity_change.var0.__null_state_ = 0;
    }
    if (BYTE1(self->_findeeAlgorithmAidingData.var0.__val_.measured_velocity_change.var0.__val_.velocityChangeH1)) {
      BYTE1(self->_findeeAlgorithmAidingData.var0.__val_.measured_velocity_change.var0.__val_.velocityChangeH1) = 0;
    }
    id v11 = qword_1008ABDE0;
    if (os_log_type_enabled((os_log_t)qword_1008ABDE0, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      *(void *)&uint8_t buf[4] = v4;
      BOOL v12 = "#find-range,Findee role is detached with token %@ is detached";
      goto LABEL_31;
    }
  }
  BOOL finderAttached = self->_finderAttached;
  if (!self->_finderAttached
    && !HIBYTE(self->_finderStartRangingOptions.var0.__val_.secondary_scheduling_interval_usec.var0.__val_))
  {
    self->_measurementsReceived = 0;
    self->_sessionState = 0;
    self->_sharedProtocol = -1;
    double val = self->_findeeAlgorithmAidingData.var0.__val_.mach_absolute_receipt_timestamp.var0.__val_;
    if (val != 0.0) {
      (*(void (**)(double, NIServerNBAMMSSession *, void))(*(void *)&val + 16))(COERCE_DOUBLE(*(void *)&val), self, 0);
    }
    ptr = self->_nbammsSession.__ptr_;
    if (ptr)
    {
      sub_1002D8288((uint64_t)ptr);
      cntrl = (std::__shared_weak_count *)self->_nbammsSession.__cntrl_;
      self->_nbammsSession.__ptr_ = 0;
      self->_nbammsSession.__cntrl_ = 0;
      if (cntrl) {
        sub_10001A970(cntrl);
      }
      sessionToken = self->_sessionToken;
      self->_sessionToken = 0;

      if (self->_sessionStartRangingOptions.__engaged_) {
        self->_sessionStartRangingOptions.__engaged_ = 0;
      }
      [(NIServerNBAMMSSession *)self _resetStatistics];
      [(NIServerNBAMMSSession *)self _resetCryptoStateIncludingFailures:1];
    }
    goto LABEL_86;
  }
  if (self->_measurementsReceived)
  {
    id v17 = qword_1008ABDE0;
    if (os_log_type_enabled((os_log_t)qword_1008ABDE0, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_DEFAULT, "#find-range,Reciprocal -> one-way, measurements already received, do nothing", buf, 2u);
    }
LABEL_86:
    v18 = (id)qword_1008ABDE0;
    if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
    {
      int v46 = [(NIServerNBAMMSSession *)self _getState];
      *(_DWORD *)buf = 138412290;
      *(void *)&uint8_t buf[4] = v46;
      _os_log_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_DEFAULT, "#find-range,NBAMMS session state (after unregister): %@", buf, 0xCu);
    }
LABEL_88:

    goto LABEL_89;
  }
  self->_measurementsReceived = 0;
  v20 = self->_nbammsSession.__ptr_;
  if (v20)
  {
    sub_1002D8288((uint64_t)v20);
    uint64_t v21 = (std::__shared_weak_count *)self->_nbammsSession.__cntrl_;
    self->_nbammsSession.__ptr_ = 0;
    self->_nbammsSession.__cntrl_ = 0;
    if (v21) {
      sub_10001A970(v21);
    }
    int v22 = self->_sessionToken;
    self->_sessionToken = 0;

    if (self->_sessionStartRangingOptions.__engaged_) {
      self->_sessionStartRangingOptions.__engaged_ = 0;
    }
    [(NIServerNBAMMSSession *)self _resetStatistics];
    [(NIServerNBAMMSSession *)self _resetCryptoStateIncludingFailures:1];
    BOOL finderAttached = self->_finderAttached;
  }
  buf[0] = 0;
  buf[504] = 0;
  LOBYTE(v50) = 0;
  char v57 = 0;
  if (finderAttached)
  {
    p_finderToken = (void **)&self->_finderToken;
    v24 = qword_1008ABDE0;
    if (os_log_type_enabled((os_log_t)qword_1008ABDE0, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)long long v47 = 0;
      _os_log_impl((void *)&_mh_execute_header, v24, OS_LOG_TYPE_DEFAULT, "#find-range,Reciprocal -> one-way: reconfigure as finder", v47, 2u);
    }
    uint64_t v25 = 824;
    uint64_t v26 = 312;
  }
  else
  {
    if (!HIBYTE(self->_finderStartRangingOptions.var0.__val_.secondary_scheduling_interval_usec.var0.__val_))
    {
      v18 = 0;
      goto LABEL_71;
    }
    long long v31 = qword_1008ABDE0;
    if (os_log_type_enabled((os_log_t)qword_1008ABDE0, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)long long v47 = 0;
      _os_log_impl((void *)&_mh_execute_header, v31, OS_LOG_TYPE_DEFAULT, "#find-range,Reciprocal -> one-way: reconfigure as findee", v47, 2u);
    }
    p_finderToken = (void **)&self->_findeeMutualAuthState.outboundChallenge;
    uint64_t v25 = 1560;
    uint64_t v26 = 1048;
  }
  long long v32 = *p_finderToken;
  v18 = v32;
  memcpy(buf, (char *)self + v26, 0x1F9uLL);
  long long v33 = *(_OWORD *)&self->_sessionStartRangingOptions.var0.__val_.peer.var0.__val_.rose_mac_address.var0.__val_.__elems_[v25 + 3];
  long long v54 = *(long long *)((char *)&self->_sessionStartRangingOptions.var0.__val_.peer.var0.__val_.uuid.var0 + v25 + 4);
  long long v55 = v33;
  long long v56 = *(_OWORD *)(&self->_sessionStartRangingOptions.var0.__val_.peer.__engaged_ + v25);
  char v57 = *(&self->_sessionStartRangingOptions.var0.__val_.start_time_type + v25);
  $B8AA82CD8D4AFFAE0D229AEE9D5E519E v34 = *($B8AA82CD8D4AFFAE0D229AEE9D5E519E *)((char *)&self->_identityString + v25);
  long long v50 = *(_OWORD *)((char *)&self->super.isa + v25);
  $B8AA82CD8D4AFFAE0D229AEE9D5E519E v51 = v34;
  long long v35 = *(_OWORD *)((char *)&self->_sessionToken + v25);
  long long v52 = *(_OWORD *)((char *)&self->_nbammsSession.__cntrl_ + v25);
  long long v53 = v35;
  if (!v18 || !buf[504] || !v57)
  {
LABEL_71:
    if (os_log_type_enabled((os_log_t)qword_1008ABDE0, OS_LOG_TYPE_ERROR)) {
      sub_100424F6C();
    }
    goto LABEL_88;
  }
  [(NIServerNBAMMSSession *)self _buildNbammsSession:buf];
  if (!v48)
  {
    if (os_log_type_enabled((os_log_t)qword_1008ABDE0, OS_LOG_TYPE_ERROR)) {
      sub_100424E1C();
    }
    goto LABEL_75;
  }
  if (!v57) {
    sub_10000AE44();
  }
  int v36 = sub_1002DB434((uint64_t)v48, &v50);
  if (v36)
  {
    int v37 = (id)qword_1008ABDE0;
    if (os_log_type_enabled(v37, OS_LOG_TYPE_ERROR))
    {
      sub_1002DE064(v36, v47);
      sub_100424E50();
    }

LABEL_75:
    char v38 = 0;
    goto LABEL_83;
  }
  long long v40 = v48;
  long long v39 = v49;
  if (v49) {
    atomic_fetch_add_explicit((atomic_ullong *volatile)v49 + 1, 1uLL, memory_order_relaxed);
  }
  long long v41 = (std::__shared_weak_count *)self->_nbammsSession.__cntrl_;
  self->_nbammsSession.__ptr_ = v40;
  self->_nbammsSession.__cntrl_ = v39;
  if (v41) {
    sub_10001A970(v41);
  }
  objc_storeStrong((id *)&self->_sessionToken, v32);
  self->_sessionState = 1;
  double v42 = self->_findeeAlgorithmAidingData.var0.__val_.mach_absolute_receipt_timestamp.var0.__val_;
  if (v42 != 0.0) {
    (*(void (**)(double, NIServerNBAMMSSession *, uint64_t))(*(void *)&v42 + 16))(COERCE_DOUBLE(*(void *)&v42), self, 1);
  }
  long long v43 = v55;
  *(_OWORD *)&self->_sessionStartRangingOptions.var0.__val_.scheduling_interval_usec = v54;
  *(_OWORD *)&self->_sessionStartRangingOptions.var0.__val_.dither_constant_msec.var0.__null_state_ = v43;
  *(_OWORD *)&self->_sessionStartRangingOptions.var0.__val_.secondary_scheduling_interval_usec.var0.__null_state_ = v56;
  $B8AA82CD8D4AFFAE0D229AEE9D5E519E v44 = v51;
  *(_OWORD *)&self->_sessionStartRangingOptions.var0.__null_state_ = v50;
  *($B8AA82CD8D4AFFAE0D229AEE9D5E519E *)((char *)&self->_sessionStartRangingOptions.var0.__val_.peer.var0.__val_.uuid.var0
                                       + 12) = v44;
  long long v45 = v53;
  *(_OWORD *)&self->_sessionStartRangingOptions.var0.__val_.peer.var0.__val_.bt_adv_address.var0.__val_.__elems_[2] = v52;
  self->_sessionStartRangingOptions.__engaged_ = v57;
  *(_OWORD *)&self->_sessionStartRangingOptions.var0.__val_.start_time_or_offset_usec = v45;
  [(NIServerNBAMMSSession *)self _resetStatistics];
  [(NIServerNBAMMSSession *)self _resetCryptoStateIncludingFailures:1];
  [(NIServerNBAMMSSession *)self _updateSessionPayload];
  char v38 = 1;
LABEL_83:
  if (v49) {
    sub_10001A970((std::__shared_weak_count *)v49);
  }

  if (v38) {
    goto LABEL_86;
  }
LABEL_89:
}

- (void)refreshRangingForToken:(id)a3
{
  id v4 = a3;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_internalQueue);
  if (self->_nbammsSession.__ptr_
    && self->_sessionStartRangingOptions.__engaged_
    && [(NIDiscoveryToken *)self->_sessionToken isEqual:v4])
  {
    if (!self->_sessionStartRangingOptions.__engaged_) {
      sub_10000AE44();
    }
    int v5 = sub_1002DB434((uint64_t)self->_nbammsSession.__ptr_, (long long *)&self->_sessionStartRangingOptions.var0.__null_state_);
    v6 = (id)qword_1008ABDE0;
    v7 = v6;
    if (v5)
    {
      if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
      {
        identityString = self->_identityString;
        id v9 = [v4 descriptionInternal];
        sub_1002DE064(v5, __p);
        if (v14 >= 0) {
          v10 = __p;
        }
        else {
          v10 = (void **)__p[0];
        }
        *(_DWORD *)buf = 138412802;
        v16 = identityString;
        __int16 v17 = 2112;
        id v18 = v9;
        __int16 v19 = 2080;
        v20 = v10;
        _os_log_error_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_ERROR, "#find-range,refreshRanging for %@ with token %@: Failed to refresh ranging. Return code: %s", buf, 0x20u);
        if (v14 < 0) {
          operator delete(__p[0]);
        }
      }
    }
    else if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      id v11 = self->_identityString;
      BOOL v12 = [v4 descriptionInternal];
      *(_DWORD *)buf = 138412546;
      v16 = v11;
      __int16 v17 = 2112;
      id v18 = v12;
      _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "#find-range,refreshRanging: Success for %@, token: %@!", buf, 0x16u);
    }
  }
}

- (BOOL)sessionRegistered
{
  return self->_nbammsSession.__ptr_ != 0;
}

- (vector<NMISessionRole,)attachedRoles
{
  dispatch_assert_queue_V2((dispatch_queue_t)self->_internalQueue);
  retstr->var0 = 0;
  retstr->var1 = 0;
  retstr->var2.var0 = 0;
  if (self->_finderAttached && self->_finderToken)
  {
    v6 = (int *)sub_10003B54C((uint64_t)&retstr->var2, 1uLL);
    result = (vector<NMISessionRole, std::allocator<NMISessionRole>> *)retstr->var0;
    var1 = retstr->var1;
    id v9 = &v6[v8];
    int *v6 = 0;
    v10 = v6 + 1;
    while (var1 != (int *)result)
    {
      int v11 = *--var1;
      *--v6 = v11;
    }
    retstr->var0 = v6;
    retstr->var1 = v10;
    retstr->var2.var0 = v9;
    if (result) {
      operator delete(result);
    }
    retstr->var1 = v10;
  }
  else
  {
    v10 = 0;
  }
  if (HIBYTE(self->_finderStartRangingOptions.var0.__val_.secondary_scheduling_interval_usec.var0.__val_)
    && self->_findeeMutualAuthState.outboundChallenge)
  {
    var0 = retstr->var2.var0;
    if (v10 >= var0)
    {
      result = (vector<NMISessionRole, std::allocator<NMISessionRole>> *)retstr->var0;
      uint64_t v14 = v10 - retstr->var0;
      unint64_t v15 = v14 + 1;
      if ((unint64_t)(v14 + 1) >> 62) {
        sub_1000267C4();
      }
      uint64_t v16 = (char *)var0 - (char *)result;
      if (v16 >> 1 > v15) {
        unint64_t v15 = v16 >> 1;
      }
      if ((unint64_t)v16 >= 0x7FFFFFFFFFFFFFFCLL) {
        unint64_t v17 = 0x3FFFFFFFFFFFFFFFLL;
      }
      else {
        unint64_t v17 = v15;
      }
      if (v17)
      {
        id v18 = (char *)sub_10003B54C((uint64_t)&retstr->var2, v17);
        result = (vector<NMISessionRole, std::allocator<NMISessionRole>> *)retstr->var0;
        v10 = retstr->var1;
      }
      else
      {
        id v18 = 0;
      }
      __int16 v19 = (int *)&v18[4 * v14];
      v20 = (int *)&v18[4 * v17];
      int *v19 = 1;
      uint64_t v13 = v19 + 1;
      while (v10 != (int *)result)
      {
        int v21 = *--v10;
        *--__int16 v19 = v21;
      }
      retstr->var0 = v19;
      retstr->var1 = v13;
      retstr->var2.var0 = v20;
      if (result) {
        operator delete(result);
      }
    }
    else
    {
      int *v10 = 1;
      uint64_t v13 = v10 + 1;
    }
    retstr->var1 = v13;
  }
  return result;
}

- (int)sessionState
{
  return self->_sessionState;
}

- (int)sharedProtocol
{
  return self->_sharedProtocol;
}

- (void)setSharedProtocol:(int)a3
{
  self->_sharedProtocol = a3;
}

- (id)sessionTokenForFinder:(BOOL)a3
{
  BOOL v3 = a3;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_internalQueue);
  uint64_t v5 = 1040;
  if (v3) {
    uint64_t v5 = 304;
  }
  v6 = *(Class *)((char *)&self->super.isa + v5);

  return v6;
}

- (id)sessionClientForFinder:(BOOL)a3
{
  BOOL v3 = a3;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_internalQueue);
  uint64_t v5 = 976;
  if (v3) {
    uint64_t v5 = 240;
  }
  id WeakRetained = objc_loadWeakRetained((id *)((char *)&self->super.isa + v5));

  return WeakRetained;
}

- (optional<rose::RoseServiceRequest>)sessionServiceRequestForFinder:(SEL)a3
{
  BOOL v4 = a4;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_internalQueue);
  uint64_t v7 = 1048;
  if (v4) {
    uint64_t v7 = 312;
  }

  return (optional<rose::RoseServiceRequest> *)memcpy(retstr, (char *)self + v7, 0x200uLL);
}

- (optional<rose::RoseStartRangingOptions>)sessionStartRangingOptionsForFinder:(SEL)a3
{
  BOOL v4 = a4;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_internalQueue);
  uint64_t v8 = 1560;
  if (v4) {
    uint64_t v8 = 824;
  }
  id v9 = (char *)self + v8;
  long long v10 = *((_OWORD *)v9 + 5);
  *(_OWORD *)&retstr->var0.__val_.scheduling_interval_usec = *((_OWORD *)v9 + 4);
  *(_OWORD *)&retstr->var0.__val_.dither_constant_msec.var0.__null_state_ = v10;
  *(_OWORD *)&retstr->var0.__val_.secondary_scheduling_interval_usec.var0.__null_state_ = *((_OWORD *)v9 + 6);
  *(void *)&retstr->__engaged_ = *((void *)v9 + 14);
  $B8AA82CD8D4AFFAE0D229AEE9D5E519E v11 = *(($B8AA82CD8D4AFFAE0D229AEE9D5E519E *)v9 + 1);
  *(_OWORD *)&retstr->var0.__null_state_ = *(_OWORD *)v9;
  *($B8AA82CD8D4AFFAE0D229AEE9D5E519E *)((char *)&retstr->var0.__val_.peer.var0.__val_.uuid.var0 + 12) = v11;
  long long v12 = *((_OWORD *)v9 + 3);
  *(_OWORD *)&retstr->var0.__val_.peer.var0.__val_.bt_adv_address.var0.__val_.__elems_[2] = *((_OWORD *)v9 + 2);
  *(_OWORD *)&retstr->var0.__val_.start_time_or_offset_usec = v12;
  return result;
}

- (void)informMutualAuthFailuresToClients
{
  dispatch_assert_queue_V2((dispatch_queue_t)self->_internalQueue);
  id WeakRetained = objc_loadWeakRetained((id *)&self->_finderClient);
  BOOL v4 = WeakRetained;
  if ((self->_finderMutualAuthState.outboundAuthState - 5 < 2
     || self->_finderMutualAuthState.inboundAuthState == 2)
    && WeakRetained)
  {
    uint64_t v5 = [WeakRetained clientQueue];
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_100243E50;
    block[3] = &unk_100846588;
    id v12 = v4;
    uint64_t v13 = self;
    dispatch_async(v5, block);
  }
  id v6 = objc_loadWeakRetained((id *)&self->_finderStartRangingOptions.var0.__val_.secondary_duty_cycle);

  if (self->_finderStartRangingOptions.__engaged_ - 5 < 2 || LOBYTE(self->_finderMutualAuthTimer) == 2)
  {
    if (v6)
    {
      uint64_t v7 = [v6 clientQueue];
      v8[0] = _NSConcreteStackBlock;
      v8[1] = 3221225472;
      v8[2] = sub_100243E60;
      v8[3] = &unk_100846588;
      id v9 = v6;
      long long v10 = self;
      dispatch_async(v7, v8);
    }
  }
}

- (id)identityString
{
  dispatch_assert_queue_V2((dispatch_queue_t)self->_internalQueue);
  identityString = self->_identityString;

  return identityString;
}

- (SessionClientsStatus)sessionClientsStatus
{
  dispatch_assert_queue_V2((dispatch_queue_t)self->_internalQueue);
  int outboundAuthState = self->_finderMutualAuthState.outboundAuthState;
  if (outboundAuthState == 1) {
    goto LABEL_4;
  }
  if (outboundAuthState == 4)
  {
    int inboundAuthState = self->_finderMutualAuthState.inboundAuthState;
    if (inboundAuthState == 1)
    {
LABEL_4:
      uint64_t v5 = 0;
      goto LABEL_10;
    }
  }
  else
  {
    if ((outboundAuthState - 5) < 2)
    {
LABEL_8:
      uint64_t v5 = (uint64_t)&_mh_execute_header;
      goto LABEL_10;
    }
    int inboundAuthState = self->_finderMutualAuthState.inboundAuthState;
  }
  if (inboundAuthState == 2) {
    goto LABEL_8;
  }
  uint64_t v5 = 0x200000000;
LABEL_10:
  int engaged = self->_finderStartRangingOptions.__engaged_;
  if (engaged != 1)
  {
    if (engaged == 4)
    {
      int finderMutualAuthTimer_low = LOBYTE(self->_finderMutualAuthTimer);
      if (finderMutualAuthTimer_low == 1) {
        goto LABEL_13;
      }
    }
    else
    {
      if ((engaged - 5) < 2)
      {
LABEL_17:
        uint64_t v8 = (uint64_t)&_mh_execute_header;
        goto LABEL_19;
      }
      int finderMutualAuthTimer_low = LOBYTE(self->_finderMutualAuthTimer);
    }
    if (finderMutualAuthTimer_low != 2)
    {
      uint64_t v8 = 0x200000000;
      goto LABEL_19;
    }
    goto LABEL_17;
  }
LABEL_13:
  uint64_t v8 = 0;
LABEL_19:
  uint64_t v9 = v5 | self->_finderAttached;
  uint64_t v10 = v8 | HIBYTE(self->_finderStartRangingOptions.var0.__val_.secondary_scheduling_interval_usec.var0.__val_);
  result.var2 = v10;
  result.var3 = HIDWORD(v10);
  result.var0 = v9;
  result.var1 = HIDWORD(v9);
  return result;
}

- (void)updateAlgorithmAidingData:(const void *)a3 token:(id)a4
{
  id v6 = a4;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_internalQueue);
  if ([v6 isEqual:self->_finderToken])
  {
    if (os_log_type_enabled((os_log_t)qword_1008ABDE0, OS_LOG_TYPE_ERROR)) {
      sub_100424FA0();
    }
  }
  else if ([v6 isEqual:self->_findeeMutualAuthState.outboundChallenge])
  {
    uint64_t v7 = (_OWORD *)((char *)&self->_findeeStartRangingOptions.var0.__val_.peer.var0.__val_.rose_mac_address.var0 + 3);
    long long v8 = *(_OWORD *)a3;
    long long v9 = *((_OWORD *)a3 + 2);
    if (self->_findeeAlgorithmAidingData.var0.__val_.measured_velocity_change.var0.__null_state_)
    {
      *(_OWORD *)&self->_findeeStartRangingOptions.var0.__val_.peer.__engaged_ = *((_OWORD *)a3 + 1);
      *(_OWORD *)&self->_findeeStartRangingOptions.var0.__val_.start_time_type = v9;
      _OWORD *v7 = v8;
      long long v10 = *((_OWORD *)a3 + 3);
      long long v11 = *((_OWORD *)a3 + 4);
      long long v12 = *((_OWORD *)a3 + 6);
      *(_OWORD *)&self->_findeeStartRangingOptions.var0.__val_.secondary_duty_cycle.var0.__null_state_ = *((_OWORD *)a3 + 5);
      *(_OWORD *)&self->_findeeAlgorithmAidingData.var0.__null_state_ = v12;
      *(_OWORD *)&self->_findeeStartRangingOptions.var0.__val_.conn_evt_trigger_desc.var0.__null_state_ = v10;
      *(_OWORD *)&self->_findeeStartRangingOptions.var0.__val_.secondary_scheduling_delay_usec.var0.__null_state_ = v11;
      long long v13 = *((_OWORD *)a3 + 7);
      long long v14 = *((_OWORD *)a3 + 8);
      long long v15 = *((_OWORD *)a3 + 9);
      *(_OWORD *)((char *)&self->_findeeAlgorithmAidingData.var0.__val_.measured_displacement.var0.__val_.displacementH2
                + 2) = *(_OWORD *)((char *)a3 + 154);
      *(_OWORD *)&self->_findeeAlgorithmAidingData.var0.__val_.measured_displacement.var0.__val_.applicabilityTimestamp = v14;
      *(_OWORD *)&self->_findeeAlgorithmAidingData.var0.__val_.measured_displacement.var0.__val_.displacementH1 = v15;
      *(_OWORD *)&self->_findeeAlgorithmAidingData.var0.__val_.bounded_displacement.__engaged_ = v13;
    }
    else
    {
      *(_OWORD *)&self->_findeeStartRangingOptions.var0.__val_.peer.__engaged_ = *((_OWORD *)a3 + 1);
      *(_OWORD *)&self->_findeeStartRangingOptions.var0.__val_.start_time_type = v9;
      _OWORD *v7 = v8;
      long long v16 = *((_OWORD *)a3 + 3);
      long long v17 = *((_OWORD *)a3 + 4);
      long long v18 = *((_OWORD *)a3 + 6);
      *(_OWORD *)&self->_findeeStartRangingOptions.var0.__val_.secondary_duty_cycle.var0.__null_state_ = *((_OWORD *)a3 + 5);
      *(_OWORD *)&self->_findeeAlgorithmAidingData.var0.__null_state_ = v18;
      *(_OWORD *)&self->_findeeStartRangingOptions.var0.__val_.conn_evt_trigger_desc.var0.__null_state_ = v16;
      *(_OWORD *)&self->_findeeStartRangingOptions.var0.__val_.secondary_scheduling_delay_usec.var0.__null_state_ = v17;
      long long v19 = *((_OWORD *)a3 + 7);
      long long v20 = *((_OWORD *)a3 + 8);
      long long v21 = *((_OWORD *)a3 + 10);
      *(_OWORD *)&self->_findeeAlgorithmAidingData.var0.__val_.measured_displacement.var0.__val_.displacementH1 = *((_OWORD *)a3 + 9);
      *(_OWORD *)&self->_findeeAlgorithmAidingData.var0.__val_.measured_displacement.var0.__val_.displacementV = v21;
      *(_OWORD *)&self->_findeeAlgorithmAidingData.var0.__val_.bounded_displacement.__engaged_ = v19;
      *(_OWORD *)&self->_findeeAlgorithmAidingData.var0.__val_.measured_displacement.var0.__val_.applicabilityTimestamp = v20;
      self->_findeeAlgorithmAidingData.var0.__val_.measured_velocity_change.var0.__null_state_ = 1;
    }
    [(NIServerNBAMMSSession *)self _updateSessionPayload];
  }
}

- (void)updateSignallingData:(const void *)a3 token:(id)a4
{
  id v11 = a4;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_internalQueue);
  if ([v11 isEqual:self->_finderToken])
  {
    BOOL engaged = self->_finderStartRangingOptions.var0.__val_.dither_constant_msec.__engaged_;
    char v7 = *((unsigned char *)a3 + 8);
    self->_finderStartRangingOptions.var0.__val_.conn_evt_trigger_desc = *(optional<rose::ConnectionEventTriggerDescriptor> *)a3;
    self->_finderStartRangingOptions.var0.__val_.dither_constant_msec.var0.__null_state_ = v7;
    if (!engaged)
    {
      p_BOOL engaged = &self->_finderStartRangingOptions.var0.__val_.dither_constant_msec.__engaged_;
LABEL_7:
      *p_BOOL engaged = 1;
    }
  }
  else
  {
    if (![v11 isEqual:self->_findeeMutualAuthState.outboundChallenge]) {
      goto LABEL_9;
    }
    int v9 = BYTE1(self->_findeeAlgorithmAidingData.var0.__val_.measured_velocity_change.var0.__val_.velocityChangeH1);
    char v10 = *((unsigned char *)a3 + 8);
    self->_findeeAlgorithmAidingData.var0.__val_.measured_velocity_change.var0.__val_.applicabilityTimestamp = *(double *)a3;
    LOBYTE(self->_findeeAlgorithmAidingData.var0.__val_.measured_velocity_change.var0.__val_.velocityChangeH1) = v10;
    if (!v9)
    {
      p_BOOL engaged = (BOOL *)&self->_findeeAlgorithmAidingData.var0.__val_.measured_velocity_change.var0.__val_.velocityChangeH1
                + 1;
      goto LABEL_7;
    }
  }
  [(NIServerNBAMMSSession *)self _updateSessionPayload];
LABEL_9:
}

- (void)_updateSessionPayload
{
  if (!self->_nbammsSession.__ptr_) {
    return;
  }
  unsigned int cryptoSessionState = self->_cryptoSessionState;
  if (cryptoSessionState - 1 < 2)
  {
LABEL_6:
    [(NIServerNBAMMSSession *)self _updateCryptoSessionConfigPayload];
    goto LABEL_7;
  }
  if (cryptoSessionState != 3)
  {
    if (self->_cryptoSessionState) {
      goto LABEL_7;
    }
    [(NIServerNBAMMSSession *)self _initializeEncryptionSessionIfNecessary];
    goto LABEL_6;
  }
  if ([(NIServerNBAMMSSession *)self _shouldSendMutualAuthMessage])
  {
    if (self->_finderStartRangingOptions.var0.__val_.secondary_scheduling_interval_usec.var0.__null_state_) {
      [(NIServerNBAMMSSession *)self _armMutualAuthTimerForFinder:1];
    }
    if (self->_findeeAlgorithmAidingData.var0.__val_.measured_velocity_change.__engaged_) {
      [(NIServerNBAMMSSession *)self _armMutualAuthTimerForFinder:0];
    }
    if ([(NIServerNBAMMSSession *)self _encryptAndUpdateMutualAuthPayload]) {
      goto LABEL_7;
    }
    goto LABEL_20;
  }
  if (![(NIServerNBAMMSSession *)self _encryptAndUpdateAidingAndSignallingPayload])
  {
LABEL_20:
    long long v8 = (id)qword_1008ABDE0;
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      [(NIServerCryptoSession *)self->_selfEncryptionSession sessionIdentifier];
      objc_claimAutoreleasedReturnValue();
      sub_100425008();
    }

    [(NIServerNBAMMSSession *)self _handleCryptoFailure];
  }
LABEL_7:
  if (self->_cryptoSessionState != cryptoSessionState)
  {
    BOOL v4 = (id)qword_1008ABDE0;
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v5 = sub_100244374(cryptoSessionState);
      id v6 = sub_100244374(self->_cryptoSessionState);
      identityString = self->_identityString;
      int v9 = 138478339;
      char v10 = v5;
      __int16 v11 = 2113;
      long long v12 = v6;
      __int16 v13 = 2112;
      long long v14 = identityString;
      _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "#find-range,#crypto Session state update while updating payload. %{private}@ -> %{private}@, id: %@", (uint8_t *)&v9, 0x20u);
    }
  }
}

- (BOOL)_encryptAndUpdateAidingAndSignallingPayload
{
  if (!self->_nbammsSession.__ptr_) {
    return 0;
  }
  if (self->_findeeAlgorithmAidingData.var0.__val_.measured_velocity_change.var0.__null_state_)
  {
    long long v3 = *(_OWORD *)&self->_findeeAlgorithmAidingData.var0.__val_.bounded_displacement.__engaged_;
    long long v4 = *(_OWORD *)&self->_findeeAlgorithmAidingData.var0.__val_.measured_displacement.var0.__val_.displacementH1;
    long long v34 = *(_OWORD *)&self->_findeeAlgorithmAidingData.var0.__val_.measured_displacement.var0.__val_.applicabilityTimestamp;
    long long v35 = v4;
    long long v36 = *(_OWORD *)&self->_findeeAlgorithmAidingData.var0.__val_.measured_displacement.var0.__val_.displacementV;
    long long v5 = *(_OWORD *)&self->_findeeStartRangingOptions.var0.__val_.conn_evt_trigger_desc.var0.__null_state_;
    long long v6 = *(_OWORD *)&self->_findeeStartRangingOptions.var0.__val_.secondary_duty_cycle.var0.__null_state_;
    long long v30 = *(_OWORD *)&self->_findeeStartRangingOptions.var0.__val_.secondary_scheduling_delay_usec.var0.__null_state_;
    long long v31 = v6;
    long long v32 = *(_OWORD *)&self->_findeeAlgorithmAidingData.var0.__null_state_;
    long long v33 = v3;
    long long v7 = *(_OWORD *)&self->_findeeStartRangingOptions.var0.__val_.peer.__engaged_;
    long long v26 = *(_OWORD *)&self->_findeeStartRangingOptions.var0.__val_.peer.var0.__val_.rose_mac_address.var0.__val_.__elems_[3];
    long long v27 = v7;
    long long v28 = *(_OWORD *)&self->_findeeStartRangingOptions.var0.__val_.start_time_type;
    long long v29 = v5;
  }
  else
  {
    LOBYTE(v26) = 0;
    LOBYTE(v27) = 0;
    BYTE8(v27) = 0;
    BYTE8(v30) = 0;
    LOBYTE(v31) = 0;
    LOBYTE(v33) = 0;
    LOBYTE(v36) = 0;
    WORD4(v36) = 0;
    *((void *)&v33 + 1) = 0;
    *(void *)&long long v34 = 0;
    BYTE8(v34) = 0;
  }
  int v9 = sub_100007D00();
  sub_100005424(v9[144]);
  uint64_t v23 = 0;
  unint64_t v24 = sub_100244730((uint64_t)&self->_finderStartRangingOptions.var0.__val_.conn_evt_trigger_desc, (uint64_t)&self->_findeeAlgorithmAidingData.var0.__val_.measured_velocity_change.var0.__val_.applicabilityTimestamp);
  char v25 = v10;
  long long v21 = 0;
  int v22 = 0;
  if (sub_100238DD4((uint64_t)&v21, (uint64_t)&v26, (unsigned __int8 *)&v24))
  {
    sub_100004950(&__p, "Send");
    sub_100239FBC((uint64_t **)&__p, (uint64_t *)&v21);
    if (v20 < 0) {
      operator delete(__p);
    }
    unsigned __int8 v17 = 2;
    if ([(NIServerNBAMMSSession *)self _shouldEncodeSignallingDataInMessageID]) {
      unsigned __int8 v17 = [(NIServerNBAMMSSession *)self _encodeSignallingDataInMessageID:v17];
    }
    sub_1001B0664(&__p, 1uLL, &v17);
    sub_100253DF4((uint64_t)&__p, (char *)__dst, (char *)v21, v22, v22 - (unsigned char *)v21);
    __int16 v11 = +[NSData dataWithBytes:__p length:(unsigned char *)__dst - (unsigned char *)__p];
    long long v12 = [(NIServerNBAMMSSession *)self _encrypt:v11];
    __int16 v13 = v12;
    if (v12 && [v12 length])
    {
      char v15 = 0;
      sub_1001B0664(v16, (size_t)[v13 length], &v15);
      [v13 getBytes:v16[0] length:[v13 length]];
      if (os_log_type_enabled((os_log_t)qword_1008ABDE0, OS_LOG_TYPE_DEBUG)) {
        sub_100425080();
      }
      sub_1002DBB0C((uint64_t)self->_nbammsSession.__ptr_, (uint64_t *)v16);
      if (v16[0])
      {
        v16[1] = v16[0];
        operator delete(v16[0]);
      }
      BOOL v8 = 1;
    }
    else
    {
      if (os_log_type_enabled((os_log_t)qword_1008ABDE0, OS_LOG_TYPE_ERROR)) {
        sub_10042504C();
      }
      BOOL v8 = 0;
    }

    if (__p)
    {
      __dst = __p;
      operator delete(__p);
    }
  }
  else
  {
    if (os_log_type_enabled((os_log_t)qword_1008ABDE0, OS_LOG_TYPE_ERROR)) {
      sub_1004250B4();
    }
    BOOL v8 = 0;
  }
  if (v21)
  {
    int v22 = (char *)v21;
    operator delete(v21);
  }
  return v8;
}

- (void)_receivedAidingAndSignallingMessage:(const void *)a3 machAbsTimestamp:(double)a4
{
  if (os_log_type_enabled((os_log_t)qword_1008ABDE0, OS_LOG_TYPE_DEBUG)) {
    sub_10042511C();
  }
  ++*(_DWORD *)&self->_findeeAlgorithmAidingData.var0.__val_.location_data.__engaged_;
  [(NIServerNBAMMSSession *)self _logStatisticsIfNecessary];
  [(NIServerNBAMMSSession *)self _handleNonMutualAuthMessage];
  uint64_t v7 = *((void *)a3 + 1);
  BOOL v8 = (const void *)(*(void *)a3 + 1);
  long long v67 = 0;
  uint64_t v68 = 0;
  long long v66 = 0;
  sub_100253FD4(&v66, v8, v7, v7 - (void)v8);
  sub_100004950(&__p, "Receive");
  sub_100239FBC((uint64_t **)&__p, (uint64_t *)&v66);
  if (SBYTE7(v56) < 0) {
    operator delete((void *)__p);
  }
  LOBYTE(__p) = 0;
  LOBYTE(v56) = 0;
  BYTE8(v56) = 0;
  BYTE8(v59) = 0;
  LOBYTE(v60) = 0;
  LOBYTE(v62) = 0;
  LOBYTE(v65) = 0;
  WORD4(v65) = 0;
  *(void *)&long long v63 = 0;
  *((void *)&v62 + 1) = 0;
  BYTE8(v63) = 0;
  int v9 = sub_100007D00();
  BOOL v10 = sub_100005424(v9[144]);
  uint64_t v53 = 0;
  BOOL v54 = v10;
  if (sub_1002397F4((uint64_t)&v66, (uint64_t)&__p, (uint64_t)&v53))
  {
    *((double *)&v62 + 1) = a4;
    BOOL v11 = 1;
    LOBYTE(v63) = 1;
    id WeakRetained = objc_loadWeakRetained((id *)&self->_finderClient);
    __int16 v13 = WeakRetained;
    int outboundAuthState = self->_finderMutualAuthState.outboundAuthState;
    if (outboundAuthState != 1)
    {
      if (outboundAuthState != 4) {
        goto LABEL_12;
      }
      BOOL v11 = self->_finderMutualAuthState.inboundAuthState == 1;
    }
    if (v11 && WeakRetained)
    {
      char v15 = [WeakRetained clientQueue];
      block[0] = _NSConcreteStackBlock;
      block[1] = 3221225472;
      block[2] = sub_100244C40;
      block[3] = &unk_10085B870;
      id v16 = v13;
      uint64_t v51 = v53;
      BOOL v52 = v54;
      long long v48 = v63;
      long long v49 = v64;
      long long v50 = v65;
      long long v44 = v59;
      long long v45 = v60;
      long long v47 = v62;
      long long v46 = v61;
      long long v40 = __p;
      long long v41 = v56;
      long long v43 = v58;
      long long v42 = v57;
      id v38 = v16;
      long long v39 = self;
      dispatch_async(v15, block);
    }
LABEL_12:
    id v17 = objc_loadWeakRetained((id *)&self->_finderStartRangingOptions.var0.__val_.secondary_duty_cycle);

    int engaged = self->_finderStartRangingOptions.__engaged_;
    if (engaged != 1)
    {
      if (engaged != 4)
      {
LABEL_18:

        goto LABEL_21;
      }
      int engaged = LOBYTE(self->_finderMutualAuthTimer) == 1;
    }
    if (engaged && v17)
    {
      long long v19 = [v17 clientQueue];
      v21[0] = _NSConcreteStackBlock;
      v21[1] = 3221225472;
      v21[2] = sub_100244C58;
      v21[3] = &unk_10085B870;
      id v20 = v17;
      uint64_t v35 = v53;
      BOOL v36 = v54;
      long long v32 = v63;
      long long v33 = v64;
      long long v34 = v65;
      long long v28 = v59;
      long long v29 = v60;
      long long v31 = v62;
      long long v30 = v61;
      long long v24 = __p;
      long long v25 = v56;
      long long v27 = v58;
      long long v26 = v57;
      id v22 = v20;
      uint64_t v23 = self;
      dispatch_async(v19, v21);
    }
    goto LABEL_18;
  }
  if (os_log_type_enabled((os_log_t)qword_1008ABDE0, OS_LOG_TYPE_ERROR)) {
    sub_1004250E8();
  }
LABEL_21:
  if (v66)
  {
    long long v67 = v66;
    operator delete(v66);
  }
}

- (id)printableState
{
  dispatch_assert_queue_V2((dispatch_queue_t)self->_internalQueue);
  long long v3 = objc_opt_new();
  identityString = self->_identityString;
  ptr = self->_nbammsSession.__ptr_;
  uint64_t v6 = [(NIDiscoveryToken *)self->_sessionToken descriptionInternal];
  uint64_t v7 = (void *)v6;
  BOOL v8 = "NO";
  if (ptr) {
    BOOL v8 = "YES";
  }
  int v9 = +[NSString stringWithFormat:@"Name: %@. Created: %s. Creation token: %@", identityString, v8, v6];
  [v3 addObject:v9];

  if (self->_finderAttached) {
    BOOL v10 = "YES";
  }
  else {
    BOOL v10 = "NO";
  }
  id WeakRetained = objc_loadWeakRetained((id *)&self->_finderClient);
  if (WeakRetained) {
    long long v12 = "YES";
  }
  else {
    long long v12 = "NO";
  }
  __int16 v13 = [(NIDiscoveryToken *)self->_finderToken descriptionInternal];
  BOOL engaged = self->_finderStartRangingOptions.var0.__val_.dither_constant_msec.__engaged_;
  if (self->_finderStartRangingOptions.var0.__val_.dither_constant_msec.__engaged_)
  {
    sub_1002452B0(&self->_finderStartRangingOptions.var0.__val_.conn_evt_trigger_desc, &__p);
    if ((__p.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0) {
      p_p = &__p;
    }
    else {
      p_p = (std::string *)__p.__r_.__value_.__r.__words[0];
    }
  }
  else
  {
    p_p = (std::string *)"0";
  }
  id v16 = +[NSString stringWithFormat:@"    Finder attached: %s, client: %s, token: %@, signalling: %s", v10, v12, v13, p_p];
  [v3 addObject:v16];

  if (engaged && SHIBYTE(__p.__r_.__value_.__r.__words[2]) < 0) {
    operator delete(__p.__r_.__value_.__l.__data_);
  }

  if (HIBYTE(self->_finderStartRangingOptions.var0.__val_.secondary_scheduling_interval_usec.var0.__val_)) {
    id v17 = "YES";
  }
  else {
    id v17 = "NO";
  }
  id v18 = objc_loadWeakRetained((id *)&self->_finderStartRangingOptions.var0.__val_.secondary_duty_cycle);
  if (v18) {
    long long v19 = "YES";
  }
  else {
    long long v19 = "NO";
  }
  id v20 = [(NSData *)self->_findeeMutualAuthState.outboundChallenge descriptionInternal];
  int v21 = BYTE1(self->_findeeAlgorithmAidingData.var0.__val_.measured_velocity_change.var0.__val_.velocityChangeH1);
  if (BYTE1(self->_findeeAlgorithmAidingData.var0.__val_.measured_velocity_change.var0.__val_.velocityChangeH1))
  {
    sub_1002452B0(&self->_findeeAlgorithmAidingData.var0.__val_.measured_velocity_change.var0.__val_.applicabilityTimestamp, &v50);
    if ((v50.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0) {
      id v22 = &v50;
    }
    else {
      id v22 = (std::string *)v50.__r_.__value_.__r.__words[0];
    }
  }
  else
  {
    id v22 = (std::string *)"0";
  }
  uint64_t v23 = +[NSString stringWithFormat:@"    Findee attached: %s, client: %s, token: %@, signalling: %s, aiding: %d", v17, v19, v20, v22, self->_findeeAlgorithmAidingData.var0.__val_.measured_velocity_change.var0.__null_state_];
  [v3 addObject:v23];

  if (v21 && SHIBYTE(v50.__r_.__value_.__r.__words[2]) < 0) {
    operator delete(v50.__r_.__value_.__l.__data_);
  }

  long long v24 = +[NSString stringWithFormat:@"    Shared protocol: %d", self->_sharedProtocol];
  [v3 addObject:v24];

  int sessionState = self->_sessionState;
  long long v26 = "IDLE";
  if (sessionState == 1) {
    long long v26 = "ACQ";
  }
  if (sessionState == 2) {
    long long v27 = "RNG";
  }
  else {
    long long v27 = v26;
  }
  long long v28 = +[NSString stringWithFormat:@"    Session state: %s", v27];
  [v3 addObject:v28];

  long long v29 = "NO";
  if (self->_measurementsReceived) {
    long long v29 = "YES";
  }
  long long v30 = +[NSString stringWithFormat:@"    Measurements received: %s", v29];
  [v3 addObject:v30];

  long long v31 = sub_100244374(self->_cryptoSessionState);
  long long v32 = [(NIServerCryptoSession *)self->_selfEncryptionSession sessionIdentifier];
  long long v33 = CUPrintNSObjectMasked();
  long long v34 = [(NIServerCryptoSession *)self->_peerDecryptionSession sessionIdentifier];
  uint64_t v35 = CUPrintNSObjectMasked();
  BOOL v36 = +[NSString stringWithFormat:@"    Crypto state: %@. Self: %@. Peer: %@. Failures: %d", v31, v33, v35, self->_cryptoFailures];
  [v3 addObject:v36];

  uint64_t v37 = sub_10024580C(&self->_finderMutualAuthState.outboundAuthState);
  id v38 = (void *)v37;
  if (BYTE2(self->_finderStartRangingOptions.var0.__val_.secondary_scheduling_interval_usec.var0.__val_))
  {
    if (*(&self->_finderStartRangingOptions.var0.__val_.secondary_scheduling_interval_usec.var0.__null_state_ + 1)) {
      long long v39 = "S";
    }
    else {
      long long v39 = "F";
    }
  }
  else
  {
    long long v39 = "N/A";
  }
  long long v40 = "NO";
  if (self->_finderStartRangingOptions.var0.__val_.secondary_scheduling_interval_usec.var0.__null_state_) {
    long long v40 = "YES";
  }
  long long v41 = +[NSString stringWithFormat:@"    Finder mutual auth: %@, last reported state: %s, should arm timer: %s", v37, v39, v40];
  [v3 addObject:v41];

  uint64_t v42 = sub_10024580C((unsigned __int8 *)&self->_finderStartRangingOptions.__engaged_);
  long long v43 = (void *)v42;
  if (*(&self->_findeeAlgorithmAidingData.var0.__val_.measured_velocity_change.__engaged_ + 2))
  {
    if (*(&self->_findeeAlgorithmAidingData.var0.__val_.measured_velocity_change.__engaged_ + 1)) {
      long long v44 = "S";
    }
    else {
      long long v44 = "F";
    }
  }
  else
  {
    long long v44 = "N/A";
  }
  long long v45 = "NO";
  if (self->_findeeAlgorithmAidingData.var0.__val_.measured_velocity_change.__engaged_) {
    long long v45 = "YES";
  }
  long long v46 = +[NSString stringWithFormat:@"    Findee mutual auth: %@, last reported state: %s, should arm timer: %s", v42, v44, v45];
  [v3 addObject:v46];

  long long v47 = +[NSString stringWithFormat:@"    Solution count: %d successful, %d unsuccessful", LODWORD(self->_findeeAlgorithmAidingData.var0.__val_.location_data.var0.__val_.easterlyOffsetM), HIDWORD(self->_findeeAlgorithmAidingData.var0.__val_.location_data.var0.__val_.easterlyOffsetM)];
  [v3 addObject:v47];

  long long v48 = +[NSString stringWithFormat:@"    Message count: %d crypto, %d mutual auth, %d aiding/signalling", self->_findeeAlgorithmAidingData.var0.__val_.location_data.var0.__val_.uncertainty, *(&self->_findeeAlgorithmAidingData.var0.__val_.location_data.var0.__val_.uncertainty + 1), *(unsigned int *)&self->_findeeAlgorithmAidingData.var0.__val_.location_data.__engaged_];
  [v3 addObject:v48];

  return v3;
}

- (void)_serviceRequestStatusUpdate:(const ServiceRequestStatusUpdate *)a3
{
  dispatch_assert_queue_V2((dispatch_queue_t)self->_internalQueue);
  if (self->_finderAttached
    || HIBYTE(self->_finderStartRangingOptions.var0.__val_.secondary_scheduling_interval_usec.var0.__val_))
  {
    uint64_t v21 = *(void *)&a3->var0;
    int var2 = a3->var2;
    id WeakRetained = objc_loadWeakRetained((id *)&self->_finderClient);
    uint64_t v6 = WeakRetained;
    if (WeakRetained)
    {
      uint64_t v7 = [WeakRetained clientQueue];
      block[0] = _NSConcreteStackBlock;
      block[1] = 3221225472;
      block[2] = sub_100245C14;
      block[3] = &unk_10085B898;
      id v18 = self;
      uint64_t v19 = v21;
      int v20 = var2;
      id v17 = v6;
      dispatch_async(v7, block);
    }
    id v8 = objc_loadWeakRetained((id *)&self->_finderStartRangingOptions.var0.__val_.secondary_duty_cycle);

    if (v8)
    {
      int v9 = [v8 clientQueue];
      v11[0] = _NSConcreteStackBlock;
      v11[1] = 3221225472;
      v11[2] = sub_100245C28;
      v11[3] = &unk_10085B898;
      id v10 = v8;
      __int16 v13 = self;
      uint64_t v14 = v21;
      int v15 = var2;
      id v12 = v10;
      dispatch_async(v9, v11);
    }
  }
  else if (os_log_type_enabled((os_log_t)qword_1008ABDE0, OS_LOG_TYPE_ERROR))
  {
    sub_100425150();
  }
}

- (void)_didReceiveNewSolution:(const void *)a3
{
  uint64_t v3 = __chkstk_darwin(self, a2, a3);
  uint64_t v5 = v4;
  uint64_t v6 = v3;
  dispatch_assert_queue_V2(*(dispatch_queue_t *)(v3 + 8));
  sub_1001F2E48();
  if (*(unsigned char *)(v6 + 232) || *(unsigned char *)(v6 + 971))
  {
    if (!*(unsigned char *)(v6 + 200))
    {
      uint64_t v7 = qword_1008ABDE0;
      if (os_log_type_enabled((os_log_t)qword_1008ABDE0, OS_LOG_TYPE_DEFAULT))
      {
        uint64_t v8 = *(void *)(v6 + 16);
        *(_DWORD *)buf = 138412290;
        *(void *)&uint8_t buf[4] = v8;
        _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "#find-range,First NBAMMS measurement received for %@", buf, 0xCu);
      }
      *(unsigned char *)(v6 + 200) = 1;
      *(_DWORD *)(v6 + 40) = 2;
      uint64_t v9 = *(void *)(v6 + 1896);
      if (v9) {
        (*(void (**)(uint64_t, uint64_t, uint64_t))(v9 + 16))(v9, v6, 2);
      }
    }
    ++*(_DWORD *)(v6 + 1920);
    [(id)v6 _logStatisticsIfNecessary];
    long long v10 = *(_OWORD *)(v5 + 16);
    *(_OWORD *)buf = *(_OWORD *)v5;
    long long v49 = v10;
    long long v50 = *(_OWORD *)(v5 + 32);
    sub_1001751A0(v51, v5 + 48);
    sub_10016E330(v52, v5 + 608);
    sub_1001751F8(v55, (__n128 *)(v5 + 760));
    memcpy(v59, (const void *)(v5 + 880), sizeof(v59));
    id WeakRetained = objc_loadWeakRetained((id *)(v6 + 240));
    id v12 = WeakRetained;
    int v13 = *(unsigned __int8 *)(v6 + 248);
    if (v13 != 1)
    {
      if (v13 != 4) {
        goto LABEL_19;
      }
      int v13 = *(unsigned __int8 *)(v6 + 272) == 1;
    }
    if (v13 && WeakRetained)
    {
      uint64_t v14 = [WeakRetained clientQueue];
      block[0] = _NSConcreteStackBlock;
      block[1] = 3321888768;
      block[2] = sub_1002461B4;
      block[3] = &unk_10085B8C0;
      id v34 = v12;
      long long v36 = *(_OWORD *)buf;
      long long v37 = v49;
      long long v38 = v50;
      sub_1001751A0(v39, (uint64_t)v51);
      sub_10016E330(v40, (uint64_t)v52);
      sub_1001751F8(v43, v55);
      memcpy(v47, v59, sizeof(v47));
      uint64_t v35 = v6;
      dispatch_async(v14, block);

      if (v46 && __p)
      {
        long long v45 = __p;
        operator delete(__p);
      }
      if (v42) {
        sub_10003E96C((uint64_t)v41, v41[1]);
      }
      sub_10015DC28((uint64_t)v39);
    }
LABEL_19:
    id v15 = objc_loadWeakRetained((id *)(v6 + 976));

    int v16 = *(unsigned __int8 *)(v6 + 984);
    if (v16 != 1)
    {
      if (v16 != 4)
      {
LABEL_30:
        if (v58 && v56)
        {
          long long v57 = v56;
          operator delete(v56);
        }
        if (v54) {
          sub_10003E96C((uint64_t)v53, v53[1]);
        }
        sub_10015DC28((uint64_t)v51);

        return;
      }
      int v16 = *(unsigned __int8 *)(v6 + 1008) == 1;
    }
    if (v16 && v15)
    {
      id v17 = [v15 clientQueue];
      v18[0] = _NSConcreteStackBlock;
      v18[1] = 3321888768;
      v18[2] = sub_1002462D4;
      v18[3] = &unk_10085B8C0;
      id v19 = v15;
      long long v21 = *(_OWORD *)buf;
      long long v22 = v49;
      long long v23 = v50;
      sub_1001751A0(v24, (uint64_t)v51);
      sub_10016E330(v25, (uint64_t)v52);
      sub_1001751F8(v28, v55);
      memcpy(v32, v59, sizeof(v32));
      uint64_t v20 = v6;
      dispatch_async(v17, v18);

      if (v31 && v29)
      {
        long long v30 = v29;
        operator delete(v29);
      }
      if (v27) {
        sub_10003E96C((uint64_t)v26, v26[1]);
      }
      sub_10015DC28((uint64_t)v24);
    }
    goto LABEL_30;
  }
  if (os_log_type_enabled((os_log_t)qword_1008ABDE0, OS_LOG_TYPE_ERROR)) {
    sub_1004251B8();
  }
}

- (void)_didReceiveUnsuccessfulSolution:(const void *)a3
{
  uint64_t v3 = __chkstk_darwin(self, a2, a3);
  uint64_t v5 = v4;
  uint64_t v6 = v3;
  dispatch_assert_queue_V2(*(dispatch_queue_t *)(v3 + 8));
  sub_1001F2E48();
  if (*(unsigned char *)(v6 + 232) || *(unsigned char *)(v6 + 971))
  {
    ++*(_DWORD *)(v6 + 1924);
    [(id)v6 _logStatisticsIfNecessary];
    long long v7 = v5[1];
    long long v45 = *v5;
    long long v46 = v7;
    long long v47 = v5[2];
    sub_1001751A0(v48, (uint64_t)(v5 + 3));
    sub_10016E330(v49, (uint64_t)(v5 + 38));
    sub_1001751F8(v52, (__n128 *)((char *)v5 + 760));
    memcpy(v56, v5 + 55, sizeof(v56));
    id WeakRetained = objc_loadWeakRetained((id *)(v6 + 240));
    uint64_t v9 = WeakRetained;
    int v10 = *(unsigned __int8 *)(v6 + 248);
    if (v10 != 1)
    {
      if (v10 != 4) {
        goto LABEL_14;
      }
      int v10 = *(unsigned __int8 *)(v6 + 272) == 1;
    }
    if (v10 && WeakRetained)
    {
      BOOL v11 = [WeakRetained clientQueue];
      block[0] = _NSConcreteStackBlock;
      block[1] = 3321888768;
      block[2] = sub_1002467D4;
      block[3] = &unk_10085B8C0;
      id v31 = v9;
      long long v33 = v45;
      long long v34 = v46;
      long long v35 = v47;
      sub_1001751A0(v36, (uint64_t)v48);
      sub_10016E330(v37, (uint64_t)v49);
      sub_1001751F8(v40, v52);
      memcpy(v44, v56, sizeof(v44));
      uint64_t v32 = v6;
      dispatch_async(v11, block);

      if (v43 && __p)
      {
        char v42 = __p;
        operator delete(__p);
      }
      if (v39) {
        sub_10003E96C((uint64_t)v38, v38[1]);
      }
      sub_10015DC28((uint64_t)v36);
    }
LABEL_14:
    id v12 = objc_loadWeakRetained((id *)(v6 + 976));

    int v13 = *(unsigned __int8 *)(v6 + 984);
    if (v13 != 1)
    {
      if (v13 != 4)
      {
LABEL_25:
        if (v55 && v53)
        {
          char v54 = v53;
          operator delete(v53);
        }
        if (v51) {
          sub_10003E96C((uint64_t)v50, v50[1]);
        }
        sub_10015DC28((uint64_t)v48);

        return;
      }
      int v13 = *(unsigned __int8 *)(v6 + 1008) == 1;
    }
    if (v13 && v12)
    {
      uint64_t v14 = [v12 clientQueue];
      v15[0] = _NSConcreteStackBlock;
      v15[1] = 3321888768;
      v15[2] = sub_1002467E8;
      v15[3] = &unk_10085B8C0;
      id v16 = v12;
      long long v18 = v45;
      long long v19 = v46;
      long long v20 = v47;
      sub_1001751A0(v21, (uint64_t)v48);
      sub_10016E330(v22, (uint64_t)v49);
      sub_1001751F8(v25, v52);
      memcpy(v29, v56, sizeof(v29));
      uint64_t v17 = v6;
      dispatch_async(v14, v15);

      if (v28 && v26)
      {
        char v27 = v26;
        operator delete(v26);
      }
      if (v24) {
        sub_10003E96C((uint64_t)v23, v23[1]);
      }
      sub_10015DC28((uint64_t)v21);
    }
    goto LABEL_25;
  }
  if (os_log_type_enabled((os_log_t)qword_1008ABDE0, OS_LOG_TYPE_ERROR)) {
    sub_10042525C();
  }
}

- (void)_didReceivePeerData:(const void *)a3
{
  dispatch_assert_queue_V2((dispatch_queue_t)self->_internalQueue);
  sub_1001F2E48();
  if (self->_finderAttached
    || HIBYTE(self->_finderStartRangingOptions.var0.__val_.secondary_scheduling_interval_usec.var0.__val_))
  {
    uint64_t v5 = (unsigned char *)*((void *)a3 + 1);
    uint64_t v6 = *((void *)a3 + 2);
    if ((unsigned char *)v6 == v5)
    {
      if (os_log_type_enabled((os_log_t)qword_1008ABDE0, OS_LOG_TYPE_ERROR)) {
        sub_10042532C();
      }
    }
    else if (*v5)
    {
      unsigned int cryptoSessionState = self->_cryptoSessionState;
      switch(self->_cryptoSessionState)
      {
        case 0u:
          [(NIServerNBAMMSSession *)self _initializeEncryptionSessionIfNecessary];
          goto LABEL_7;
        case 1u:
LABEL_7:
          [(NIServerNBAMMSSession *)self _updateCryptoSessionConfigPayload];
          break;
        case 2u:
          self->_unsigned int cryptoSessionState = 3;
          goto LABEL_15;
        case 3u:
LABEL_15:
          uint64_t v8 = +[NSData dataWithBytes:length:](NSData, "dataWithBytes:length:");
          uint64_t v9 = [(NIServerNBAMMSSession *)self _decrypt:v8];
          int v10 = v9;
          if (v9 && [v9 length])
          {
            v17[0] = 0;
            sub_1001B0664(__p, (size_t)[v10 length], v17);
            [v10 getBytes:__p[0] length:[v10 length]];
            [(NIServerNBAMMSSession *)self _processPeerMessage:__p machAbsTimestamp:1 wasEncrypted:*((double *)a3 + 4)];
            if (__p[0])
            {
              __p[1] = __p[0];
              operator delete(__p[0]);
            }
          }
          else
          {
            BOOL v11 = (id)qword_1008ABDE0;
            if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
            {
              [(NIServerCryptoSession *)self->_peerDecryptionSession sessionIdentifier];
              objc_claimAutoreleasedReturnValue();
              sub_100425394();
            }

            [(NIServerNBAMMSSession *)self _handleCryptoFailure];
          }

          break;
        default:
          break;
      }
      if (self->_cryptoSessionState != cryptoSessionState)
      {
        id v12 = (id)qword_1008ABDE0;
        if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
        {
          int v13 = sub_100244374(cryptoSessionState);
          uint64_t v14 = sub_100244374(self->_cryptoSessionState);
          identityString = self->_identityString;
          LODWORD(__p[0]) = 138478339;
          *(void **)((char *)__p + 4) = v13;
          WORD2(__p[1]) = 2113;
          *(void **)((char *)&__p[1] + 6) = v14;
          HIWORD(__p[2]) = 2112;
          __p[3] = identityString;
          _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEFAULT, "#find-range,#crypto Session state update while receiving data. %{private}@ -> %{private}@. %@", (uint8_t *)__p, 0x20u);
        }
      }
    }
    else
    {
      memset(__p, 0, 24);
      sub_100253FD4(__p, v5 + 1, v6, v6 - (void)(v5 + 1));
      [(NIServerNBAMMSSession *)self _processPeerMessage:__p machAbsTimestamp:0 wasEncrypted:*((double *)a3 + 4)];
      if (__p[0])
      {
        __p[1] = __p[0];
        operator delete(__p[0]);
      }
    }
  }
  else if (os_log_type_enabled((os_log_t)qword_1008ABDE0, OS_LOG_TYPE_ERROR))
  {
    sub_1004252C4();
  }
}

- (void)_processPeerMessage:(void *)a3 machAbsTimestamp:(double)a4 wasEncrypted:(BOOL)a5
{
  if (*((void *)a3 + 1) != *(void *)a3)
  {
    BOOL v6 = a5;
    int v9 = **(unsigned __int8 **)a3;
    memset(&v61[7], 0, 17);
    int v10 = sub_100007D00();
    BOOL v11 = sub_100005424(v10[144]);
    if ((v9 & 0x10) != 0)
    {
      uint64_t v24 = 0x10100000000;
    }
    else
    {
      if ((v9 & 0x18) == 0) {
        goto LABEL_21;
      }
      uint64_t v24 = 0;
    }
    uint64_t v12 = (v9 << 28 >> 31) & 0x101;
    id WeakRetained = objc_loadWeakRetained((id *)&self->_finderClient);
    uint64_t v14 = WeakRetained;
    int outboundAuthState = self->_finderMutualAuthState.outboundAuthState;
    if (outboundAuthState != 1)
    {
      if (outboundAuthState != 4) {
        goto LABEL_14;
      }
      int outboundAuthState = self->_finderMutualAuthState.inboundAuthState == 1;
    }
    if (outboundAuthState && WeakRetained)
    {
      id v16 = [WeakRetained clientQueue];
      block[0] = _NSConcreteStackBlock;
      block[1] = 3221225472;
      block[2] = sub_100246FD0;
      block[3] = &unk_10085B870;
      uint64_t v50 = *(void *)&v61[16];
      uint64_t v53 = v24 | (v12 << 16);
      char v43 = 0;
      char v44 = 0;
      char v45 = 0;
      char v46 = 0;
      char v47 = 0;
      char v48 = 0;
      long long v49 = *(_OWORD *)v61;
      char v51 = 0;
      __int16 v52 = 0;
      BOOL v54 = v11;
      id v41 = v14;
      char v42 = self;
      dispatch_async(v16, block);
    }
LABEL_14:
    id v17 = objc_loadWeakRetained((id *)&self->_finderStartRangingOptions.var0.__val_.secondary_duty_cycle);

    int engaged = self->_finderStartRangingOptions.__engaged_;
    if (engaged != 1)
    {
      if (engaged != 4)
      {
LABEL_20:

LABEL_21:
        **(unsigned char **)a3 &= 7u;
        if ((v9 & 7) == 2)
        {
          if (v6)
          {
            [(NIServerNBAMMSSession *)self _receivedAidingAndSignallingMessage:a3 machAbsTimestamp:a4];
            goto LABEL_32;
          }
        }
        else if ((v9 & 7) == 1)
        {
          if (v6)
          {
            [(NIServerNBAMMSSession *)self _receivedMutualAuthMessage:a3];
            goto LABEL_32;
          }
        }
        else if ((v9 & 7) == 0 && !v6)
        {
          [(NIServerNBAMMSSession *)self _receivedCryptoSessionConfigMessage:a3];
LABEL_32:
          [(NIServerNBAMMSSession *)self _updateSessionPayload];
          return;
        }
        long long v21 = qword_1008ABDE0;
        if (os_log_type_enabled((os_log_t)qword_1008ABDE0, OS_LOG_TYPE_ERROR))
        {
          int v22 = **(unsigned __int8 **)a3;
          identityString = self->_identityString;
          *(_DWORD *)buf = 67109634;
          int v56 = v22;
          __int16 v57 = 1024;
          BOOL v58 = v6;
          __int16 v59 = 2112;
          long long v60 = identityString;
          _os_log_error_impl((void *)&_mh_execute_header, v21, OS_LOG_TYPE_ERROR, "#find-range,Unrecognized message ID %d. Was encrypted: %d. %@", buf, 0x18u);
        }
        goto LABEL_32;
      }
      int engaged = LOBYTE(self->_finderMutualAuthTimer) == 1;
    }
    if (engaged && v17)
    {
      long long v19 = [v17 clientQueue];
      v25[0] = _NSConcreteStackBlock;
      v25[1] = 3221225472;
      v25[2] = sub_100246FE8;
      v25[3] = &unk_10085B870;
      id v20 = v17;
      uint64_t v35 = *(void *)&v61[16];
      char v28 = 0;
      char v29 = 0;
      char v30 = 0;
      char v31 = 0;
      char v32 = 0;
      char v33 = 0;
      long long v34 = *(_OWORD *)v61;
      char v36 = 0;
      __int16 v37 = 0;
      uint64_t v38 = v24 | (v12 << 16);
      BOOL v39 = v11;
      id v26 = v20;
      char v27 = self;
      dispatch_async(v19, v25);
    }
    goto LABEL_20;
  }
  if (os_log_type_enabled((os_log_t)qword_1008ABDE0, OS_LOG_TYPE_ERROR)) {
    sub_1004253D8();
  }
}

- (void)_didReceiveInvalidation:(int)a3
{
  dispatch_assert_queue_V2((dispatch_queue_t)self->_internalQueue);
  if (self->_finderAttached
    || HIBYTE(self->_finderStartRangingOptions.var0.__val_.secondary_scheduling_interval_usec.var0.__val_))
  {
    id WeakRetained = objc_loadWeakRetained((id *)&self->_finderClient);
    BOOL v6 = WeakRetained;
    if (WeakRetained)
    {
      long long v7 = [WeakRetained clientQueue];
      block[0] = _NSConcreteStackBlock;
      block[1] = 3221225472;
      block[2] = sub_1002471A8;
      block[3] = &unk_10085B8F8;
      int v17 = a3;
      id v15 = v6;
      id v16 = self;
      dispatch_async(v7, block);
    }
    id v8 = objc_loadWeakRetained((id *)&self->_finderStartRangingOptions.var0.__val_.secondary_duty_cycle);

    if (v8)
    {
      int v9 = [v8 clientQueue];
      v10[0] = _NSConcreteStackBlock;
      v10[1] = 3221225472;
      v10[2] = sub_1002471BC;
      v10[3] = &unk_10085B8F8;
      int v13 = a3;
      id v11 = v8;
      uint64_t v12 = self;
      dispatch_async(v9, v10);
    }
  }
  else if (os_log_type_enabled((os_log_t)qword_1008ABDE0, OS_LOG_TYPE_ERROR))
  {
    sub_100425440();
  }
}

- (BOOL)_validateTokensAndRangingParameters
{
  finderToken = self->_finderToken;
  if (finderToken && self->_findeeMutualAuthState.outboundChallenge)
  {
    uint64_t v4 = [(NIDiscoveryToken *)finderToken getIRK];
    uint64_t v5 = [(NSData *)self->_findeeMutualAuthState.outboundChallenge getIRK];
    if ([v4 length] == (id)16
      && [v5 length] == (id)16
      && ![v4 isEqualToData:v5])
    {
      if (self->_finderRoseServiceRequest.var0.__val_.range_enable_params.nbamms.mms_pkt_type.__engaged_
        && self->_findeeRoseServiceRequest.var0.__val_.range_enable_params.fira.local_addr.__engaged_)
      {
        if (LOBYTE(self->_finderStartRangingOptions.var0.__val_.scheduling_interval_usec)
          && self->_findeeStartRangingOptions.var0.__val_.peer.var0.__val_.uuid.var0.__val_.__elems_[12])
        {
          BOOL v7 = 1;
          goto LABEL_10;
        }
        if (os_log_type_enabled((os_log_t)qword_1008ABDE0, OS_LOG_TYPE_ERROR)) {
          sub_10042555C();
        }
      }
      else if (os_log_type_enabled((os_log_t)qword_1008ABDE0, OS_LOG_TYPE_ERROR))
      {
        sub_1004254A8();
      }
    }
    else
    {
      BOOL v6 = (id)qword_1008ABDE0;
      if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
      {
        identityString = self->_identityString;
        int v13 = [(NIDiscoveryToken *)self->_finderToken descriptionInternal];
        uint64_t v14 = [(NSData *)self->_findeeMutualAuthState.outboundChallenge descriptionInternal];
        int v15 = 138412802;
        id v16 = identityString;
        __int16 v17 = 2112;
        long long v18 = v13;
        __int16 v19 = 2112;
        id v20 = v14;
        _os_log_error_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_ERROR, "#find-range,Finder or findee token of %@ has invalid length or they have equal IRKs, finder: %@, findee: %@", (uint8_t *)&v15, 0x20u);
      }
    }
    BOOL v7 = 0;
LABEL_10:

    goto LABEL_14;
  }
  uint64_t v4 = (id)qword_1008ABDE0;
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
  {
    int v9 = self->_identityString;
    int v10 = [(NIDiscoveryToken *)self->_finderToken descriptionInternal];
    id v11 = [(NSData *)self->_findeeMutualAuthState.outboundChallenge descriptionInternal];
    int v15 = 138412802;
    id v16 = v9;
    __int16 v17 = 2112;
    long long v18 = v10;
    __int16 v19 = 2112;
    id v20 = v11;
    _os_log_error_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_ERROR, "#find-range,One or both tokens for %@ are nil - finder: %@, findee: %@", (uint8_t *)&v15, 0x20u);
  }
  BOOL v7 = 0;
LABEL_14:

  return v7;
}

- (BOOL)_shouldUseFinderToken:(id)a3 findeeToken:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  BOOL v7 = v6;
  if (!v5)
  {
    uint64_t v12 = "finderToken != nil";
    int v13 = 1961;
    goto LABEL_9;
  }
  if (!v6)
  {
    uint64_t v12 = "findeeToken != nil";
    int v13 = 1962;
LABEL_9:
    __assert_rtn("-[NIServerNBAMMSSession _shouldUseFinderToken:findeeToken:]", "NIServerFindingRanging.mm", v13, v12);
  }
  id v8 = [v5 getIRK];
  int v9 = [v7 getIRK];
  unint64_t v16 = 0;
  unint64_t v17 = 0;
  unint64_t v14 = 0;
  unint64_t v15 = 0;
  [v8 getBytes:&v16 range:0];
  [v8 getBytes:&v17 range:8];
  [v9 getBytes:&v14 range:0, 8];
  [v9 getBytes:&v15 range:8];
  if (v17 == v15) {
    BOOL v10 = v16 > v14;
  }
  else {
    BOOL v10 = v17 > v15;
  }

  return v10;
}

- (shared_ptr<rose::objects::NBAMMSSession>)_buildNbammsSession:(const void *)a3
{
  id v6 = v3;
  BOOL v7 = (std::string *)sub_100004950(&buf, (char *)[(NSString *)self->_identityString UTF8String]);
  id v8 = std::string::insert(v7, 0, "Finding.");
  long long v9 = *(_OWORD *)&v8->__r_.__value_.__l.__data_;
  std::string::size_type v26 = v8->__r_.__value_.__r.__words[2];
  *(_OWORD *)std::string __p = v9;
  v8->__r_.__value_.__l.__size_ = 0;
  v8->__r_.__value_.__r.__words[2] = 0;
  v8->__r_.__value_.__r.__words[0] = 0;
  if (v44 < 0) {
    operator delete((void *)buf);
  }
  BOOL v10 = self;
  id v11 = operator new(0x5D8uLL);
  v11[1] = 0;
  v11[2] = 0;
  *id v11 = off_10085BA60;
  uint64_t v12 = (uint64_t)(v11 + 3);
  int v13 = v10;
  *(void *)&long long buf = off_10085BAB0;
  *((void *)&buf + 1) = v13;
  p_long long buf = &buf;
  long long v40 = off_10085BB30;
  id v41 = v13;
  char v42 = &v40;
  __int16 v37 = off_10085BBB0;
  uint64_t v38 = v41;
  BOOL v39 = &v37;
  long long v34 = off_10085BC30;
  uint64_t v35 = v38;
  char v36 = &v34;
  unint64_t v14 = v35;
  v33[0] = off_10085BCB0;
  v33[1] = v14;
  v33[3] = v33;
  v32[3] = 0;
  v31[3] = 0;
  v30[3] = 0;
  v29[3] = 0;
  cntrl = (std::__shared_weak_count *)v14->_pbLogger.__cntrl_;
  ptr = v10->_pbLogger.__ptr_;
  char v28 = cntrl;
  if (cntrl) {
    atomic_fetch_add_explicit(&cntrl->__shared_owners_, 1uLL, memory_order_relaxed);
  }
  sub_1002D7C48(v12, (long long *)__p, (void *)a3, (uint64_t)&buf, (uint64_t)&v40, (uint64_t)&v37, (uint64_t)&v34, (uint64_t)v33, (uint64_t)v32, (uint64_t)v31, (uint64_t)v30, (uint64_t)v29, &ptr);
  v11[3] = &off_10085BD30;
  void v11[4] = off_10085BDF8;
  if (v28) {
    sub_10001A970(v28);
  }
  sub_1001E1150(v29);
  sub_1001D2B78(v30);
  sub_1001D2BFC(v31);
  sub_1001E11D4(v32);
  sub_1001E1258(v33);
  sub_1001D2C80(&v34);
  sub_1001E12DC(&v37);
  sub_1001E1258(&v40);
  sub_1001D2D04(&buf);
  *(void *)&long long v24 = v11 + 3;
  *((void *)&v24 + 1) = v11;
  sub_10001ABCC((uint64_t)&v24, v11 + 5, v12);
  unint64_t v16 = qword_1008ABDE0;
  if (os_log_type_enabled((os_log_t)qword_1008ABDE0, OS_LOG_TYPE_DEFAULT))
  {
    identityString = self->_identityString;
    LODWORD(buf) = 138412290;
    *(void *)((char *)&buf + 4) = identityString;
    _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_DEFAULT, "#find-range,Initialize NBAMMS session for %@.", (uint8_t *)&buf, 0xCu);
  }
  if ((void)v24)
  {
    int v18 = sub_1002D85F4(v24);
    if (v18)
    {
      __int16 v19 = (id)qword_1008ABDE0;
      if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
      {
        sub_1002DE064(v18, &buf);
        sub_100425614();
      }
    }
    else
    {
      long long *v6 = v24;
      id v6 = &v24;
    }
  }
  else
  {
    id v20 = qword_1008ABDE0;
    if (os_log_type_enabled((os_log_t)qword_1008ABDE0, OS_LOG_TYPE_DEFAULT))
    {
      long long v21 = self->_identityString;
      LODWORD(buf) = 138412290;
      *(void *)((char *)&buf + 4) = v21;
      _os_log_impl((void *)&_mh_execute_header, v20, OS_LOG_TYPE_DEFAULT, "#find-range,Failed to create a NBAMMS session for %@.", (uint8_t *)&buf, 0xCu);
    }
  }
  *(void *)id v6 = 0;
  *((void *)v6 + 1) = 0;
  if (*((void *)&v24 + 1)) {
    sub_10001A970(*((std::__shared_weak_count **)&v24 + 1));
  }

  if (SHIBYTE(v26) < 0) {
    operator delete(__p[0]);
  }
  result.__cntrl_ = v23;
  result.__ptr_ = v22;
  return result;
}

- (id)_getState
{
  identityString = self->_identityString;
  uint64_t v4 = "NO";
  if (self->_nbammsSession.__ptr_) {
    id v5 = "YES";
  }
  else {
    id v5 = "NO";
  }
  id v6 = [(NIDiscoveryToken *)self->_sessionToken descriptionInternal];
  if (self->_finderAttached) {
    BOOL v7 = "YES";
  }
  else {
    BOOL v7 = "NO";
  }
  id v8 = [(NIDiscoveryToken *)self->_finderToken descriptionInternal];
  long long v9 = sub_10024580C(&self->_finderMutualAuthState.outboundAuthState);
  if (HIBYTE(self->_finderStartRangingOptions.var0.__val_.secondary_scheduling_interval_usec.var0.__val_)) {
    uint64_t v4 = "YES";
  }
  BOOL v10 = [(NSData *)self->_findeeMutualAuthState.outboundChallenge descriptionInternal];
  id v11 = sub_10024580C((unsigned __int8 *)&self->_finderStartRangingOptions.__engaged_);
  uint64_t v12 = +[NSString stringWithFormat:@"%@: %s, token: %@. Finder: %s, token: %@, authState: %@. Findee: %s, token: %@, authState: %@", identityString, v5, v6, v7, v8, v9, v4, v10, v11];

  return v12;
}

- (void)_logStatisticsIfNecessary
{
  double v3 = sub_100006C38();
  if (v3 - self->_findeeAlgorithmAidingData.var0.__val_.location_data.var0.__val_.northerlyOffsetM > 5.0)
  {
    uint64_t v4 = qword_1008ABDE0;
    if (os_log_type_enabled((os_log_t)qword_1008ABDE0, OS_LOG_TYPE_DEFAULT))
    {
      identityString = self->_identityString;
      int easterlyOffsetM_low = LODWORD(self->_findeeAlgorithmAidingData.var0.__val_.location_data.var0.__val_.easterlyOffsetM);
      int easterlyOffsetM_high = HIDWORD(self->_findeeAlgorithmAidingData.var0.__val_.location_data.var0.__val_.easterlyOffsetM);
      unsigned int uncertainty = self->_findeeAlgorithmAidingData.var0.__val_.location_data.var0.__val_.uncertainty;
      int v9 = *(&self->_findeeAlgorithmAidingData.var0.__val_.location_data.var0.__val_.uncertainty + 1);
      int v10 = *(_DWORD *)&self->_findeeAlgorithmAidingData.var0.__val_.location_data.__engaged_;
      int v11 = 138413570;
      uint64_t v12 = identityString;
      __int16 v13 = 1024;
      int v14 = easterlyOffsetM_low;
      __int16 v15 = 1024;
      int v16 = easterlyOffsetM_high;
      __int16 v17 = 1024;
      unsigned int v18 = uncertainty;
      __int16 v19 = 1024;
      int v20 = v9;
      __int16 v21 = 1024;
      int v22 = v10;
      _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "#find-range,%@, Solution count: %d successful, %d unsuccessful. Message count: %d crypto, %d mutual auth, %d aiding/signalling", (uint8_t *)&v11, 0x2Au);
    }
    self->_findeeAlgorithmAidingData.var0.__val_.location_data.var0.__val_.northerlyOffsetM = v3;
  }
}

- (void)_resetStatistics
{
  *(_DWORD *)&self->_findeeAlgorithmAidingData.var0.__val_.location_data.__engaged_ = 0;
  *(void *)&self->_findeeAlgorithmAidingData.var0.__val_.location_data.var0.__val_.unsigned int uncertainty = 0;
  *(_OWORD *)&self->_findeeAlgorithmAidingData.var0.__val_.location_data.var0.__null_state_ = 0u;
}

- (BOOL)_shouldEncodeSignallingDataInMessageID
{
  return self->_sharedProtocol > 0;
}

- (unsigned)_encodeSignallingDataInMessageID:(unsigned __int8)a3
{
  id v5 = sub_100007D00();
  sub_100005424(v5[144]);
  unint64_t v6 = sub_100244730((uint64_t)&self->_finderStartRangingOptions.var0.__val_.conn_evt_trigger_desc, (uint64_t)&self->_findeeAlgorithmAidingData.var0.__val_.measured_velocity_change.var0.__val_.applicabilityTimestamp);
  BOOL v7 = (v6 & 0xFF0000) == 0 || (v6 & 0xFF000000) == 0;
  unsigned __int8 v8 = a3 | 8;
  if (v7) {
    unsigned __int8 v8 = a3;
  }
  if ((v6 & 0xFF00000000) == 0 || (v6 & 0xFF0000000000) == 0) {
    return v8;
  }
  else {
    return v8 | 0x10;
  }
}

- (void)_updateCryptoSessionConfigPayload
{
  if (self->_nbammsSession.__ptr_)
  {
    [(NIServerNBAMMSSession *)self _initializeEncryptionSessionIfNecessary];
    unsigned __int8 cryptoSessionState = self->_cryptoSessionState;
    uint64_t v4 = [(NIServerCryptoSession *)self->_selfEncryptionSession sessionIdentifier];
    unsigned __int8 v5 = [v4 length];

    unint64_t v6 = [(NIServerCryptoSession *)self->_selfEncryptionSession sessionIdentifier];
    char v15 = 0;
    sub_1001B0664(&__p, (size_t)[v6 length] + 8, &v15);

    *(unsigned char *)std::string __p = 0;
    BOOL v7 = __p;
    *((unsigned char *)__p + 1) = 0;
    v7[2] = cryptoSessionState;
    v7[3] = v5;
    *((_DWORD *)v7 + 1) = 0;
    unsigned __int8 v8 = (char *)__p;
    id v9 = [(NIServerCryptoSession *)self->_selfEncryptionSession sessionIdentifier];
    id v10 = [v9 bytes];
    int v11 = [(NIServerCryptoSession *)self->_selfEncryptionSession sessionIdentifier];
    memcpy(v8 + 8, v10, (size_t)[v11 length]);

    uint64_t v12 = [(NIServerCryptoSession *)self->_selfEncryptionSession sessionIdentifier];
    __int16 v13 = (char *)[v12 length] + 8;

    if (v13 != (char *)(v17 - (unsigned char *)__p)) {
      __assert_rtn("-[NIServerNBAMMSSession _updateCryptoSessionConfigPayload]", "NIServerFindingRanging.mm", 2128, "byteOffset == payload.size()");
    }
    if (*((unsigned char *)__p + 1)) {
      __assert_rtn("-[NIServerNBAMMSSession _updateCryptoSessionConfigPayload]", "NIServerFindingRanging.mm", 2132, "payload[kMessageIDIndex] == static_cast<uint8_t>(FindingMessageID::CryptoSessionConfig)");
    }
    if ([(NIServerNBAMMSSession *)self _shouldEncodeSignallingDataInMessageID])
    {
      unsigned __int8 v14 = [(NIServerNBAMMSSession *)self _encodeSignallingDataInMessageID:*((unsigned __int8 *)__p + 1)];
      *((unsigned char *)__p + 1) = v14;
    }
    if (os_log_type_enabled((os_log_t)qword_1008ABDE0, OS_LOG_TYPE_DEBUG)) {
      sub_100425664();
    }
    sub_1002DBB0C((uint64_t)self->_nbammsSession.__ptr_, (uint64_t *)&__p);
    if (__p)
    {
      __int16 v17 = __p;
      operator delete(__p);
    }
  }
}

- (void)_receivedCryptoSessionConfigMessage:(const void *)a3
{
  if (os_log_type_enabled((os_log_t)qword_1008ABDE0, OS_LOG_TYPE_DEBUG)) {
    sub_100425698();
  }
  ++self->_findeeAlgorithmAidingData.var0.__val_.location_data.var0.__val_.uncertainty;
  [(NIServerNBAMMSSession *)self _logStatisticsIfNecessary];
  uint64_t v5 = *(void *)a3;
  unint64_t v6 = *((void *)a3 + 1) - *(void *)a3;
  if (v6 <= 6)
  {
    uint64_t v7 = qword_1008ABDE0;
    if (os_log_type_enabled((os_log_t)qword_1008ABDE0, OS_LOG_TYPE_ERROR))
    {
      int v8 = *((_DWORD *)a3 + 2) - *(_DWORD *)a3;
      identityString = self->_identityString;
      int v39 = 67109378;
      *(_DWORD *)long long v40 = v8;
      *(_WORD *)&__n128 v40[4] = 2112;
      *(void *)&v40[6] = identityString;
      id v10 = "#find-range,#crypto Invalid peer session config message size %d, %@";
      int v11 = v7;
      uint32_t v12 = 18;
LABEL_12:
      _os_log_error_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_ERROR, v10, (uint8_t *)&v39, v12);
      return;
    }
    return;
  }
  uint64_t v13 = *(unsigned __int8 *)(v5 + 2);
  if (*(unsigned char *)(v5 + 2)) {
    BOOL v14 = v6 >= v13 + 7;
  }
  else {
    BOOL v14 = 0;
  }
  if (v14)
  {
    unsigned int v18 = *(unsigned __int8 *)(v5 + 1);
    __int16 v19 = +[NSData dataWithBytes:v5 + 7 length:*(unsigned __int8 *)(v5 + 2)];
    int v20 = [(NIServerCryptoSession *)self->_peerDecryptionSession sessionIdentifier];
    unsigned __int8 v21 = [v19 isEqualToData:v20];

    if ((v21 & 1) == 0)
    {
      int v22 = (id)qword_1008ABDE0;
      if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
      {
        long long v23 = [(NIServerCryptoSession *)self->_peerDecryptionSession sessionIdentifier];
        CUPrintNSObjectMasked();
        id v24 = (id)objc_claimAutoreleasedReturnValue();
        long long v25 = CUPrintNSObjectMasked();
        std::string::size_type v26 = [(NIDiscoveryToken *)self->_sessionToken descriptionInternal];
        char v27 = self->_identityString;
        int v39 = 138478595;
        *(void *)long long v40 = v24;
        *(_WORD *)&v40[8] = 2113;
        *(void *)&v40[10] = v25;
        *(_WORD *)&v40[18] = 2113;
        id v41 = v26;
        __int16 v42 = 2112;
        char v43 = v27;
        _os_log_impl((void *)&_mh_execute_header, v22, OS_LOG_TYPE_DEFAULT, "#find-range,#crypto Init peer session. Old ID: %{private}@. New ID: %{private}@. Token: %{private}@, %@", (uint8_t *)&v39, 0x2Au);
      }
      char v28 = [NIServerCryptoSession alloc];
      char v29 = [(NIDiscoveryToken *)self->_sessionToken getIRK];
      char v30 = [(NIServerCryptoSession *)v28 initWithKeyDerivationKey:v29 sessionIdentifier:v19 encrypt:0];
      peerDecryptionSession = self->_peerDecryptionSession;
      self->_peerDecryptionSession = v30;
    }
    unsigned int cryptoSessionState = self->_cryptoSessionState;
    [(NIServerNBAMMSSession *)self _initializeEncryptionSessionIfNecessary];
    int v33 = 2;
    self->_unsigned int cryptoSessionState = 2;
    if (v18 == 2)
    {
      if (!cryptoSessionState) {
        goto LABEL_20;
      }
    }
    else if (v18 != 3)
    {
LABEL_20:
      if (v33 != cryptoSessionState)
      {
        long long v34 = (id)qword_1008ABDE0;
        if (os_log_type_enabled(v34, OS_LOG_TYPE_DEFAULT))
        {
          sub_100244374(v18);
          id v35 = (id)objc_claimAutoreleasedReturnValue();
          char v36 = sub_100244374(cryptoSessionState);
          __int16 v37 = sub_100244374(self->_cryptoSessionState);
          uint64_t v38 = self->_identityString;
          int v39 = 138478595;
          *(void *)long long v40 = v35;
          *(_WORD *)&v40[8] = 2113;
          *(void *)&v40[10] = v36;
          *(_WORD *)&v40[18] = 2113;
          id v41 = v37;
          __int16 v42 = 2112;
          char v43 = v38;
          _os_log_impl((void *)&_mh_execute_header, v34, OS_LOG_TYPE_DEFAULT, "#find-range,#crypto Session state update while receiving peer config [peer state %{private}@]. %{private}@ -> %{private}@. %@", (uint8_t *)&v39, 0x2Au);
        }
      }

      return;
    }
    int v33 = 3;
    self->_unsigned int cryptoSessionState = 3;
    goto LABEL_20;
  }
  uint64_t v15 = qword_1008ABDE0;
  if (os_log_type_enabled((os_log_t)qword_1008ABDE0, OS_LOG_TYPE_ERROR))
  {
    int v16 = *((_DWORD *)a3 + 2) - *(_DWORD *)a3;
    __int16 v17 = self->_identityString;
    int v39 = 67109634;
    *(_DWORD *)long long v40 = v13;
    *(_WORD *)&__n128 v40[4] = 1024;
    *(_DWORD *)&v40[6] = v16;
    *(_WORD *)&v40[10] = 2112;
    *(void *)&v40[12] = v17;
    id v10 = "#find-range,#crypto Invalid peer session ID size %d (config message size %d), %@";
    int v11 = v15;
    uint32_t v12 = 24;
    goto LABEL_12;
  }
}

- (void)_initializeEncryptionSessionIfNecessary
{
  if (!self->_cryptoSessionState)
  {
    double v3 = NSRandomData();
    uint64_t v4 = (id)qword_1008ABDE0;
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v5 = CUPrintNSObjectMasked();
      unint64_t v6 = [(NIDiscoveryToken *)self->_sessionToken descriptionInternal];
      identityString = self->_identityString;
      int v12 = 138478339;
      uint64_t v13 = v5;
      __int16 v14 = 2113;
      uint64_t v15 = v6;
      __int16 v16 = 2112;
      __int16 v17 = identityString;
      _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "#find-range,#crypto Init self session. ID: %{private}@. Token: %{private}@. %@", (uint8_t *)&v12, 0x20u);
    }
    int v8 = [NIServerCryptoSession alloc];
    id v9 = [(NIDiscoveryToken *)self->_sessionToken getIRK];
    id v10 = [(NIServerCryptoSession *)v8 initWithKeyDerivationKey:v9 sessionIdentifier:v3 encrypt:1];
    selfEncryptionSession = self->_selfEncryptionSession;
    self->_selfEncryptionSession = v10;

    self->_unsigned int cryptoSessionState = 1;
  }
}

- (id)_encrypt:(id)a3
{
  id v4 = a3;
  if ([(NIServerNBAMMSSession *)self _isCryptoDisabled])
  {
    id v5 = v4;
  }
  else
  {
    id v5 = [(NIServerCryptoSession *)self->_selfEncryptionSession encrypt:v4];
  }
  unint64_t v6 = v5;

  return v6;
}

- (id)_decrypt:(id)a3
{
  id v4 = a3;
  if ([(NIServerNBAMMSSession *)self _isCryptoDisabled])
  {
    id v5 = v4;
  }
  else
  {
    id v5 = [(NIServerCryptoSession *)self->_peerDecryptionSession decrypt:v4];
  }
  unint64_t v6 = v5;

  return v6;
}

- (void)_resetCryptoStateIncludingFailures:(BOOL)a3
{
  BOOL v3 = a3;
  id v5 = qword_1008ABDE0;
  if (os_log_type_enabled((os_log_t)qword_1008ABDE0, OS_LOG_TYPE_DEFAULT))
  {
    int cryptoFailures = self->_cryptoFailures;
    identityString = self->_identityString;
    v11[0] = 67240706;
    v11[1] = cryptoFailures;
    __int16 v12 = 1026;
    BOOL v13 = v3;
    __int16 v14 = 2112;
    uint64_t v15 = identityString;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "#find-range,#crypto Reset state. Failures: %{public}d. Reset: %{public}d, %@", (uint8_t *)v11, 0x18u);
  }
  selfEncryptionSession = self->_selfEncryptionSession;
  self->_selfEncryptionSession = 0;

  peerDecryptionSession = self->_peerDecryptionSession;
  self->_peerDecryptionSession = 0;

  if ([(NIServerNBAMMSSession *)self _isCryptoDisabled]) {
    unsigned __int8 v10 = 3;
  }
  else {
    unsigned __int8 v10 = 0;
  }
  self->_unsigned int cryptoSessionState = v10;
  if (v3) {
    self->_int cryptoFailures = 0;
  }
}

- (void)_handleCryptoFailure
{
  [(NIServerNBAMMSSession *)self _resetCryptoStateIncludingFailures:0];
  sub_100242058((uint64_t)&self->_finderMutualAuthState);
  sub_100242058((uint64_t)&self->_finderStartRangingOptions.__engaged_);
  [(NIServerNBAMMSSession *)self _initializeEncryptionSessionIfNecessary];
  [(NIServerNBAMMSSession *)self _updateCryptoSessionConfigPayload];
  int cryptoFailures = self->_cryptoFailures;
  self->_int cryptoFailures = cryptoFailures + 1;
  if (cryptoFailures >= 10)
  {
    id WeakRetained = objc_loadWeakRetained((id *)&self->_finderClient);
    id v5 = WeakRetained;
    if (WeakRetained)
    {
      unint64_t v6 = [WeakRetained clientQueue];
      block[0] = _NSConcreteStackBlock;
      block[1] = 3221225472;
      block[2] = sub_1002489EC;
      block[3] = &unk_100846588;
      id v13 = v5;
      __int16 v14 = self;
      dispatch_async(v6, block);
    }
    id v7 = objc_loadWeakRetained((id *)&self->_finderStartRangingOptions.var0.__val_.secondary_duty_cycle);

    if (v7)
    {
      int v8 = [v7 clientQueue];
      v9[0] = _NSConcreteStackBlock;
      v9[1] = 3221225472;
      v9[2] = sub_1002489FC;
      v9[3] = &unk_100846588;
      id v10 = v7;
      int v11 = self;
      dispatch_async(v8, v9);
    }
  }
}

- (BOOL)_isCryptoDisabled
{
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100248A9C;
  block[3] = &unk_1008473B0;
  void block[4] = self;
  if (qword_1008A5BA8 != -1) {
    dispatch_once(&qword_1008A5BA8, block);
  }
  return byte_1008A5BB0;
}

- (BOOL)_shouldSendMutualAuthMessage
{
  BOOL finderAttached = self->_finderAttached;
  if (finderAttached)
  {
    int outboundAuthState = self->_finderMutualAuthState.outboundAuthState;
    BOOL finderAttached = outboundAuthState != 1
                  && (outboundAuthState != 4 || self->_finderMutualAuthState.inboundAuthState != 1);
  }
  char val_high = HIBYTE(self->_finderStartRangingOptions.var0.__val_.secondary_scheduling_interval_usec.var0.__val_);
  if (val_high)
  {
    int engaged = self->_finderStartRangingOptions.__engaged_;
    char val_high = engaged != 1 && (engaged != 4 || LOBYTE(self->_finderMutualAuthTimer) != 1);
  }
  return finderAttached | val_high;
}

- (void)_handleNonMutualAuthMessage
{
  [(NIServerNBAMMSSession *)self _processNonMutualAuthMessageForFinder:1];
  [(NIServerNBAMMSSession *)self _processNonMutualAuthMessageForFinder:0];

  [(NIServerNBAMMSSession *)self _reportMutualAuthStates];
}

- (void)_processNonMutualAuthMessageForFinder:(BOOL)a3
{
  uint64_t v3 = 971;
  if (a3) {
    uint64_t v3 = 232;
  }
  if (*((unsigned char *)&self->super.isa + v3))
  {
    BOOL v4 = a3;
    uint64_t v6 = 984;
    if (a3) {
      uint64_t v6 = 248;
    }
    id v7 = (char *)self + v6;
    int v8 = *((unsigned __int8 *)&self->super.isa + v6);
    if (v8 != 1)
    {
      if (v8 == 4)
      {
        int v9 = v7[24];
        if (v9 == 1) {
          return;
        }
      }
      else if (v8 == 3)
      {
        int v9 = v7[24];
        if (v9 == 1)
        {
          id v10 = (id)qword_1008ABDE0;
          if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
          {
            int v11 = sub_1002E0FBC(v4);
            identityString = self->_identityString;
            int v18 = 136315394;
            __int16 v19 = v11;
            __int16 v20 = 2112;
            unsigned __int8 v21 = identityString;
            _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "#find-range,#auth Non-auth message. Self [%s] outbound response accepted. %@", (uint8_t *)&v18, 0x16u);
          }

          char *v7 = 4;
          return;
        }
      }
      else
      {
        if ((v8 - 5) < 2) {
          return;
        }
        int v9 = v7[24];
      }
      if (v9 != 2)
      {
        int v13 = *((_DWORD *)v7 + 12);
        *((_DWORD *)v7 + 12) = v13 + 1;
        if (v13 >= 50) {
          char *v7 = 6;
        }
        __int16 v14 = (id)qword_1008ABDE0;
        if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
        {
          uint64_t v15 = sub_1002E0FBC(v4);
          sub_10024580C((unsigned __int8 *)v7);
          __int16 v16 = (NSString *)objc_claimAutoreleasedReturnValue();
          __int16 v17 = self->_identityString;
          int v18 = 136315650;
          __int16 v19 = v15;
          __int16 v20 = 2112;
          unsigned __int8 v21 = v16;
          __int16 v22 = 2112;
          long long v23 = v17;
          _os_log_error_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_ERROR, "#find-range,#auth Non-auth message. Self [%s] missed attempt %@. %@", (uint8_t *)&v18, 0x20u);
        }
      }
    }
  }
}

- (void)_reportMutualAuthStates
{
  uint64_t v3 = (__int16 *)((char *)&self->_finderStartRangingOptions.var0.__val_.secondary_scheduling_interval_usec + 1);
  if (self->_finderAttached
    && *(void *)&self->_findeeAlgorithmAidingData.var0.__val_.mach_absolute_receipt_timestamp.__engaged_)
  {
    int outboundAuthState = self->_finderMutualAuthState.outboundAuthState;
    if (((outboundAuthState - 5) < 2 || self->_finderMutualAuthState.inboundAuthState == 2)
      && (!BYTE2(self->_finderStartRangingOptions.var0.__val_.secondary_scheduling_interval_usec.var0.__val_)
       || *(unsigned char *)v3))
    {
      id v5 = qword_1008ABDE0;
      if (os_log_type_enabled((os_log_t)qword_1008ABDE0, OS_LOG_TYPE_DEFAULT))
      {
        identityString = self->_identityString;
        int v20 = 138412290;
        unsigned __int8 v21 = identityString;
        _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "#find-range,#auth Mutual-auth for finder failed, report to session manager, %@", (uint8_t *)&v20, 0xCu);
      }
      (*(void (**)(void))(*(void *)&self->_findeeAlgorithmAidingData.var0.__val_.mach_absolute_receipt_timestamp.__engaged_
                        + 16))();
      __int16 v7 = 256;
LABEL_10:
      *uint64_t v3 = v7;
      goto LABEL_15;
    }
    if (outboundAuthState == 4
      && self->_finderMutualAuthState.inboundAuthState == 1
      && (!BYTE2(self->_finderStartRangingOptions.var0.__val_.secondary_scheduling_interval_usec.var0.__val_)
       || !*(unsigned char *)v3))
    {
      __int16 v12 = qword_1008ABDE0;
      if (os_log_type_enabled((os_log_t)qword_1008ABDE0, OS_LOG_TYPE_DEFAULT))
      {
        int v13 = self->_identityString;
        int v20 = 138412290;
        unsigned __int8 v21 = v13;
        _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEFAULT, "#find-range,#auth Mutual-auth for finder succeeded, cancel timer and report to session manager, %@", (uint8_t *)&v20, 0xCu);
      }
      secondary_scheduling_delay_usec = self->_finderStartRangingOptions.var0.__val_.secondary_scheduling_delay_usec;
      if (secondary_scheduling_delay_usec)
      {
        dispatch_source_cancel(secondary_scheduling_delay_usec);
        uint64_t v15 = (void *)self->_finderStartRangingOptions.var0.__val_.secondary_scheduling_delay_usec;
        self->_finderStartRangingOptions.var0.__val_.secondary_scheduling_delay_usec = 0;

        self->_finderStartRangingOptions.var0.__val_.secondary_scheduling_interval_usec.var0.__null_state_ = 0;
      }
      (*(void (**)(void))(*(void *)&self->_findeeAlgorithmAidingData.var0.__val_.mach_absolute_receipt_timestamp.__engaged_
                        + 16))();
      __int16 v7 = 257;
      goto LABEL_10;
    }
  }
LABEL_15:
  if (HIBYTE(self->_finderStartRangingOptions.var0.__val_.secondary_scheduling_interval_usec.var0.__val_)
    && *(void *)&self->_findeeAlgorithmAidingData.var0.__val_.mach_absolute_receipt_timestamp.__engaged_)
  {
    int engaged = self->_finderStartRangingOptions.__engaged_;
    if (((engaged - 5) < 2 || LOBYTE(self->_finderMutualAuthTimer) == 2)
      && (!*(&self->_findeeAlgorithmAidingData.var0.__val_.measured_velocity_change.__engaged_ + 2)
       || *((unsigned char *)v3 + 920)))
    {
      int v9 = qword_1008ABDE0;
      if (os_log_type_enabled((os_log_t)qword_1008ABDE0, OS_LOG_TYPE_DEFAULT))
      {
        id v10 = self->_identityString;
        int v20 = 138412290;
        unsigned __int8 v21 = v10;
        _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "#find-range,#auth Mutual-auth for findee failed, report to session manager, %@", (uint8_t *)&v20, 0xCu);
      }
      (*(void (**)(void))(*(void *)&self->_findeeAlgorithmAidingData.var0.__val_.mach_absolute_receipt_timestamp.__engaged_
                        + 16))();
      __int16 v11 = 256;
LABEL_24:
      v3[460] = v11;
      return;
    }
    if (engaged == 4
      && LOBYTE(self->_finderMutualAuthTimer) == 1
      && (!*(&self->_findeeAlgorithmAidingData.var0.__val_.measured_velocity_change.__engaged_ + 2)
       || !*((unsigned char *)v3 + 920)))
    {
      __int16 v16 = qword_1008ABDE0;
      if (os_log_type_enabled((os_log_t)qword_1008ABDE0, OS_LOG_TYPE_DEFAULT))
      {
        __int16 v17 = self->_identityString;
        int v20 = 138412290;
        unsigned __int8 v21 = v17;
        _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_DEFAULT, "#find-range,#auth Mutual-auth for findee succeeded, cancel timer and report to session manager, %@", (uint8_t *)&v20, 0xCu);
      }
      double velocityChangeH2 = self->_findeeAlgorithmAidingData.var0.__val_.measured_velocity_change.var0.__val_.velocityChangeH2;
      if (velocityChangeH2 != 0.0)
      {
        dispatch_source_cancel(*(dispatch_source_t *)&velocityChangeH2);
        double v19 = self->_findeeAlgorithmAidingData.var0.__val_.measured_velocity_change.var0.__val_.velocityChangeH2;
        self->_findeeAlgorithmAidingData.var0.__val_.measured_velocity_change.var0.__val_.double velocityChangeH2 = 0.0;

        self->_findeeAlgorithmAidingData.var0.__val_.measured_velocity_change.__engaged_ = 0;
      }
      (*(void (**)(void))(*(void *)&self->_findeeAlgorithmAidingData.var0.__val_.mach_absolute_receipt_timestamp.__engaged_
                        + 16))();
      __int16 v11 = 257;
      goto LABEL_24;
    }
  }
}

- (BOOL)_encryptAndUpdateMutualAuthPayload
{
  if (!self->_nbammsSession.__ptr_) {
    return 0;
  }
  if (self->_finderAttached)
  {
    p_finderMutualAuthState = &self->_finderMutualAuthState;
    unsigned int outboundAuthState = self->_finderMutualAuthState.outboundAuthState;
    BOOL v5 = outboundAuthState > 0xB;
    int v6 = (1 << outboundAuthState) & 0xC02;
    BOOL v7 = v5 || v6 == 0;
    if (v7 && !self->_finderMutualAuthState.outboundChallenge)
    {
      long long v23 = qword_1008ABDE0;
      if (os_log_type_enabled((os_log_t)qword_1008ABDE0, OS_LOG_TYPE_DEFAULT))
      {
        identityString = self->_identityString;
        LODWORD(buf) = 138412290;
        *(void *)((char *)&buf + 4) = identityString;
        _os_log_impl((void *)&_mh_execute_header, v23, OS_LOG_TYPE_DEFAULT, "#find-range,#auth Self [Finder] start mutual auth (generate outbound challenge), %@", (uint8_t *)&buf, 0xCu);
      }
      sub_100249650((uint64_t)&self->_finderMutualAuthState);
      p_finderMutualAuthState->unsigned int outboundAuthState = 2;
    }
  }
  if (HIBYTE(self->_finderStartRangingOptions.var0.__val_.secondary_scheduling_interval_usec.var0.__val_))
  {
    unsigned int engaged = self->_finderStartRangingOptions.__engaged_;
    BOOL v5 = engaged > 0xB;
    int v9 = (1 << engaged) & 0xC02;
    BOOL v10 = v5 || v9 == 0;
    if (v10 && !*(void *)&self->_finderSignallingData.var0.__null_state_)
    {
      long long v25 = qword_1008ABDE0;
      if (os_log_type_enabled((os_log_t)qword_1008ABDE0, OS_LOG_TYPE_DEFAULT))
      {
        std::string::size_type v26 = self->_identityString;
        LODWORD(buf) = 138412290;
        *(void *)((char *)&buf + 4) = v26;
        _os_log_impl((void *)&_mh_execute_header, v25, OS_LOG_TYPE_DEFAULT, "#find-range,#auth Self [Findee] start mutual auth (generate outbound challenge), %@", (uint8_t *)&buf, 0xCu);
      }
      sub_100249650((uint64_t)&self->_finderStartRangingOptions.__engaged_);
      self->_finderStartRangingOptions.__engaged_ = 2;
    }
  }
  v29[0] = 1;
  memset(&v29[2], 0, 19);
  unsigned int v11 = self->_finderMutualAuthState.outboundAuthState;
  if (v11 >= 0x10) {
    sub_1004256CC();
  }
  unsigned int inboundAuthState = self->_finderMutualAuthState.inboundAuthState;
  if (inboundAuthState >= 0x10) {
    sub_1004256F8();
  }
  v29[1] = inboundAuthState | (16 * v11);
  if ((id)[(NSData *)self->_finderMutualAuthState.outboundChallenge length] == (id)3) {
    [(NSData *)self->_finderMutualAuthState.outboundChallenge getBytes:&v29[2] length:3];
  }
  if ((id)[(NSData *)self->_finderMutualAuthState.outboundResponse length] == (id)6) {
    [(NSData *)self->_finderMutualAuthState.outboundResponse getBytes:&v29[5] length:6];
  }
  unsigned int v13 = self->_finderStartRangingOptions.__engaged_;
  if (v13 >= 0x10) {
    sub_100425724();
  }
  unsigned int finderMutualAuthTimer_low = LOBYTE(self->_finderMutualAuthTimer);
  if (finderMutualAuthTimer_low >= 0x10) {
    sub_100425750();
  }
  v29[11] = finderMutualAuthTimer_low | (16 * v13);
  if ([*(id *)&self->_finderSignallingData.var0.__null_state_ length] == (id)3) {
    [*(id *)&self->_finderSignallingData.var0.__null_state_ getBytes:&v29[12] length:3];
  }
  if ([*(id *)&self->_finderSignallingData.var0.__val_.isPhone length] == (id)6) {
    [*(id *)&self->_finderSignallingData.var0.__val_.isPhone getBytes:&v29[15] length:6];
  }
  LOBYTE(__p[0]) = 0;
  sub_1001B0664(&buf, 0x15uLL, __p);
  uint64_t v15 = (_OWORD *)buf;
  long long v16 = *(_OWORD *)v29;
  *(void *)(buf + 13) = *(void *)&v29[13];
  _OWORD *v15 = v16;
  if ([(NIServerNBAMMSSession *)self _shouldEncodeSignallingDataInMessageID])
  {
    unsigned __int8 v17 = [(NIServerNBAMMSSession *)self _encodeSignallingDataInMessageID:*(unsigned __int8 *)buf];
    *(unsigned char *)long long buf = v17;
  }
  int v18 = +[NSData dataWithBytes:(void)buf length:*((void *)&buf + 1) - (void)buf];
  double v19 = [(NIServerNBAMMSSession *)self _encrypt:v18];
  int v20 = v19;
  if (v19 && [v19 length])
  {
    char v27 = 0;
    sub_1001B0664(__p, (size_t)[v20 length], &v27);
    [v20 getBytes:__p[0] length:[v20 length]];
    if (os_log_type_enabled((os_log_t)qword_1008ABDE0, OS_LOG_TYPE_DEBUG)) {
      sub_1004257E4();
    }
    sub_1002DBB0C((uint64_t)self->_nbammsSession.__ptr_, (uint64_t *)__p);
    if (__p[0])
    {
      __p[1] = __p[0];
      operator delete(__p[0]);
    }
    BOOL v21 = 1;
  }
  else
  {
    if (os_log_type_enabled((os_log_t)qword_1008ABDE0, OS_LOG_TYPE_ERROR)) {
      sub_10042577C();
    }
    BOOL v21 = 0;
  }

  if ((void)buf)
  {
    *((void *)&buf + 1) = buf;
    operator delete((void *)buf);
  }
  return v21;
}

- (void)_receivedMutualAuthMessage:(const void *)a3
{
  if (os_log_type_enabled((os_log_t)qword_1008ABDE0, OS_LOG_TYPE_DEBUG)) {
    sub_1004258C8();
  }
  ++*(&self->_findeeAlgorithmAidingData.var0.__val_.location_data.var0.__val_.uncertainty + 1);
  [(NIServerNBAMMSSession *)self _logStatisticsIfNecessary];
  BOOL v5 = *(long long **)a3;
  if (*((void *)a3 + 1) - *(void *)a3 > 0x14uLL)
  {
    long long v6 = *v5;
    *(void *)&v14[13] = *(void *)((char *)v5 + 13);
    *(_OWORD *)__int16 v14 = v6;
    sub_100249868((uint64_t)v14, 1, (uint64_t)v12);
    sub_100249868((uint64_t)v14, 0, (uint64_t)v10);
    int v7 = v13;
    if (v13 && v11)
    {
      [(NIServerNBAMMSSession *)self _processPeerMutualAuthState:v12 peerIsFinder:1];
      if (!v11) {
        sub_10000AE44();
      }
      [(NIServerNBAMMSSession *)self _processPeerMutualAuthState:v10 peerIsFinder:0];
      [(NIServerNBAMMSSession *)self _reportMutualAuthStates];
    }
    else
    {
      int v8 = (id)qword_1008ABDE0;
      if (os_log_type_enabled(v8, OS_LOG_TYPE_FAULT))
      {
        int v9 = sub_1002E0FBC(v7 == 0);
        sub_100425880((uint64_t)v9, buf, v8);
      }
    }
    sub_100253DA8((uint64_t)v10);
    sub_100253DA8((uint64_t)v12);
  }
  else if (os_log_type_enabled((os_log_t)qword_1008ABDE0, OS_LOG_TYPE_ERROR))
  {
    sub_100425818();
  }
}

- (void)_processPeerMutualAuthState:(const MutualAuthState *)a3 peerIsFinder:(BOOL)a4
{
  BOOL v4 = a4;
  uint64_t v6 = 232;
  if (a4) {
    uint64_t v6 = 971;
  }
  if (*((unsigned char *)&self->super.isa + v6))
  {
    uint64_t v8 = 304;
    if (a4) {
      uint64_t v8 = 1040;
    }
    int v9 = *(Class *)((char *)&self->super.isa + v8);
    if (a4) {
      uint64_t v10 = 984;
    }
    else {
      uint64_t v10 = 248;
    }
    char v11 = v9;
    __int16 v12 = (char *)self + v10;
    v34[0] = *v12;
    id v35 = *((id *)v12 + 1);
    id v36 = *((id *)v12 + 2);
    char v37 = v12[24];
    unsigned __int8 v13 = (id *)(v12 + 32);
    id v38 = *((id *)v12 + 4);
    id v39 = *((id *)v12 + 5);
    int v40 = *((_DWORD *)v12 + 12);
    *((_DWORD *)v12 + 12) = 0;
    unsigned int outboundAuthState = a3->outboundAuthState;
    if (outboundAuthState == 1) {
      goto LABEL_14;
    }
    if ((*v12 & 0xFE) != 0xA)
    {
      if ((outboundAuthState & 0xFE) != 0xA)
      {
        if (a3->outboundResponse && ![(NSData *)a3->outboundChallenge isEqualToData:*v13])
        {
          sub_100249EF8((uint64_t)v12, 0xAu);
          goto LABEL_14;
        }
        if (*((void *)v12 + 1))
        {
          if (a3->outboundChallenge && (objc_msgSend(*v13, "isEqualToData:") & 1) == 0)
          {
            objc_storeStrong((id *)v12 + 4, a3->outboundChallenge);
            sub_100249FA4(v12, v11);
            *__int16 v12 = 3;
          }
          if (a3->outboundResponse && (objc_msgSend(*((id *)v12 + 5), "isEqualToData:") & 1) == 0)
          {
            objc_storeStrong((id *)v12 + 5, a3->outboundResponse);
            if (sub_10024A0B8(v12, v11)) {
              char v27 = 1;
            }
            else {
              char v27 = 2;
            }
            v12[24] = v27;
          }
          int inboundAuthState = a3->inboundAuthState;
          if (inboundAuthState == 1)
          {
            char v29 = 4;
          }
          else
          {
            if (inboundAuthState != 2) {
              goto LABEL_14;
            }
            char v29 = 5;
          }
        }
        else
        {
          sub_100249650((uint64_t)v12);
          char v29 = 2;
        }
        *__int16 v12 = v29;
        goto LABEL_14;
      }
      sub_100249EF8((uint64_t)v12, outboundAuthState);
    }
    sub_100249E7C(v12);
LABEL_14:
    if (!sub_10024A1F0((unsigned __int8 *)v12, (unsigned __int8 *)v34))
    {
      uint64_t v15 = (id)qword_1008ABDE0;
      if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
      {
        long long v16 = sub_1002E0FBC(v4);
        unsigned __int8 v17 = sub_10024580C(&a3->outboundAuthState);
        int v30 = 136315394;
        char v31 = v16;
        __int16 v32 = 2112;
        int v33 = v17;
        _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_DEFAULT, "#find-range,#auth Received peer [%s] mutual auth:     %@", (uint8_t *)&v30, 0x16u);
      }
      int v18 = !v4;
      double v19 = (id)qword_1008ABDE0;
      if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
      {
        int v20 = sub_1002E0FBC(v18);
        BOOL v21 = sub_10024580C((unsigned __int8 *)v34);
        int v30 = 136315394;
        char v31 = v20;
        __int16 v32 = 2112;
        int v33 = v21;
        _os_log_impl((void *)&_mh_execute_header, v19, OS_LOG_TYPE_DEFAULT, "#find-range,#auth     Self [%s] mutual auth (BEFORE): %@", (uint8_t *)&v30, 0x16u);
      }
      __int16 v22 = (id)qword_1008ABDE0;
      if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
      {
        long long v23 = sub_1002E0FBC(v18);
        id v24 = sub_10024580C((unsigned __int8 *)v12);
        int v30 = 136315394;
        char v31 = v23;
        __int16 v32 = 2112;
        int v33 = v24;
        _os_log_impl((void *)&_mh_execute_header, v22, OS_LOG_TYPE_DEFAULT, "#find-range,#auth     Self [%s] mutual auth (AFTER):  %@", (uint8_t *)&v30, 0x16u);
      }
    }

LABEL_23:
    return;
  }
  if (a3->outboundAuthState)
  {
    char v11 = (id)qword_1008ABDE0;
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    {
      long long v25 = sub_1002E0FBC(v4);
      std::string::size_type v26 = sub_10024580C(&a3->outboundAuthState);
      sub_1004258FC((uint64_t)v25, v26, (uint64_t)v34, v11);
    }
    goto LABEL_23;
  }
}

- (void)_armMutualAuthTimerForFinder:(BOOL)a3
{
  if (a3)
  {
    secondary_scheduling_delay_usec = self->_finderStartRangingOptions.var0.__val_.secondary_scheduling_delay_usec;
    if (secondary_scheduling_delay_usec) {
      dispatch_source_cancel(secondary_scheduling_delay_usec);
    }
    dispatch_source_t v6 = dispatch_source_create((dispatch_source_type_t)&_dispatch_source_type_timer, 0, 0, (dispatch_queue_t)self->_internalQueue);
    int v7 = (void *)self->_finderStartRangingOptions.var0.__val_.secondary_scheduling_delay_usec;
    self->_finderStartRangingOptions.var0.__val_.secondary_scheduling_delay_usec = (optional<unsigned int>)v6;

    uint64_t v8 = self->_finderStartRangingOptions.var0.__val_.secondary_scheduling_delay_usec;
    dispatch_time_t v9 = dispatch_time(0, 5000000000);
    dispatch_source_set_timer(v8, v9, 0xFFFFFFFFFFFFFFFFLL, 0x989680uLL);
    objc_initWeak(&location, self);
    uint64_t v10 = self->_finderStartRangingOptions.var0.__val_.secondary_scheduling_delay_usec;
    handler[0] = _NSConcreteStackBlock;
    handler[1] = 3221225472;
    handler[2] = sub_10024A5FC;
    handler[3] = &unk_10085B920;
    char v11 = &v26;
    objc_copyWeak(&v26, &location);
    handler[4] = self;
    BOOL v27 = a3;
    dispatch_source_set_event_handler(v10, handler);
    dispatch_resume(*(dispatch_object_t *)&self->_finderStartRangingOptions.var0.__val_.secondary_scheduling_delay_usec);
    self->_finderStartRangingOptions.var0.__val_.secondary_scheduling_interval_usec.var0.__null_state_ = 0;
    __int16 v12 = qword_1008ABDE0;
    if (os_log_type_enabled((os_log_t)qword_1008ABDE0, OS_LOG_TYPE_DEFAULT))
    {
      identityString = self->_identityString;
      *(_DWORD *)long long buf = 138412290;
      int v30 = identityString;
      __int16 v14 = "#find-range,Armed finder mutual-auth timer, session %@";
LABEL_10:
      _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEFAULT, v14, buf, 0xCu);
    }
  }
  else
  {
    double velocityChangeH2 = self->_findeeAlgorithmAidingData.var0.__val_.measured_velocity_change.var0.__val_.velocityChangeH2;
    if (velocityChangeH2 != 0.0) {
      dispatch_source_cancel(*(dispatch_source_t *)&velocityChangeH2);
    }
    dispatch_source_t v16 = dispatch_source_create((dispatch_source_type_t)&_dispatch_source_type_timer, 0, 0, (dispatch_queue_t)self->_internalQueue);
    double v17 = self->_findeeAlgorithmAidingData.var0.__val_.measured_velocity_change.var0.__val_.velocityChangeH2;
    *(void *)&self->_findeeAlgorithmAidingData.var0.__val_.measured_velocity_change.var0.__val_.double velocityChangeH2 = v16;

    double v18 = self->_findeeAlgorithmAidingData.var0.__val_.measured_velocity_change.var0.__val_.velocityChangeH2;
    dispatch_time_t v19 = dispatch_time(0, 5000000000);
    dispatch_source_set_timer(*(dispatch_source_t *)&v18, v19, 0xFFFFFFFFFFFFFFFFLL, 0x989680uLL);
    objc_initWeak(&location, self);
    double v20 = self->_findeeAlgorithmAidingData.var0.__val_.measured_velocity_change.var0.__val_.velocityChangeH2;
    v22[0] = _NSConcreteStackBlock;
    v22[1] = 3221225472;
    v22[2] = sub_10024A730;
    v22[3] = &unk_10085B920;
    char v11 = &v23;
    objc_copyWeak(&v23, &location);
    v22[4] = self;
    BOOL v24 = a3;
    dispatch_source_set_event_handler(*(dispatch_source_t *)&v20, v22);
    dispatch_resume(*(dispatch_object_t *)&self->_findeeAlgorithmAidingData.var0.__val_.measured_velocity_change.var0.__val_.velocityChangeH2);
    self->_findeeAlgorithmAidingData.var0.__val_.measured_velocity_change.__engaged_ = 0;
    __int16 v12 = qword_1008ABDE0;
    if (os_log_type_enabled((os_log_t)qword_1008ABDE0, OS_LOG_TYPE_DEFAULT))
    {
      BOOL v21 = self->_identityString;
      *(_DWORD *)long long buf = 138412290;
      int v30 = v21;
      __int16 v14 = "#find-range,Armed findee mutual-auth timer, session %@";
      goto LABEL_10;
    }
  }
  objc_destroyWeak(v11);
  objc_destroyWeak(&location);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_findeeAlgorithmAidingData.var0.__val_.mach_absolute_receipt_timestamp.__engaged_, 0);
  objc_storeStrong((id *)&self->_findeeAlgorithmAidingData.var0.__val_.mach_absolute_receipt_timestamp.var0.__val_, 0);
  objc_storeStrong((id *)&self->_findeeAlgorithmAidingData.var0.__val_.measured_velocity_change.var0.__val_.velocityChangeH2, 0);
  objc_storeStrong((id *)&self->_findeeMutualAuthState.outboundChallenge, 0);

  objc_destroyWeak((id *)&self->_finderStartRangingOptions.var0.__val_.secondary_duty_cycle);
  objc_storeStrong((id *)&self->_finderStartRangingOptions.var0.__val_.secondary_scheduling_delay_usec, 0);
  objc_storeStrong((id *)&self->_finderToken, 0);

  objc_destroyWeak((id *)&self->_finderClient);
  objc_storeStrong((id *)&self->_peerDecryptionSession, 0);
  objc_storeStrong((id *)&self->_selfEncryptionSession, 0);
  cntrl = (std::__shared_weak_count *)self->_pbLogger.__cntrl_;
  if (cntrl) {
    sub_10001A970(cntrl);
  }
  objc_storeStrong((id *)&self->_sessionToken, 0);
  BOOL v4 = (std::__shared_weak_count *)self->_nbammsSession.__cntrl_;
  if (v4) {
    sub_10001A970(v4);
  }
  objc_storeStrong((id *)&self->_identityString, 0);

  objc_storeStrong((id *)&self->_internalQueue, 0);
}

- (id).cxx_construct
{
  self->_nbammsSession = 0u;
  self->_sessionStartRangingOptions.var0.__null_state_ = 0;
  self->_sessionStartRangingOptions.__engaged_ = 0;
  self->_pbLogger = 0u;
  *(_OWORD *)&self->_finderMutualAuthState.outboundChallenge = 0u;
  *(_OWORD *)&self->_finderMutualAuthState.inboundChallenge = 0u;
  sub_100242058((uint64_t)&self->_finderMutualAuthState);
  self->_finderRoseServiceRequest.var0.__null_state_ = 0;
  self->_finderRoseServiceRequest.var0.__val_.range_enable_params.nbamms.mms_pkt_type.__engaged_ = 0;
  self->_finderRoseServiceRequest.var0.__val_.range_enable_params.nbamms.mms_bch.var0.__null_state_ = 0;
  LOBYTE(self->_finderStartRangingOptions.var0.__val_.scheduling_interval_usec) = 0;
  self->_finderStartRangingOptions.var0.__val_.conn_evt_trigger_desc.var0.__null_state_ = 0;
  self->_finderStartRangingOptions.var0.__val_.dither_constant_msec.__engaged_ = 0;
  *(_WORD *)(&self->_finderStartRangingOptions.var0.__val_.secondary_scheduling_interval_usec.var0.__null_state_ + 1) = 0;
  *(_OWORD *)&self->_finderSignallingData.var0.__null_state_ = 0u;
  *(_OWORD *)&self->_finderShouldArmMutualAuthTimer = 0u;
  sub_100242058((uint64_t)&self->_finderStartRangingOptions.__engaged_);
  LOBYTE(self->_findeeMutualAuthState.outboundResponse) = 0;
  self->_findeeRoseServiceRequest.var0.__val_.range_enable_params.fira.local_addr.__engaged_ = 0;
  self->_findeeRoseServiceRequest.var0.__val_.range_enable_params.fira.peer_addr.var0.__null_state_ = 0;
  self->_findeeStartRangingOptions.var0.__val_.peer.var0.__val_.uuid.var0.__val_.__elems_[12] = 0;
  self->_findeeStartRangingOptions.var0.__val_.peer.var0.__val_.rose_mac_address.var0.__val_.__elems_[3] = 0;
  self->_findeeAlgorithmAidingData.var0.__val_.measured_velocity_change.var0.__null_state_ = 0;
  LOBYTE(self->_findeeAlgorithmAidingData.var0.__val_.measured_velocity_change.var0.__val_.applicabilityTimestamp) = 0;
  BYTE1(self->_findeeAlgorithmAidingData.var0.__val_.measured_velocity_change.var0.__val_.velocityChangeH1) = 0;
  *(_WORD *)(&self->_findeeAlgorithmAidingData.var0.__val_.measured_velocity_change.__engaged_ + 1) = 0;
  return self;
}

@end