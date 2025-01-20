@interface WRM_IceClientDriver
- (WRM_IceClientDriver)init;
- (id).cxx_construct;
- (void)IBICallPsBandwidthEstimationIndHandle:(char *)a3 size:(unsigned int)a4;
- (void)IBINetRadioSignalIndCbHandle:(char *)a3 size:(unsigned int)a4;
- (void)IBINetRegistrationInfoIndCbHandle:(char *)a3 size:(unsigned int)a4;
- (void)clientStarted;
- (void)clientStopped;
- (void)startBandwidthEstimation:(int64_t)a3;
- (void)stopBandwidthEstimation:(int64_t)a3;
@end

@implementation WRM_IceClientDriver

- (WRM_IceClientDriver)init
{
  v21.receiver = self;
  v21.super_class = (Class)WRM_IceClientDriver;
  v2 = [(WRM_IceClientDriver *)&v21 init];
  if (v2)
  {
    v3 = dispatch_queue_attr_make_with_qos_class(0, QOS_CLASS_UTILITY, 0);
    dispatch_queue_t v4 = dispatch_queue_create("com.apple.WRM_IceClientDriver", v3);
    v5 = (void *)*((void *)v2 + 3);
    *((void *)v2 + 3) = v4;

    sub_100068B9C((id *)v2 + 3, (OS_dispatch_object *)"com.apple.WirelessRadioManagerd", &v20);
    long long v6 = v20;
    long long v20 = 0uLL;
    v7 = (std::__shared_weak_count *)*((void *)v2 + 2);
    *(_OWORD *)(v2 + 8) = v6;
    if (v7)
    {
      sub_1000357EC(v7);
      if (*((void *)&v20 + 1)) {
        sub_1000357EC(*((std::__shared_weak_count **)&v20 + 1));
      }
    }
    v8 = (uint64_t *)*((void *)v2 + 1);
    v18[0] = _NSConcreteStackBlock;
    v18[1] = 3221225472;
    v18[2] = sub_1000678F4;
    v18[3] = &unk_10020D7D0;
    v9 = v2;
    v19 = v9;
    sub_1000D54DC(v8, 0, (uint64_t)v18);
    v10 = (uint64_t *)*((void *)v2 + 1);
    v13 = _NSConcreteStackBlock;
    uint64_t v14 = 3221225472;
    v15 = sub_1000678FC;
    v16 = &unk_10020D7D0;
    v11 = v9;
    v17 = v11;
    sub_1000D54DC(v10, 1, (uint64_t)&v13);
    *((void *)v11 + 4) = 0;
    *((void *)v11 + 5) = 0;
    v11[48] = 0;
    +[WCM_Logging logLevel:22, @"ICE Client to be started", v13, v14, v15, v16 message];
    sub_1000D54CC(*((ice::Client ***)v2 + 1));
  }
  return (WRM_IceClientDriver *)v2;
}

- (void)clientStarted
{
  +[WCM_Logging logLevel:22 message:@"ICE Client started"];
  ptr = (uint64_t *)self->mIceClient.__ptr_;
  v14[0] = _NSConcreteStackBlock;
  v14[1] = 3221225472;
  v14[2] = sub_100067B4C;
  v14[3] = &unk_10020D7F8;
  v14[4] = self;
  sub_1000D55B4(ptr, 494960640, (uint64_t)v14);
  dispatch_queue_t v4 = (uint64_t *)self->mIceClient.__ptr_;
  v13[0] = _NSConcreteStackBlock;
  v13[1] = 3221225472;
  v13[2] = sub_100067B5C;
  v13[3] = &unk_10020D7F8;
  v13[4] = self;
  sub_1000D55B4(v4, 629276672, (uint64_t)v13);
  v5 = (uint64_t *)self->mIceClient.__ptr_;
  v12[0] = _NSConcreteStackBlock;
  v12[1] = 3221225472;
  v12[2] = sub_100067B6C;
  v12[3] = &unk_10020D7F8;
  v12[4] = self;
  sub_1000D55B4(v5, 227573760, (uint64_t)v12);
  long long v6 = +[WRM_HandoverManager WRM_HandoverManagerSingleton];
  v7 = v6;
  if (v6)
  {
    if ([v6 isSisSupportedOnICE])
    {
      +[WCM_Logging logLevel:22 message:@"ICE Client startBandwidthEstimation"];
      [(WRM_IceClientDriver *)self startBandwidthEstimation:1];
      [(WRM_IceClientDriver *)self startBandwidthEstimation:2];
    }
    else
    {
      +[WCM_Logging logLevel:22 message:@"ICE Client NOT startBandwidthEstimation"];
    }
  }

  v8 = +[WRM_BWEvalManager WRM_BWEvalManagerSingleton];
  v9 = v8;
  if (v8) {
    [v8 resetStreamingState:0];
  }

  v10 = +[WRM_HandoverManager WRM_HandoverManagerSingleton];
  v11 = [v10 getQueue];
  dispatch_async(v11, &stru_10020EB10);

  [(WRM_IceClientDriver *)self setHandlerLocationDbInfo];
  self->mClientStarted = 1;
}

- (void)clientStopped
{
  self->mClientStarted = 0;
}

- (void)startBandwidthEstimation:(int64_t)a3
{
  AriSdk::ARI_IBICallPsStartBandwidthEstimationReq_SDK::ARI_IBICallPsStartBandwidthEstimationReq_SDK((AriSdk::ARI_IBICallPsStartBandwidthEstimationReq_SDK *)v5);
  BOOL v4 = sub_1000883EC(a3);
  sub_10002A14C();
}

- (void)stopBandwidthEstimation:(int64_t)a3
{
  AriSdk::ARI_IBICallPsStopBandwidthEstimationReq_SDK::ARI_IBICallPsStopBandwidthEstimationReq_SDK((AriSdk::ARI_IBICallPsStopBandwidthEstimationReq_SDK *)v5);
  BOOL v4 = sub_1000883EC(a3);
  sub_10002A14C();
}

- (void)IBINetRegistrationInfoIndCbHandle:(char *)a3 size:(unsigned int)a4
{
}

- (void)IBINetRadioSignalIndCbHandle:(char *)a3 size:(unsigned int)a4
{
  AriSdk::ARI_IBINetRadioSignalIndCb_SDK::ARI_IBINetRadioSignalIndCb_SDK((AriSdk::ARI_IBINetRadioSignalIndCb_SDK *)v14, (const unsigned __int8 *)a3, a4);
  if (ice::isARIResponseValid((ice *)v14, (const AriSdk::MsgBase *)0x25820000, v4))
  {
    uint64_t v5 = AriSdk::ARI_IBINetRadioSignalIndCb_SDK::unpack((AriSdk::ARI_IBINetRadioSignalIndCb_SDK *)v14);
    if (v5)
    {
      +[WCM_Logging logLevel:22, @"Failed to unpack IBINetRadioSignalIndCb: %s (%u)", asString(), v5 message];
    }
    else
    {
      long long v6 = +[WRM_EnhancedCTService wrm_EnhancedCTServiceSingleton];
      unint64_t v7 = sub_10005F050(*v15);
      +[WCM_Logging logLevel:22, @"ICE IBINetRadioSignalIndCbHandle nInstance = %s", sub_1000883F8(v7) message];
      +[WCM_Logging logLevel:22, @"ICE IBINetRadioSignalIndCbHandle scell_rat = %s", sub_10008841C(*v16) message];
      uint64_t v8 = sub_10005F050(*v15);
      int v9 = *v16;
      unsigned __int16 v10 = sub_10008875C((uint64_t)v14);
      unsigned __int16 v11 = sub_1000887A4((uint64_t)v14);
      if (v10 >= 0x100u)
      {
        v12 = sub_1000887EC(v9);
        +[WCM_Logging logLevel:22, @"ICE IBINetRadioSignalIndCbHandle %s = %fdBm", v12, sub_100088810(v10, v9) message];
      }
      if (v11 >= 0x100u)
      {
        v13 = sub_10008887C(v9);
        +[WCM_Logging logLevel:22, @"ICE IBINetRadioSignalIndCbHandle %s = %fdB", v13, sub_1000888A0(v11, v9) message];
      }
      if (v9 == 2)
      {
        if (v10 >= 0x100u && v11 >= 0x100u)
        {
          [v6 setServingCellRSCP:v8 forSim:sub_100088810(v10, 2)];
          [v6 setServingCellECIO:v8 forSim:sub_1000888A0(v11, 2)];
        }
      }
      else if (v9 == 8)
      {
        if (v10 >= 0x100u && v11 >= 0x100u)
        {
          [v6 setNrRSRP:v8 forSim:sub_100088810(v10, 8)];
          [v6 setNrRSRQ:v8 forSim:sub_1000888A0(v11, 8)];
          [v6 evaluateCbrsInDualSimMode:0];
        }
        if (v17)
        {
          +[WCM_Logging logLevel:22, @"ICE IBINetRadioSignalIndCbHandle NR cell_id = %llu, narfcn=%u, pci=%u, cell_grp_id=%u, sinr=%f", *(void *)(v17 + 60), *(unsigned int *)(v17 + 52), *(unsigned __int16 *)(v17 + 56), *(unsigned __int8 *)(v17 + 58), sub_1000886FC(*(unsigned __int8 *)(v17 + 68)) message];
          [v6 setNrSNR:v8 forSim:sub_1000886FC(*(unsigned __int8 *)(v17 + 68))];
        }
      }
      else if (v9 == 3 && v10 >= 0x100u && v11 >= 0x100u)
      {
        [v6 setServingCellRSRP:v8 forSim:sub_100088810(v10, 3)];
        [v6 setServingCellRSRQ:v8 forSim:sub_1000888A0(v11, 3)];
        [v6 evaluateCbrsInDualSimMode:0];
      }
    }
  }
  else
  {
    +[WCM_Logging logLevel:22 message:@"ICE ERROR: Invalid IBINetRadioSignalIndCbHandle received"];
  }
  AriSdk::ARI_IBINetRadioSignalIndCb_SDK::~ARI_IBINetRadioSignalIndCb_SDK((AriSdk::ARI_IBINetRadioSignalIndCb_SDK *)v14);
}

- (void)IBICallPsBandwidthEstimationIndHandle:(char *)a3 size:(unsigned int)a4
{
  AriSdk::ARI_IBICallPsBandwidthEstimationInd_SDK::ARI_IBICallPsBandwidthEstimationInd_SDK((AriSdk::ARI_IBICallPsBandwidthEstimationInd_SDK *)v56, (const unsigned __int8 *)a3, a4);
  if ((ice::isARIResponseValid((ice *)v56, (const AriSdk::MsgBase *)0xD908000, v5) & 1) == 0)
  {
    +[WCM_Logging logLevel:22 message:@"ICE ERROR: Invalid IBICallPsBandwidthEstimationInd received"];
    goto LABEL_51;
  }
  +[WCM_Logging logLevel:22 message:@"ICE IBICallPsBandwidthEstimationInd received"];
  uint64_t v6 = AriSdk::ARI_IBICallPsBandwidthEstimationInd_SDK::unpack((AriSdk::ARI_IBICallPsBandwidthEstimationInd_SDK *)v56);
  if (v6)
  {
    +[WCM_Logging logLevel:22, @"Failed to unpack IBICallPsBandwidthEstimationInd: %s (%u)", asString(), v6 message];
    goto LABEL_51;
  }
  v55 = +[WRM_HandoverManager WRM_HandoverManagerSingleton];
  unint64_t v7 = +[WRM_EnhancedCTService wrm_EnhancedCTServiceSingleton];
  v54 = v7;
  unint64_t v8 = sub_10005F050(*v57);
  +[WCM_Logging logLevel:22, @"ICE IBICallPsBandwidthEstimationInd nInstance = %s", sub_1000883F8(v8) message];
  if (!v58)
  {
    int v53 = 0;
LABEL_20:
    unsigned int v20 = 0;
    goto LABEL_21;
  }
  int v10 = *(_DWORD *)v58;
  uint64_t v9 = *(unsigned int *)(v58 + 4);
  int v51 = *(_DWORD *)(v58 + 8);
  uint64_t v11 = *(unsigned int *)(v58 + 16);
  uint64_t v49 = *(unsigned int *)(v58 + 12);
  uint64_t v13 = *(unsigned int *)(v58 + 20);
  uint64_t v12 = *(unsigned int *)(v58 + 24);
  unint64_t v14 = *(void *)(v58 + 28);
  v15 = sub_10008841C(*(_DWORD *)v58);
  +[WCM_Logging logLevel:22, @"ICE IBICallPsBandwidthEstimationInd serv_cell_info_t2.primary_nb_rat=%s, primary_gNb_freq_range=%d, secondary_nb_rat=%s, secondary_gNb_freq_range =%d, mcc=%u, mnc=%u, tac=%u, cell_id=%lu", v15, v9, sub_10008841C(v51), v49, v11, v13, v12, v14 message];
  if (sub_10005F050(*v57) == 1)
  {
    unint64_t mSlotOneCellID = self->mSlotOneCellID;
    p_unint64_t mSlotOneCellID = &self->mSlotOneCellID;
    unint64_t v16 = mSlotOneCellID;
  }
  else
  {
    if (sub_10005F050(*v57) != 2)
    {
LABEL_12:
      unsigned int v20 = 0;
      unint64_t v7 = v54;
      goto LABEL_14;
    }
    unint64_t mSlotTwoCellID = self->mSlotTwoCellID;
    p_unint64_t mSlotOneCellID = &self->mSlotTwoCellID;
    unint64_t v16 = mSlotTwoCellID;
  }
  if (v16 == v14) {
    goto LABEL_12;
  }
  unint64_t *p_mSlotOneCellID = v14;
  objc_super v21 = +[NSString stringWithFormat:@"%u.%u.%u.%llu", v11, v13, v12, v14];
  v22 = +[NSString stringWithFormat:@"%u.%u", v11, v13];
  unint64_t v7 = v54;
  unint64_t v23 = sub_10005F050(*v57);
  +[WCM_Logging logLevel:22, @"%s GCI: %@, Prefix: %@", sub_1000883F8(v23), v21, v22 message];
  [v54 updateGlobalCellID:*v57 gci:v21 cellprefix:objc_msgSend(v22, "length")];

  unsigned int v20 = 1;
LABEL_14:
  if (v10 == 8)
  {
    int v24 = 1;
    uint64_t v25 = 3;
    goto LABEL_16;
  }
  int v24 = 0;
  if (v10 == 3)
  {
    uint64_t v25 = 0;
    int v53 = 0;
    if (v51 == 8)
    {
      int v26 = v49;
      if (v49 == 1)
      {
        int v24 = 1;
        uint64_t v25 = v49;
        goto LABEL_17;
      }
      if (v49 == 2)
      {
        int v24 = 1;
        uint64_t v25 = 2;
      }
      else
      {
        int v24 = 0;
        uint64_t v25 = 0;
      }
LABEL_16:
      int v26 = 1;
LABEL_17:
      int v53 = v26;
    }
  }
  else
  {
    uint64_t v25 = 0;
    int v53 = 0;
  }
  unint64_t v27 = sub_10005F050(*v57);
  +[WCM_Logging logLevel:22, @"%s Cell Changed %d, nrCellType: %d", sub_1000883F8(v27), v20, v25 message];
  if ((v20 | v24) != 1) {
    goto LABEL_20;
  }
  +[WCM_Logging logLevel:22 message:@"Callling updateCurrentRatInfo"];
  [v7 updateCurrentRatInfo:sub_10005F050(*v57) currentNRCell:v25];
  [v55 evaluateWiFiVersusCell];
LABEL_21:
  if (v59)
  {
    uint64_t v28 = *v59;
    uint64_t v29 = v59[1];
    +[WCM_Logging logLevel:22, @"ICE IBICallPsBandwidthEstimationInd configured_max_bw_t3.uplink_throughput=%u, downlink_throughput=%u", v28, v29 message];
    [v7 updateConfiguredMaxBW:sub_10005F050(*v57) dlbw:v29 ulbw:v28];
  }
  if (v60)
  {
    uint64_t v30 = *(unsigned int *)v60;
    uint64_t v31 = v60[4];
    uint64_t v32 = v60[5];
    uint64_t v33 = v60[6];
    +[WCM_Logging logLevel:22, @"ICE IBICallPsBandwidthEstimationInd downlink_bw_estimation_t4.allowed_rate=%ukbps, confidence_level=%u, split_lte_percent=%u, split_5g_percent=%u", v30, v31, v32, v33 message];
    [v7 updateDownlinkEstimatedBW:sub_10005F050(*v57) bw:v30 conf:v31 lte:v32 nr:v33];
    [v55 forceActiveModeEval:1];
    [v55 evaluateWiFiVersusCell];
    [v55 forceActiveModeEval:0];
  }
  if (v61)
  {
    uint64_t v34 = *v61;
    uint64_t v35 = *((unsigned __int8 *)v61 + 4);
    uint64_t v36 = *((unsigned __int8 *)v61 + 5);
    +[WCM_Logging logLevel:22, @"ICE IBICallPsBandwidthEstimationInd uplink_bw_estimation_t5.allowed_rate=%ukbps, confidence_level=%u, queue_size=%u", v34, v35, v36 message];
    [v7 updateUplinkEstimatedBW:sub_10005F050(*v57) bw:v34 conf:v35 queue:v36];
    [v55 forceActiveModeEval:1];
    [v55 evaluateWiFiVersusCell];
    [v55 forceActiveModeEval:0];
  }
  if (v62)
  {
    uint64_t v37 = v62[1];
    uint64_t v38 = *((unsigned int *)v62 + 4);
    unsigned int v39 = *((_DWORD *)v62 + 6);
    uint64_t v48 = v62[13];
    uint64_t v50 = v62[12];
    uint64_t v52 = *((unsigned int *)v62 + 2);
    +[WCM_Logging logLevel:22, @"ICE IBICallPsBandwidthEstimationInd connected_state_summary_t6.max_ue_rank=%u, max_network_mimo_layer=%u, max_scheduled_mimo_layer=%u, max_dl_modulation=%u, max_ul_modulation=%u, total_dl_mimo_layers=%u, total_num_cc=%u, aggregated_dl_bw=%umHz, aggregated_ul_bw=%umHz, nr5g_neighbor_cell=%u, rsrp=%ddBm, log_sinr_10xDb=%u", *v62, v37, v62[2], *((unsigned int *)v62 + 1), v52, v50, v48, v38, *((unsigned int *)v62 + 5), v39, *((unsigned int *)v62 + 7), v62[32] message];
    unsigned int v40 = [v7 getWRMCellOutrankWifiBWThreshold];
    switch(v39)
    {
      case 2u:
        int v42 = 0;
        uint64_t v43 = 3;
        int v44 = 1;
        int v41 = 1;
        break;
      case 3u:
        int v41 = 0;
        int v42 = 0;
        int v44 = 1;
        uint64_t v43 = 1;
        break;
      case 4u:
        int v41 = 0;
        int v42 = 0;
        uint64_t v43 = 2;
        int v44 = 1;
        break;
      default:
        int v44 = 0;
        int v41 = 0;
        uint64_t v43 = 0;
        int v42 = 1;
        break;
    }
    unint64_t v45 = sub_10005F050(*v57);
    +[WCM_Logging logLevel:22, @"%s Cell Changed %d, nrCellType: %d", sub_1000883F8(v45), v20, v43 message];
    if ((v20 | v44) == 1)
    {
      +[WCM_Logging logLevel:22 message:@"Calling updateConnectedStateSummary"];
      [v54 updateConnectedStateSummary:sub_10005F050(*v57) neighberNRCell:v43 highrateIndicator:v38 >= v40];
      [v55 evaluateWiFiVersusCell];
    }
    if ((v20 | v41 | v42) == 1)
    {
      +[WCM_Logging logLevel:22 message:@"Calling updateHighRateLikely"];
      [v54 updateHighRateLikely:sub_10005F050(*v57) highrateIndicator:v38 >= v40];
    }
    v46 = +[WRM_BWEvalManager WRM_BWEvalManagerSingleton];
    v47 = v46;
    unint64_t v7 = v54;
    if (v53)
    {
      [v46 updateNRQSHMetrics:v38 :v37 :v52];
    }
    else
    {
      [v46 updateQSHMetrics:v48 :v38 :v50 :v37];
      [v54 updateLTEBandwidth:sub_10005F050(*v57) LTEBW:v38];
    }
  }
  if (v63)
  {
    +[WCM_Logging logLevel:22, @"ICE IBICallPsBandwidthEstimationInd rlgs_info_t7.congested = %d", *v63 message];
    [v55 evaluateWiFiVersusCell];
  }

LABEL_51:
  AriSdk::ARI_IBICallPsBandwidthEstimationInd_SDK::~ARI_IBICallPsBandwidthEstimationInd_SDK((AriSdk::ARI_IBICallPsBandwidthEstimationInd_SDK *)v56);
}

- (void).cxx_destruct
{
  begin = self->mLocationDbInfo.sadcCellInfoList.__begin_;
  if (begin)
  {
    self->mLocationDbInfo.sadcCellInfoList.__end_ = begin;
    operator delete(begin);
  }
  unsigned int v4 = self->mLocationDbInfo.saCellInfoList.__begin_;
  if (v4)
  {
    self->mLocationDbInfo.saCellInfoList.__end_ = v4;
    operator delete(v4);
  }
  unsigned int v5 = self->mLocationDbInfo.lteNsaCellInfoList.__begin_;
  if (v5)
  {
    self->mLocationDbInfo.lteNsaCellInfoList.__end_ = v5;
    operator delete(v5);
  }
  uint64_t v6 = self->mLocationDbInfo.lteCellInfoList.__begin_;
  if (v6)
  {
    self->mLocationDbInfo.lteCellInfoList.__end_ = v6;
    operator delete(v6);
  }
  fObj = self->mQueue.fObj.fObj;
  self->mQueue.fObj.fObj = 0;

  cntrl = self->mIceClient.__cntrl_;
  if (cntrl)
  {
    sub_1000357EC((std::__shared_weak_count *)cntrl);
  }
}

- (id).cxx_construct
{
  *((_OWORD *)self + 9) = 0u;
  *((_OWORD *)self + 10) = 0u;
  *((_OWORD *)self + 7) = 0u;
  *((_OWORD *)self + 8) = 0u;
  *((_OWORD *)self + 5) = 0u;
  *((_OWORD *)self + 6) = 0u;
  *((void *)self + 2) = 0;
  *((void *)self + 3) = 0;
  *((void *)self + 1) = 0;
  return self;
}

@end