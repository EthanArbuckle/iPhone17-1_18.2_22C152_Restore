void sub_100413F2C()
{
  __assert_rtn("handleRoseInfrastructureStatusUpdate", "RoseScheduler.cpp", 725, "false");
}

void sub_100413F58()
{
}

void sub_100413F84()
{
  sub_100010524();
  sub_1000104E4((void *)&_mh_execute_header, v0, v1, "Got RoseBluetoothEvent::Type::Unspecified.", v2, v3, v4, v5, v6);
}

void sub_100413FB8()
{
  sub_100010524();
  sub_1000104E4((void *)&_mh_execute_header, v0, v1, "Failed to handle BT adv roll. setNewRoseMacAddress returned false.", v2, v3, v4, v5, v6);
}

void sub_100413FEC()
{
}

void sub_100414018()
{
  sub_100010524();
  sub_1000104E4((void *)&_mh_execute_header, v0, v1, "Failed to inform AOP about R2 GPIO trigger blanking request", v2, v3, v4, v5, v6);
}

void sub_10041404C()
{
  sub_100010524();
  sub_1000104E4((void *)&_mh_execute_header, v0, v1, "Failed to inform AOP about NB channels to trigger GPIO blanking on", v2, v3, v4, v5, v6);
}

void sub_100414080()
{
}

void sub_1004140AC()
{
}

void sub_1004140D8()
{
}

void sub_100414104()
{
}

void sub_100414130()
{
  sub_100010524();
  sub_1000104E4((void *)&_mh_execute_header, v0, v1, "Failed to inform AOP about request to trigger GPIO blanking", v2, v3, v4, v5, v6);
}

void sub_100414164(uint64_t a1)
{
  uint64_t v2 = *(void **)(a1 + 648);
  if (v2)
  {
    *(void *)(a1 + 656) = v2;
    operator delete(v2);
  }
}

void sub_10041417C(uint64_t a1)
{
  uint64_t v2 = *(void **)(a1 + 8);
  if (v2) {
    sub_100186D78(v2, a1);
  }
}

void sub_100414190(unsigned char *a1, uint64_t a2)
{
  if (*a1)
  {
    uint64_t v2 = *(void **)(a2 + 648);
    if (v2)
    {
      *(void *)(a2 + 656) = v2;
      operator delete(v2);
    }
  }
}

void sub_1004141AC()
{
  __assert_rtn("SetupProxyObjects", "ProxyObjectConsumerBase.h", 49, "proxyObj != nullptr");
}

void sub_1004141D8()
{
}

void sub_100414204()
{
  __assert_rtn("ingestEvent", "MotionProxyObject.cpp", 36, "fMeasurementConsumer != nullptr");
}

void sub_100414230()
{
}

void sub_10041425C()
{
}

void sub_100414288()
{
  __assert_rtn("relayMessage", "AOPRoseProxyObject.cpp", 26, "fDataProvider != nullptr");
}

void sub_1004142B4()
{
  __assert_rtn("relayMessage", "AOPRoseProxyObject.cpp", 33, "fDataProvider != nullptr");
}

void sub_1004142E0()
{
  __assert_rtn("ingestEvent", "AOPRoseProxyObject.cpp", 40, "fEventConsumer != nullptr");
}

void sub_10041430C()
{
  __assert_rtn("ingestEvent", "AOPRoseProxyObject.cpp", 48, "fMeasurementConsumer != nullptr");
}

void sub_100414338()
{
}

void sub_100414364()
{
}

void sub_100414390()
{
}

void sub_1004143BC()
{
}

void sub_1004143E8()
{
}

void sub_100414414()
{
}

void sub_100414440()
{
}

void sub_10041446C()
{
}

void sub_100414498()
{
}

void sub_1004144C4()
{
}

void sub_1004144F0()
{
}

void sub_10041451C()
{
  sub_100010524();
  sub_1000104E4((void *)&_mh_execute_header, v0, v1, "#ant-selection,mismatching secondary Tx, Rx antennas", v2, v3, v4, v5, v6);
}

void sub_100414550()
{
  sub_100010524();
  sub_1000104E4((void *)&_mh_execute_header, v0, v1, "#ant-selection,mismatching primary Tx, Rx antennas", v2, v3, v4, v5, v6);
}

void sub_100414584()
{
  sub_100010524();
  sub_1000104E4((void *)&_mh_execute_header, v0, v1, "#ant-selection,conflicting ports used with recieve diversity", v2, v3, v4, v5, v6);
}

void sub_1004145B8()
{
  sub_100010524();
  sub_1000104E4((void *)&_mh_execute_header, v0, v1, "#ant-selection,wrong antenna has priority", v2, v3, v4, v5, v6);
}

void sub_1004145EC()
{
  sub_100010524();
  sub_1000104E4((void *)&_mh_execute_header, v0, v1, "#ant-selection,primary antenna masks are not NONE", v2, v3, v4, v5, v6);
}

void sub_100414620(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_100414690(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_100414708()
{
  sub_100010524();
  sub_1000104E4((void *)&_mh_execute_header, v0, v1, "Failed to populate qos config.", v2, v3, v4, v5, v6);
}

void sub_10041473C()
{
  sub_100010524();
  sub_1000104E4((void *)&_mh_execute_header, v0, v1, "Failed to populate ranging trigger config", v2, v3, v4, v5, v6);
}

void sub_100414770()
{
  sub_100010524();
  sub_1000104E4((void *)&_mh_execute_header, v0, v1, "populateRangeEnableCommand failed", v2, v3, v4, v5, v6);
}

void sub_1004147A4()
{
  sub_100010524();
  sub_1000104E4((void *)&_mh_execute_header, v0, v1, "populateRangeEnableCommand failed with unknown HSI Version", v2, v3, v4, v5, v6);
}

void sub_1004147D8()
{
  sub_100010524();
  sub_1000104E4((void *)&_mh_execute_header, v0, v1, "populateRangeEnableCommand HSI1 failed", v2, v3, v4, v5, v6);
}

void sub_10041480C()
{
  sub_100010524();
  sub_1000104E4((void *)&_mh_execute_header, v0, v1, "populateRangeEnableCommand HSI2 failed", v2, v3, v4, v5, v6);
}

void sub_100414840()
{
  sub_100010524();
  sub_100056C38((void *)&_mh_execute_header, v0, v1, "populateRangeEnableCommand failed: no alisha job type configured for Alisha mac mode.", v2, v3, v4, v5, v6);
}

void sub_100414874()
{
  sub_100010524();
  sub_100056C38((void *)&_mh_execute_header, v0, v1, "populateRangeEnableCommand failed: invalid alisha job type configured for Alisha mac mode.", v2, v3, v4, v5, v6);
}

void sub_1004148A8()
{
  sub_100010524();
  sub_100056C38((void *)&_mh_execute_header, v0, v1, "populateRangeEnableCommand failed: not gr config for gr job.", v2, v3, v4, v5, v6);
}

void sub_1004148DC()
{
  sub_100010524();
  sub_1000104E4((void *)&_mh_execute_header, v0, v1, "newServiceRequest failed", v2, v3, v4, v5, v6);
}

void sub_100414910()
{
  sub_100010524();
  sub_1000104E4((void *)&_mh_execute_header, v0, v1, "populate test NMI Range Enable Command failed", v2, v3, v4, v5, v6);
}

void sub_100414944()
{
  sub_100010524();
  sub_1000104E4((void *)&_mh_execute_header, v0, v1, "populate NMI Range Enable Command failed", v2, v3, v4, v5, v6);
}

void sub_100414978()
{
  sub_100010524();
  sub_1000104E4((void *)&_mh_execute_header, v0, v1, "PRRoseProvider::newServiceRequestPacket got Unspecified mac mode", v2, v3, v4, v5, v6);
}

void sub_1004149AC()
{
  sub_100010524();
  sub_100056C38((void *)&_mh_execute_header, v0, v1, "PRSupervisorPacketBuilder::PTSCmd missing required parameter.", v2, v3, v4, v5, v6);
}

void sub_1004149E0()
{
}

void sub_100414A0C()
{
}

void sub_100414A38()
{
}

void sub_100414A64()
{
}

void sub_100414A90()
{
  sub_100010524();
  sub_1000104E4((void *)&_mh_execute_header, v0, v1, "PRSupervisorPacketBuilder::PTSCmd initiator missing antenna diversity parameters.", v2, v3, v4, v5, v6);
}

void sub_100414AC4()
{
  sub_100010524();
  sub_1000104E4((void *)&_mh_execute_header, v0, v1, "PRSupervisorPacketBuilder::PTSCmd responder missing antenna diversity parameters.", v2, v3, v4, v5, v6);
}

void sub_100414AF8(unsigned __int8 *a1, uint8_t *buf, os_log_t log)
{
  int v3 = *a1;
  *(_DWORD *)buf = 67109120;
  *((_DWORD *)buf + 1) = v3;
  _os_log_fault_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_FAULT, "PRSupervisorPacketBuilder::PTSCmd: invalid session role %d", buf, 8u);
}

void sub_100414B44()
{
  sub_100010524();
  sub_10016F0D8((void *)&_mh_execute_header, v0, v1, "PRSupervisorPacketBuilder::populateRangeEnableCommand PointToShare", v2, v3, v4, v5, v6);
}

void sub_100414B78()
{
}

void sub_100414BA4()
{
}

void sub_100414BD0()
{
}

void sub_100414BFC()
{
}

void sub_100414C28()
{
  sub_100010524();
  sub_10016F0D8((void *)&_mh_execute_header, v0, v1, "PRSupervisorPacketBuilder::populateRangeEnableCommand PointToShareHSI2", v2, v3, v4, v5, v6);
}

void sub_100414C5C()
{
  sub_100010524();
  sub_100056C38((void *)&_mh_execute_header, v0, v1, "PRSupervisorPacketBuilder::P2PCmd HSI1 missing required parameter.", v2, v3, v4, v5, v6);
}

void sub_100414C90()
{
}

void sub_100414CBC()
{
}

void sub_100414CE8()
{
}

void sub_100414D14()
{
}

void sub_100414D40()
{
  sub_100010524();
  sub_10016F0D8((void *)&_mh_execute_header, v0, v1, "PRSupervisorPacketBuilder::populateRangeEnableCommand P2P HSI1", v2, v3, v4, v5, v6);
}

void sub_100414D74()
{
  sub_100010524();
  sub_100056C38((void *)&_mh_execute_header, v0, v1, "PRSupervisorPacketBuilder::P2PCmd HSI2 missing required parameter.", v2, v3, v4, v5, v6);
}

void sub_100414DA8()
{
  sub_100010524();
  sub_10016F0D8((void *)&_mh_execute_header, v0, v1, "PRSupervisorPacketBuilder::populateRangeEnableCommand P2P HSI2", v2, v3, v4, v5, v6);
}

void sub_100414DDC()
{
  sub_100010524();
  sub_1000104E4((void *)&_mh_execute_header, v0, v1, "PRSupervisorPacketBuilder::AlishaCmd missing required parameter.", v2, v3, v4, v5, v6);
}

void sub_100414E10()
{
}

void sub_100414E3C()
{
  sub_100010524();
  sub_1000104E4((void *)&_mh_execute_header, v0, v1, "PRSupervisorPacketBuilder::AlishaCmd missing required ACWG parameters.", v2, v3, v4, v5, v6);
}

void sub_100414E70()
{
  sub_100010524();
  sub_10016F0D8((void *)&_mh_execute_header, v0, v1, "PRRoseProvider::populateRangeEnableCommand Alisha", v2, v3, v4, v5, v6);
}

void sub_100414EA4()
{
}

void sub_100414ED0()
{
  sub_100010524();
  sub_100056C38((void *)&_mh_execute_header, v0, v1, "PRSupervisorPacketBuilder::GRNoDataCmd missing required parameter.", v2, v3, v4, v5, v6);
}

void sub_100414F04()
{
  sub_100010524();
  sub_100056C38((void *)&_mh_execute_header, v0, v1, "PRSupervisorPacketBuilder::GRCmd addresses can't be set.", v2, v3, v4, v5, v6);
}

void sub_100414F38()
{
}

void sub_100414F64()
{
}

void sub_100414F90()
{
}

void sub_100414FBC()
{
  sub_100010524();
  sub_10016F0D8((void *)&_mh_execute_header, v0, v1, "PRSupervisorPacketBuilder::populateRangeEnableCommand GR NoData", v2, v3, v4, v5, v6);
}

void sub_100414FF0()
{
}

void sub_10041501C()
{
}

void sub_100415048()
{
}

void sub_100415074()
{
  sub_100010524();
  sub_100056C38((void *)&_mh_execute_header, v0, v1, "PRSupervisorPacketBuilder::GRCmd missing required parameter.", v2, v3, v4, v5, v6);
}

void sub_1004150A8()
{
}

void sub_1004150D4()
{
}

void sub_100415100()
{
}

void sub_10041512C()
{
}

void sub_100415158()
{
  sub_100010524();
  sub_10016F0D8((void *)&_mh_execute_header, v0, v1, "PRSupervisorPacketBuilder::populateRangeEnableCommand GR", v2, v3, v4, v5, v6);
}

void sub_10041518C()
{
}

void sub_1004151B8()
{
}

void sub_1004151E4()
{
}

void sub_100415210()
{
}

void sub_10041523C()
{
  sub_100010524();
  sub_1000104E4((void *)&_mh_execute_header, v0, v1, "PRSupervisorPacketBuilder::FiRaUnicastCmdHSI1 missing required parameter.", v2, v3, v4, v5, v6);
}

void sub_100415270()
{
}

void sub_10041529C()
{
  sub_100010524();
  sub_10016F0D8((void *)&_mh_execute_header, v0, v1, "PRRoseProvider::populateRangeEnableCommand FiRa Unicast", v2, v3, v4, v5, v6);
}

void sub_1004152D0()
{
}

void sub_1004152FC()
{
  sub_100010524();
  sub_1000104E4((void *)&_mh_execute_header, v0, v1, "PRSupervisorPacketBuilder::FiRaContentionBasedCmdHSI1 missing required parameter.", v2, v3, v4, v5, v6);
}

void sub_100415330()
{
}

void sub_10041535C()
{
  sub_100010524();
  sub_10016F0D8((void *)&_mh_execute_header, v0, v1, "PRRoseProvider::populateRangeEnableCommand FiRa Contention Based", v2, v3, v4, v5, v6);
}

void sub_100415390()
{
  sub_100010524();
  sub_1000104E4((void *)&_mh_execute_header, v0, v1, "PRSupervisorPacketBuilder::FiRaContentionBasedCmdHSI2 missing required parameter.", v2, v3, v4, v5, v6);
}

void sub_1004153C4()
{
}

void sub_1004153F0()
{
  sub_100010524();
  sub_1000104E4((void *)&_mh_execute_header, v0, v1, "PRSupervisorPacketBuilder Test NMI missing required parameter.", v2, v3, v4, v5, v6);
}

void sub_100415424()
{
  sub_100010524();
  sub_10016F0D8((void *)&_mh_execute_header, v0, v1, "PRSupervisorPacketBuilder populate Test NMI Range Enable Command", v2, v3, v4, v5, v6);
}

void sub_100415458()
{
  sub_100010524();
  sub_1000104E4((void *)&_mh_execute_header, v0, v1, "PRSupervisorPacketBuilder NMI missing required parameter.", v2, v3, v4, v5, v6);
}

void sub_10041548C()
{
  sub_100010524();
  sub_10016F0D8((void *)&_mh_execute_header, v0, v1, "PRRoseProvider::populateRangeEnableCommand NMI", v2, v3, v4, v5, v6);
}

void sub_1004154C0()
{
  sub_100010524();
  sub_100056C38((void *)&_mh_execute_header, v0, v1, "PRSupervisorPacketBuilder::triggerConfig for GR but gr_config is nullopt.", v2, v3, v4, v5, v6);
}

void sub_1004154F4()
{
  sub_100010524();
  sub_100056C38((void *)&_mh_execute_header, v0, v1, "PRSupervisorPacketBuilder::triggerConfig for test NMI but config is nullopt.", v2, v3, v4, v5, v6);
}

void sub_100415528()
{
}

void sub_100415554()
{
  sub_100010524();
  sub_100056C38((void *)&_mh_execute_header, v0, v1, "PRSupervisorPacketBuilder::triggerConfig for NMI but config is nullopt.", v2, v3, v4, v5, v6);
}

void sub_100415588()
{
  sub_100010524();
  sub_1000104E4((void *)&_mh_execute_header, v0, v1, "PRSupervisorPacketBuilder::qosConfig - Unspecified quality of service.", v2, v3, v4, v5, v6);
}

void sub_1004155BC()
{
  sub_100010524();
  sub_100056C38((void *)&_mh_execute_header, v0, v1, "clientStartService start time cannot be specified as offset from next BT connection event without connection event descriptor (and vice versa)", v2, v3, v4, v5, v6);
}

void sub_1004155F0()
{
  sub_100010524();
  sub_100056C38((void *)&_mh_execute_header, v0, v1, "clientStartService gr request peer does not have a BT adv address.", v2, v3, v4, v5, v6);
}

void sub_100415624()
{
  sub_100010524();
  sub_100056C38((void *)&_mh_execute_header, v0, v1, "clientStartService given peer without Rose Mac Address.", v2, v3, v4, v5, v6);
}

void sub_100415658()
{
  sub_100010524();
  sub_100056C38((void *)&_mh_execute_header, v0, v1, "clientStartService NMI request peer does not have a BT adv address.", v2, v3, v4, v5, v6);
}

void sub_10041568C()
{
  sub_100010524();
  sub_100056C38((void *)&_mh_execute_header, v0, v1, "clientStartService duty cycle should be <= 1", v2, v3, v4, v5, v6);
}

void sub_1004156C0()
{
  sub_100010524();
  sub_10016F0D8((void *)&_mh_execute_header, v0, v1, "PRSupervisorPacketBuilder::LPEMEnable", v2, v3, v4, v5, v6);
}

void sub_1004156F4()
{
  sub_100010524();
  sub_100056C38((void *)&_mh_execute_header, v0, v1, "Must specify a timebase to convert from", v2, v3, v4, v5, v6);
}

void sub_100415728()
{
  sub_100010524();
  sub_100056C38((void *)&_mh_execute_header, v0, v1, "Must specify a timebase to convert to", v2, v3, v4, v5, v6);
}

void sub_10041575C()
{
  sub_100010524();
  sub_100056C38((void *)&_mh_execute_header, v0, v1, "Time bases must be different", v2, v3, v4, v5, v6);
}

void sub_100415790()
{
  sub_100010524();
  sub_10016F0D8((void *)&_mh_execute_header, v0, v1, "PRSupervisorPacketBuilder::convertTime", v2, v3, v4, v5, v6);
}

void sub_1004157C4()
{
  sub_100010524();
  sub_100056C38((void *)&_mh_execute_header, v0, v1, "Invalid deep sleep request", v2, v3, v4, v5, v6);
}

void sub_1004157F8()
{
  sub_100010524();
  sub_10016F0D8((void *)&_mh_execute_header, v0, v1, "PRSupervisorPacketBuilder::deepSleepRequest", v2, v3, v4, v5, v6);
}

void sub_10041582C()
{
  sub_100010524();
  sub_10016F0D8((void *)&_mh_execute_header, v0, v1, "regulatory,geo,loc,invalidateCache", v2, v3, v4, v5, v6);
}

void sub_100415860(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_1004158D0()
{
  sub_100010524();
  sub_10016F0D8((void *)&_mh_execute_header, v0, v1, "regulatory,geo,loc,tileIsAvailableFromFile", v2, v3, v4, v5, v6);
}

void sub_100415904()
{
  sub_100196EA0();
  sub_100196ED4((void *)&_mh_execute_header, v0, v1, "regulatory,geo,loc,isTileAvailableBasedOnFile,%.6f,%.6f", v2, v3);
}

void sub_100415974()
{
  sub_100010524();
  sub_10016F0D8((void *)&_mh_execute_header, v0, v1, "regulatory,geo,loc,knownLonLat,returnedTrue", v2, v3, v4, v5, v6);
}

void sub_1004159A8()
{
  sub_100010524();
  sub_10016F0D8((void *)&_mh_execute_header, v0, v1, "regulatory,geo,loc,knownLonLat,found", v2, v3, v4, v5, v6);
}

void sub_1004159DC(uint8_t *buf, unsigned char *a2, os_log_t log)
{
  *buf = 0;
  *a2 = 0;
  _os_log_debug_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_DEBUG, "regulatory,geo,loc,knownLonLat", buf, 2u);
}

void sub_100415A1C(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_100415A8C(unsigned __int8 *a1, int a2, os_log_t log)
{
  int v3 = *a1;
  int v4 = *((_DWORD *)a1 + 1);
  v5[0] = 67109632;
  v5[1] = a2;
  __int16 v6 = 1024;
  int v7 = v3;
  __int16 v8 = 1024;
  int v9 = v4;
  _os_log_debug_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_DEBUG, "regulatory,geo,loc,latlon,%u,lastValid,%d,lastLonLat,%u", (uint8_t *)v5, 0x14u);
}

void sub_100415B24()
{
  sub_100196EA0();
  sub_100196ED4((void *)&_mh_execute_header, v0, v1, "regulatory,geo,loc,in isUnrestrictedGrid,%.6f,%.6f", v2, v3);
}

void sub_100415B94(char *a1, void *a2, NSObject *a3)
{
  if (*a1 < 0) {
    a2 = (void *)*a2;
  }
  LODWORD(v3) = 136446210;
  *(void *)((char *)&v3 + 4) = a2;
  sub_100196EF4((void *)&_mh_execute_header, (uint64_t)a2, a3, "regulatory,gm,loc,grid,#Warning,could not open,%{public}s", (void)v3, DWORD2(v3));
}

void sub_100415C0C()
{
  sub_100010524();
  sub_10016F0D8((void *)&_mh_execute_header, v0, v1, "regulatory,gm,loc,grid,finished", v2, v3, v4, v5, v6);
}

void sub_100415C40()
{
  sub_100010524();
  sub_10016F0D8((void *)&_mh_execute_header, v0, v1, "regulatory,gm,loc,grid,#Warning,Invalid PRReg availability file - unable to get data byte", v2, v3, v4, v5, v6);
}

void sub_100415C74(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_100415CE0(char *a1, void *a2, NSObject *a3)
{
  if (*a1 < 0) {
    a2 = (void *)*a2;
  }
  LODWORD(v3) = 136446210;
  *(void *)((char *)&v3 + 4) = a2;
  sub_100196EF4((void *)&_mh_execute_header, (uint64_t)a2, a3, "regulatory,gm,loc,grid,%{public}s", (void)v3, DWORD2(v3));
}

void sub_100415D58(os_log_t log)
{
  int v1 = 136315138;
  uint64_t v2 = off_10089EEB0;
  _os_log_debug_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_DEBUG, "regulatory,gm,loc,grid,fileDoesNotExist,%s", (uint8_t *)&v1, 0xCu);
}

void sub_100415DE0()
{
  sub_100010524();
  _os_log_fault_impl((void *)&_mh_execute_header, v0, OS_LOG_TYPE_FAULT, "#btsampledistributor Registered for device presence bluetooth sample but does not support device presence.", v1, 2u);
}

void sub_100415E20()
{
  sub_10001AC8C();
  sub_10000B3E0((void *)&_mh_execute_header, v0, v1, "#btsampledistributor CBDiscovery activation failed with error: %@", v2, v3, v4, v5, v6);
}

void sub_100415E88()
{
  sub_100010524();
  sub_1000104E4((void *)&_mh_execute_header, v0, v1, "#btsampledistributor LeechingAidingScanner for home device session activation failed due to CBManagerStatePoweredOff", v2, v3, v4, v5, v6);
}

void sub_100415EBC()
{
  sub_10019B14C();
  sub_100056CBC((void *)&_mh_execute_header, v0, v1, "#btsampledistributor BT Leeching with max rate scanner activation failed [%0.6f s]. Error: %@", v2, v3, v4, v5, v6);
}

void sub_100415F24()
{
  sub_100010524();
  sub_1000104E4((void *)&_mh_execute_header, v0, v1, "#btsampledistributor #nibtfinding btAddress is nil", v2, v3, v4, v5, v6);
}

void sub_100415F58(uint8_t *buf, uint64_t a2, os_log_t log)
{
  *(_DWORD *)buf = 134217984;
  *(void *)(buf + 4) = a2;
  _os_log_error_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_ERROR, "#btsampledistributor #nibtfinding macAddressHexString less than 1: %lu", buf, 0xCu);
}

void sub_100415FA0(uint64_t a1, uint8_t *buf, os_log_t log)
{
  *(_DWORD *)buf = 136315138;
  *(void *)(buf + 4) = a1;
  _os_log_error_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_ERROR, "#btsampledistributor #nibtfinding invalid btaddress length: %s", buf, 0xCu);
}

void sub_100415FE8()
{
  sub_10019B14C();
  sub_100056CBC((void *)&_mh_execute_header, v0, v1, "#btsampledistributor CBDiscovery activation failed [%0.6f s]. Error: %@", v2, v3, v4, v5, v6);
}

void sub_100416050()
{
  sub_10019B14C();
  sub_100056CBC((void *)&_mh_execute_header, v0, v1, "#btsampledistributor CBDiscovery Screen Off activation failed [%0.6f s]. Error: %@", v2, v3, v4, v5, v6);
}

void sub_1004160B8()
{
  sub_10019B14C();
  sub_100056CBC((void *)&_mh_execute_header, v0, v1, "#btsampledistributor CBDiscovery AirPods Leech activation failed [%0.6f s]. Error: %@", v2, v3, v4, v5, v6);
}

void sub_100416120()
{
  sub_100010524();
  sub_1000104E4((void *)&_mh_execute_header, v0, v1, "#btsampledistributor _cbDiscoveryAirPodsLeech invalidated.", v2, v3, v4, v5, v6);
}

void sub_100416154()
{
  sub_100010524();
  sub_1000104E4((void *)&_mh_execute_header, v0, v1, "#btsampledistributor _cbDiscoveryAirPodsLeech interrupted.", v2, v3, v4, v5, v6);
}

void sub_100416188()
{
  sub_10001AC8C();
  sub_10000B3E0((void *)&_mh_execute_header, v0, v1, "#btsampledistributor _cbDiscoveryAirPodsLeech error: %@", v2, v3, v4, v5, v6);
}

void sub_1004161F0()
{
  sub_100010524();
  sub_1000104E4((void *)&_mh_execute_header, v0, v1, "#btsampledistributor CBDiscoveryScreenOff invalidated.", v2, v3, v4, v5, v6);
}

void sub_100416224()
{
  sub_100010524();
  sub_1000104E4((void *)&_mh_execute_header, v0, v1, "#btsampledistributor CBDiscoveryScreenOff interrupted.", v2, v3, v4, v5, v6);
}

void sub_100416258()
{
  sub_10001AC8C();
  sub_10000B3E0((void *)&_mh_execute_header, v0, v1, "#btsampledistributor CBDiscoveryScreenOff error: %@", v2, v3, v4, v5, v6);
}

void sub_1004162C0()
{
  sub_100010524();
  sub_1000104E4((void *)&_mh_execute_header, v0, v1, "#btsampledistributor CBDiscovery invalidated.", v2, v3, v4, v5, v6);
}

void sub_1004162F4()
{
  sub_100010524();
  sub_1000104E4((void *)&_mh_execute_header, v0, v1, "#btsampledistributor CBDiscovery interrupted.", v2, v3, v4, v5, v6);
}

void sub_100416328()
{
  sub_10001AC8C();
  sub_10000B3E0((void *)&_mh_execute_header, v0, v1, "#btsampledistributor CBDiscovery error: %@", v2, v3, v4, v5, v6);
}

void sub_100416390()
{
  sub_10001AC8C();
  sub_10000B3E0((void *)&_mh_execute_header, v0, v1, "#btsampledistributor Dropping sample with invalid RSSI %@", v2, v3, v4, v5, v6);
}

void sub_1004163F8(uint8_t *buf, unsigned char *a2, os_log_t log)
{
  *buf = 0;
  *a2 = 0;
  _os_log_error_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_ERROR, "enumerateFiles: null filename from reverseEnumerateFiles", buf, 2u);
}

void sub_100416438(os_log_t log)
{
  *(_WORD *)uint64_t v1 = 0;
  _os_log_error_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_ERROR, "pruneLogFiles: empty dir name", v1, 2u);
}

void sub_10041647C(int *a1, uint8_t *buf, os_log_t log)
{
  int v3 = *a1;
  *(_DWORD *)buf = 67109120;
  *((_DWORD *)buf + 1) = v3;
  _os_log_error_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_ERROR, "pruneLogFiles: clock_gettime failed with errno %d", buf, 8u);
}

void sub_1004164C8(char *a1, void *a2, os_log_t log)
{
  if (*a1 < 0) {
    a2 = (void *)*a2;
  }
  int v3 = 136315138;
  uint64_t v4 = a2;
  _os_log_error_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_ERROR, "pruneLogFiles: directory %s does not exist", (uint8_t *)&v3, 0xCu);
}

void sub_100416550()
{
}

void sub_10041657C(os_log_t log)
{
  int v1 = 138412290;
  CFStringRef v2 = @"Missing entitlement";
  _os_log_error_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_ERROR, "#ses-secure-ranging,%@", (uint8_t *)&v1, 0xCu);
}

void sub_100416600(os_log_t log)
{
  *(_WORD *)int v1 = 0;
  _os_log_error_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_ERROR, "#ses-secure-ranging,Discovery token doesn't contain an AWDL mac address", v1, 2u);
}

void sub_100416644(os_log_t log)
{
  *(_WORD *)int v1 = 0;
  _os_log_error_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_ERROR, "#ses-secure-ranging,Discovery token doesn't contain a secure ranging key", v1, 2u);
}

void sub_100416688(os_log_t log)
{
  int v1 = 138412290;
  CFStringRef v2 = @"Failed to start WiFi service. session is nil";
  _os_log_error_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_ERROR, "#ses-secure-ranging,%@", (uint8_t *)&v1, 0xCu);
}

void sub_10041670C(char *a1, void *a2, os_log_t log)
{
  if (*a1 >= 0) {
    int v3 = a2;
  }
  else {
    int v3 = (void *)*a2;
  }
  int v4 = 136380675;
  uint64_t v5 = v3;
  _os_log_error_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_ERROR, "#ses-secure-ranging,WiFi ranging error:%{private}s", (uint8_t *)&v4, 0xCu);
}

void sub_100416798(uint64_t *a1, NSObject *a2)
{
  uint64_t v2 = *a1;
  int v3 = 134217984;
  uint64_t v4 = v2;
  _os_log_debug_impl((void *)&_mh_execute_header, a2, OS_LOG_TYPE_DEBUG, "regulatory,geof,qm,default,fUwbOnDelay, %.1f", (uint8_t *)&v3, 0xCu);
}

void sub_100416814()
{
}

void sub_100416840()
{
}

void sub_10041686C()
{
  __assert_rtn("handleEvent", "PRStateMachine.h", 94, "handlerFn != std::end(state_handlers)");
}

void sub_100416898()
{
  __assert_rtn("handleEvent", "PRStateMachine.h", 112, "retState == newState");
}

void sub_1004168C4()
{
  __assert_rtn("handleEvent", "PRStateMachine.h", 109, "retState == oldState");
}

void sub_1004168F0()
{
  __assert_rtn("handleEvent", "PRStateMachine.h", 99, "newState == oldState");
}

void sub_10041691C()
{
}

void sub_100416948(os_log_t log)
{
  *(_WORD *)int v1 = 0;
  _os_log_error_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_ERROR, "#ses-devicepresence,error triggering enhanced discovery", v1, 2u);
}

void sub_10041698C(os_log_t log)
{
  *(_WORD *)int v1 = 0;
  _os_log_error_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_ERROR, "#ses-devicepresence,error invalidating deviceDiscovery", v1, 2u);
}

void sub_1004169D0()
{
  sub_10001AC8C();
  sub_10000B3E0((void *)&_mh_execute_header, v0, v1, "#ses-devicepresence,enhanced discovery failed with error %@", v2, v3, v4, v5, v6);
}

void sub_100416A38()
{
  sub_10001AC8C();
  sub_10000B3E0((void *)&_mh_execute_header, v0, v1, "#ses-devicepresence,Invalid sample provided: %@", v2, v3, v4, v5, v6);
}

void sub_100416AA0()
{
  sub_10001AC8C();
  sub_10000B3E0((void *)&_mh_execute_header, v0, v1, "#ses-devicepresence,Invalid model provided: %@", v2, v3, v4, v5, v6);
}

void sub_100416B08()
{
  sub_10001AC8C();
  _os_log_debug_impl((void *)&_mh_execute_header, v0, OS_LOG_TYPE_DEBUG, "#ses-devicepresence,#QE_Log This shouldn't happen partIdentifierHash is 0 for sample: %@", v1, 0xCu);
}

void sub_100416B7C()
{
  sub_10001AC8C();
  _os_log_debug_impl((void *)&_mh_execute_header, v0, OS_LOG_TYPE_DEBUG, "#ses-devicepresence,#QE_Log Pairable device presence accepting sample: %@", v1, 0xCu);
}

void sub_100416BF0()
{
  sub_10001AC8C();
  sub_10000B3E0((void *)&_mh_execute_header, v0, v1, "#ses-devicepresence,invalid btaddress length: %@", v2, v3, v4, v5, v6);
}

void sub_100416C58()
{
}

void sub_100416C84(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_100416CF4()
{
  sub_100010524();
  sub_1000104E4((void *)&_mh_execute_header, v0, v1, "#system-health,scheduleSendingOfSystemHealthReport: SystemHealth library not available", v2, v3, v4, v5, v6);
}

void sub_100416D28()
{
  sub_100010524();
  sub_1000104E4((void *)&_mh_execute_header, v0, v1, "#system-health,scheduleSendingOfSystemHealthReport: Game mode notification fired after destruct", v2, v3, v4, v5, v6);
}

void sub_100416D5C()
{
  sub_100010524();
  sub_1000104E4((void *)&_mh_execute_header, v0, v1, "#system-health,_tryToSendScheduledHealthReport: No scheduled report. Possible race condition in sending it?", v2, v3, v4, v5, v6);
}

void sub_100416D90()
{
  sub_100010524();
  sub_1000104E4((void *)&_mh_execute_header, v0, v1, "#system-health,_tryToSendScheduledHealthReport: Failed to create SystemHealthManager", v2, v3, v4, v5, v6);
}

void sub_100416DC4()
{
  sub_100010524();
  sub_1000104E4((void *)&_mh_execute_header, v0, v1, "#system-health,scheduleSendingOfSystemHealthReport: Background activity fired after destruct", v2, v3, v4, v5, v6);
}

void sub_100416DF8()
{
  sub_100010524();
  sub_1000104E4((void *)&_mh_execute_header, v0, v1, "#system-health,scheduleSendingOfSystemHealthReport: Background activity dispatch after destruct", v2, v3, v4, v5, v6);
}

void sub_100416E2C(uint64_t a1, NSObject *a2)
{
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_error_impl((void *)&_mh_execute_header, a2, OS_LOG_TYPE_ERROR, "#system-health,_tryToSendScheduledHealthReport: Failed to notify SystemHealthManager of HW status. Error: %@", (uint8_t *)&v2, 0xCu);
}

void sub_100416EA4(uint64_t a1, NSObject *a2)
{
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_error_impl((void *)&_mh_execute_header, a2, OS_LOG_TYPE_ERROR, "#ses-ecosystem,Error adding service client: %@", (uint8_t *)&v2, 0xCu);
}

void sub_100416F1C()
{
}

void sub_100416F48()
{
  sub_100010524();
  _os_log_fault_impl((void *)&_mh_execute_header, v0, OS_LOG_TYPE_FAULT, "#ses-ecosystem,Configuration does not have a discovery token.", v1, 2u);
}

void sub_100416F88()
{
  sub_100010524();
  sub_1000104E4((void *)&_mh_execute_header, v0, v1, "#ses-ecosystem,serviceDidGenerateShareableConfigurationData while session nil or disabled. Possible race condition", v2, v3, v4, v5, v6);
}

void sub_100416FBC(uint64_t a1)
{
}

void sub_100416FE0()
{
  sub_100010524();
  sub_1000104E4((void *)&_mh_execute_header, v0, v1, "#ses-ecosystem,serviceDidReceiveNewSolution while session nil or disabled. Possible race condition", v2, v3, v4, v5, v6);
}

void sub_100417014()
{
  sub_100010524();
  sub_1000104E4((void *)&_mh_execute_header, v0, v1, "#ses-ecosystem,skipping measurement due to a lack of mach continuous timestamp.", v2, v3, v4, v5, v6);
}

void sub_100417048(int *a1, NSObject *a2)
{
  int v2 = *a1;
  v3[0] = 67109120;
  v3[1] = v2;
  _os_log_fault_impl((void *)&_mh_execute_header, a2, OS_LOG_TYPE_FAULT, "#ses-ecosystem,Unexpected RoseSolutionType: %d", (uint8_t *)v3, 8u);
}

void sub_1004170C4(uint64_t a1)
{
}

void sub_1004170D4()
{
  sub_100010524();
  sub_1000104E4((void *)&_mh_execute_header, v0, v1, "#ses-ecosystem,serviceRequestDidUpdateStatus while session nil or disabled. Possible race condition", v2, v3, v4, v5, v6);
}

void sub_100417108()
{
  sub_100010524();
  sub_1000104E4((void *)&_mh_execute_header, v0, v1, "#ses-ecosystem,serviceDidInvalidateWithReason while session nil or disabled. Possible race condition", v2, v3, v4, v5, v6);
}

void sub_10041713C(char *a1, uint8_t *buf, os_log_t log)
{
  if (a1[23] >= 0) {
    uint64_t v4 = a1;
  }
  else {
    uint64_t v4 = *(char **)a1;
  }
  *(_DWORD *)buf = 136315138;
  *(void *)(buf + 4) = v4;
  _os_log_error_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_ERROR, "#ses-ecosystem,Rose session invalidated unexpectedly. Reason: %s", buf, 0xCu);
  if (a1[23] < 0) {
    operator delete(*(void **)a1);
  }
}

void sub_1004171B0()
{
  sub_100010524();
  sub_1000104E4((void *)&_mh_execute_header, v0, v1, "#ses-ecosystem,accessoryGATTServiceFailedWithError while session disabled. Possible race condition", v2, v3, v4, v5, v6);
}

void sub_1004171E4(void *a1, uint64_t a2, uint8_t *buf, os_log_t log)
{
  *(_DWORD *)buf = 138412546;
  *(void *)(buf + 4) = a1;
  *((_WORD *)buf + 6) = 2112;
  *(void *)(buf + 14) = a2;
  _os_log_error_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_ERROR, "#ses-ecosystem,Bluetooth device %@. Error: %@", buf, 0x16u);
}

void sub_10041724C()
{
  sub_100010524();
  sub_1000104E4((void *)&_mh_execute_header, v0, v1, "#ses-ecosystem,accessoryGATTServiceAuthorizedBackgroundOperation while session invalidated. Possible race condition", v2, v3, v4, v5, v6);
}

void sub_100417280(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_1004172F0(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_100417360(void *a1, uint64_t a2, NSObject *a3)
{
  *(_DWORD *)uint64_t v3 = 138412546;
  *(void *)&v3[4] = *a1;
  *(_WORD *)&v3[12] = 2112;
  *(void *)&v3[14] = a2;
  sub_10001AC6C((void *)&_mh_execute_header, a2, a3, "#bt-accessory,BackgroundAuthorization: tracking listener [%@] but not peer [%@]", *(void *)v3, *(void *)&v3[8], *(void *)&v3[16]);
}

void sub_1004173DC()
{
  sub_10001AC8C();
  sub_10000B3E0((void *)&_mh_execute_header, v0, v1, "#bt-accessory,ConnectToPeer [%@]: BT not available", v2, v3, v4, v5, v6);
}

void sub_100417444()
{
  sub_10001AC8C();
  sub_10000B3E0((void *)&_mh_execute_header, v0, v1, "#bt-accessory,ConnectToPeer [%@]: not paired", v2, v3, v4, v5, v6);
}

void sub_1004174AC()
{
  sub_10001AC8C();
  sub_10000B3E0((void *)&_mh_execute_header, v0, v1, "#bt-accessory,ConnectToPeer [%@]: not already connected", v2, v3, v4, v5, v6);
}

void sub_100417514()
{
  sub_10001AC8C();
  sub_10000B3E0((void *)&_mh_execute_header, v0, v1, "#bt-accessory,centralManager:didConnectPeripheral [%@]: No matching peer", v2, v3, v4, v5, v6);
}

void sub_10041757C()
{
  sub_10001AC8C();
  sub_10000B3E0((void *)&_mh_execute_header, v0, v1, "#bt-accessory,centralManager:didConnectPeripheral [%@]: Unexpected connection success", v2, v3, v4, v5, v6);
}

void sub_1004175E4()
{
  sub_10001AC54();
  sub_10001AC6C((void *)&_mh_execute_header, v0, v1, "#bt-accessory,centralManager:didFailToConnectPeripheral [%@]: No matching peer. Error: %@");
}

void sub_10041764C()
{
  sub_10001AC54();
  sub_10001AC6C((void *)&_mh_execute_header, v0, v1, "#bt-accessory,centralManager:didFailToConnectPeripheral [%@]: Unexpected connection failure: %@");
}

void sub_1004176B4()
{
  sub_10001AC54();
  sub_10001AC6C((void *)&_mh_execute_header, v0, v1, "#bt-accessory,centralManager:didDisconnectPeripheral [%@]: No matching peer. Error: %@");
}

void sub_10041771C()
{
  sub_10001AC54();
  sub_10001AC6C((void *)&_mh_execute_header, v0, v1, "#bt-accessory,peripheral:didDiscoverServices [%@]: No matching peer. Error: %@");
}

void sub_100417784()
{
  sub_10001AC8C();
  sub_10000B3E0((void *)&_mh_execute_header, v0, v1, "#bt-accessory,peripheral:didDiscoverServices [%@]: Service not discovered", v2, v3, v4, v5, v6);
}

void sub_1004177EC()
{
  sub_10001AC54();
  sub_10001AC6C((void *)&_mh_execute_header, v0, v1, "#bt-accessory,peripheral:didDiscoverServices [%@]: Error discovering service: %@");
}

void sub_100417854()
{
  sub_10001AC54();
  sub_10001AC6C((void *)&_mh_execute_header, v0, v1, "#bt-accessory,peripheral:didDiscoverServices [%@]: Unexpected service discovery. Error: %@");
}

void sub_1004178BC()
{
  sub_10001AC54();
  sub_10001AC6C((void *)&_mh_execute_header, v0, v1, "#bt-accessory,peripheral:didDiscoverCharacteristics [%@]: No matching peer. Error: %@");
}

void sub_100417924()
{
  sub_10001AC8C();
  sub_10000B3E0((void *)&_mh_execute_header, v0, v1, "#bt-accessory,peripheral:didDiscoverCharacteristics [%@]: Characteristics not discovered", v2, v3, v4, v5, v6);
}

void sub_10041798C()
{
  sub_10001AC54();
  sub_10001AC6C((void *)&_mh_execute_header, v0, v1, "#bt-accessory,peripheral:didDiscoverCharacteristics [%@]: Error discovering characteristics: %@");
}

void sub_1004179F4()
{
  sub_10001AC54();
  sub_10001AC6C((void *)&_mh_execute_header, v0, v1, "#bt-accessory,peripheral:didDiscoverCharacteristics [%@]: Unexpected characteristic discovery. Error: %@");
}

void sub_100417A5C()
{
  sub_10001AC54();
  sub_10001AC6C((void *)&_mh_execute_header, v0, v1, "#bt-accessory,peripheral:didUpdateValueForCharacteristic [%@]: No matching peer. Error: %@");
}

void sub_100417AC4()
{
  sub_1001B06E4();
  sub_1001B0704((void *)&_mh_execute_header, v0, v1, "#bt-accessory,peripheral:didUpdateValueForCharacteristic [%@]: Multi-config characteristic (idx: %d, len: %d): Unexpectedly large");
}

void sub_100417B2C()
{
  sub_1001B06E4();
  sub_1001B0704((void *)&_mh_execute_header, v0, v1, "#bt-accessory,peripheral:didUpdateValueForCharacteristic [%@]: Multi-config characteristic (idx: %d, len: %d): Could not read config count");
}

void sub_100417B94()
{
  sub_10001AC54();
  sub_10001AC6C((void *)&_mh_execute_header, v0, v1, "#bt-accessory,peripheral:didUpdateValueForCharacteristic [%@]: Error: %@");
}

void sub_100417BFC()
{
  sub_10001AC54();
  sub_10001AC6C((void *)&_mh_execute_header, v0, v1, "#bt-accessory,peripheral:didUpdateValueForCharacteristic [%@]: Unexpected characteristic update. Error: %@");
}

void sub_100417C64()
{
  sub_10001AC8C();
  sub_10001AC6C((void *)&_mh_execute_header, v0, v1, "#bt-accessory,BackgroundAuthorization: listener [%@] for peer [%@] NOT authorized");
}

void sub_100417CDC()
{
}

void sub_100417D08()
{
}

void sub_100417D34()
{
}

void sub_100417D60()
{
  sub_100010524();
  _os_log_debug_impl((void *)&_mh_execute_header, v0, OS_LOG_TYPE_DEBUG, "~PRRosePowerManager()", v1, 2u);
}

void sub_100417DA0(os_log_t log)
{
  v1[0] = 67109120;
  v1[1] = 1;
  _os_log_error_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_ERROR, "PRRosePowerManager: Invalid roseDefaultPowerVoteCount, using system default %d", (uint8_t *)v1, 8u);
}

void sub_100417E20()
{
  __assert_rtn("releasePower_block_invoke", "PRRosePowerManager.mm", 92, "fPowerVoteCount >= 0");
}

void sub_100417E4C()
{
  sub_100010524();
  _os_log_error_impl((void *)&_mh_execute_header, v0, OS_LOG_TYPE_ERROR, "PRRosePowerManager: Failed to start RoseIdleTimer, aborting.", v1, 2u);
}

void sub_100417E8C()
{
  sub_100010524();
  _os_log_error_impl((void *)&_mh_execute_header, v0, OS_LOG_TYPE_ERROR, "PRRosePowerManager: RoseIdleTimer timeout unexpected, aborting", v1, 2u);
}

void sub_100417ECC()
{
  sub_100010524();
  _os_log_debug_impl((void *)&_mh_execute_header, v0, OS_LOG_TYPE_DEBUG, "PRRosePowerManager: fRoseIdleTimer Timeout Callback.", v1, 2u);
}

void sub_100417F0C(int a1, NSObject *a2)
{
  v2[0] = 67109120;
  v2[1] = a1;
  _os_log_error_impl((void *)&_mh_execute_header, a2, OS_LOG_TYPE_ERROR, "#nisessmgr,no signing identity for pid: %d. Rejecting connection.", (uint8_t *)v2, 8u);
}

void sub_100417F84(os_log_t log)
{
  *(_WORD *)os_log_t v1 = 0;
  _os_log_error_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_ERROR, "#nisessmgr,Observation session was not permitted.", v1, 2u);
}

void sub_100417FC8(os_log_t log)
{
  int v1 = 138477827;
  CFStringRef v2 = @"nil session is not allowed to activate.";
  _os_log_error_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_ERROR, "#nisessmgr,%{private}@", (uint8_t *)&v1, 0xCu);
}

void sub_10041804C(int a1, NSObject *a2)
{
  v2[0] = 67174915;
  v2[1] = a1;
  __int16 v3 = 2113;
  CFStringRef v4 = @"exceeded kMaxActivatedSessionsPerProcess";
  _os_log_error_impl((void *)&_mh_execute_header, a2, OS_LOG_TYPE_ERROR, "#nisessmgr,pid %{private}d %{private}@.", (uint8_t *)v2, 0x12u);
}

void sub_1004180D8()
{
}

void sub_100418104()
{
  sub_100010524();
  sub_10016F0D8((void *)&_mh_execute_header, v0, v1, "#roseprovider,onRoseReport - RoseSupervisorReportType::Error", v2, v3, v4, v5, v6);
}

void sub_100418138()
{
  sub_10016F0F4();
  sub_100196EB8((void *)&_mh_execute_header, v0, v1, "#roseprovider,Got measurement ticket id: %d", v2, v3, v4, v5, v6);
}

void sub_1004181A4()
{
  sub_100010524();
  sub_10016F0D8((void *)&_mh_execute_header, v0, v1, "#roseprovider,onRoseReport - RoseSupervisorReportType::NewMeasurement", v2, v3, v4, v5, v6);
}

void sub_1004181D8()
{
  sub_100010524();
  sub_10016F0D8((void *)&_mh_execute_header, v0, v1, "#roseprovider,onRoseReport - RoseSupervisorReportType::RequestStatus", v2, v3, v4, v5, v6);
}

void sub_10041820C()
{
  sub_100010524();
  sub_10016F0D8((void *)&_mh_execute_header, v0, v1, "#roseprovider,======================================================================", v2, v3, v4, v5, v6);
}

void sub_100418240(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_1004182B0()
{
  sub_1001BE628();
  sub_1001BE5B8((void *)&_mh_execute_header, v0, v1, "#roseprovider,Rx1SOI_RSSIChain3_dBm: %f", v2, v3, v4, v5, v6);
}

void sub_10041831C()
{
  sub_1001BE628();
  sub_1001BE5B8((void *)&_mh_execute_header, v0, v1, "#roseprovider,Rx2SOI_RSSIChain2_dBm: %f", v2, v3, v4, v5, v6);
}

void sub_100418388()
{
  sub_1001BE628();
  sub_1001BE5B8((void *)&_mh_execute_header, v0, v1, "#roseprovider,Rx1SOI_RSSIChain2_dBm: %f", v2, v3, v4, v5, v6);
}

void sub_1004183F4()
{
  sub_1001BE628();
  sub_1001BE5B8((void *)&_mh_execute_header, v0, v1, "#roseprovider,Rx2SOI_RSSIChain1_dBm: %f", v2, v3, v4, v5, v6);
}

void sub_100418460()
{
  sub_1001BE628();
  sub_1001BE5B8((void *)&_mh_execute_header, v0, v1, "#roseprovider,Rx1SOI_RSSIChain1_dBm: %f", v2, v3, v4, v5, v6);
}

void sub_1004184CC()
{
  sub_10016F0F4();
  sub_100196EB8((void *)&_mh_execute_header, v0, v1, "#roseprovider,Cycle Index: %hu", v2, v3, v4, v5, v6);
}

void sub_100418538()
{
  sub_10016F0F4();
  sub_100196EB8((void *)&_mh_execute_header, v0, v1, "#roseprovider,Session ID: %d", v2, v3, v4, v5, v6);
}

void sub_1004185A4()
{
  sub_100010524();
  sub_10016F0D8((void *)&_mh_execute_header, v0, v1, "#roseprovider,RangeDebugEvent:", v2, v3, v4, v5, v6);
}

void sub_1004185D8()
{
  sub_10001AC8C();
  sub_1001BE5B8((void *)&_mh_execute_header, v0, v1, "#roseprovider,tat_r: %llu", v2, v3, v4, v5, v6);
}

void sub_100418640()
{
  sub_10001AC8C();
  sub_1001BE5B8((void *)&_mh_execute_header, v0, v1, "#roseprovider,rtt_r: %llu", v2, v3, v4, v5, v6);
}

void sub_1004186A8()
{
  sub_10001AC8C();
  sub_1001BE5B8((void *)&_mh_execute_header, v0, v1, "#roseprovider,tat_i: %llu", v2, v3, v4, v5, v6);
}

void sub_100418710()
{
  sub_10001AC8C();
  sub_1001BE5B8((void *)&_mh_execute_header, v0, v1, "#roseprovider,rtt_i: %llu", v2, v3, v4, v5, v6);
}

void sub_100418778(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_1004187E8()
{
  sub_100010524();
  sub_10016F0D8((void *)&_mh_execute_header, v0, v1, "#roseprovider,RangeDebugV2Event:", v2, v3, v4, v5, v6);
}

void sub_10041881C()
{
  sub_100010524();
  sub_10016F0D8((void *)&_mh_execute_header, v0, v1, "#roseprovider,onRoseReport - RoseSupervisorReportType::RangeResultDebugEvent", v2, v3, v4, v5, v6);
}

void sub_100418850()
{
  sub_100010524();
  sub_10016F0D8((void *)&_mh_execute_header, v0, v1, "#roseprovider,onRoseReport - RoseSupervisorReportType::CIRDataEvent", v2, v3, v4, v5, v6);
}

void sub_100418884()
{
  sub_10016F0F4();
  sub_100196EB8((void *)&_mh_execute_header, v0, v1, "#roseprovider,Got AOACIRDataEvent ticket id: %d", v2, v3, v4, v5, v6);
}

void sub_1004188F0()
{
  sub_100010524();
  sub_10016F0D8((void *)&_mh_execute_header, v0, v1, "#roseprovider,onRoseReport - RoseSupervisorReportType::AOACIRDataEvent", v2, v3, v4, v5, v6);
}

void sub_100418924()
{
  sub_10016F0F4();
  sub_100196EB8((void *)&_mh_execute_header, v0, v1, "#roseprovider,Got TOACIRDataEvent ticket id: %d", v2, v3, v4, v5, v6);
}

void sub_100418990()
{
  sub_100010524();
  sub_10016F0D8((void *)&_mh_execute_header, v0, v1, "#roseprovider,onRoseReport - RoseSupervisorReportType::TOACIRDataEvent", v2, v3, v4, v5, v6);
}

void sub_1004189C4()
{
  sub_10016F0F4();
  sub_100196EB8((void *)&_mh_execute_header, v0, v1, "#roseprovider,Got TOACIRDataV2Event ticket id: %d", v2, v3, v4, v5, v6);
}

void sub_100418A30()
{
  sub_100010524();
  sub_10016F0D8((void *)&_mh_execute_header, v0, v1, "#roseprovider,onRoseReport - RoseSupervisorReportType::TOACIRDataV2Event", v2, v3, v4, v5, v6);
}

void sub_100418A64()
{
  sub_100010524();
  sub_1000104E4((void *)&_mh_execute_header, v0, v1, "#roseprovider,cannot parse hello response for unknown HSI", v2, v3, v4, v5, v6);
}

void sub_100418A98()
{
  sub_100010524();
  sub_10016F0D8((void *)&_mh_execute_header, v0, v1, "#roseprovider,onRoseReport - RoseSupervisorReportType::HelloResponse", v2, v3, v4, v5, v6);
}

void sub_100418ACC(int a1, NSObject *a2)
{
  v2[0] = 67109120;
  v2[1] = a1;
  _os_log_error_impl((void *)&_mh_execute_header, a2, OS_LOG_TYPE_ERROR, "#roseprovider,Rose event of unknown opcode : %d", (uint8_t *)v2, 8u);
}

void sub_100418B44()
{
  sub_100010524();
  sub_10016F0D8((void *)&_mh_execute_header, v0, v1, "#roseprovider,onRoseReport - RoseSupervisorReportType::CoexEventData", v2, v3, v4, v5, v6);
}

void sub_100418B78()
{
  sub_100010524();
  sub_10016F0D8((void *)&_mh_execute_header, v0, v1, "#roseprovider,onRoseReport - RoseSupervisorReportType::SuperframeComplete", v2, v3, v4, v5, v6);
}

void sub_100418BAC()
{
  sub_100010524();
  sub_10016F0D8((void *)&_mh_execute_header, v0, v1, "#roseprovider,onRoseReport - RoseSupervisorReportType::PowerStatsResponse", v2, v3, v4, v5, v6);
}

void sub_100418BE0()
{
  sub_100010524();
  sub_10016F0D8((void *)&_mh_execute_header, v0, v1, "#roseprovider,onRoseReport - RoseSupervisorReportType::SessionStartReport", v2, v3, v4, v5, v6);
}

void sub_100418C14()
{
  sub_100010524();
  sub_10016F0D8((void *)&_mh_execute_header, v0, v1, "#roseprovider,onRoseReport - SessionDataReport", v2, v3, v4, v5, v6);
}

void sub_100418C48()
{
  sub_100010524();
  sub_10016F0D8((void *)&_mh_execute_header, v0, v1, "#roseprovider,onRoseReport - RoseSupervisorReportType::SubrateUpdate", v2, v3, v4, v5, v6);
}

void sub_100418C7C(int a1, NSObject *a2)
{
  v2[0] = 67109120;
  v2[1] = a1;
  _os_log_fault_impl((void *)&_mh_execute_header, a2, OS_LOG_TYPE_FAULT, "#roseprovider,LPEM enable response status %d is not RoseFWErrorCode::Success", (uint8_t *)v2, 8u);
}

void sub_100418CF4()
{
}

void sub_100418D20()
{
  sub_1001BE634();
  __int16 v4 = v0;
  int v5 = v1;
  _os_log_debug_impl((void *)&_mh_execute_header, v2, OS_LOG_TYPE_DEBUG, "#roseprovider,#aop-bt-rssi: timestamp = %llu, connHandle = %d, rssi = %d", v3, 0x18u);
}

void sub_100418DA8()
{
  sub_1001BE634();
  _os_log_error_impl((void *)&_mh_execute_header, v0, OS_LOG_TYPE_ERROR, "#roseprovider,#aop-disp-error: ioReportTimeDeltaUs = %llu, state = %d", v1, 0x12u);
}

void sub_100418E28()
{
  sub_1001BE64C();
  _os_log_debug_impl(v0, v1, v2, v3, v4, 0x1Cu);
}

void sub_100418EE0()
{
  sub_10016F0F4();
  __int16 v3 = 1024;
  int v4 = v0;
  __int16 v5 = 1024;
  int v6 = v0;
  _os_log_debug_impl((void *)&_mh_execute_header, v1, OS_LOG_TYPE_DEBUG, "#roseprovider,#aop-sf-update: updateType = %u, btConnHandle = 0x%04x (%u)", v2, 0x14u);
}

void sub_100418F70()
{
  sub_1001BE5F8();
  __int16 v6 = v0;
  uint64_t v7 = v1;
  __int16 v8 = 1024;
  int v9 = v2;
  __int16 v10 = 1024;
  int v11 = v3;
  _os_log_debug_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEBUG, "#roseprovider,#aop-bt-rssi: connHandle = %d, bubbleEnterdBm = %2.1f, bubbleExitThresholddBm = %2.1f, displacingProcessStd = %2.1f, staticProcessStd = %2.1f, measStd = %2.1f, negativeMeasurementRejectionThreshold = %d, txPowerdBm = %d", v5, 0x46u);
}

void sub_100419020()
{
  sub_1001BE65C(__stack_chk_guard);
  sub_1001BE5F8();
  sub_1001BE64C();
  _os_log_debug_impl(v0, v1, v2, v3, v4, 0x42u);
}

void sub_1004190BC()
{
  sub_1001BE65C(__stack_chk_guard);
  sub_1001BE64C();
  _os_log_debug_impl(v0, v1, v2, v3, v4, 0x26u);
}

void sub_100419148()
{
  sub_100010524();
  sub_10016F0D8((void *)&_mh_execute_header, v0, v1, "#roseprovider,~PRRoseProvider()", v2, v3, v4, v5, v6);
}

void sub_10041917C()
{
  sub_100010524();
  sub_1000104E4((void *)&_mh_execute_header, v0, v1, "#roseprovider,_getPreflightInfo, powerOnAndWaitForReady failed", v2, v3, v4, v5, v6);
}

void sub_1004191B0()
{
  sub_100010524();
  sub_1000104E4((void *)&_mh_execute_header, v0, v1, "#roseprovider,_getChipInfo, powerOnAndWaitForReady failed", v2, v3, v4, v5, v6);
}

void sub_1004191E4()
{
  sub_100010524();
  sub_1000104E4((void *)&_mh_execute_header, v0, v1, "#roseprovider,_getChipInfoAsync, powerOnAndWaitForReady failed", v2, v3, v4, v5, v6);
}

void sub_100419218()
{
  sub_100010524();
  sub_1000104E4((void *)&_mh_execute_header, v0, v1, "#roseprovider,_getChipPublicKey, powerOnAndWaitForReady failed", v2, v3, v4, v5, v6);
}

void sub_10041924C()
{
  sub_1001BE670(__stack_chk_guard);
  sub_1001BE684();
  HIWORD(v3) = 36;
  sub_10001AC6C((void *)&_mh_execute_header, v0, v1, "#roseprovider,Unexpected outputBuffer size (%zu) for AOPRoseError (%zu)", v2, v3);
}

void sub_1004192BC()
{
  sub_100175C1C();
  if (v4 != v5) {
    uint64_t v6 = v3;
  }
  else {
    uint64_t v6 = v1;
  }
  sub_1001BE5EC(v2, v6, 4.8149e-34);
  sub_1001BE59C((void *)&_mh_execute_header, v7, v8, "#roseprovider,%s", v9);
  if (*(char *)(v0 + 23) < 0) {
    operator delete(*(void **)v0);
  }
}

void sub_100419310()
{
  sub_100010524();
  sub_1000104E4((void *)&_mh_execute_header, v0, v1, "#roseprovider,Timed out while waiting for hello response.", v2, v3, v4, v5, v6);
}

void sub_100419344()
{
  sub_100175C1C();
  if (v4 != v5) {
    uint64_t v6 = v3;
  }
  else {
    uint64_t v6 = v1;
  }
  sub_1001BE5EC(v2, v6, 4.8149e-34);
  sub_1001BE59C((void *)&_mh_execute_header, v7, v8, "#roseprovider,Rose returned error. Command type: %s", v9);
  if (*(char *)(v0 + 23) < 0) {
    operator delete(*(void **)v0);
  }
}

void sub_100419398()
{
  sub_100010524();
  sub_1000104E4((void *)&_mh_execute_header, v0, v1, "#roseprovider,Failed to probe AOP activity report.", v2, v3, v4, v5, v6);
}

void sub_1004193CC()
{
  sub_100010524();
  sub_100056C38((void *)&_mh_execute_header, v0, v1, "#roseprovider,#aop-activity Requested AOP activity summary, but timed out waiting for part 1.", v2, v3, v4, v5, v6);
}

void sub_100419400()
{
  sub_100010524();
  sub_100056C38((void *)&_mh_execute_header, v0, v1, "#roseprovider,#aop-activity Requested AOP activity summary, but timed out waiting for part 2.", v2, v3, v4, v5, v6);
}

void sub_100419434()
{
  sub_100010524();
  sub_100056C38((void *)&_mh_execute_header, v0, v1, "#roseprovider,#time-convert Requested time conversion, but timed out waiting for report.", v2, v3, v4, v5, v6);
}

void sub_100419468()
{
  sub_100010524();
  sub_100056C38((void *)&_mh_execute_header, v0, v1, "#roseprovider,#time-convert Rose failed to request time conversion.", v2, v3, v4, v5, v6);
}

void sub_10041949C()
{
  sub_100010524();
  sub_1000104E4((void *)&_mh_execute_header, v0, v1, "#roseprovider,#alisha Timed out while waiting for Alisha capabilities.", v2, v3, v4, v5, v6);
}

void sub_1004194D0()
{
  sub_100175C1C();
  if (v4 != v5) {
    uint64_t v6 = v3;
  }
  else {
    uint64_t v6 = v1;
  }
  sub_1001BE5EC(v2, v6, 4.8149e-34);
  sub_1001BE59C((void *)&_mh_execute_header, v7, v8, "#roseprovider,#alisha Rose returned error. Command type: %s", v9);
  if (*(char *)(v0 + 23) < 0) {
    operator delete(*(void **)v0);
  }
}

void sub_100419524()
{
  sub_100010524();
  sub_1000104E4((void *)&_mh_execute_header, v0, v1, "#roseprovider,#alisha Timed out while waiting for Alisha key.", v2, v3, v4, v5, v6);
}

void sub_100419558()
{
  sub_100010524();
  sub_1000104E4((void *)&_mh_execute_header, v0, v1, "#roseprovider,#alisha Timed out while waiting for Alisha key (temporary workaround to prewarm Rose-SE secure channel).", v2, v3, v4, v5, v6);
}

void sub_10041958C()
{
  sub_100010524();
  sub_1000104E4((void *)&_mh_execute_header, v0, v1, "#roseprovider,#alisha Timed out while waiting for Alisha debug set key response.", v2, v3, v4, v5, v6);
}

void sub_1004195C0()
{
  sub_100175C1C();
  if (v4 != v5) {
    uint64_t v6 = v3;
  }
  else {
    uint64_t v6 = v1;
  }
  sub_1001BE5EC(v2, v6, 4.8149e-34);
  sub_1001BE59C((void *)&_mh_execute_header, v7, v8, "#roseprovider,#aop-sf Rose returned error. Command type: %s", v9);
  if (*(char *)(v0 + 23) < 0) {
    operator delete(*(void **)v0);
  }
}

void sub_100419614()
{
  sub_1001BE670(__stack_chk_guard);
  sub_1001BE684();
  HIWORD(v3) = 1;
  sub_10001AC6C((void *)&_mh_execute_header, v0, v1, "#roseprovider,#deep-slp Unexpected outputBuffer size (%zu) for DeepSleepState (%zu)", v2, v3);
}

void sub_100419684()
{
  sub_100175C1C();
  if (v4 != v5) {
    uint64_t v6 = v3;
  }
  else {
    uint64_t v6 = v1;
  }
  sub_1001BE5EC(v2, v6, 4.8149e-34);
  sub_1001BE59C((void *)&_mh_execute_header, v7, v8, "#roseprovider,#deep-slp Rose returned error while sending command. Command type:%s", v9);
  if (*(char *)(v0 + 23) < 0) {
    operator delete(*(void **)v0);
  }
}

void sub_1004196D8()
{
  sub_100010524();
  sub_1000104E4((void *)&_mh_execute_header, v0, v1, "#roseprovider,#alisha Timed out while waiting for Alisha delete keys response.", v2, v3, v4, v5, v6);
}

void sub_10041970C(char a1, NSObject *a2)
{
  if ((a1 - 1) > 2u) {
    uint64_t v2 = "GetKeyResponse";
  }
  else {
    uint64_t v2 = off_100857668[(char)(a1 - 1)];
  }
  int v3 = 136315138;
  uint64_t v4 = v2;
  _os_log_fault_impl((void *)&_mh_execute_header, a2, OS_LOG_TYPE_FAULT, "#roseprovider,#alisha delete keys - got %s report type.", (uint8_t *)&v3, 0xCu);
}

void sub_1004197B0()
{
  __assert_rtn("_sendAlishaDeleteKeysCommandSync", "PRRoseProvider.mm", 853, "inBuffer.size() == sizeof(aop::SupervisorCommandPackets::AlishaDeleteKeysPacket)");
}

void sub_1004197DC()
{
  sub_100010524();
  sub_1000104E4((void *)&_mh_execute_header, v0, v1, "#roseprovider,Timed out while waiting for power stats response.", v2, v3, v4, v5, v6);
}

void sub_100419810()
{
  sub_100010524();
  sub_1000104E4((void *)&_mh_execute_header, v0, v1, "#roseprovider,Unable to query the chip power state. Can't query the power stats.", v2, v3, v4, v5, v6);
}

void sub_100419844()
{
  sub_100010524();
  sub_10016F0D8((void *)&_mh_execute_header, v0, v1, "#roseprovider,relayToProvider -- Command", v2, v3, v4, v5, v6);
}

void sub_100419878()
{
  sub_100175C1C();
  if (v4 != v5) {
    uint64_t v6 = v3;
  }
  else {
    uint64_t v6 = v1;
  }
  sub_1001BE5EC(v2, v6, 4.8149e-34);
  sub_1001BE59C((void *)&_mh_execute_header, v7, v8, "#roseprovider,Rose returned error while sending command. Command type:%s", v9);
  if (*(char *)(v0 + 23) < 0) {
    operator delete(*(void **)v0);
  }
}

void sub_1004198CC()
{
  sub_100010524();
  sub_1000104E4((void *)&_mh_execute_header, v0, v1, "#roseprovider,Error building new service request packet", v2, v3, v4, v5, v6);
}

void sub_100419900()
{
  sub_100010524();
  sub_10016F0D8((void *)&_mh_execute_header, v0, v1, "#roseprovider,relayCommandMessage -- CreateRequest", v2, v3, v4, v5, v6);
}

void sub_100419934()
{
  sub_100010524();
  sub_1000104E4((void *)&_mh_execute_header, v0, v1, "#roseprovider,Error building user trigger start packet", v2, v3, v4, v5, v6);
}

void sub_100419968()
{
  sub_100010524();
  sub_10016F0D8((void *)&_mh_execute_header, v0, v1, "#roseprovider,relayCommandMessage -- StartRequest", v2, v3, v4, v5, v6);
}

void sub_10041999C()
{
  sub_100010524();
  sub_1000104E4((void *)&_mh_execute_header, v0, v1, "#roseprovider,Error building user trigger stop packet", v2, v3, v4, v5, v6);
}

void sub_1004199D0()
{
  sub_100010524();
  sub_10016F0D8((void *)&_mh_execute_header, v0, v1, "#roseprovider,relayCommandMessage -- StopRequest", v2, v3, v4, v5, v6);
}

void sub_100419A04()
{
  sub_100010524();
  sub_1000104E4((void *)&_mh_execute_header, v0, v1, "#roseprovider,Error building cancel service packet", v2, v3, v4, v5, v6);
}

void sub_100419A38()
{
  sub_100010524();
  sub_10016F0D8((void *)&_mh_execute_header, v0, v1, "#roseprovider,relayCommandMessage -- CancelRequest", v2, v3, v4, v5, v6);
}

void sub_100419A6C()
{
  sub_100010524();
  sub_10016F0D8((void *)&_mh_execute_header, v0, v1, "#roseprovider,relayCommandMessage -- UpdateSessionData", v2, v3, v4, v5, v6);
}

void sub_100419AA0()
{
  sub_100010524();
  sub_10016F0D8((void *)&_mh_execute_header, v0, v1, "#roseprovider,relayCommandMessage -- Unspecified", v2, v3, v4, v5, v6);
}

void sub_100419AD4()
{
  sub_100010524();
  sub_10016F0D8((void *)&_mh_execute_header, v0, v1, "#roseprovider,relayToProvider -- Property", v2, v3, v4, v5, v6);
}

void sub_100419B08()
{
}

void sub_100419B34()
{
  sub_100010524();
  sub_1000104E4((void *)&_mh_execute_header, v0, v1, "#roseprovider,Got unspecified AOPRosePropertyMessageType", v2, v3, v4, v5, v6);
}

void sub_100419B68()
{
  sub_10001AC8C();
  sub_1001BE5D4((void *)&_mh_execute_header, v0, v1, "#roseprovider,%@", v2);
}

void sub_100419BD4(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_100419C50(NSObject *a1, uint64_t a2, uint64_t a3)
{
  int v3 = 138412290;
  CFStringRef v4 = @"pushBeaconAllowlist: may only push BLE or UUID identified beacons.";
  sub_1001BE5D4((void *)&_mh_execute_header, a1, a3, "#roseprovider,%@", (uint8_t *)&v3);
}

void sub_100419CCC(NSObject *a1, uint64_t a2, uint64_t a3)
{
  int v3 = 138412290;
  CFStringRef v4 = @"Given vector of different types beacons. All beacons must be of the same identifer type.";
  sub_1001BE5D4((void *)&_mh_execute_header, a1, a3, "#roseprovider,%@", (uint8_t *)&v3);
}

void sub_100419D48()
{
  sub_10001AC8C();
  sub_1001BE5D4((void *)&_mh_execute_header, v0, v1, "#roseprovider,LE thresholds array does not have exactly 2 values. %@", v2);
}

uint64_t sub_100419DB4(uint64_t *a1, uint64_t *a2)
{
  uint64_t v3 = *a1;
  *a1 = 0;
  if (v3) {
    operator delete();
  }
  uint64_t result = *a2;
  *a2 = 0;
  if (result)
  {
    operator delete();
  }
  return result;
}

uint64_t sub_100419E30(uint64_t *a1)
{
  uint64_t result = *a1;
  *a1 = 0;
  if (result) {
    operator delete();
  }
  return result;
}

void sub_100419E58(os_log_t log)
{
  *(_WORD *)uint64_t v1 = 0;
  _os_log_debug_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_DEBUG, "ignoring identifier-less sample", v1, 2u);
}

void sub_100419E9C()
{
  sub_100010524();
  sub_1000104E4((void *)&_mh_execute_header, v0, v1, "#alisha-ca,requesting session while another session request is still active", v2, v3, v4, v5, v6);
}

void sub_100419ED0()
{
  sub_100010524();
  sub_1000104E4((void *)&_mh_execute_header, v0, v1, "#alisha-ca,Inconsistent session event (sessionStarted)", v2, v3, v4, v5, v6);
}

void sub_100419F04()
{
  sub_100010524();
  sub_1000104E4((void *)&_mh_execute_header, v0, v1, "#alisha-ca,Inconsistent session event (sessionEnded)", v2, v3, v4, v5, v6);
}

void sub_100419F38()
{
  sub_100010524();
  sub_1000104E4((void *)&_mh_execute_header, v0, v1, "#alisha-ca,Inconsistent request event (rangingWasDisallowed)", v2, v3, v4, v5, v6);
}

void sub_100419F6C()
{
  sub_100010524();
  sub_1000104E4((void *)&_mh_execute_header, v0, v1, "#alisha-ca,Inconsistent request event (dckErrorSendEventNotification)", v2, v3, v4, v5, v6);
}

void sub_100419FA0()
{
  sub_100010524();
  sub_1000104E4((void *)&_mh_execute_header, v0, v1, "#alisha-ca,Inconsistent request event (dckErrorReturnErrorCode)", v2, v3, v4, v5, v6);
}

void sub_100419FD4()
{
  sub_100010524();
  sub_1000104E4((void *)&_mh_execute_header, v0, v1, "#alisha-ca,Inconsistent session event (reportVehicleLocked)", v2, v3, v4, v5, v6);
}

void sub_10041A008()
{
  sub_100010524();
  sub_1000104E4((void *)&_mh_execute_header, v0, v1, "#alisha-ca,Inconsistent session event (reportVehicleUnlocked)", v2, v3, v4, v5, v6);
}

void sub_10041A03C()
{
  sub_100010524();
  sub_1000104E4((void *)&_mh_execute_header, v0, v1, "#alisha-ca,Inconsistent session event (reportVehicleReadyToDrive)", v2, v3, v4, v5, v6);
}

void sub_10041A070()
{
  sub_100010524();
  sub_1000104E4((void *)&_mh_execute_header, v0, v1, "#alisha-ca,Inconsistent request event (getKeyStarted)", v2, v3, v4, v5, v6);
}

void sub_10041A0A4()
{
  sub_100010524();
  sub_1000104E4((void *)&_mh_execute_header, v0, v1, "#alisha-ca,Inconsistent request event (getKeyFinished)", v2, v3, v4, v5, v6);
}

void sub_10041A0D8()
{
  sub_100010524();
  sub_1000104E4((void *)&_mh_execute_header, v0, v1, "#alisha-ca,Inconsistent session event (sessionStatsUpdated)", v2, v3, v4, v5, v6);
}

void sub_10041A10C()
{
  __assert_rtn("sessionStatsUpdated", "NIServerCarKeyAnalyticsManager.mm", 361, "sessionStats.numBlocksWithAnchors.size() >= kMaxAnchorsToCount");
}

void sub_10041A138(uint64_t a1, uint64_t a2, os_log_t log)
{
  int v3 = 138412546;
  uint64_t v4 = a1;
  __int16 v5 = 2112;
  uint64_t v6 = a2;
  _os_log_error_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_ERROR, "#ni-assertion,Failed to acquire %@. Error: %@", (uint8_t *)&v3, 0x16u);
}

void sub_10041A1C0(uint64_t a1, NSObject *a2)
{
  uint64_t v2 = *(void *)(a1 + 8);
  int v3 = 138412290;
  uint64_t v4 = v2;
  _os_log_debug_impl((void *)&_mh_execute_header, a2, OS_LOG_TYPE_DEBUG, "#bg-continuation,Measurement received. Session identifier: %@", (uint8_t *)&v3, 0xCu);
}

void sub_10041A23C(os_log_t log)
{
  *(_WORD *)uint64_t v1 = 0;
  _os_log_error_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_ERROR, "#bg-continuation,NotAuthorized is a terminal state. Dropping state change", v1, 2u);
}

void sub_10041A280()
{
}

void sub_10041A2AC()
{
}

void sub_10041A2D8()
{
  __assert_rtn("operator()", "RoseAOAtoPDOAMapping.cpp", 39, "azDeg >= fMinAzDeg");
}

void sub_10041A304()
{
  __assert_rtn("operator()", "RoseAOAtoPDOAMapping.cpp", 40, "azDeg <= fMaxAzDeg");
}

void sub_10041A330()
{
  __assert_rtn("operator()", "RoseAOAtoPDOAMapping.cpp", 41, "elDeg >= fMinElDeg");
}

void sub_10041A35C()
{
  __assert_rtn("operator()", "RoseAOAtoPDOAMapping.cpp", 42, "elDeg <= fMaxElDeg");
}

void sub_10041A388()
{
  __assert_rtn("operator()", "RoseAOAtoPDOAMapping.cpp", 50, "azDeg >= fMinAzDeg");
}

void sub_10041A3B4()
{
  __assert_rtn("operator()", "RoseAOAtoPDOAMapping.cpp", 51, "azDeg <= fMaxAzDeg");
}

void sub_10041A3E0()
{
  __assert_rtn("operator()", "RoseAOAtoPDOAMapping.cpp", 52, "elDeg >= fMinElDeg");
}

void sub_10041A40C()
{
  __assert_rtn("operator()", "RoseAOAtoPDOAMapping.cpp", 53, "elDeg <= fMaxElDeg");
}

void sub_10041A438()
{
  __assert_rtn("operator+=", "RoseAOAtoPDOAMapping.cpp", 248, "ch9CalAvailable() && rhs.ch9CalAvailable()");
}

void sub_10041A464()
{
  __assert_rtn("operator+=", "RoseAOAtoPDOAMapping.cpp", 247, "checkCalBlobIntegrity() && rhs.checkCalBlobIntegrity() && fChannelAvailabilityMask == rhs.getChannelAvailabilityMask()");
}

void sub_10041A490(os_log_t log)
{
  *(_WORD *)uint64_t v1 = 0;
  _os_log_fault_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_FAULT, "#obsrvr, Unpermitted client attempting to start an observation session.", v1, 2u);
}

void sub_10041A4D4(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_10041A54C(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_10041A5C4(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_10041A63C(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_10041A6B4(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_10041A72C(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_10041A7A4()
{
  sub_100010524();
  sub_1000104E4((void *)&_mh_execute_header, v0, v1, "#ses-acwg,lockIdentifier is nil", v2, v3, v4, v5, v6);
}

void sub_10041A7D8()
{
  sub_100010524();
  sub_1000104E4((void *)&_mh_execute_header, v0, v1, "#ses-acwg,lockIdentifier is not a valid UUID", v2, v3, v4, v5, v6);
}

void sub_10041A80C(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_10041A884()
{
}

void sub_10041A8B0(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_10041A928(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_10041A9A0(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_10041AA18()
{
  sub_100010524();
  sub_100056C38((void *)&_mh_execute_header, v0, v1, "#ses-acwg,run() but no ACWG manager", v2, v3, v4, v5, v6);
}

void sub_10041AA4C()
{
  sub_10001AC8C();
  sub_10000B3E0((void *)&_mh_execute_header, v0, v1, "#ses-acwg,%@", v2, v3, v4, v5, v6);
}

void sub_10041AAB4(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_10041AB2C()
{
  sub_100010524();
  sub_1000104E4((void *)&_mh_execute_header, v0, v1, "#ses-acwg,_pauseOwnerSession but no Acwg manager", v2, v3, v4, v5, v6);
}

void sub_10041AB60()
{
  sub_100010524();
  sub_100056C38((void *)&_mh_execute_header, v0, v1, "#ses-acwg,Pause Source Invalid", v2, v3, v4, v5, v6);
}

void sub_10041AB94(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_10041AC0C()
{
  sub_100010524();
  sub_100056C38((void *)&_mh_execute_header, v0, v1, "#ses-acwg,processAcwgM1Msg but no ACWG manager", v2, v3, v4, v5, v6);
}

void sub_10041AC40()
{
  sub_100010524();
  sub_100056C38((void *)&_mh_execute_header, v0, v1, "#ses-acwg,ACWG session reason stack cannot be empty on M1 error", v2, v3, v4, v5, v6);
}

void sub_10041AC74(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_10041ACEC()
{
  sub_100010524();
  sub_100056C38((void *)&_mh_execute_header, v0, v1, "#ses-acwg,processAcwgM3Msg but no ACWG manager", v2, v3, v4, v5, v6);
}

void sub_10041AD20(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_10041AD98()
{
  sub_100010524();
  sub_100056C38((void *)&_mh_execute_header, v0, v1, "#ses-acwg,suspendAcwgRanging but no ACWG manager", v2, v3, v4, v5, v6);
}

void sub_10041ADCC()
{
  sub_100010524();
  sub_100056C38((void *)&_mh_execute_header, v0, v1, "#ses-acwg,clients are not allowed to use NI surfaced suspend reasons", v2, v3, v4, v5, v6);
}

void sub_10041AE00(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_10041AE78()
{
  sub_100010524();
  sub_100056C38((void *)&_mh_execute_header, v0, v1, "#ses-acwg,processAcwgRangingSessionResumeRequestMsg but no ACWG manager", v2, v3, v4, v5, v6);
}

void sub_10041AEAC()
{
  sub_100010524();
  sub_100056C38((void *)&_mh_execute_header, v0, v1, "#ses-acwg,ACWG session reason stack cannot be empty on resume error", v2, v3, v4, v5, v6);
}

void sub_10041AEE0(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_10041AF58()
{
  sub_100010524();
  sub_100056C38((void *)&_mh_execute_header, v0, v1, "#ses-acwg,prefetchAcwgUrsk but no ACWG manager", v2, v3, v4, v5, v6);
}

void sub_10041AF8C(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_10041B004()
{
  sub_100010524();
  sub_100056C38((void *)&_mh_execute_header, v0, v1, "#ses-acwg,processBluetoothHostTimeSyncWithType but no ACWG manager", v2, v3, v4, v5, v6);
}

void sub_10041B038(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_10041B0B0()
{
  sub_100010524();
  sub_100056C38((void *)&_mh_execute_header, v0, v1, "#ses-acwg,", v2, v3, v4, v5, v6);
}

void sub_10041B0E4(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_10041B15C()
{
  sub_100010524();
  sub_1000104E4((void *)&_mh_execute_header, v0, v1, "#ses-acwg,deleteURSKs but no ACWG manager", v2, v3, v4, v5, v6);
}

void sub_10041B190(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_10041B208(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_10041B280(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_10041B2F8(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_10041B370(uint64_t a1)
{
  sub_1001D44C8();
  if (v7 != v8) {
    uint64_t v9 = v6;
  }
  else {
    uint64_t v9 = v2;
  }
  *(_DWORD *)uint64_t v3 = 136315138;
  *(void *)(v3 + 4) = v9;
  _os_log_error_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_ERROR, "#ses-acwg,Failed to allocate Acwg session (%s)", v5, 0xCu);
  if (*(char *)(a1 + 23) < 0) {
    operator delete(*(void **)a1);
  }
}

void sub_10041B3DC(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_10041B454(uint64_t a1)
{
  sub_1001D44C8();
  if (v7 != v8) {
    uint64_t v9 = v6;
  }
  else {
    uint64_t v9 = v2;
  }
  *(_DWORD *)uint64_t v3 = 136315138;
  *(void *)(v3 + 4) = v9;
  _os_log_error_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_ERROR, "#ses-acwg,Alisha session invalidated unexpectedly. Reason: %s", v5, 0xCu);
  if (*(char *)(a1 + 23) < 0) {
    operator delete(*(void **)a1);
  }
}

void sub_10041B4C0(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_10041B538(std::__shared_weak_count **a1, std::__shared_weak_count *this)
{
  uint64_t v3 = *a1;
  if (v3) {
    sub_10001A970(v3);
  }
  std::__shared_weak_count::~__shared_weak_count(this);
  operator delete(v4);
}

void sub_10041B570(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_10041B5E8(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_10041B660(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_10041B6D8()
{
  sub_100010524();
  sub_100056C38((void *)&_mh_execute_header, v0, v1, "#ses-acwg,ACWG session suspend timestamp isn't valid", v2, v3, v4, v5, v6);
}

void sub_10041B70C()
{
  sub_100010524();
  sub_100056C38((void *)&_mh_execute_header, v0, v1, "#ses-acwg,ACWG session reason stack cannot be empty here", v2, v3, v4, v5, v6);
}

void sub_10041B740(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_10041B7B8(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_10041B830(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_10041B8A8(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_10041B920()
{
  sub_1001D44C8();
  if (v3 != v4) {
    uint64_t v5 = v2;
  }
  else {
    uint64_t v5 = v0;
  }
  int v6 = 136315138;
  uint64_t v7 = v5;
  _os_log_fault_impl((void *)&_mh_execute_header, v1, OS_LOG_TYPE_FAULT, "#ses-acwg,timeout event %s unsupported", (uint8_t *)&v6, 0xCu);
}

void sub_10041B9A0(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_10041BA18(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_10041BA90()
{
  sub_100010524();
  sub_1000104E4((void *)&_mh_execute_header, v0, v1, "#ses-acwg,ACWG session destroyed when receiving AopSensorFusionUpdate", v2, v3, v4, v5, v6);
}

void sub_10041BAC4(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_10041BB3C()
{
}

void sub_10041BB68()
{
  __assert_rtn("AcwgConfigProvider", "NIServerAcwgSession.mm", 135, "minRanMultiplier <= std::numeric_limits<decltype(_minRanMultiplier)>::max()");
}

void sub_10041BB94()
{
}

void sub_10041BBC0()
{
  sub_100010524();
  sub_100056C38((void *)&_mh_execute_header, v0, v1, "#ses-acwg,Existing service request does not have tx_preamble. Cannot add it to running count.", v2, v3, v4, v5, v6);
}

void sub_10041BBF4()
{
  sub_100010524();
  sub_100056C38((void *)&_mh_execute_header, v0, v1, "#ses-acwg,Not supported tx_preamble in service request", v2, v3, v4, v5, v6);
}

void sub_10041BC28()
{
  sub_100010524();
  sub_1000104E4((void *)&_mh_execute_header, v0, v1, "#ses-acwg,Failed to create acwg session.", v2, v3, v4, v5, v6);
}

void sub_10041BC5C(os_log_t log)
{
  int v1 = 138412290;
  CFStringRef v2 = @"Not authorized.";
  _os_log_error_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_ERROR, "#ses-system,%@", (uint8_t *)&v1, 0xCu);
}

void sub_10041BCE0(uint64_t a1, NSObject *a2)
{
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_error_impl((void *)&_mh_execute_header, a2, OS_LOG_TYPE_ERROR, "[PRAppStateMonitor] error creating handle for identifier. Error: %@", (uint8_t *)&v2, 0xCu);
}

void sub_10041BD58(int *a1, int a2, os_log_t log)
{
  int v3 = *a1;
  v4[0] = 67109376;
  v4[1] = a2;
  __int16 v5 = 1024;
  int v6 = v3;
  _os_log_fault_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_FAULT, "[PRAppStateMonitor] pid (%d) != _monitoredPID (%d)", (uint8_t *)v4, 0xEu);
}

void sub_10041BDE4()
{
  sub_100010524();
  _os_log_fault_impl((void *)&_mh_execute_header, v0, OS_LOG_TYPE_FAULT, "#peer-gr,Run called without a successful configuration.", v1, 2u);
}

void sub_10041BE24()
{
  sub_100010524();
  _os_log_debug_impl((void *)&_mh_execute_header, v0, OS_LOG_TYPE_DEBUG, "#peer-gr,sending data from GR session to rose base session", v1, 2u);
}

void sub_10041BE64(int *a1, NSObject *a2)
{
  int v2 = *a1;
  v3[0] = 67109120;
  v3[1] = v2;
  _os_log_fault_impl((void *)&_mh_execute_header, a2, OS_LOG_TYPE_FAULT, "#peer-gr,Unexpected RoseSolutionType: %d", (uint8_t *)v3, 8u);
}

void sub_10041BEE0()
{
  sub_100175C1C();
  if (v6 != v7) {
    uint64_t v8 = v5;
  }
  else {
    uint64_t v8 = v1;
  }
  *(_DWORD *)uint64_t v2 = 136315138;
  *(void *)(v2 + 4) = v8;
  sub_1001BE59C((void *)&_mh_execute_header, v2, v3, "#peer-gr,Rose session invalidated unexpectedly. Reason: %s", v4);
  if (*(char *)(v0 + 23) < 0) {
    operator delete(*(void **)v0);
  }
}

void sub_10041BF38()
{
  sub_100175C1C();
  if (v6 != v7) {
    uint64_t v8 = v5;
  }
  else {
    uint64_t v8 = v1;
  }
  *(_DWORD *)uint64_t v2 = 136315138;
  *(void *)(v2 + 4) = v8;
  sub_1001BE59C((void *)&_mh_execute_header, v2, v3, "#peer-gr,Failed to allocate a UWB session. Error: %s", v4);
  if (*(char *)(v0 + 23) < 0) {
    operator delete(*(void **)v0);
  }
}

void sub_10041BF90()
{
  sub_100010524();
  _os_log_error_impl((void *)&_mh_execute_header, v0, OS_LOG_TYPE_ERROR, "#peer-gr,Configuration Manager error", v1, 2u);
}

void sub_10041BFD0()
{
  sub_100010524();
  _os_log_error_impl((void *)&_mh_execute_header, v0, OS_LOG_TYPE_ERROR, "#peer-gr,Resource manager did not provide discovery token", v1, 2u);
}

void sub_10041C010()
{
  sub_100010524();
  _os_log_fault_impl((void *)&_mh_execute_header, v0, OS_LOG_TYPE_FAULT, "#peer-gr,Unable to determine UWB channels", v1, 2u);
}

void sub_10041C050()
{
  sub_100175C1C();
  if (v6 != v7) {
    uint64_t v8 = v5;
  }
  else {
    uint64_t v8 = v1;
  }
  *(_DWORD *)uint64_t v2 = 136315138;
  *(void *)(v2 + 4) = v8;
  sub_1001BE59C((void *)&_mh_execute_header, v2, v3, "#peer-gr,Failed to start ranging. Return code: %s", v4);
  if (*(char *)(v0 + 23) < 0) {
    operator delete(*(void **)v0);
  }
}

void sub_10041C0A8()
{
  sub_10001AC8C();
  sub_100029DF8((void *)&_mh_execute_header, v0, v1, "#find-proxy,UpdatesEngine init failed with error %@", v2, v3, v4, v5, v6);
}

void sub_10041C110()
{
  sub_10001AC8C();
  sub_100029DF8((void *)&_mh_execute_header, v0, v1, "#find-proxy,Error after notifying device unlocked since boot: %@", v2, v3, v4, v5, v6);
}

void sub_10041C178()
{
  sub_100010524();
  sub_100056C38((void *)&_mh_execute_header, v0, v1, "#find-proxy,Prepare token cache: could not get current boot UUID", v2, v3, v4, v5, v6);
}

void sub_10041C1AC()
{
  sub_100010524();
  sub_100056C38((void *)&_mh_execute_header, v0, v1, "#find-proxy,Prepare token cache: reset failed", v2, v3, v4, v5, v6);
}

void sub_10041C1E0()
{
  sub_100010500();
  sub_100029DF8((void *)&_mh_execute_header, v0, v1, "#find-proxy,Prepare token cache: error restoring from cache: %@", v2, v3, v4, v5, v6);
}

void sub_10041C250()
{
  sub_100010524();
  sub_100056C38((void *)&_mh_execute_header, v0, v1, "#find-proxy,Prepare token cache: not ready", v2, v3, v4, v5, v6);
}

void sub_10041C284()
{
  sub_10001AC8C();
  sub_10000B3E0((void *)&_mh_execute_header, v0, v1, "#find-proxy,Error enabling interaction after setting new tokens: %@", v2, v3, v4, v5, v6);
}

void sub_10041C2EC()
{
  sub_10001AC8C();
  sub_10000B3E0((void *)&_mh_execute_header, v0, v1, "#find-proxy,Error setting token cache: %@", v2, v3, v4, v5, v6);
}

void sub_10041C354()
{
  sub_10001AC8C();
  sub_10000B3E0((void *)&_mh_execute_header, v0, v1, "#find-proxy,Error stopping ranging with peer: %@", v2, v3, v4, v5, v6);
}

void sub_10041C3BC()
{
  sub_10001AC8C();
  sub_10000B3E0((void *)&_mh_execute_header, v0, v1, "#find-proxy,Error stopping advertising to peer: %@", v2, v3, v4, v5, v6);
}

void sub_10041C424()
{
  sub_100010524();
  sub_100056C38((void *)&_mh_execute_header, v0, v1, "#find-proxy,Failed to create location manager", v2, v3, v4, v5, v6);
}

void sub_10041C458()
{
  sub_100010524();
  sub_100056C38((void *)&_mh_execute_header, v0, v1, "#find-proxy,Failed to create PDR manager", v2, v3, v4, v5, v6);
}

void sub_10041C48C()
{
  sub_100010524();
  sub_100056C38((void *)&_mh_execute_header, v0, v1, "#find-proxy,Failed to create motion activity manager", v2, v3, v4, v5, v6);
}

void sub_10041C4C0()
{
  sub_100010524();
  sub_100056C38((void *)&_mh_execute_header, v0, v1, "#find-proxy,Failed to create pedometer manager", v2, v3, v4, v5, v6);
}

void sub_10041C4F4()
{
  sub_100010524();
  sub_100056C38((void *)&_mh_execute_header, v0, v1, "#find-proxy,Failed to create altimeter manager", v2, v3, v4, v5, v6);
}

void sub_10041C528()
{
  sub_100010524();
  sub_100056C38((void *)&_mh_execute_header, v0, v1, "#find-proxy,Failed to create motion manager", v2, v3, v4, v5, v6);
}

void sub_10041C55C()
{
  sub_100010524();
  sub_100056C38((void *)&_mh_execute_header, v0, v1, "#find-proxy,Couldn't activate OS transaction while findable", v2, v3, v4, v5, v6);
}

void sub_10041C590(int a1, NSObject *a2)
{
  v2[0] = 67109120;
  v2[1] = a1;
  _os_log_fault_impl((void *)&_mh_execute_header, a2, OS_LOG_TYPE_FAULT, "#find-proxy,Couldn't activate power assertion while interacting. Return code %d", (uint8_t *)v2, 8u);
}

void sub_10041C608()
{
  sub_100010524();
  sub_100056C38((void *)&_mh_execute_header, v0, v1, "#find-proxy,Couldn't activate OS transaction while interacting", v2, v3, v4, v5, v6);
}

void sub_10041C63C(int a1, NSObject *a2)
{
  v2[0] = 67109120;
  v2[1] = a1;
  _os_log_fault_impl((void *)&_mh_execute_header, a2, OS_LOG_TYPE_FAULT, "#find-proxy,Couldn't deactivate power assertion while interacting. Return code %d", (uint8_t *)v2, 8u);
}

void sub_10041C6B4()
{
  sub_10001AC8C();
  sub_10000B3E0((void *)&_mh_execute_header, v0, v1, "#find-proxy,Ranging error: %@", v2, v3, v4, v5, v6);
}

void sub_10041C71C()
{
  sub_10001AC8C();
  sub_100029DF8((void *)&_mh_execute_header, v0, v1, "#find-proxy,Failed to start advertising: %@", v2, v3, v4, v5, v6);
}

void sub_10041C784()
{
}

void sub_10041C7B0()
{
  sub_10001AC8C();
  sub_100029DF8((void *)&_mh_execute_header, v0, v1, "#find-proxy,Failed to stop ranging: %@", v2, v3, v4, v5, v6);
}

void sub_10041C818()
{
  sub_10001AC8C();
  sub_100029DF8((void *)&_mh_execute_header, v0, v1, "#find-proxy,Failed to stop advertising: %@", v2, v3, v4, v5, v6);
}

void sub_10041C880()
{
  sub_10001AC8C();
  sub_10000B3E0((void *)&_mh_execute_header, v0, v1, "#find-proxy,Error setting eligible discovery peers: %@", v2, v3, v4, v5, v6);
}

void sub_10041C8E8()
{
  sub_100010524();
  sub_100056C38((void *)&_mh_execute_header, v0, v1, "#find-proxy,shouldInteract returned NO, not going to enable interaction", v2, v3, v4, v5, v6);
}

void sub_10041C91C()
{
  sub_100010524();
  sub_100056C38((void *)&_mh_execute_header, v0, v1, "#find-proxy,shouldInteract returned YES, not going to disable interaction", v2, v3, v4, v5, v6);
}

void sub_10041C950()
{
  sub_100010500();
  sub_10000B3E0((void *)&_mh_execute_header, v0, v1, "#find-proxy,Error stopping scanning: %@", v2, v3, v4, v5, v6);
}

void sub_10041C9C0()
{
  sub_1001EF398(__stack_chk_guard);
  sub_100010500();
  sub_10000B3E0((void *)&_mh_execute_header, v0, v1, "#find-proxy,Error stopping ranging: %@", v2, v3, v4, v5, v6);
}

void sub_10041CA28()
{
  sub_1001EF398(__stack_chk_guard);
  sub_100010500();
  sub_10000B3E0((void *)&_mh_execute_header, v0, v1, "#find-proxy,Error stopping advertising: %@", v2, v3, v4, v5, v6);
}

void sub_10041CA90()
{
  sub_100010524();
  sub_1000104E4((void *)&_mh_execute_header, v0, v1, "#find-proxy,didRangeWithPeer with nil token. Possible race condition.", v2, v3, v4, v5, v6);
}

void sub_10041CAC4()
{
  sub_100010524();
  sub_1000104E4((void *)&_mh_execute_header, v0, v1, "#find-proxy,didAttemptRangingWithPeer with nil token. Possible race condition.", v2, v3, v4, v5, v6);
}

void sub_10041CAF8(void *a1, uint8_t *buf, os_log_t log)
{
  *(_DWORD *)buf = 138412290;
  *(void *)(buf + 4) = a1;
  _os_log_debug_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_DEBUG, "#find-proxy,%@", buf, 0xCu);
}

void sub_10041CB50()
{
  sub_10001AC8C();
  _os_log_debug_impl((void *)&_mh_execute_header, v0, OS_LOG_TYPE_DEBUG, "#find-proxy,%@", v1, 0xCu);
}

void sub_10041CBC4()
{
  sub_100010524();
  sub_1000104E4((void *)&_mh_execute_header, v0, v1, "#find-proxy,Ranging terminated callback with nil token. Possible race condition.", v2, v3, v4, v5, v6);
}

void sub_10041CBF8()
{
  sub_100010524();
  sub_1000104E4((void *)&_mh_execute_header, v0, v1, "#find-proxy,altitudeData is nil", v2, v3, v4, v5, v6);
}

void sub_10041CC2C()
{
  sub_10001AC8C();
  sub_10000B3E0((void *)&_mh_execute_header, v0, v1, "#find-proxy,error receiving altimeter data: %{public}@", v2, v3, v4, v5, v6);
}

void sub_10041CC94()
{
  sub_100010524();
  sub_1000104E4((void *)&_mh_execute_header, v0, v1, "#find-proxy,pedometerData is nil", v2, v3, v4, v5, v6);
}

void sub_10041CCC8()
{
  sub_100010500();
  sub_10000B3E0((void *)&_mh_execute_header, v0, v1, "#find-proxy,error receiving pedometer data: %{public}@", v2, v3, v4, v5, v6);
}

void sub_10041CD34()
{
  sub_100010500();
  sub_10000B3E0((void *)&_mh_execute_header, v0, v1, "#find-proxy,error receiving pedometer event: %{public}@", v2, v3, v4, v5, v6);
}

void sub_10041CDA0()
{
  sub_100010524();
  sub_1000104E4((void *)&_mh_execute_header, v0, v1, "#find-proxy,motion activity is nil", v2, v3, v4, v5, v6);
}

void sub_10041CDD4()
{
  sub_100010524();
  sub_1000104E4((void *)&_mh_execute_header, v0, v1, "#find-proxy,device motion is nil", v2, v3, v4, v5, v6);
}

void sub_10041CE08()
{
  sub_100010524();
  sub_1000104E4((void *)&_mh_execute_header, v0, v1, "#find-proxy,Could not convert pdr state time to mach continuous", v2, v3, v4, v5, v6);
}

void sub_10041CE3C()
{
  sub_10001AC8C();
  _os_log_debug_impl((void *)&_mh_execute_header, v0, OS_LOG_TYPE_DEBUG, "#find-proxy,pdr state received: %@", v1, 0xCu);
}

void sub_10041CEB0()
{
  sub_10001AC8C();
  sub_10000B3E0((void *)&_mh_execute_header, v0, v1, "#find-proxy,error receiving PDRState: %{public}@", v2, v3, v4, v5, v6);
}

void sub_10041CF18()
{
  sub_100010524();
  sub_10016F0D8((void *)&_mh_execute_header, v0, v1, "#find-proxy, #findalgs pdr handler", v2, v3, v4, v5, v6);
}

void sub_10041CF4C()
{
  sub_100010524();
  sub_1000104E4((void *)&_mh_execute_header, v0, v1, "#find-proxy,Could not convert device motion time to mach continuous", v2, v3, v4, v5, v6);
}

void sub_10041CF80()
{
  sub_10001AC8C();
  sub_10000B3E0((void *)&_mh_execute_header, v0, v1, "#find-proxy,error receiving DeviceMotion: %{public}@", v2, v3, v4, v5, v6);
}

void sub_10041CFE8()
{
  sub_100010524();
  sub_10016F0D8((void *)&_mh_execute_header, v0, v1, "#find-proxy,didUpdateFindeeData", v2, v3, v4, v5, v6);
}

void sub_10041D01C()
{
  sub_100010524();
  sub_1000104E4((void *)&_mh_execute_header, v0, v1, "#find-proxy,locations array is nil", v2, v3, v4, v5, v6);
}

void sub_10041D050()
{
  sub_100010524();
  sub_1000104E4((void *)&_mh_execute_header, v0, v1, "#find-proxy,current location not updated", v2, v3, v4, v5, v6);
}

void sub_10041D084()
{
  sub_10001AC8C();
  sub_100029DF8((void *)&_mh_execute_header, v0, v1, "#find-proxy,unexpected location manager error: %@", v2, v3, v4, v5, v6);
}

void sub_10041D0EC()
{
  sub_100010524();
  sub_10016F0D8((void *)&_mh_execute_header, v0, v1, "#find-proxy,user denied request to monitor location and heading updates", v2, v3, v4, v5, v6);
}

void sub_10041D120(os_log_t log)
{
  *(_WORD *)uint64_t v1 = 0;
  _os_log_fault_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_FAULT, "#nimd,MotionActivity is not available, return", v1, 2u);
}

void sub_10041D164(os_log_t log)
{
  *(_WORD *)uint64_t v1 = 0;
  _os_log_error_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_ERROR, "#nimd,cannot start activity updates because fMotionActivityMgr is nil", v1, 2u);
}

void sub_10041D1A8(os_log_t log)
{
  *(_WORD *)uint64_t v1 = 0;
  _os_log_error_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_ERROR, "#nimd,cannot start device motion updates because fMotionManager is nil", v1, 2u);
}

void sub_10041D1EC()
{
  __assert_rtn("processGravityVector", "NIServerMotionDetector.mm", 506, "_gxBuf.size() == kDequeSize");
}

void sub_10041D218()
{
  __assert_rtn("processGravityVector", "NIServerMotionDetector.mm", 500, "_gyBuf.size() == _gzBuf.size()");
}

void sub_10041D244()
{
  __assert_rtn("processGravityVector", "NIServerMotionDetector.mm", 499, "_gxBuf.size() == _gyBuf.size()");
}

void sub_10041D270()
{
  __assert_rtn("_computeMaxAngle", "NIServerMotionDetector.mm", 534, "z.size() == M");
}

void sub_10041D29C()
{
  __assert_rtn("_computeMaxAngle", "NIServerMotionDetector.mm", 533, "y.size() == M");
}

void sub_10041D2C8(uint64_t a1, NSObject *a2)
{
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_fault_impl((void *)&_mh_execute_header, a2, OS_LOG_TYPE_FAULT, "Device %@ does not have token data and it is not a known device", (uint8_t *)&v2, 0xCu);
}

void sub_10041D340()
{
}

void sub_10041D36C()
{
}

void sub_10041D398()
{
  sub_100010500();
  sub_1001FDE5C((void *)&_mh_execute_header, v0, v1, "regulatory,geo,mon,maxLocationAge,%.1f", v2);
}

void sub_10041D410()
{
  sub_100010500();
  sub_1001FDE5C((void *)&_mh_execute_header, v0, v1, "regulatory,geo,mon,maxMccAge,%.1f", v2);
}

void sub_10041D488()
{
  sub_10016F0F4();
  sub_100196EB8((void *)&_mh_execute_header, v0, v1, "regulatory,geo,sm,extendRetriesBackToCount:%d", v2, v3, v4, v5, v6);
}

void sub_10041D4F4()
{
  sub_10016F0F4();
  __int16 v3 = 1024;
  int v4 = v0;
  _os_log_debug_impl((void *)&_mh_execute_header, v1, OS_LOG_TYPE_DEBUG, "regulatory,geo,sm,retryLocation,total:%d,left:%d", v2, 0xEu);
}

void sub_10041D580(os_log_t log)
{
  v1[0] = 67109632;
  v1[1] = HIDWORD(qword_10089EDA0);
  __int16 v2 = 1024;
  int v3 = qword_10089EDA0;
  __int16 v4 = 1024;
  int v5 = dword_10089EDA8;
  _os_log_debug_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_DEBUG, "defaults,locationTimeout:%d,queryInterval:%d,maxRetries:%d", (uint8_t *)v1, 0x14u);
}

void sub_10041D620()
{
  sub_10016F0F4();
  sub_100196EB8((void *)&_mh_execute_header, v0, v1, "regulatory,geo,sm,timeoutValueForBackoff:%d", v2, v3, v4, v5, v6);
}

void sub_10041D68C(uint64_t a1, uint64_t a2, uint64_t a3)
{
  sub_1001FDE74(a1, a2, a3, 4.8151e-34);
  sub_1001FDE8C((void *)&_mh_execute_header, "regulatory,geo,mon,setIsLocationNeeded,locationIsRecent,iso:%s,age:%.2f,skipped", v3, v4);
}

void sub_10041D6C8(uint64_t a1, uint64_t a2, uint64_t a3)
{
  sub_1001FDE74(a1, a2, a3, 4.8151e-34);
  sub_1001FDE8C((void *)&_mh_execute_header, "regulatory,geo,mon,setIsLocationNeeded,locationIsEmptyOrStale,iso:%s,age:%.2f,done", v3, v4);
}

void sub_10041D704(uint64_t a1, uint64_t a2, uint64_t a3)
{
  sub_1001FDE74(a1, a2, a3, 4.8151e-34);
  sub_1001FDE8C((void *)&_mh_execute_header, "regulatory,geo,mon,clearIsLocationNeeded,locationIsEmptyOrStale,iso:%s,age:%.2f,needsRefresh", v3, v4);
}

void sub_10041D740()
{
  sub_100010524();
  sub_10016F0D8((void *)&_mh_execute_header, v0, v1, "regulatory,geo,gm,mon,locationMonitoringNotNeeded,NotStarting", v2, v3, v4, v5, v6);
}

void sub_10041D774()
{
  sub_100010524();
  sub_10016F0D8((void *)&_mh_execute_header, v0, v1, "regulatory,geo,gm,mon,locationMonitoringNeeded,starting", v2, v3, v4, v5, v6);
}

void sub_10041D7A8()
{
  sub_100010524();
  sub_10016F0D8((void *)&_mh_execute_header, v0, v1, "regulatory,geo,gm,mon,locationMonitoringStopped", v2, v3, v4, v5, v6);
}

void sub_10041D7DC()
{
  sub_100010524();
  sub_1000104E4((void *)&_mh_execute_header, v0, v1, "regulatory,geo,monitor,fMccMonitor startGeoMonitorAnalyticsTimer, null timerCB passed", v2, v3, v4, v5, v6);
}

void sub_10041D810()
{
  sub_100010524();
  sub_1000104E4((void *)&_mh_execute_header, v0, v1, "regulatory,geo,monitor,fMccMonitor startGeoMonitorAnalyticsTimer, Failed to create timer.", v2, v3, v4, v5, v6);
}

void sub_10041D844()
{
  sub_100010524();
  sub_10016F0D8((void *)&_mh_execute_header, v0, v1, "regulatory,geo,monitor,fMccMonitor startGeoMonitorAnalyticsTimer, Started Analytics timer.", v2, v3, v4, v5, v6);
}

void sub_10041D878()
{
  sub_10016F0F4();
  sub_100196EB8((void *)&_mh_execute_header, v0, v1, "regulatory,geo,monitor,fLocationMonitor startMonitoring done, success, %d", v2, v3, v4, v5, v6);
}

void sub_10041D8E4()
{
  sub_100010524();
  sub_10016F0D8((void *)&_mh_execute_header, v0, v1, "regulatory,geo,monitor,fIsoQueryManager start done", v2, v3, v4, v5, v6);
}

void sub_10041D918()
{
  sub_10016F0F4();
  sub_100196EB8((void *)&_mh_execute_header, v0, v1, "regulatory,geo,monitor,fMccMonitor startMonitoring done, success, %d", v2, v3, v4, v5, v6);
}

void sub_10041D984(char *a1, void *a2, NSObject *a3)
{
  if (*a1 < 0) {
    a2 = (void *)*a2;
  }
  int v3 = 136315138;
  uint64_t v4 = a2;
  sub_1001FDE5C((void *)&_mh_execute_header, a3, (uint64_t)a3, "regulatory,geo,monitor,clearStoredRegulatoryArea:%s", (uint8_t *)&v3);
}

void sub_10041DA04()
{
  sub_1001659E8(__stack_chk_guard);
  sub_100010500();
  sub_1001FDE5C((void *)&_mh_execute_header, v0, v1, "regulatory,geo,monitor,refreshCurrentGeoArea,bestMccCandidate,oneIsValidOtherIsnt,chosen:%s", v2);
}

void sub_10041DA70()
{
  sub_1001659E8(__stack_chk_guard);
  sub_100010500();
  sub_1001FDE5C((void *)&_mh_execute_header, v0, v1, "regulatory,geo,monitor,refreshCurrentGeoArea,bestMccCandidate:%s,reason,oneOrBothMccInvalid", v2);
}

void sub_10041DADC()
{
  sub_100010524();
  _os_log_fault_impl((void *)&_mh_execute_header, v0, OS_LOG_TYPE_FAULT, "regulatory,geo,monitor,refreshCurrentGeoArea,device is neither a UWB phone or watch.", v1, 2u);
}

void sub_10041DB1C()
{
  sub_1001659E8(__stack_chk_guard);
  sub_100010500();
  sub_1001FDE5C((void *)&_mh_execute_header, v0, v1, "geo,monitor,chooseBestMccForHomepod,chooseBestMccForHomepod:%s", v2);
}

void sub_10041DB88()
{
  sub_100010524();
  sub_1000104E4((void *)&_mh_execute_header, v0, v1, "regulatory,geo,mon,refreshCurentGeoArea,cannotGetStoredParams", v2, v3, v4, v5, v6);
}

void sub_10041DBBC()
{
  sub_100010524();
  sub_10016F0D8((void *)&_mh_execute_header, v0, v1, "regulatory,geo,monitor,processLocationAvailable", v2, v3, v4, v5, v6);
}

void sub_10041DBF0()
{
  sub_100010500();
  sub_1001FDE5C((void *)&_mh_execute_header, v0, v1, "regulatory,geo,monitor,processRegulatoryAreaKnown:%s", v2);
}

void sub_10041DC6C()
{
  sub_100010500();
  sub_1001FDE5C((void *)&_mh_execute_header, v0, v1, "regulatory,geo,monitor,processRegulatoryAreaLastKnown:%s", v2);
}

void sub_10041DCE8()
{
  sub_100010524();
  sub_10016F0D8((void *)&_mh_execute_header, v0, v1, "regulatory,geo,monitor,processLocation,clearStoredSpecialRegion", v2, v3, v4, v5, v6);
}

void sub_10041DD1C()
{
  sub_100175C1C();
  if (v4 != v5) {
    uint64_t v6 = v3;
  }
  else {
    uint64_t v6 = v1;
  }
  sub_1001BE5EC(v2, v6, 4.8149e-34);
  sub_1001FDE5C((void *)&_mh_execute_header, v7, (uint64_t)v7, "regulatory,geo,monitor,forwardTestMcc,mccSource:%s.", v8);
  if (*(char *)(v0 + 23) < 0) {
    operator delete(*(void **)v0);
  }
}

void sub_10041DD74()
{
  sub_1001659E8(__stack_chk_guard);
  sub_100010500();
  sub_1001FDE5C((void *)&_mh_execute_header, v0, v1, "regulatory,geo,monitor,forwardTestMcc:%s", v2);
}

void sub_10041DDE0()
{
  sub_100010524();
  sub_10016F0D8((void *)&_mh_execute_header, v0, v1, "regulatory,geo,monitor,processIsoCountryFromPhone - Early return. This method is only supported for non-phone platforms.", v2, v3, v4, v5, v6);
}

void sub_10041DE14()
{
  sub_100175C1C();
  if (v4 != v5) {
    uint64_t v6 = v3;
  }
  else {
    uint64_t v6 = v1;
  }
  sub_1001BE5EC(v2, v6, 4.8149e-34);
  sub_1001FDE5C((void *)&_mh_execute_header, v7, (uint64_t)v7, "regulatory,geo,monitor,processIsoCountryFromPhone,isoCountrySource:%s.", v8);
  if (*(char *)(v0 + 23) < 0) {
    operator delete(*(void **)v0);
  }
}

void sub_10041DE6C()
{
  sub_1001659E8(__stack_chk_guard);
  sub_100010500();
  sub_1001FDE5C((void *)&_mh_execute_header, v0, v1, "regulatory,geo,monitor,processIsoCountryFromPhone:%s", v2);
}

void sub_10041DED8()
{
  sub_100010524();
  sub_10016F0D8((void *)&_mh_execute_header, v0, v1, "regulatory,geo,processTriggerLocation", v2, v3, v4, v5, v6);
}

void sub_10041DF0C()
{
  sub_100010524();
  sub_1000104E4((void *)&_mh_execute_header, v0, v1, "PRGeoMonitor failed to take assertion during backoff period, aborting nearbyd", v2, v3, v4, v5, v6);
}

void sub_10041DF40()
{
  sub_10016F0F4();
  sub_100196EB8((void *)&_mh_execute_header, v0, v1, "regulatory,geo,processLocationAuthorized:%d", v2, v3, v4, v5, v6);
}

void sub_10041DFAC()
{
  __assert_rtn("processAirplaneMode", "PRGeoMonitor.mm", 1030, "airplaneMode != Rose::AirplaneMode::UNKNOWN");
}

void sub_10041DFD8()
{
  sub_100010524();
  sub_1000104E4((void *)&_mh_execute_header, v0, v1, "regulatory,geo,mon,processAirplaneMode called with invalid input argument value.", v2, v3, v4, v5, v6);
}

void sub_10041E00C()
{
  sub_100010524();
  sub_10016F0D8((void *)&_mh_execute_header, v0, v1, "regulatory,geo,monitor,processAirplaneMode,clearStoredRegionAndMccs", v2, v3, v4, v5, v6);
}

void sub_10041E040()
{
  sub_100010524();
  sub_10016F0D8((void *)&_mh_execute_header, v0, v1, "regulatory,geo,mon,airplaneOff,clearStoredRegulatoryArea", v2, v3, v4, v5, v6);
}

void sub_10041E074(uint64_t a1, void *a2, NSObject *a3)
{
  if (*(char *)(a1 + 399) < 0) {
    a2 = (void *)*a2;
  }
  int v3 = 136315138;
  uint64_t v4 = a2;
  sub_1001FDE5C((void *)&_mh_execute_header, a3, (uint64_t)a3, "regulatory,geo,monitor,setStoredRegulatoryArea:%s", (uint8_t *)&v3);
}

void sub_10041E0F4()
{
  sub_100010500();
  __int16 v3 = 2080;
  uint64_t v4 = v0;
  _os_log_debug_impl((void *)&_mh_execute_header, v1, OS_LOG_TYPE_DEBUG, "geo,mon fCurrentWifiIso current:%s new:%s", v2, 0x16u);
}

void sub_10041E1C0(os_log_t log)
{
  *(_WORD *)os_log_t v1 = 0;
  _os_log_error_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_ERROR, "PRAlishaLEPMQueryCrashSummaryLog token write failed", v1, 2u);
}

void sub_10041E204(os_log_t log)
{
  *(_WORD *)os_log_t v1 = 0;
  _os_log_debug_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_DEBUG, "PRAlishaLEPMQueryCrashSummaryLog write token", v1, 2u);
}

void sub_10041E248()
{
  sub_10001AC8C();
  sub_10000B3E0((void *)&_mh_execute_header, v0, v1, "failed to clear Alisha LPEM crash summary: %@", v2, v3, v4, v5, v6);
}

void sub_10041E2B0()
{
  sub_10001AC8C();
  sub_10000B3E0((void *)&_mh_execute_header, v0, v1, "Failed to get Alisha LPEM crash summary: %@", v2, v3, v4, v5, v6);
}

void sub_10041E318()
{
  sub_10001AC8C();
  sub_10000B3E0((void *)&_mh_execute_header, v0, v1, "Failed to get SE (as part of getting Alisha LPEM logs): %@", v2, v3, v4, v5, v6);
}

void sub_10041E380()
{
  sub_10001AC8C();
  sub_10000B3E0((void *)&_mh_execute_header, v0, v1, "Failed to start NFHardwareManager logging session with error: %@", v2, v3, v4, v5, v6);
}

void sub_10041E3E8(uint64_t a1, NSObject *a2)
{
  uint64_t v2 = *(void *)(a1 + 24);
  int v3 = 138412290;
  uint64_t v4 = v2;
  _os_log_error_impl((void *)&_mh_execute_header, a2, OS_LOG_TYPE_ERROR, "#alisha-tom,invalidate() must be called before destructing CarKeyTimeoutManager for session identifier %@", (uint8_t *)&v3, 0xCu);
}

void sub_10041E464()
{
}

void sub_10041E490()
{
  sub_100010524();
  sub_100056C38((void *)&_mh_execute_header, v0, v1, "#ses-home,Run called without a successful configuration.", v2, v3, v4, v5, v6);
}

void sub_10041E4C4()
{
  sub_10001AC8C();
  _os_log_debug_impl((void *)&_mh_execute_header, v0, OS_LOG_TYPE_DEBUG, "#ses-home,starting BT advertise with high rate err: %@", v1, 0xCu);
}

void sub_10041E538()
{
}

void sub_10041E564()
{
  sub_10001AC8C();
  __int16 v3 = 2112;
  uint64_t v4 = v0;
  _os_log_error_impl((void *)&_mh_execute_header, v1, OS_LOG_TYPE_ERROR, "#ses-home,Failed to add peers %@. Session identifier: %@", v2, 0x16u);
}

void sub_10041E5F4()
{
  sub_10001AC8C();
  sub_10000B3E0((void *)&_mh_execute_header, v0, v1, "#ses-home,%@", v2, v3, v4, v5, v6);
}

void sub_10041E65C()
{
  sub_100010524();
  sub_1000104E4((void *)&_mh_execute_header, v0, v1, "#ses-home,cbDevice model unavailable for systemKeyRelationship. Will not attempt to range", v2, v3, v4, v5, v6);
}

void sub_10041E690()
{
  sub_10001AC8C();
  sub_10000B3E0((void *)&_mh_execute_header, v0, v1, "#ses-home,#allow-list peer device model %@ disallowed from UWB ranging", v2, v3, v4, v5, v6);
}

void sub_10041E6F8()
{
  sub_100010524();
  sub_100056C38((void *)&_mh_execute_header, v0, v1, "#ses-home,NINearbyObject objectFromBluetoothDevice returned nil.", v2, v3, v4, v5, v6);
}

void sub_10041E72C()
{
  sub_100010524();
  sub_1000104E4((void *)&_mh_execute_header, v0, v1, "#ses-home,Failed to allocate responder session. Resources are not available.", v2, v3, v4, v5, v6);
}

void sub_10041E760()
{
  sub_10001AC8C();
  sub_10000B3E0((void *)&_mh_execute_header, v0, v1, "#ses-home,Failed to start responder session. Error: %@", v2, v3, v4, v5, v6);
}

void sub_10041E7C8()
{
  sub_10020E5CC(__stack_chk_guard);
  sub_100010500();
  sub_10000B3E0((void *)&_mh_execute_header, v0, v1, "#ses-home,Unexpectedly failed to emplace session for identitifer: 0x%llx", v2, v3, v4, v5, v6);
}

void sub_10041E830()
{
  sub_100010524();
  sub_1000104E4((void *)&_mh_execute_header, v0, v1, "#ses-home,Failed to determine an appropriate tech for ranging.  ", v2, v3, v4, v5, v6);
}

void sub_10041E864()
{
  sub_10001AC8C();
  sub_10000B3E0((void *)&_mh_execute_header, v0, v1, "#ses-home,The system will not respond to %@ at this time.", v2, v3, v4, v5, v6);
}

void sub_10041E8CC(uint64_t a1, uint64_t a2)
{
  sub_10020E5C0(a1, a2, 4.8149e-34);
  sub_1001BE5D4((void *)&_mh_execute_header, v2, (uint64_t)v2, "#ses-home,#allow-list unable to parse audio accessory model: %s", v3);
}

void sub_10041E908(uint64_t a1, uint64_t a2)
{
  sub_10020E5C0(a1, a2, 4.8149e-34);
  sub_1001BE5D4((void *)&_mh_execute_header, v2, (uint64_t)v2, "#ses-home,#allow-list unable to parse phone model: %s", v3);
}

void sub_10041E944(uint64_t a1, uint64_t a2)
{
  sub_10020E5C0(a1, a2, 4.8149e-34);
  sub_1001BE5D4((void *)&_mh_execute_header, v2, (uint64_t)v2, "#ses-home,#allow-list unable to parse watch model: %s", v3);
}

void sub_10041E980()
{
  sub_100010524();
  sub_1000104E4((void *)&_mh_execute_header, v0, v1, "#ses-home,#warning. Device re-discovered, but no responder session. Expected responder session. Session failed the first time?", v2, v3, v4, v5, v6);
}

void sub_10041E9B4()
{
  sub_10001AC8C();
  sub_10000B3E0((void *)&_mh_execute_header, v0, v1, "#ses-home,Failed to re-start responder session. Error: %@", v2, v3, v4, v5, v6);
}

void sub_10041EA1C()
{
  sub_100010524();
  _os_log_debug_impl((void *)&_mh_execute_header, v0, OS_LOG_TYPE_DEBUG, "#ses-home,Device rediscovered decision: not restarting Wifi session since address is the same and role != responder and wifi ranging bit is unchanged and wifi ranging not enabled.", v1, 2u);
}

void sub_10041EA5C()
{
  sub_100010524();
  sub_1000104E4((void *)&_mh_execute_header, v0, v1, "#ses-home,skipping measurement due to a lack of mach continuous timestamp.", v2, v3, v4, v5, v6);
}

void sub_10041EA90()
{
  sub_10001AC8C();
  sub_10000B3E0((void *)&_mh_execute_header, v0, v1, "#ses-home,Ignoring measurement, no discovery token for macAddr: 0x%llx", v2, v3, v4, v5, v6);
}

void sub_10041EAF8()
{
  sub_10020E5CC(__stack_chk_guard);
  sub_100010500();
  sub_10000B3E0((void *)&_mh_execute_header, v0, v1, "#ses-home,responder measurement dropped due to missing processing information for 0x%llx", v2, v3, v4, v5, v6);
}

void sub_10041EB60()
{
  sub_10001AC8C();
  sub_10000B3E0((void *)&_mh_execute_header, v0, v1, "#ses-home,Ignoring measurement, not tracking peer with token: %@", v2, v3, v4, v5, v6);
}

void sub_10041EBC8(int *a1, NSObject *a2)
{
  int v2 = *a1;
  v3[0] = 67109120;
  v3[1] = v2;
  _os_log_fault_impl((void *)&_mh_execute_header, a2, OS_LOG_TYPE_FAULT, "#ses-home,Unexpected RoseSolutionType: %d", (uint8_t *)v3, 8u);
}

void sub_10041EC44()
{
  __assert_rtn("pushSample", "NIServerHomeDeviceSession.mm", 192, "magneticField.size() == timestamps.size()");
}

void sub_10041EC70(_DWORD *a1, _DWORD *a2, os_log_t log)
{
  int v3 = *a1 - *a2;
  v4[0] = 67109376;
  v4[1] = v3;
  __int16 v5 = 1024;
  int v6 = 16;
  _os_log_error_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_ERROR, "#ses-home,Received unexpected remote data: too small (%d < %d)", (uint8_t *)v4, 0xEu);
}

void sub_10041ED08()
{
  sub_100010524();
  sub_1000104E4((void *)&_mh_execute_header, v0, v1, "#ses-home,Received unexpected remote data: incorrect type", v2, v3, v4, v5, v6);
}

void sub_10041ED3C()
{
  sub_100010524();
  sub_1000104E4((void *)&_mh_execute_header, v0, v1, "#ses-home,Received didChangeRangingUpdateRate but session could not be found.", v2, v3, v4, v5, v6);
}

void sub_10041ED70()
{
  sub_100010524();
  sub_1000104E4((void *)&_mh_execute_header, v0, v1, "#ses-home,#throttle Adjusting throttle rate failed", v2, v3, v4, v5, v6);
}

void sub_10041EDA4()
{
  sub_10001AC8C();
  sub_10000B3E0((void *)&_mh_execute_header, v0, v1, "#ses-home,Invalid sample provided: %@", v2, v3, v4, v5, v6);
}

void sub_10041EE0C()
{
  sub_10001AC8C();
  sub_10000B3E0((void *)&_mh_execute_header, v0, v1, "#ses-home,Invalid model provided: %@", v2, v3, v4, v5, v6);
}

void sub_10041EE74()
{
}

void sub_10041EEA0()
{
  sub_100010524();
  sub_1000104E4((void *)&_mh_execute_header, v0, v1, "#ses-home,UWB system readiness updated after session invalidated. Ignore it.", v2, v3, v4, v5, v6);
}

void sub_10041EED4()
{
  sub_10001AC8C();
  sub_10000B3E0((void *)&_mh_execute_header, v0, v1, "#ses-home,Failed to re-run session to handle UWB state change. Error: %@", v2, v3, v4, v5, v6);
}

void sub_10041EF3C()
{
  sub_10001AC8C();
  sub_10000B3E0((void *)&_mh_execute_header, v0, v1, "#ses-home,Failed to re-configure session to handle UWB state change. Error: %@", v2, v3, v4, v5, v6);
}

void sub_10041EFA4()
{
  sub_10001AC8C();
  sub_10000B3E0((void *)&_mh_execute_header, v0, v1, "#ses-home,Failed to pause session to handle UWB state change. Error: %@", v2, v3, v4, v5, v6);
}

void sub_10041F00C()
{
}

void sub_10041F038()
{
  sub_100010524();
  sub_1000104E4((void *)&_mh_execute_header, v0, v1, "#ses-home,Configuration Manager error", v2, v3, v4, v5, v6);
}

void sub_10041F06C(void *a1, uint64_t a2)
{
  sub_10020E5C0((uint64_t)a1, a2, 5.7779e-34);
  sub_1001BE5D4((void *)&_mh_execute_header, v3, (uint64_t)v3, "#ses-home,Session key has invalid length. %@", v4);
}

void sub_10041F0B8()
{
  sub_100010524();
  sub_1000104E4((void *)&_mh_execute_header, v0, v1, "#ses-home,Unknown HSI Version, use default cipher blob", v2, v3, v4, v5, v6);
}

void sub_10041F0EC()
{
  sub_100010524();
  sub_100056C38((void *)&_mh_execute_header, v0, v1, "#ses-home,Unable to determine UWB channels", v2, v3, v4, v5, v6);
}

void sub_10041F120()
{
  sub_100175C1C();
  if (v6 != v7) {
    uint64_t v8 = v5;
  }
  else {
    uint64_t v8 = v1;
  }
  *(_DWORD *)uint64_t v2 = 136315138;
  *(void *)(v2 + 4) = v8;
  sub_1001BE5D4((void *)&_mh_execute_header, v3, (uint64_t)v3, "#ses-home,Failed to allocate a UWB session. Error: %s", v4);
  if (*(char *)(v0 + 23) < 0) {
    operator delete(*(void **)v0);
  }
}

void sub_10041F17C()
{
  sub_10001AC8C();
  sub_10000B3E0((void *)&_mh_execute_header, v0, v1, "#ses-home,#hangup Address 0x%{private}llx has no mapping to a discovery token.", v2, v3, v4, v5, v6);
}

void sub_10041F1E4(os_log_t log)
{
  v1[0] = 67109120;
  v1[1] = 4;
  _os_log_error_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_ERROR, "#ses-home,Active session limit exceeded (%d)", (uint8_t *)v1, 8u);
}

void sub_10041F264()
{
  sub_100175C1C();
  if (v6 != v7) {
    uint64_t v8 = v5;
  }
  else {
    uint64_t v8 = v1;
  }
  *(_DWORD *)uint64_t v2 = 136315138;
  *(void *)(v2 + 4) = v8;
  sub_1001BE5D4((void *)&_mh_execute_header, v3, (uint64_t)v3, "#ses-home,Rose session invalidated unexpectedly. Reason: %s", v4);
  if (*(char *)(v0 + 23) < 0) {
    operator delete(*(void **)v0);
  }
}

void sub_10041F2C0()
{
}

void sub_10041F2EC()
{
  sub_100175C1C();
  if (v6 != v7) {
    uint64_t v8 = v5;
  }
  else {
    uint64_t v8 = v1;
  }
  *(_DWORD *)uint64_t v2 = 136315138;
  *(void *)(v2 + 4) = v8;
  sub_1001BE5D4((void *)&_mh_execute_header, v3, (uint64_t)v3, "#ses-home,Failed to start ranging. Return code: %s", v4);
  if (*(char *)(v0 + 23) < 0) {
    operator delete(*(void **)v0);
  }
}

void sub_10041F348()
{
  sub_10001AC8C();
  sub_10000B3E0((void *)&_mh_execute_header, v0, v1, "#ses-home,#warning, failed to remove peer discovery token: %@", v2, v3, v4, v5, v6);
}

void sub_10041F3B0()
{
  sub_100010524();
  sub_1000104E4((void *)&_mh_execute_header, v0, v1, "#ses-home,attempt to remove non-existent tracked object", v2, v3, v4, v5, v6);
}

void sub_10041F3E4()
{
}

void sub_10041F410()
{
}

void sub_10041F43C()
{
  __assert_rtn("size", "NIServerHomeDeviceSession.mm", 184, "timestamps.size() == magneticField.size()");
}

void sub_10041F468()
{
  sub_100010524();
  sub_1000104E4((void *)&_mh_execute_header, v0, v1, "#ses-home,Discovery token cannot be parsed", v2, v3, v4, v5, v6);
}

void sub_10041F49C()
{
  sub_100010524();
  sub_1000104E4((void *)&_mh_execute_header, v0, v1, "#ses-home,#Discovery token doesn't contain an identifier", v2, v3, v4, v5, v6);
}

void sub_10041F4D0()
{
  sub_100010524();
  sub_1000104E4((void *)&_mh_execute_header, v0, v1, "#ses-home,#Discovery token doesn't contain IRK", v2, v3, v4, v5, v6);
}

void sub_10041F504()
{
  sub_100010524();
  sub_1000104E4((void *)&_mh_execute_header, v0, v1, "#ses-home,invalid value for HomeAnchorVariant", v2, v3, v4, v5, v6);
}

void sub_10041F538()
{
  sub_10020E5CC(__stack_chk_guard);
  sub_100010500();
  sub_10000B3E0((void *)&_mh_execute_header, v0, v1, "#ses-home,Failed to get object from identifier: %llx", v2, v3, v4, v5, v6);
}

void sub_10041F5A0()
{
  sub_10001AC8C();
  sub_10000B3E0((void *)&_mh_execute_header, v0, v1, "#ses-home,#throttle adjustResponderThrottleRateIfNeeded - no uwbIdentifier. Object: %@", v2, v3, v4, v5, v6);
}

void sub_10041F608()
{
  sub_10001AC8C();
  sub_10000B3E0((void *)&_mh_execute_header, v0, v1, "#ses-home,#throttle adjustResponderThrottleRateIfNeeded - no session. Object: %@", v2, v3, v4, v5, v6);
}

void sub_10041F670()
{
  sub_10001AC8C();
  sub_10000B3E0((void *)&_mh_execute_header, v0, v1, "#ses-home,#throttle adjustResponderThrottleRateIfNeeded - session is null. Object: %@", v2, v3, v4, v5, v6);
}

void sub_10041F6D8(char *a1, uint8_t *buf, os_log_t log, float a4)
{
  double v5 = a4;
  if (a1[23] >= 0) {
    uint8_t v6 = a1;
  }
  else {
    uint8_t v6 = *(char **)a1;
  }
  *(_DWORD *)buf = 134218242;
  *(double *)(buf + 4) = v5;
  *((_WORD *)buf + 6) = 2080;
  *(void *)(buf + 14) = v6;
  _os_log_error_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_ERROR, "#ses-home,#throttle failed to schedule throttling request for rate %0.2f. Error: %s", buf, 0x16u);
  if (a1[23] < 0) {
    operator delete(*(void **)a1);
  }
}

void sub_10041F75C()
{
  sub_10001AC8C();
  _os_log_fault_impl((void *)&_mh_execute_header, v0, OS_LOG_TYPE_FAULT, "#ses-home,#throttle adjustResponderThrottleRateIfNeeded. Update rate 'None' not supported. Object: %@", v1, 0xCu);
}

void sub_10041F7D0()
{
  sub_100010524();
  sub_1000104E4((void *)&_mh_execute_header, v0, v1, "#ses-home,#throttle adjustResponderThrottleRateIfNeeded - not a responder.", v2, v3, v4, v5, v6);
}

void sub_10041F804()
{
  sub_10020E5CC(__stack_chk_guard);
  sub_100010500();
  sub_10000B3E0((void *)&_mh_execute_header, v0, v1, "#ses-home,Ignoring measurement, no discovery token for identifier: %llu", v2, v3, v4, v5, v6);
}

void sub_10041F86C()
{
  sub_10001AC8C();
  sub_10000B3E0((void *)&_mh_execute_header, v0, v1, "#ses-home,Ignoring measurement, not tracking peer with token: %@", v2, v3, v4, v5, v6);
}

void sub_10041F8D4()
{
  sub_100010500();
  sub_1001BE5D4((void *)&_mh_execute_header, v0, (uint64_t)v0, "#ses-home,WiFi ranging error:%{private}s", v1);
}

void sub_10041F954()
{
  sub_10001AC8C();
  sub_100029DF8((void *)&_mh_execute_header, v0, v1, "#find-ses,FindingServicePool replace non-nil service for token: %{public}@. Race condition (probably not OK)", v2, v3, v4, v5, v6);
}

void sub_10041F9BC(void *a1, uint64_t a2, uint64_t a3)
{
  sub_10021B49C((uint64_t)a1, a2, a3, 5.8081e-34);
  _os_log_debug_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEBUG, "#find-ses,Service processSelfLocation [%{private}@]: %{private}@", v4, 0x16u);
}

void sub_10041FA14(void *a1, uint64_t a2, uint64_t a3)
{
  sub_10021B49C((uint64_t)a1, a2, a3, 5.8081e-34);
  _os_log_debug_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEBUG, "#find-ses,Service processSelfHeading [%{private}@]: %{private}@", v4, 0x16u);
}

void sub_10041FA6C(uint64_t a1, uint64_t *a2, os_log_t log)
{
  uint64_t v3 = *(void *)(a1 + 88);
  uint64_t v4 = *a2;
  int v5 = 138478083;
  uint64_t v6 = v3;
  __int16 v7 = 2112;
  uint64_t v8 = v4;
  _os_log_error_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_ERROR, "#find-ses,Providers could not be initialized for token: %{private}@ with configuration: %@", (uint8_t *)&v5, 0x16u);
}

void sub_10041FAFC()
{
  sub_100010524();
  sub_1000104E4((void *)&_mh_execute_header, v0, v1, "#find-ses,failed creating CMPDRManager", v2, v3, v4, v5, v6);
}

void sub_10041FB30()
{
  sub_100010524();
  _os_log_fault_impl((void *)&_mh_execute_header, v0, OS_LOG_TYPE_FAULT, "#find-ses,Failed to create altimeter manager", v1, 2u);
}

void sub_10041FB70()
{
  sub_10001AC8C();
  sub_100029DF8((void *)&_mh_execute_header, v0, v1, "#find-ses,UpdatesEngine init failed with error %@", v2, v3, v4, v5, v6);
}

void sub_10041FBD8()
{
  sub_100010524();
  sub_1000104E4((void *)&_mh_execute_header, v0, v1, "#find-ses,device motion is nil", v2, v3, v4, v5, v6);
}

void sub_10041FC0C()
{
  sub_100010524();
  sub_1000104E4((void *)&_mh_execute_header, v0, v1, "#find-ses,Could not convert device motion time to mach continuous", v2, v3, v4, v5, v6);
}

void sub_10041FC40()
{
  sub_10001AC8C();
  sub_10000B3E0((void *)&_mh_execute_header, v0, v1, "#find-ses,error receiving DeviceMotion: %{public}@", v2, v3, v4, v5, v6);
}

void sub_10041FCA8()
{
  sub_100010524();
  sub_1000104E4((void *)&_mh_execute_header, v0, v1, "#find-ses,altitudeData is nil", v2, v3, v4, v5, v6);
}

void sub_10041FCDC()
{
  sub_10001AC8C();
  sub_10000B3E0((void *)&_mh_execute_header, v0, v1, "#find-ses,error receiving altimeter data: %{public}@", v2, v3, v4, v5, v6);
}

void sub_10041FD44()
{
  sub_10001AC8C();
  sub_1001BE5B8((void *)&_mh_execute_header, v0, v1, "#find-ses,pdr state received: %@", v2, v3, v4, v5, v6);
}

void sub_10041FDAC()
{
  sub_10001AC8C();
  sub_10000B3E0((void *)&_mh_execute_header, v0, v1, "#find-ses,error receiving PDRState: %{public}@", v2, v3, v4, v5, v6);
}

void sub_10041FE14(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_10041FE84(int *a1, uint64_t a2, os_log_t log)
{
  int v3 = *a1;
  v4[0] = 67109379;
  v4[1] = v3;
  __int16 v5 = 2113;
  uint64_t v6 = a2;
  _os_log_fault_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_FAULT, "#find-ses,didRangeWithPeer:newSolution: unexpected RoseSolutionType: %d. Token: %{private}@", (uint8_t *)v4, 0x12u);
}

void sub_10041FF10()
{
  sub_100010524();
  sub_1000104E4((void *)&_mh_execute_header, v0, v1, "#find-ses,Range solution, but does not match finding token. Possible race condition.", v2, v3, v4, v5, v6);
}

void sub_10041FF44()
{
  sub_100010524();
  sub_1000104E4((void *)&_mh_execute_header, v0, v1, "#find-ses,Unsuccessful attempt does not match finding token. Possible race condition.", v2, v3, v4, v5, v6);
}

void sub_10041FF78()
{
  sub_10001AC8C();
  sub_1001BE5B8((void *)&_mh_execute_header, v0, v1, "#find-ses,%{public}@", v2, v3, v4, v5, v6);
}

void sub_10041FFE0(void *a1, uint8_t *buf, os_log_t log)
{
  *(_DWORD *)buf = 138543362;
  *(void *)(buf + 4) = a1;
  _os_log_debug_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_DEBUG, "#find-ses,%{public}@", buf, 0xCu);
}

void sub_100420038()
{
  sub_10001AC8C();
  sub_100029DF8((void *)&_mh_execute_header, v0, v1, "#find-ses,Failed to stop ranging: %@", v2, v3, v4, v5, v6);
}

void sub_1004200A0()
{
  sub_10001AC8C();
  sub_100029DF8((void *)&_mh_execute_header, v0, v1, "#find-ses,Failed to stop advertising: %@", v2, v3, v4, v5, v6);
}

void sub_100420108()
{
  sub_10001AC8C();
  sub_100029DF8((void *)&_mh_execute_header, v0, v1, "#find-ses,Failed to stop scanning: %@", v2, v3, v4, v5, v6);
}

void sub_100420170()
{
  sub_100010524();
  sub_1000104E4((void *)&_mh_execute_header, v0, v1, "#find-ses,Ranging terminated callback, but does not match finding token. Possible race condition.", v2, v3, v4, v5, v6);
}

void sub_1004201A4()
{
  sub_10001AC8C();
  sub_10000B3E0((void *)&_mh_execute_header, v0, v1, "#find-ses,Ranging error: %@", v2, v3, v4, v5, v6);
}

void sub_10042020C()
{
  sub_100010524();
  _os_log_fault_impl((void *)&_mh_execute_header, v0, OS_LOG_TYPE_FAULT, "#find-ses,locations array is nil", v1, 2u);
}

void sub_10042024C()
{
  sub_10001AC8C();
  sub_1001BE5B8((void *)&_mh_execute_header, v0, v1, "#find-ses,didUpdateLocations: %{private}@", v2, v3, v4, v5, v6);
}

void sub_1004202B4()
{
  sub_100010524();
  _os_log_debug_impl((void *)&_mh_execute_header, v0, OS_LOG_TYPE_DEBUG, "#find-ses,heading is nil", v1, 2u);
}

void sub_1004202F4()
{
  sub_10001AC8C();
  sub_1001BE5B8((void *)&_mh_execute_header, v0, v1, "#find-ses,didUpdateHeading: %{private}@", v2, v3, v4, v5, v6);
}

void sub_10042035C()
{
  sub_10001AC8C();
  sub_100029DF8((void *)&_mh_execute_header, v0, v1, "#find-ses,received unexpected error from location manager: %@", v2, v3, v4, v5, v6);
}

void sub_1004203C4()
{
  sub_100010524();
  sub_1000104E4((void *)&_mh_execute_header, v0, v1, "#find-ses,heading could not be determined", v2, v3, v4, v5, v6);
}

void sub_1004203F8()
{
  sub_100010524();
  _os_log_debug_impl((void *)&_mh_execute_header, v0, OS_LOG_TYPE_DEBUG, "#find-ses,user denied request to monitor location and heading updates", v1, 2u);
}

void sub_100420438()
{
}

void sub_100420464()
{
  sub_100010524();
  sub_1000104E4((void *)&_mh_execute_header, v0, v1, "#find-ses,Dropping event, configuration is nil", v2, v3, v4, v5, v6);
}

void sub_100420498(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_1004204D0(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_100420508(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_100420540()
{
  sub_10021E064(__stack_chk_guard);
  sub_100010500();
  sub_10000B3E0((void *)&_mh_execute_header, v0, v1, "#crypto,[%{private}@][Encryptor] not configured correctly", v2, v3, v4, v5, v6);
}

void sub_1004205A8()
{
  sub_10021E064(__stack_chk_guard);
  sub_100010500();
  sub_10000B3E0((void *)&_mh_execute_header, v0, v1, "#crypto,[%{private}@][Encryptor] nonce expired", v2, v3, v4, v5, v6);
}

void sub_100420610()
{
  sub_10021E064(__stack_chk_guard);
  sub_10021E04C();
  sub_10001ACCC((void *)&_mh_execute_header, v0, v1, "#crypto,[%{private}@][Encryptor] get auth tag failed %d");
}

void sub_100420678()
{
  sub_10021E064(__stack_chk_guard);
  sub_10021E04C();
  sub_10001ACCC((void *)&_mh_execute_header, v0, v1, "#crypto,[%{private}@][Encryptor] cryptor-update failed %d");
}

void sub_1004206E0()
{
  sub_10021E064(__stack_chk_guard);
  sub_10021E04C();
  sub_10001ACCC((void *)&_mh_execute_header, v0, v1, "#crypto,[%{private}@][Encryptor] add auth data failed %d");
}

void sub_100420748()
{
  sub_10021E064(__stack_chk_guard);
  sub_10021E04C();
  sub_10001ACCC((void *)&_mh_execute_header, v0, v1, "#crypto,[%{private}@][Encryptor] add nonce failed %d");
}

void sub_1004207B0()
{
  sub_10021E064(__stack_chk_guard);
  sub_10021E04C();
  sub_10001ACCC((void *)&_mh_execute_header, v0, v1, "#crypto,[%{private}@][Encryptor] set MAC size failed %d");
}

void sub_100420818()
{
  sub_10021E064(__stack_chk_guard);
  sub_10021E04C();
  sub_10001ACCC((void *)&_mh_execute_header, v0, v1, "#crypto,[%{private}@][Encryptor] set data size failed %d");
}

void sub_100420880(uint64_t a1, int a2, uint64_t a3)
{
  sub_10021E070(a1, a2, a3, 5.8082e-34);
  *(_DWORD *)(v3 + 20) = 1;
  sub_10021E08C((void *)&_mh_execute_header, "#crypto,[%{private}@][Decryptor] ciphertext too small (%d < %d)", v4, v5);
}

void sub_1004208C4(uint64_t a1, int a2, uint64_t a3)
{
  sub_10021E070(a1, a2, a3, 5.8082e-34);
  *(_DWORD *)(v3 + 20) = 5;
  sub_10021E08C((void *)&_mh_execute_header, "#crypto,[%{private}@][Decryptor] ciphertext too small (%d < %d)", v4, v5);
}

void sub_100420908(uint64_t a1, int a2, uint64_t a3)
{
  sub_10021E070(a1, a2, a3, 5.8082e-34);
  *(_DWORD *)(v3 + 20) = 11;
  sub_10021E08C((void *)&_mh_execute_header, "#crypto,[%{private}@][Decryptor] ciphertext too small (%d < %d)", v4, v5);
}

void sub_10042094C()
{
  sub_10021E064(__stack_chk_guard);
  sub_100010500();
  sub_10000B3E0((void *)&_mh_execute_header, v0, v1, "#crypto,[%{private}@][Decryptor] no ciphertext", v2, v3, v4, v5, v6);
}

void sub_1004209B4()
{
  sub_10021E064(__stack_chk_guard);
  sub_100010500();
  sub_10000B3E0((void *)&_mh_execute_header, v0, v1, "#crypto,[%{private}@][Decryptor] auth tags don't match", v2, v3, v4, v5, v6);
}

void sub_100420A1C()
{
  sub_10021E064(__stack_chk_guard);
  sub_10021E04C();
  sub_10001ACCC((void *)&_mh_execute_header, v0, v1, "#crypto,[%{private}@][Decryptor] get auth tag failed %d");
}

void sub_100420A84()
{
  sub_10021E064(__stack_chk_guard);
  sub_10021E04C();
  sub_10001ACCC((void *)&_mh_execute_header, v0, v1, "#crypto,[%{private}@][Decryptor] cryptor-update failed %d");
}

void sub_100420AEC()
{
  sub_10021E064(__stack_chk_guard);
  sub_10021E04C();
  sub_10001ACCC((void *)&_mh_execute_header, v0, v1, "#crypto,[%{private}@][Decryptor] add auth data failed %d");
}

void sub_100420B54()
{
  sub_10021E064(__stack_chk_guard);
  sub_10021E04C();
  sub_10001ACCC((void *)&_mh_execute_header, v0, v1, "#crypto,[%{private}@][Decryptor] add nonce failed %d");
}

void sub_100420BBC()
{
  sub_10021E064(__stack_chk_guard);
  sub_10021E04C();
  sub_10001ACCC((void *)&_mh_execute_header, v0, v1, "#crypto,[%{private}@][Decryptor] set MAC size failed %d");
}

void sub_100420C24()
{
  sub_10021E064(__stack_chk_guard);
  sub_10021E04C();
  sub_10001ACCC((void *)&_mh_execute_header, v0, v1, "#crypto,[%{private}@][Decryptor] set data size failed %d");
}

void sub_100420C8C()
{
  sub_10021E064(__stack_chk_guard);
  sub_100010500();
  sub_10000B3E0((void *)&_mh_execute_header, v0, v1, "#crypto,[%{private}@][Decryptor] unsupported version", v2, v3, v4, v5, v6);
}

void sub_100420CF4()
{
  sub_10021E064(__stack_chk_guard);
  sub_100010500();
  sub_10000B3E0((void *)&_mh_execute_header, v0, v1, "#crypto,[%{private}@][Decryptor] not configured correctly", v2, v3, v4, v5, v6);
}

void sub_100420D5C()
{
  sub_10021E064(__stack_chk_guard);
  sub_10021E04C();
  sub_10001ACCC((void *)&_mh_execute_header, v0, v1, "#crypto,[%{private}@][KDF] derive key failed %d");
}

void sub_100420DC4()
{
  sub_100010524();
  _os_log_debug_impl((void *)&_mh_execute_header, v0, OS_LOG_TYPE_DEBUG, "#regulatory,isoquerymgr,registerIsoQueryListener register rapport link", v1, 2u);
}

void sub_100420E04()
{
  sub_100010524();
  _os_log_error_impl((void *)&_mh_execute_header, v0, OS_LOG_TYPE_ERROR, "#regulatory,isoquerymgr,connectWithActiveDevice, invalid rpDevice!", v1, 2u);
}

void sub_100420E44(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_100420EB0()
{
  sub_100010524();
  _os_log_debug_impl((void *)&_mh_execute_header, v0, OS_LOG_TYPE_DEBUG, "#regulatory,isoquerymgr,PRIsoQueryManager: fNoDeviceFoundErrorSubmissionTimer Timeout Callback.", v1, 2u);
}

void sub_100420EF0(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  sub_10000B3E0((void *)&_mh_execute_header, a2, a3, "#regulatory,isoquerymgr,sendIsoRequest, activation error = %@", a5, a6, a7, a8, 2u);
}

void sub_100420F5C()
{
  sub_100010524();
  _os_log_error_impl((void *)&_mh_execute_header, v0, OS_LOG_TYPE_ERROR, "#regulatory,isoquerymgr,sendIsoRequest,response received but couldn't parse inResponse", v1, 2u);
}

void sub_100420F9C(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  sub_10000B3E0((void *)&_mh_execute_header, a2, a3, "#regulatory,isoquerymgr,sendIsoRequest,response, error = %@ ", a5, a6, a7, a8, 2u);
}

void sub_100421008(uint64_t a1, NSObject *a2)
{
  int v2 = 134217984;
  uint64_t v3 = a1;
  _os_log_error_impl((void *)&_mh_execute_header, a2, OS_LOG_TYPE_ERROR, "regulatory,download,Unexpected activity state %ld", (uint8_t *)&v2, 0xCu);
}

void sub_100421080(os_log_t log)
{
  v1[0] = 67109120;
  v1[1] = 4;
  _os_log_error_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_ERROR, "regulatory,download,unable to set state, %u", (uint8_t *)v1, 8u);
}

void sub_100421100(os_log_t log)
{
  v1[0] = 67109120;
  v1[1] = 5;
  _os_log_error_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_ERROR, "regulatory,download,unable to set state, %u", (uint8_t *)v1, 8u);
}

void sub_100421180(os_log_t log)
{
  *(_WORD *)os_log_t v1 = 0;
  _os_log_error_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_ERROR, "regulatory,download,dstIsNull", v1, 2u);
}

void sub_1004211C4(os_log_t log)
{
  *(_WORD *)os_log_t v1 = 0;
  _os_log_error_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_ERROR, "regulatory,download,srcIsNull", v1, 2u);
}

void sub_100421208()
{
  __assert_rtn("PRGetDeviceModelName_block_invoke", "PRUtilities.m", 40, "CFGetTypeID(answer) == CFStringGetTypeID()");
}

void sub_100421234(uint64_t a1, NSObject *a2)
{
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_fault_impl((void *)&_mh_execute_header, a2, OS_LOG_TYPE_FAULT, "#vision,Session failed with error: %@", (uint8_t *)&v2, 0xCu);
}

void sub_1004212AC()
{
  sub_100010524();
  sub_1000104E4((void *)&_mh_execute_header, v0, v1, "We shouldn't be here! abort!!!", v2, v3, v4, v5, v6);
}

void sub_1004212E0()
{
  sub_100010500();
  __int16 v4 = 1024;
  int v5 = v0;
  __int16 v6 = 1024;
  int v7 = v1;
  _os_log_error_impl((void *)&_mh_execute_header, v2, OS_LOG_TYPE_ERROR, "Crash Reason: %s for core: %d and isFatal: %d", v3, 0x18u);
}

void sub_100421380()
{
  sub_100010524();
  sub_1000104E4((void *)&_mh_execute_header, v0, v1, "FW crash string reason wasn't extracted", v2, v3, v4, v5, v6);
}

void sub_1004213B4()
{
  sub_100010524();
  sub_1000104E4((void *)&_mh_execute_header, v0, v1, "Crashlog received is corrupted", v2, v3, v4, v5, v6);
}

void sub_1004213E8()
{
  sub_1001BE670(__stack_chk_guard);
  sub_100010500();
  WORD2(v3) = 2048;
  HIWORD(v3) = 155;
  sub_10001AC6C((void *)&_mh_execute_header, v0, v1, "HID event size [%lu] != expected size [%lu]", v2, v3);
}

void sub_100421460(unsigned int *a1)
{
  sub_100237148(a1, __stack_chk_guard);
  sub_100010500();
  sub_10000B3E0((void *)&_mh_execute_header, v1, v2, "Called PRRose::deactivate while in state %s", v3, v4, v5, v6, v7);
}

void sub_1004214E4()
{
  sub_100010524();
  sub_1000104E4((void *)&_mh_execute_header, v0, v1, "Failed to send AP Goodbye", v2, v3, v4, v5, v6);
}

void sub_100421518()
{
}

void sub_100421530()
{
}

void sub_10042155C()
{
}

void sub_100421588()
{
  sub_100010500();
  sub_10000B3E0((void *)&_mh_execute_header, v0, v1, "Called PRRose::activate while in state == %s", v2, v3, v4, v5, v6);
}

void sub_100421614(unsigned int *a1)
{
  sub_100237148(a1, __stack_chk_guard);
  sub_100010500();
  sub_10000B3E0((void *)&_mh_execute_header, v1, v2, "PRRose Power Off Failed  while in state: %s ", v3, v4, v5, v6, v7);
}

void sub_100421698()
{
  sub_100010524();
  sub_1000104E4((void *)&_mh_execute_header, v0, v1, "Rose failed to update. Setting state to UNAVAILABLE.", v2, v3, v4, v5, v6);
}

void sub_1004216CC()
{
  sub_100010524();
  sub_1000104E4((void *)&_mh_execute_header, v0, v1, "Heal attempt token write failed", v2, v3, v4, v5, v6);
}

void sub_100421700()
{
  sub_100010524();
  sub_1000104E4((void *)&_mh_execute_header, v0, v1, "Rose failed to heal. Caching heal attempt token.", v2, v3, v4, v5, v6);
}

void sub_100421734()
{
  sub_100010524();
  sub_1000104E4((void *)&_mh_execute_header, v0, v1, "Failed to connect to Rose AOP services. Setting state to OFF.", v2, v3, v4, v5, v6);
}

void sub_100421768()
{
  sub_100010524();
  sub_1000104E4((void *)&_mh_execute_header, v0, v1, "Device does not have chip. Setting state to UNAVAILABLE.", v2, v3, v4, v5, v6);
}

void sub_10042179C()
{
}

void sub_1004217B4()
{
  sub_100010524();
  sub_1000104E4((void *)&_mh_execute_header, v0, v1, "failed to determine firmware update status", v2, v3, v4, v5, v6);
}

void sub_1004217E8()
{
  sub_100010524();
  sub_1000104E4((void *)&_mh_execute_header, v0, v1, "PRRose: failed to send a APGoodbye command.", v2, v3, v4, v5, v6);
}

void sub_10042181C()
{
  sub_100010524();
  sub_1000104E4((void *)&_mh_execute_header, v0, v1, "PRRose:: Failed to Power off Rose. Aborting", v2, v3, v4, v5, v6);
}

void sub_100421850()
{
  sub_100010524();
  sub_1000104E4((void *)&_mh_execute_header, v0, v1, "regulatory,Failed to apply config parameters.", v2, v3, v4, v5, v6);
}

void sub_100421884()
{
  sub_100010524();
  sub_1000104E4((void *)&_mh_execute_header, v0, v1, "regulatory,Failed to produce valid rose config parameters.", v2, v3, v4, v5, v6);
}

void sub_1004218B8()
{
  sub_100010524();
  sub_1000104E4((void *)&_mh_execute_header, v0, v1, "PRRose::setConfigParameters: setRoseConnectionlessMacAddress failed", v2, v3, v4, v5, v6);
}

void sub_1004218EC(unsigned char *a1, unsigned char *a2)
{
  sub_100029E3C(a1, a2);
  sub_1002370EC((void *)&_mh_execute_header, v2, (uint64_t)v2, "PRRose::setConfigParameters: failed to set UWB power table.", v3);
}

void sub_10042191C(unsigned char *a1, unsigned char *a2)
{
  sub_100029E3C(a1, a2);
  sub_1002370EC((void *)&_mh_execute_header, v2, (uint64_t)v2, "PRRose::setConfigParameters: failed to set NB SAR power table.", v3);
}

void sub_10042194C(unsigned char *a1, unsigned char *a2)
{
  sub_100029E3C(a1, a2);
  sub_1002370EC((void *)&_mh_execute_header, v2, (uint64_t)v2, "PRRose::setConfigParameters: failed to set NB UNII3 power table.", v3);
}

void sub_10042197C()
{
  sub_100010524();
  sub_100056C38((void *)&_mh_execute_header, v0, v1, "PRRose::applyConfigOptions unsupported HSI", v2, v3, v4, v5, v6);
}

void sub_1004219B0()
{
  sub_100010524();
  sub_1000104E4((void *)&_mh_execute_header, v0, v1, "PRRose::setConfigParameters: _updateCoexGlobalEventStatus failed", v2, v3, v4, v5, v6);
}

void sub_1004219E4()
{
  sub_100010524();
  sub_1000104E4((void *)&_mh_execute_header, v0, v1, "PRRose::setConfigParameters: setRoseConfigParameters failed", v2, v3, v4, v5, v6);
}

void sub_100421A18()
{
  sub_100010524();
  sub_1000104E4((void *)&_mh_execute_header, v0, v1, "PRRose failed to take assertion after triggering fatal log collection, aborting nearbyd", v2, v3, v4, v5, v6);
}

void sub_100421A4C()
{
  sub_100010524();
  sub_100056C38((void *)&_mh_execute_header, v0, v1, "#halt-exec-PRRose halt PRRose execution due to HaltPRRoseOnFatalError override", v2, v3, v4, v5, v6);
}

void sub_100421A80(uint64_t a1, NSObject *a2)
{
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_fault_impl((void *)&_mh_execute_header, a2, OS_LOG_TYPE_FAULT, "#halt-exec-PRRose halt PRRose execution due to HaltPRRoseOnFatalErrorReason override: %@", (uint8_t *)&v2, 0xCu);
}

void sub_100421AF8()
{
  sub_100010524();
  sub_1000104E4((void *)&_mh_execute_header, v0, v1, "LogCollectionStatus::TriggerFailed (non-fatal). Promoting to fatal.", v2, v3, v4, v5, v6);
}

void sub_100421B2C()
{
  sub_100010524();
  sub_1000104E4((void *)&_mh_execute_header, v0, v1, "Failed to trigger fatal log collection, aborting nearbyd.", v2, v3, v4, v5, v6);
}

void sub_100421B60(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_100421BCC()
{
  sub_100010524();
  sub_1000104E4((void *)&_mh_execute_header, v0, v1, "LogCollectionStatus::BusyNonFatalInProgress: Unexpected BusyNonFatalInProgress after triggering fatal log collection. Aborting nearbyd.", v2, v3, v4, v5, v6);
}

void sub_100421C00()
{
  sub_100010524();
  sub_1000104E4((void *)&_mh_execute_header, v0, v1, "LogCollectionStatus::BusyNonFatalInProgress.", v2, v3, v4, v5, v6);
}

void sub_100421C34()
{
  sub_100010524();
  sub_1000104E4((void *)&_mh_execute_header, v0, v1, "LogCollectionStatus::BusyFatalInProgress.", v2, v3, v4, v5, v6);
}

void sub_100421C68()
{
  sub_100010524();
  sub_1000104E4((void *)&_mh_execute_header, v0, v1, "Bad argument triggering log collection.", v2, v3, v4, v5, v6);
}

void sub_100421C9C()
{
  sub_100010524();
  sub_1000104E4((void *)&_mh_execute_header, v0, v1, "Not ready while triggering log collection.", v2, v3, v4, v5, v6);
}

void sub_100421CD0()
{
  sub_100010524();
  sub_1000104E4((void *)&_mh_execute_header, v0, v1, "PRRose: sending deep sleep exit request to RoseSupervisor failed. Aborting nearbyd.", v2, v3, v4, v5, v6);
}

void sub_100421D04()
{
  __assert_rtn("setRoseReportHandler", "PRRose.mm", 577, "nullptr != handler");
}

void sub_100421D30()
{
  __assert_rtn("setRoseStateEventsHandler", "PRRose.mm", 583, "nullptr != handler");
}

void sub_100421D5C()
{
  sub_100175C1C();
  if (v6 != v7) {
    uint64_t v8 = v5;
  }
  else {
    uint64_t v8 = v1;
  }
  *(_DWORD *)uint64_t v2 = 136315138;
  *(void *)(v2 + 4) = v8;
  sub_1001BE5D4((void *)&_mh_execute_header, v3, (uint64_t)v3, "Command %s not allowed in deep sleep", v4);
  if (*(char *)(v0 + 23) < 0) {
    operator delete(*(void **)v0);
  }
}

void sub_100421DB8()
{
  sub_100010524();
  sub_1000104E4((void *)&_mh_execute_header, v0, v1, "Failed to get deep sleep state", v2, v3, v4, v5, v6);
}

void sub_100421DEC()
{
  sub_100010524();
  sub_1000104E4((void *)&_mh_execute_header, v0, v1, "Tried to send command to rose, but not ready for comms.", v2, v3, v4, v5, v6);
}

void sub_100421E20()
{
  sub_100010524();
  sub_1000104E4((void *)&_mh_execute_header, v0, v1, "Tried to set rose property, but not ready for comms.", v2, v3, v4, v5, v6);
}

void sub_100421E54(char a1)
{
  if (a1)
  {
    sub_10016F0F4();
    _os_log_impl((void *)&_mh_execute_header, v1, OS_LOG_TYPE_DEFAULT, "PRRose::_handleRoseControlReport unknown type %hhu", v2, 8u);
  }
  __assert_rtn("_handleRoseControlReport", "PRRose.mm", 734, "false");
}

void sub_100421EDC()
{
  sub_100010524();
  sub_1000104E4((void *)&_mh_execute_header, v0, v1, "Failed to reset supervisor jobs", v2, v3, v4, v5, v6);
}

void sub_100421F10()
{
  sub_100010524();
  sub_1000104E4((void *)&_mh_execute_header, v0, v1, "Failed to trigger jobs report.", v2, v3, v4, v5, v6);
}

void sub_100421F44()
{
  sub_100010524();
  _os_log_debug_impl((void *)&_mh_execute_header, v0, OS_LOG_TYPE_DEBUG, "PRRose: probeAOPActivityReport", v1, 2u);
}

void sub_100421F84()
{
  sub_100010524();
  sub_1000104E4((void *)&_mh_execute_header, v0, v1, "Failed to activate AOP timesync", v2, v3, v4, v5, v6);
}

void sub_100421FB8()
{
  sub_1001BE670(__stack_chk_guard);
  sub_100010500();
  sub_1001BE5D4((void *)&_mh_execute_header, v0, (uint64_t)v0, "CalDataPushed property has unexpected size %zu", v1);
}

void sub_100422028()
{
  sub_100010524();
  sub_1000104E4((void *)&_mh_execute_header, v0, v1, "Failed to get CalDataPushed property", v2, v3, v4, v5, v6);
}

void sub_10042205C()
{
  sub_100010524();
  sub_1000104E4((void *)&_mh_execute_header, v0, v1, "PRRose: RoseSupervisor unexpected size for last known rose time", v2, v3, v4, v5, v6);
}

void sub_100422090()
{
  sub_100010524();
  sub_1000104E4((void *)&_mh_execute_header, v0, v1, "PRRose: Failed to get last known rose time.", v2, v3, v4, v5, v6);
}

uint64_t sub_1004220C4()
{
  uint64_t v0 = abort_report_np();
  return sub_1004220DC(v0);
}

void sub_1004220DC()
{
  sub_100010524();
  sub_1000104E4((void *)&_mh_execute_header, v0, v1, "unable to extract data from the use-internal-32k-clock property", v2, v3, v4, v5, v6);
}

void sub_100422110(uint64_t a1, uint64_t a2, NSObject *a3)
{
  *(_DWORD *)a1 = 134217984;
  *(void *)(a1 + 4) = a2;
  sub_1001BE5D4((void *)&_mh_execute_header, a3, (uint64_t)a3, "property data type %lu or property length is invalid", (uint8_t *)a1);
}

void sub_100422150()
{
  sub_100010524();
  sub_1000104E4((void *)&_mh_execute_header, v0, v1, "Coex: invalid config parameters from getConfig response", v2, v3, v4, v5, v6);
}

void sub_100422184()
{
  sub_100010524();
  sub_1000104E4((void *)&_mh_execute_header, v0, v1, "Called setRoseDebugLevel but not ready for comms.", v2, v3, v4, v5, v6);
}

void sub_1004221B8()
{
  sub_100010524();
  sub_1000104E4((void *)&_mh_execute_header, v0, v1, "fRoseCommMgr.sendSetConfigCommand returned false.", v2, v3, v4, v5, v6);
}

void sub_1004221EC()
{
  sub_100010524();
  sub_1000104E4((void *)&_mh_execute_header, v0, v1, "getLeadingEdgeThresholdsBytes failed.", v2, v3, v4, v5, v6);
}

void sub_100422220()
{
  sub_100010524();
  sub_1000104E4((void *)&_mh_execute_header, v0, v1, "getRoseAlishaTestMode failed: couldn't send command", v2, v3, v4, v5, v6);
}

void sub_100422254()
{
  sub_100010524();
  sub_1000104E4((void *)&_mh_execute_header, v0, v1, "getRoseAlishaTestMode failed: config not received", v2, v3, v4, v5, v6);
}

void sub_100422288()
{
  sub_100175C1C();
  if (v6 != v7) {
    uint64_t v8 = v5;
  }
  else {
    uint64_t v8 = v1;
  }
  *(_DWORD *)uint64_t v2 = 136315138;
  *(void *)(v2 + 4) = v8;
  sub_1001BE5D4((void *)&_mh_execute_header, v3, (uint64_t)v3, "getRoseAlishaTestMode failed: response not successful (%s)", v4);
  if (*(char *)(v0 + 23) < 0) {
    operator delete(*(void **)v0);
  }
}

void sub_1004222E4()
{
  sub_100010524();
  sub_1000104E4((void *)&_mh_execute_header, v0, v1, "getNBUWBePAeLNAModes failed: couldn't send command", v2, v3, v4, v5, v6);
}

void sub_100422318()
{
  sub_100175C1C();
  if (v6 != v7) {
    uint64_t v8 = v5;
  }
  else {
    uint64_t v8 = v1;
  }
  *(_DWORD *)uint64_t v2 = 136315138;
  *(void *)(v2 + 4) = v8;
  sub_1001BE5D4((void *)&_mh_execute_header, v3, (uint64_t)v3, "getNBUWBePAeLNAModes failed: response not successful (%s)", v4);
  if (*(char *)(v0 + 23) < 0) {
    operator delete(*(void **)v0);
  }
}

void sub_100422374()
{
  sub_100010524();
  sub_1000104E4((void *)&_mh_execute_header, v0, v1, "Unable to set AOP UserDefaults property", v2, v3, v4, v5, v6);
}

void sub_1004223A8()
{
  sub_100010524();
  sub_1000104E4((void *)&_mh_execute_header, v0, v1, "Failed to download firmware", v2, v3, v4, v5, v6);
}

void sub_1004223DC()
{
  sub_100010524();
  sub_1000104E4((void *)&_mh_execute_header, v0, v1, "Device does not have rose chip.", v2, v3, v4, v5, v6);
}

void sub_100422410()
{
  sub_100010524();
  sub_1000104E4((void *)&_mh_execute_header, v0, v1, "Failed to connect to fRoseCommMgr", v2, v3, v4, v5, v6);
}

void sub_100422444()
{
  sub_100010524();
  sub_1000104E4((void *)&_mh_execute_header, v0, v1, "Failed to deassert interface 0 path ownership.", v2, v3, v4, v5, v6);
}

void sub_100422478()
{
  sub_10016F0F4();
  sub_10001AC98((void *)&_mh_execute_header, v0, v1, "ApplyConfigParamsSetMACAddressFailure: %d", v2, v3, v4, v5, v6);
}

void sub_1004224E4()
{
  sub_10016F0F4();
  sub_10001AC98((void *)&_mh_execute_header, v0, v1, "ApplyConfigParamsSendPowerTableFailure: %d", v2, v3, v4, v5, v6);
}

void sub_100422550()
{
  sub_10016F0F4();
  sub_10001AC98((void *)&_mh_execute_header, v0, v1, "ApplyConfigParamsCoExStatusFailure: %d", v2, v3, v4, v5, v6);
}

void sub_1004225BC()
{
  sub_10016F0F4();
  sub_10001AC98((void *)&_mh_execute_header, v0, v1, "ApplyConfigParamsCIRVersionFailure: %d", v2, v3, v4, v5, v6);
}

void sub_100422628()
{
  sub_10016F0F4();
  sub_10001AC98((void *)&_mh_execute_header, v0, v1, "AOPActivateTimeSyncEnableFailure: %d", v2, v3, v4, v5, v6);
}

void sub_100422694()
{
  sub_10016F0F4();
  sub_10001AC98((void *)&_mh_execute_header, v0, v1, "FWTimeSyncEnableFailure: %d", v2, v3, v4, v5, v6);
}

void sub_100422700()
{
  sub_10016F0F4();
  sub_10001AC98((void *)&_mh_execute_header, v0, v1, "DisableFWLogsFailure: %d", v2, v3, v4, v5, v6);
}

void sub_10042276C()
{
  sub_10016F0F4();
  sub_10001AC98((void *)&_mh_execute_header, v0, v1, "ConfigureFWSleepFailure: %d", v2, v3, v4, v5, v6);
}

void sub_1004227D8()
{
  sub_10016F0F4();
  sub_10001AC98((void *)&_mh_execute_header, v0, v1, "ExtClockSettingFailure: %d", v2, v3, v4, v5, v6);
}

void sub_100422844()
{
  sub_10016F0F4();
  sub_10001AC98((void *)&_mh_execute_header, v0, v1, "PushCalFailure: %d", v2, v3, v4, v5, v6);
}

void sub_1004228B0()
{
  sub_10016F0F4();
  sub_10001AC98((void *)&_mh_execute_header, v0, v1, "PingFWFailure: %d", v2, v3, v4, v5, v6);
}

void sub_10042291C()
{
  sub_10016F0F4();
  sub_10001AC98((void *)&_mh_execute_header, v0, v1, "PushFWFailure: %d", v2, v3, v4, v5, v6);
}

void sub_100422988()
{
  sub_100010524();
  sub_1000104E4((void *)&_mh_execute_header, v0, v1, "BootFailure Breakdown:", v2, v3, v4, v5, v6);
}

void sub_1004229BC(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_100422A30()
{
  sub_100010524();
  sub_1000104E4((void *)&_mh_execute_header, v0, v1, "Unable to power on Rose", v2, v3, v4, v5, v6);
}

void sub_100422A64()
{
  sub_100010524();
  sub_1000104E4((void *)&_mh_execute_header, v0, v1, "Unable to power off Rose", v2, v3, v4, v5, v6);
}

void sub_100422A98()
{
  sub_100010524();
  sub_1000104E4((void *)&_mh_execute_header, v0, v1, "PRRose: chip reset failed, falling back to power cycle", v2, v3, v4, v5, v6);
}

void sub_100422ACC()
{
  sub_100010524();
  sub_1000104E4((void *)&_mh_execute_header, v0, v1, "fRoseCommMgr.getPreflightInfo() failed", v2, v3, v4, v5, v6);
}

void sub_100422B00(unsigned int *a1)
{
  sub_100237148(a1, __stack_chk_guard);
  sub_100010500();
  sub_10000B3E0((void *)&_mh_execute_header, v1, v2, "Called getPreflightInfo but not in a compatible state: %s", v3, v4, v5, v6, v7);
}

void sub_100422B84()
{
  sub_100010524();
  sub_1000104E4((void *)&_mh_execute_header, v0, v1, "Called getPreflightInfo but there is no chip", v2, v3, v4, v5, v6);
}

void sub_100422BB8(unsigned int *a1)
{
  sub_100237148(a1, __stack_chk_guard);
  sub_100010500();
  sub_10000B3E0((void *)&_mh_execute_header, v1, v2, "Called getChipInfo but in state: [%s]", v3, v4, v5, v6, v7);
}

void sub_100422C3C(unsigned int *a1)
{
  sub_100237148(a1, __stack_chk_guard);
  sub_100010500();
  sub_10000B3E0((void *)&_mh_execute_header, v1, v2, "Called getChipInfoAsync but in incompatible terminal state: [%s]", v3, v4, v5, v6, v7);
}

void sub_100422CC0()
{
  sub_100010524();
  sub_1000104E4((void *)&_mh_execute_header, v0, v1, "Called getChipInfoAsync but a previous call is already pending", v2, v3, v4, v5, v6);
}

void sub_100422CF4()
{
  sub_1001BE670(__stack_chk_guard);
  sub_100010500();
  sub_1001BE5D4((void *)&_mh_execute_header, v0, (uint64_t)v0, "PRRose: RoseSupervisor returned unexpected size %zu for deep sleep state. Aborting nearbyd.", v1);
}

void sub_100422D64()
{
  sub_100010524();
  sub_1000104E4((void *)&_mh_execute_header, v0, v1, "PRRose: sending deep sleep state query to RoseSupervisor failed. Aborting nearbyd.", v2, v3, v4, v5, v6);
}

void sub_100422D98()
{
  sub_100010524();
  sub_1000104E4((void *)&_mh_execute_header, v0, v1, "Failed to generate AOP activity report.", v2, v3, v4, v5, v6);
}

void sub_100422DCC()
{
  sub_100010524();
  sub_1000104E4((void *)&_mh_execute_header, v0, v1, "Chip is not present or failed to connect to RoseCommMgr. Ignoring attempt to trigger log collection", v2, v3, v4, v5, v6);
}

void sub_100422E00()
{
  sub_100010524();
  sub_1000104E4((void *)&_mh_execute_header, v0, v1, "Failed to trigger log collection", v2, v3, v4, v5, v6);
}

void sub_100422E34(unsigned int *a1)
{
  sub_100237148(a1, __stack_chk_guard);
  sub_100010500();
  sub_10000B3E0((void *)&_mh_execute_header, v1, v2, "Tried to trigger fatal or nonfatal logs, but state is in [%s]", v3, v4, v5, v6, v7);
}

void sub_100422EB8()
{
  sub_100010524();
  sub_1000104E4((void *)&_mh_execute_header, v0, v1, "fRoseCommMgr.getChipPublicKey() failed", v2, v3, v4, v5, v6);
}

void sub_100422EEC(unsigned int *a1)
{
  sub_100237148(a1, __stack_chk_guard);
  sub_100010500();
  sub_10000B3E0((void *)&_mh_execute_header, v1, v2, "Called getChipPublicKey but not in a compatible state: %s", v3, v4, v5, v6, v7);
}

void sub_100422F70()
{
  sub_100010524();
  sub_1000104E4((void *)&_mh_execute_header, v0, v1, "Called getChipPublicKey but there is no chip", v2, v3, v4, v5, v6);
}

void sub_100422FA4()
{
  sub_100010524();
  sub_1000104E4((void *)&_mh_execute_header, v0, v1, "PRRose::setStateFromUnknownToHost: failed to clear AOP command queue.", v2, v3, v4, v5, v6);
}

void sub_100422FD8()
{
  sub_100010524();
  sub_1000104E4((void *)&_mh_execute_header, v0, v1, "PRRose AOP reset did not finish in time.", v2, v3, v4, v5, v6);
}

void sub_10042300C()
{
  sub_100010524();
  sub_1000104E4((void *)&_mh_execute_header, v0, v1, "PRRose::setStateFromUnknownToHost: failed to get AOP property CmdQueueClearAllowed.", v2, v3, v4, v5, v6);
}

void sub_100423040()
{
  sub_100010524();
  sub_1000104E4((void *)&_mh_execute_header, v0, v1, "PRRose: failed to get deep sleep state during startup", v2, v3, v4, v5, v6);
}

void sub_100423074()
{
  sub_100010524();
  sub_1000104E4((void *)&_mh_execute_header, v0, v1, "PRRose: failed to exit deep sleep during startup, aborting nearbyd", v2, v3, v4, v5, v6);
}

void sub_1004230A8()
{
  sub_100010500();
  sub_10000B3E0((void *)&_mh_execute_header, v0, v1, "PRRose failed to take assertion - setStateFromUnknownToHost: FWState::%s", v2, v3, v4, v5, v6);
}

void sub_100423134()
{
  sub_100010524();
  sub_1000104E4((void *)&_mh_execute_header, v0, v1, "Failed to dump existing logs, aborting nearbyd", v2, v3, v4, v5, v6);
}

void sub_100423168()
{
  sub_100010524();
  sub_1000104E4((void *)&_mh_execute_header, v0, v1, "Failed to trigger fatal crashLog, aborting nearbyd", v2, v3, v4, v5, v6);
}

void sub_10042319C()
{
  sub_100010524();
  sub_1000104E4((void *)&_mh_execute_header, v0, v1, "Failed to dump exisiting logs, aborting nearbyd", v2, v3, v4, v5, v6);
}

void sub_1004231D0()
{
  sub_100010524();
  sub_1000104E4((void *)&_mh_execute_header, v0, v1, "Unable to power on R1", v2, v3, v4, v5, v6);
}

void sub_100423204()
{
  sub_100010524();
  sub_1000104E4((void *)&_mh_execute_header, v0, v1, "PRRose::setStateFromUnknownToHost: Failed to trigger fatal crashLog, aborting nearbyd", v2, v3, v4, v5, v6);
}

void sub_100423238()
{
  sub_100010524();
  sub_1000104E4((void *)&_mh_execute_header, v0, v1, "PRRose: Failed to reset AOP jobs.", v2, v3, v4, v5, v6);
}

void sub_10042326C()
{
  sub_100010524();
  sub_1000104E4((void *)&_mh_execute_header, v0, v1, "PRRose::setStateFromUnknownToHost failed to assert UWB comms ownership", v2, v3, v4, v5, v6);
}

void sub_1004232A0(uint64_t a1)
{
  sub_100237104(a1, __stack_chk_guard);
  sub_10023715C();
  sub_100010560();
  sub_10001AC6C((void *)&_mh_execute_header, v1, v2, "PRRose unexpected event while in state: %s, event: %s, aborting nearbyd", v3, v4);
}

void sub_100423344(uint64_t a1)
{
  sub_100237104(a1, __stack_chk_guard);
  sub_10023715C();
  sub_100010560();
  sub_10001AC6C((void *)&_mh_execute_header, v1, v2, "PRRose unexpected event while in state: %s, event: %s, aborting nearbyd", v3, v4);
}

void sub_1004233E8()
{
  sub_100010524();
  sub_1000104E4((void *)&_mh_execute_header, v0, v1, "Failed to send hello.", v2, v3, v4, v5, v6);
}

void sub_10042341C()
{
  sub_100010524();
  sub_1000104E4((void *)&_mh_execute_header, v0, v1, "Failed to apply config parameters.", v2, v3, v4, v5, v6);
}

void sub_100423450()
{
  sub_100010524();
  sub_1000104E4((void *)&_mh_execute_header, v0, v1, "Failed to produce valid rose config parameters.", v2, v3, v4, v5, v6);
}

void sub_100423484()
{
  sub_100010524();
  sub_1000104E4((void *)&_mh_execute_header, v0, v1, "Failed to activate AOP timesync.", v2, v3, v4, v5, v6);
}

void sub_1004234B8()
{
  sub_100010524();
  sub_1000104E4((void *)&_mh_execute_header, v0, v1, "Failed to enable timesync on the FW", v2, v3, v4, v5, v6);
}

void sub_1004234EC()
{
  sub_100010524();
  sub_1000104E4((void *)&_mh_execute_header, v0, v1, "Failed to disable firmware logging", v2, v3, v4, v5, v6);
}

void sub_100423520()
{
  sub_100010524();
  sub_100056C38((void *)&_mh_execute_header, v0, v1, "Unable to set AOP SleepBetweenRangingCycles property", v2, v3, v4, v5, v6);
}

void sub_100423554()
{
  sub_100010524();
  sub_1000104E4((void *)&_mh_execute_header, v0, v1, "Failed to enable UWB sleep between ranging cycles", v2, v3, v4, v5, v6);
}

void sub_100423588()
{
  sub_100010524();
  sub_1000104E4((void *)&_mh_execute_header, v0, v1, "Unable to disable UWB power table", v2, v3, v4, v5, v6);
}

void sub_1004235BC()
{
  sub_100010524();
  sub_1000104E4((void *)&_mh_execute_header, v0, v1, "Disabling sleep failed", v2, v3, v4, v5, v6);
}

void sub_1004235F0()
{
  sub_100010524();
  sub_1000104E4((void *)&_mh_execute_header, v0, v1, "Unable to set OTPWorkaroundCompleted property", v2, v3, v4, v5, v6);
}

void sub_100423624()
{
  sub_100010524();
  sub_1000104E4((void *)&_mh_execute_header, v0, v1, "Enabling sleep failed", v2, v3, v4, v5, v6);
}

void sub_100423658()
{
  sub_100010524();
  sub_1000104E4((void *)&_mh_execute_header, v0, v1, "Failed to enable internal clock on the FW", v2, v3, v4, v5, v6);
}

void sub_10042368C()
{
  sub_100010524();
  sub_1000104E4((void *)&_mh_execute_header, v0, v1, "Failed to configure Rose to use host GTB", v2, v3, v4, v5, v6);
}

void sub_1004236C0()
{
  sub_100010524();
  sub_1000104E4((void *)&_mh_execute_header, v0, v1, "Failed to set RX LP mode", v2, v3, v4, v5, v6);
}

void sub_1004236F4()
{
  sub_100010524();
  sub_1000104E4((void *)&_mh_execute_header, v0, v1, "Failed to enforce NB/UWB eLNA mode on the FW", v2, v3, v4, v5, v6);
}

void sub_100423728()
{
  sub_100010524();
  sub_1000104E4((void *)&_mh_execute_header, v0, v1, "Failed to set NB ePA/eLNA mode on the FW", v2, v3, v4, v5, v6);
}

void sub_10042375C()
{
  sub_100010524();
  sub_1000104E4((void *)&_mh_execute_header, v0, v1, "firmware is indicating a bad calibration file", v2, v3, v4, v5, v6);
}

void sub_100423790()
{
  sub_100010524();
  sub_1000104E4((void *)&_mh_execute_header, v0, v1, "Resetting chip since cal data has not been pushed", v2, v3, v4, v5, v6);
}

void sub_1004237C4()
{
  sub_100010524();
  sub_1000104E4((void *)&_mh_execute_header, v0, v1, "#deep-slp Disabling deep sleep on unsupported Rose HW rev", v2, v3, v4, v5, v6);
}

void sub_1004237F8()
{
  sub_100010524();
  sub_1000104E4((void *)&_mh_execute_header, v0, v1, "Unexpected chip reset event received while booting", v2, v3, v4, v5, v6);
}

void sub_10042382C(uint64_t a1)
{
  sub_100237104(a1, __stack_chk_guard);
  sub_10023715C();
  sub_100010560();
  sub_10001AC6C((void *)&_mh_execute_header, v1, v2, "PRRose unexpected event while in state: %s, event: %s, aborting nearbyd", v3, v4);
}

void sub_1004238D0(uint64_t a1)
{
  sub_100237104(a1, __stack_chk_guard);
  sub_10023715C();
  sub_100010560();
  sub_10001AC6C((void *)&_mh_execute_header, v1, v2, "PRRose unexpected event while in state: %s, event: %s, aborting nearbyd", v3, v4);
}

void sub_100423974(uint64_t a1)
{
  sub_10023711C(a1, __stack_chk_guard);
  sub_100237134();
  uint64_t v4 = "FatalChipError";
  sub_10001050C((void *)&_mh_execute_header, v1, v2, "PRRose failed to take assertion. state %s, event: %s, aborting nearbyd", v3);
}

void sub_100423A08(uint64_t a1)
{
  sub_10023711C(a1, __stack_chk_guard);
  sub_100237134();
  uint64_t v4 = "ChipReset";
  sub_10001050C((void *)&_mh_execute_header, v1, v2, "PRRose failed to take assertion. state %s, event: %s, aborting nearbyd", v3);
}

void sub_100423A9C(uint64_t a1)
{
  sub_100237104(a1, __stack_chk_guard);
  sub_100010560();
  sub_10001AC6C((void *)&_mh_execute_header, v1, v2, "PRRose unexpected event while in state: %s, event: %s, aborting nearbyd", v3, v4);
}

void sub_100423B44()
{
  sub_100010524();
  sub_1000104E4((void *)&_mh_execute_header, v0, v1, "Error state - FatalChipError. Start error handling.", v2, v3, v4, v5, v6);
}

void sub_100423B78()
{
  sub_100010524();
  sub_1000104E4((void *)&_mh_execute_header, v0, v1, "Failed to dump firmware logs, aborting nearbyd", v2, v3, v4, v5, v6);
}

void sub_100423BAC()
{
  sub_100010524();
  sub_1000104E4((void *)&_mh_execute_header, v0, v1, "Rose Service Handshake Error. Cannot proceeed. Aborting nearbyd.", v2, v3, v4, v5, v6);
}

void sub_100423BE0()
{
  sub_100010524();
  sub_1000104E4((void *)&_mh_execute_header, v0, v1, "Error state - FatalChipError. Already in ErrorHandling state, ignoring.", v2, v3, v4, v5, v6);
}

void sub_100423C14()
{
  sub_100010524();
  sub_1000104E4((void *)&_mh_execute_header, v0, v1, "Event - ChipReset. Already in ErrorHandling state, ignoring.", v2, v3, v4, v5, v6);
}

void sub_100423C48()
{
  sub_100010524();
  sub_1000104E4((void *)&_mh_execute_header, v0, v1, "Event - BootError. Already in ErrorHandling state, ignoring.", v2, v3, v4, v5, v6);
}

void sub_100423C7C(uint64_t a1)
{
  sub_100237104(a1, __stack_chk_guard);
  sub_10023715C();
  sub_100010560();
  sub_10001AC6C((void *)&_mh_execute_header, v1, v2, "PRRose unexpected event while in state: %s, event: %s, ignoring", v3, v4);
}

void sub_100423D20(uint64_t a1)
{
  sub_100237104(a1, __stack_chk_guard);
  sub_10023715C();
  sub_100010560();
  sub_100237168((void *)&_mh_execute_header, v1, v2, "PRRose unexpected event while in state: %s, event: %s", v3, v4);
}

void sub_100423DC4(uint64_t a1)
{
  sub_10023711C(a1, __stack_chk_guard);
  sub_100237134();
  uint64_t v4 = "PowerOn";
  sub_10001050C((void *)&_mh_execute_header, v1, v2, "PRRose Power On Failed  while in state: %s, event: %s, aborting nearbyd", v3);
}

void sub_100423E58(uint64_t a1)
{
  sub_10023711C(a1, __stack_chk_guard);
  sub_100237134();
  uint64_t v4 = "Configure";
  sub_10001050C((void *)&_mh_execute_header, v1, v2, "PRRose unexpected event while in state: %s, event: %s", v3);
}

void sub_100423EEC(uint64_t a1)
{
  sub_100237104(a1, __stack_chk_guard);
  sub_10023715C();
  sub_100010560();
  sub_100237168((void *)&_mh_execute_header, v1, v2, "PRRose unexpected event while in state: %s, event: %s", v3, v4);
}

void sub_100423F90()
{
  sub_100010524();
  sub_1000104E4((void *)&_mh_execute_header, v0, v1, "PRRose: timed out waiting for deep sleep exit", v2, v3, v4, v5, v6);
}

void sub_100423FC4()
{
  sub_100010500();
  sub_10000B3E0((void *)&_mh_execute_header, v0, v1, "PRRose: invalid deep sleep state %s after requesting deep sleep exit. Aborting nearbyd.", v2, v3, v4, v5, v6);
}

void sub_100424044()
{
  sub_100010524();
  sub_1000104E4((void *)&_mh_execute_header, v0, v1, "PRRose::errorHandlingRoutine: Failed to promote error to fatal. Aborting nearbyd.", v2, v3, v4, v5, v6);
}

void sub_100424078()
{
  sub_100010524();
  sub_1000104E4((void *)&_mh_execute_header, v0, v1, "PRRose: Failed to start secureROM Timer.", v2, v3, v4, v5, v6);
}

void sub_1004240AC()
{
  sub_100010524();
  sub_1000104E4((void *)&_mh_execute_header, v0, v1, "PRRose: sending deep sleep entry request to RoseSupervisor failed. Aborting nearbyd.", v2, v3, v4, v5, v6);
}

void sub_1004240E0()
{
  sub_100010524();
  sub_1000104E4((void *)&_mh_execute_header, v0, v1, "PRRose: sending LPEM Enable command to Rose failed. Aborting nearbyd.", v2, v3, v4, v5, v6);
}

void sub_100424114()
{
  sub_100010524();
  sub_1000104E4((void *)&_mh_execute_header, v0, v1, "Failed to trigger fatal crash logs, aborting nearbyd", v2, v3, v4, v5, v6);
}

void sub_100424148()
{
  sub_100010524();
  sub_1000104E4((void *)&_mh_execute_header, v0, v1, "PRRose is no longer in Error. Ignoring the event.", v2, v3, v4, v5, v6);
}

void sub_10042417C()
{
  sub_100010524();
  sub_1000104E4((void *)&_mh_execute_header, v0, v1, "PRRose: Failed to start LogCollectionCompleted Timer.", v2, v3, v4, v5, v6);
}

void sub_1004241B0()
{
  sub_100010524();
  sub_1000104E4((void *)&_mh_execute_header, v0, v1, "PRRose: DebugManagerEvent::Dead", v2, v3, v4, v5, v6);
}

void sub_1004241E4()
{
  sub_100010524();
  sub_1000104E4((void *)&_mh_execute_header, v0, v1, "PRRose: DebugManagerEvent::RoseSecureROM. No longer in SecureROM. Ignoring the event", v2, v3, v4, v5, v6);
}

void sub_100424218(unsigned int *a1)
{
  sub_100237148(a1, __stack_chk_guard);
  sub_100010500();
  sub_10000B3E0((void *)&_mh_execute_header, v1, v2, "PRRose: DebugManagerEvent::RoseSecureROM. Current state: [%s]", v3, v4, v5, v6, v7);
}

void sub_10042429C()
{
  sub_100010524();
  sub_1000104E4((void *)&_mh_execute_header, v0, v1, "PRRose: DebugManagerEvent::LogCollectionFatalFailed", v2, v3, v4, v5, v6);
}

void sub_1004242D0()
{
  sub_100010524();
  sub_1000104E4((void *)&_mh_execute_header, v0, v1, "PRRose: DebugManagerEvent::LogCollectionNonFatalFailed", v2, v3, v4, v5, v6);
}

void sub_100424304()
{
  sub_100010524();
  sub_1000104E4((void *)&_mh_execute_header, v0, v1, "PRRose: DebugManagerEvent::InterfaceError", v2, v3, v4, v5, v6);
}

void sub_100424338()
{
  sub_100010524();
  sub_1000104E4((void *)&_mh_execute_header, v0, v1, "PRRose: DebugManagerEvent::FilesystemError", v2, v3, v4, v5, v6);
}

void sub_10042436C()
{
  sub_100010524();
  sub_1000104E4((void *)&_mh_execute_header, v0, v1, "PRRose: null timeoutCB.", v2, v3, v4, v5, v6);
}

void sub_1004243A0()
{
  sub_100010524();
  sub_1000104E4((void *)&_mh_execute_header, v0, v1, "PRRose: Failed to create LogCollectionCompleted timer.", v2, v3, v4, v5, v6);
}

void sub_1004243D4()
{
  sub_100010524();
  sub_1000104E4((void *)&_mh_execute_header, v0, v1, "PRRose: Failed to create timer.", v2, v3, v4, v5, v6);
}

void sub_100424408()
{
  sub_100010524();
  sub_1000104E4((void *)&_mh_execute_header, v0, v1, "PRRose is unavailable to provide services", v2, v3, v4, v5, v6);
}

void sub_10042443C()
{
  sub_100010524();
  sub_1000104E4((void *)&_mh_execute_header, v0, v1, "PRRose: powerOnAndWaitForReady timed out while waiting for response.", v2, v3, v4, v5, v6);
}

void sub_100424470()
{
  sub_10016F0F4();
  sub_10001AC98((void *)&_mh_execute_header, v0, v1, "PRRose:applyConfigOptions,regulatory,sendingConfig, rangingGroupMessageID != SET_CONFIG (%hx)", v2, v3, v4, v5, v6);
}

void sub_1004244DC()
{
  sub_10016F0F4();
  sub_10001AC98((void *)&_mh_execute_header, v0, v1, "PRRose:applyConfigOptions,regulatory,sendingConfig, groupID != Ranging (%hhx)", v2, v3, v4, v5, v6);
}

void sub_100424548()
{
  sub_100010524();
  sub_100056C38((void *)&_mh_execute_header, v0, v1, "UWB sleep between ranging set config failure - unexpected response type", v2, v3, v4, v5, v6);
}

void sub_10042457C()
{
  sub_10016F0F4();
  _os_log_fault_impl((void *)&_mh_execute_header, v0, OS_LOG_TYPE_FAULT, "UWB sleep between ranging set config failure - status %d", v1, 8u);
}

void sub_1004245F4()
{
  sub_100010524();
  sub_1000104E4((void *)&_mh_execute_header, v0, v1, "#handoffca rangingRateChanged() called without active session", v2, v3, v4, v5, v6);
}

void sub_100424628()
{
  sub_1001BE628();
  __int16 v3 = 1024;
  int v4 = v0;
  _os_log_debug_impl((void *)&_mh_execute_header, v1, OS_LOG_TYPE_DEBUG, "#handoffca rangingRateChanged() monotonicTimeSeconds: %f s, rangingIntervalMilliseconds %d s", v2, 0x12u);
}

void sub_1004246A8()
{
  sub_100010524();
  sub_1000104E4((void *)&_mh_execute_header, v0, v1, "#handoffca regionChanged() called without active session", v2, v3, v4, v5, v6);
}

void sub_1004246DC()
{
  sub_1001BE628();
  sub_1001BE5B8((void *)&_mh_execute_header, v0, v1, "#handoffca regionChanged() monotonicTimeSeconds: %f s", v2, v3, v4, v5, v6);
}

void sub_100424748()
{
  sub_1001BE628();
  sub_1001BE5B8((void *)&_mh_execute_header, v0, v1, "#handoffca updateTimeSpentRangingWithNumberOfDevices() monotonicTimeSeconds: %f s", v2, v3, v4, v5, v6);
}

void sub_1004247B4()
{
  sub_100010524();
  sub_1000104E4((void *)&_mh_execute_header, v0, v1, "#handoffca addedDevice() called without active session", v2, v3, v4, v5, v6);
}

void sub_1004247E8()
{
  sub_1001BE628();
  sub_1001BE5B8((void *)&_mh_execute_header, v0, v1, "#handoffca adding device in addedDevice(), monotonicTimeSeconds: %f s", v2, v3, v4, v5, v6);
}

void sub_100424854()
{
  sub_1001BE628();
  sub_1001BE5B8((void *)&_mh_execute_header, v0, v1, "#handoffca addedDevice() monotonicTimeSeconds: %f s", v2, v3, v4, v5, v6);
}

void sub_1004248C0()
{
  sub_100010524();
  sub_1000104E4((void *)&_mh_execute_header, v0, v1, "#handoffca removedDevice() called without active session", v2, v3, v4, v5, v6);
}

void sub_1004248F4()
{
  sub_1001BE628();
  sub_1001BE5B8((void *)&_mh_execute_header, v0, v1, "#handoffca removing object in removedDevice() monotonicTimeSeconds: %f s,", v2, v3, v4, v5, v6);
}

void sub_100424960()
{
  sub_1001BE628();
  sub_1001BE5B8((void *)&_mh_execute_header, v0, v1, "#handoffca removedDevice() monotonicTimeSeconds: %f s,", v2, v3, v4, v5, v6);
}

void sub_1004249CC()
{
  sub_1001BE628();
  sub_1001BE5B8((void *)&_mh_execute_header, v0, v1, "#handoffca sessionStarted() monotonicTimeSeconds: %f s", v2, v3, v4, v5, v6);
}

void sub_100424A38()
{
  sub_100010524();
  sub_1000104E4((void *)&_mh_execute_header, v0, v1, "#handoffca sessionEnded() called without active session", v2, v3, v4, v5, v6);
}

void sub_100424A6C()
{
  sub_1001BE628();
  sub_1001BE5B8((void *)&_mh_execute_header, v0, v1, "#handoffca sessionEnded() monotonicTimeSeconds: %f, s", v2, v3, v4, v5, v6);
}

void sub_100424AD8()
{
  sub_100010524();
  _os_log_debug_impl((void *)&_mh_execute_header, v0, OS_LOG_TYPE_DEBUG, "#handoffca resetStatistics()", v1, 2u);
}

void sub_100424B18(os_log_t log)
{
  *(_WORD *)uint64_t v1 = 0;
  _os_log_fault_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_FAULT, "Registered for vision input but does not support camera assistance.", v1, 2u);
}

void sub_100424B5C(os_log_t log)
{
  *(_WORD *)uint64_t v1 = 0;
  _os_log_fault_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_FAULT, "FindingFrame,Measured velocity change and measured displacement are both available", v1, 2u);
}

void sub_100424BA0(os_log_t log)
{
  *(_WORD *)uint64_t v1 = 0;
  _os_log_fault_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_FAULT, "FindingFrame,Contents are larger than space allocated to it. Wrapping around.", v1, 2u);
}

float sub_100424BE4(unsigned __int8 *a1, NSObject *a2)
{
  int v2 = a1[8];
  int v3 = a1[9];
  int v4 = a1[10];
  int v5 = a1[11];
  v7[0] = 67109888;
  v7[1] = v2;
  __int16 v8 = 1024;
  int v9 = v3;
  __int16 v10 = 1024;
  int v11 = v4;
  __int16 v12 = 1024;
  int v13 = v5;
  _os_log_debug_impl((void *)&_mh_execute_header, a2, OS_LOG_TYPE_DEBUG, "#type19,Parsed. Flag FE: %d. FS: %d. FC: %d. FC2: %d.", (uint8_t *)v7, 0x1Au);
  return result;
}

void sub_100424C84(uint64_t a1, uint64_t a2, os_log_t log)
{
  int v3 = 138412546;
  uint64_t v4 = a1;
  __int16 v5 = 2112;
  uint64_t v6 = a2;
  _os_log_debug_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_DEBUG, "#type19,UWB Data to parse: %@, Presence Data to parse: %@ ", (uint8_t *)&v3, 0x16u);
}

void sub_100424D0C(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_100424D44(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_100424D7C(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_100424DB4()
{
  sub_100010524();
  sub_1000104E4((void *)&_mh_execute_header, v0, v1, "#find-range,Invalid argument - token is nil", v2, v3, v4, v5, v6);
}

void sub_100424DE8()
{
  sub_100010524();
  sub_1000104E4((void *)&_mh_execute_header, v0, v1, "#find-range,Invalid argument - client is nil", v2, v3, v4, v5, v6);
}

void sub_100424E1C()
{
  sub_100010524();
  sub_1000104E4((void *)&_mh_execute_header, v0, v1, "#find-range,Failed to build nbamms ranging session", v2, v3, v4, v5, v6);
}

void sub_100424E50()
{
  sub_100175C1C();
  if (v6 != v7) {
    uint64_t v8 = v5;
  }
  else {
    uint64_t v8 = v1;
  }
  *(_DWORD *)uint64_t v2 = 136315138;
  *(void *)(v2 + 4) = v8;
  sub_1001BE5D4((void *)&_mh_execute_header, v3, (uint64_t)v3, "#find-range,Failed to start ranging. Return code: %s", v4);
  if (*(char *)(v0 + 23) < 0) {
    operator delete(*(void **)v0);
  }
}

void sub_100424EAC()
{
  sub_100010524();
  sub_1000104E4((void *)&_mh_execute_header, v0, v1, "#find-range,Cannot attached client to existing NBAMMS session", v2, v3, v4, v5, v6);
}

void sub_100424EE0(int *a1, int a2, os_log_t log)
{
  int v3 = *a1;
  v4[0] = 67109376;
  v4[1] = a2;
  __int16 v5 = 1024;
  int v6 = v3;
  _os_log_error_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_ERROR, "#find-range,Shared protocol not matching - new protocol: %d, existing protocol: %d", (uint8_t *)v4, 0xEu);
}

void sub_100424F6C()
{
  sub_100010524();
  sub_1000104E4((void *)&_mh_execute_header, v0, v1, "#find-range,Reciprocal -> one-way: couldn't get ranging token or parameters", v2, v3, v4, v5, v6);
}

void sub_100424FA0()
{
  sub_1002552CC(__stack_chk_guard);
  sub_100010500();
  sub_10000B3E0((void *)&_mh_execute_header, v0, v1, "#find-range,%@, cannot set findee data if not findee", v2, v3, v4, v5, v6);
}

void sub_100425008()
{
  sub_100255388();
  sub_100255370(v1, 5.8081e-34, v2, v3);
  sub_1002552B0((void *)&_mh_execute_header, "#find-range,#crypto Failed to encrypt (self ID %{private}@), id: %@", v4, v5);
}

void sub_10042504C()
{
  sub_100010524();
  sub_1000104E4((void *)&_mh_execute_header, v0, v1, "#find-range,#crypto Aiding and signalling encryption failed", v2, v3, v4, v5, v6);
}

void sub_100425080()
{
  sub_100010524();
  sub_10016F0D8((void *)&_mh_execute_header, v0, v1, "#find-range,#data TX: aiding / signalling", v2, v3, v4, v5, v6);
}

void sub_1004250B4()
{
  sub_100010524();
  sub_1000104E4((void *)&_mh_execute_header, v0, v1, "#find-range,FindingDataFrameFormat::encode failed in NBAMMSSessionManager", v2, v3, v4, v5, v6);
}

void sub_1004250E8()
{
  sub_100010524();
  sub_1000104E4((void *)&_mh_execute_header, v0, v1, "#find-range,Malformed findee data detected", v2, v3, v4, v5, v6);
}

void sub_10042511C()
{
  sub_100010524();
  sub_10016F0D8((void *)&_mh_execute_header, v0, v1, "#find-range,#data RX: aiding / signalling", v2, v3, v4, v5, v6);
}

void sub_100425150()
{
  sub_1002552CC(__stack_chk_guard);
  sub_100010500();
  sub_10000B3E0((void *)&_mh_execute_header, v0, v1, "#find-range,NBAMMS _serviceRequestStatusUpdate but nothing attached, possible race condition. %@", v2, v3, v4, v5, v6);
}

void sub_1004251B8()
{
  sub_1002552CC(__stack_chk_guard);
  sub_100010500();
  sub_10000B3E0((void *)&_mh_execute_header, v0, v1, "#find-range,NBAMMS _didReceiveNewSolution but nothing attached, possible race condition. %@", v2, v3, v4, v5, v6);
}

void sub_100425220(uint64_t a1)
{
}

void sub_100425238(uint64_t a1)
{
}

void sub_100425250(uint64_t a1)
{
}

void sub_10042525C()
{
  sub_1002552CC(__stack_chk_guard);
  sub_100010500();
  sub_10000B3E0((void *)&_mh_execute_header, v0, v1, "#find-range,NBAMMS _didReceiveUnsuccessfulSolution but nothing attached, possible race condition. %@", v2, v3, v4, v5, v6);
}

void sub_1004252C4()
{
  sub_1002552CC(__stack_chk_guard);
  sub_100010500();
  sub_10000B3E0((void *)&_mh_execute_header, v0, v1, "#find-range,NBAMMS _didReceivePeerData but nothing attached, possible race condition. %@", v2, v3, v4, v5, v6);
}

void sub_10042532C()
{
  sub_1002552FC();
  sub_10016F0F4();
  sub_100255310((void *)&_mh_execute_header, v0, v1, "#find-range,Invalid peer data size %d", v2);
}

void sub_100425394()
{
  sub_100255388();
  sub_100255370(v1, 5.8081e-34, v2, v3);
  sub_1002552B0((void *)&_mh_execute_header, "#find-range,#crypto Failed to decrypt (peer ID %{private}@). %@", v4, v5);
}

void sub_1004253D8()
{
  sub_1002552FC();
  sub_10016F0F4();
  sub_100255310((void *)&_mh_execute_header, v0, v1, "#find-range,Invalid message size %d", v2);
}

void sub_100425440()
{
  sub_1002552CC(__stack_chk_guard);
  sub_100010500();
  sub_10000B3E0((void *)&_mh_execute_header, v0, v1, "#find-range,NBAMMS _didReceiveInvalidation but nothing attached, possible race condition. %@", v2, v3, v4, v5, v6);
}

void sub_1004254A8()
{
  sub_1002552CC(__stack_chk_guard);
  int v3 = *(unsigned __int8 *)(v2 + 1672);
  if (*(unsigned char *)(v2 + 936)) {
    uint64_t v4 = "yes";
  }
  else {
    uint64_t v4 = "no";
  }
  int v6 = 138412802;
  if (v3) {
    uint64_t v5 = "yes";
  }
  else {
    uint64_t v5 = "no";
  }
  uint64_t v7 = v1;
  __int16 v8 = 2080;
  int v9 = v4;
  __int16 v10 = 2080;
  int v11 = v5;
  _os_log_error_impl((void *)&_mh_execute_header, v0, OS_LOG_TYPE_ERROR, "#find-range,Rose service request of %@, finder: %s, findee: %s", (uint8_t *)&v6, 0x20u);
}

void sub_10042555C()
{
  sub_1002552CC(__stack_chk_guard);
  int v3 = "yes";
  int v5 = *(unsigned __int8 *)(v4 + 1672);
  if (*v2) {
    int v6 = "yes";
  }
  else {
    int v6 = "no";
  }
  int v7 = 138412802;
  if (!v5) {
    int v3 = "no";
  }
  uint64_t v8 = v1;
  __int16 v9 = 2080;
  __int16 v10 = v6;
  __int16 v11 = 2080;
  __int16 v12 = v3;
  _os_log_error_impl((void *)&_mh_execute_header, v0, OS_LOG_TYPE_ERROR, "#find-range,Start ranging options of %@, finder: %s, findee: %s", (uint8_t *)&v7, 0x20u);
}

void sub_100425614()
{
  sub_10025539C();
  sub_1002552D8(v1, v2, v3, 5.778e-34);
  sub_1002552B0((void *)&_mh_execute_header, "#find-range,Failed to initialize a NBAMMS session for %@. Error: %s", v4, v5);
  if (*(char *)(v0 + 23) < 0) {
    operator delete(*(void **)v0);
  }
}

void sub_100425664()
{
  sub_100010524();
  sub_10016F0D8((void *)&_mh_execute_header, v0, v1, "#find-range,#data TX: crypto session config", v2, v3, v4, v5, v6);
}

void sub_100425698()
{
  sub_100010524();
  sub_10016F0D8((void *)&_mh_execute_header, v0, v1, "#find-range,#data RX: crypto session config", v2, v3, v4, v5, v6);
}

void sub_1004256CC()
{
  __assert_rtn("_mutualAuthStateToMessage", "NIServerFindingRanging.mm", 697, "finderOutboundAuthStateRawValue <= 0x0F");
}

void sub_1004256F8()
{
  __assert_rtn("_mutualAuthStateToMessage", "NIServerFindingRanging.mm", 698, "finderInboundAuthStateRawValue <= 0x0F");
}

void sub_100425724()
{
  __assert_rtn("_mutualAuthStateToMessage", "NIServerFindingRanging.mm", 712, "findeeOutboundAuthStateRawValue <= 0x0F");
}

void sub_100425750()
{
  __assert_rtn("_mutualAuthStateToMessage", "NIServerFindingRanging.mm", 713, "findeeInboundAuthStateRawValue <= 0x0F");
}

void sub_10042577C()
{
  sub_1002552CC(__stack_chk_guard);
  sub_100010500();
  sub_10000B3E0((void *)&_mh_execute_header, v0, v1, "#find-range,#crypto #auth encryption failed, %@", v2, v3, v4, v5, v6);
}

void sub_1004257E4()
{
  sub_100010524();
  sub_10016F0D8((void *)&_mh_execute_header, v0, v1, "#find-range,#data TX: mutual auth", v2, v3, v4, v5, v6);
}

void sub_100425818()
{
  sub_1002552FC();
  sub_10016F0F4();
  sub_100255310((void *)&_mh_execute_header, v0, v1, "#find-range,#auth Invalid message size %d", v2);
}

void sub_100425880(uint64_t a1, uint8_t *buf, os_log_t log)
{
  *(_DWORD *)buf = 136315138;
  *(void *)(buf + 4) = a1;
  _os_log_fault_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_FAULT, "#find-range,#auth Message could not be parsed for peer %s state", buf, 0xCu);
}

void sub_1004258C8()
{
  sub_100010524();
  sub_10016F0D8((void *)&_mh_execute_header, v0, v1, "#find-range,#data RX: mutual auth", v2, v3, v4, v5, v6);
}

void sub_1004258FC(uint64_t a1, void *a2, uint64_t a3, NSObject *a4)
{
  *(_DWORD *)a3 = 136315394;
  *(void *)(a3 + 4) = a1;
  *(_WORD *)(a3 + 12) = 2112;
  *(void *)(a3 + 14) = a2;
  sub_1002552B0((void *)&_mh_execute_header, "#find-range,#auth IGNORED peer [%s] mutual auth:      %@", (uint8_t *)a3, a4);
}

void sub_100425958()
{
  sub_100010524();
  sub_1000104E4((void *)&_mh_execute_header, v0, v1, "#find-range,#auth Can't advance resync on a non-resync state", v2, v3, v4, v5, v6);
}

void sub_10042598C()
{
  sub_100010524();
  sub_1000104E4((void *)&_mh_execute_header, v0, v1, "#find-range,#auth Can't start resync on a non-resync state", v2, v3, v4, v5, v6);
}

void sub_1004259C0()
{
  sub_10016F0F4();
  _os_log_error_impl((void *)&_mh_execute_header, v0, OS_LOG_TYPE_ERROR, "#find-range,Cannot start ranging because shared protocol version (%d) does not support group finding", v1, 8u);
}

void sub_100425A38()
{
  sub_100010524();
  sub_1000104E4((void *)&_mh_execute_header, v0, v1, "#find-range,Unrecognized NMI session", v2, v3, v4, v5, v6);
}

void sub_100425A6C()
{
  sub_100010524();
  _os_log_fault_impl((void *)&_mh_execute_header, v0, OS_LOG_TYPE_FAULT, "#find-range,Consumer provided incomplete ranging availability callbacks", v1, 2u);
}

void sub_100425AAC()
{
  sub_100010524();
  sub_1000104E4((void *)&_mh_execute_header, v0, v1, "#find-range,startRangingWithPeer: not activated", v2, v3, v4, v5, v6);
}

void sub_100425AE0()
{
  sub_100010524();
  sub_1000104E4((void *)&_mh_execute_header, v0, v1, "#find-range,Failed to build service request", v2, v3, v4, v5, v6);
}

void sub_100425B14()
{
  sub_100010524();
  sub_1000104E4((void *)&_mh_execute_header, v0, v1, "#find-range,StopRangingWithPeer: not activated", v2, v3, v4, v5, v6);
}

void sub_100425B48()
{
  sub_100010524();
  sub_1000104E4((void *)&_mh_execute_header, v0, v1, "#find-range,setAlgorithmAidingData, not activated", v2, v3, v4, v5, v6);
}

void sub_100425B7C()
{
  sub_100010524();
  sub_1000104E4((void *)&_mh_execute_header, v0, v1, "#find-range,setAlgorithmAidingData, not ranging with specified peer", v2, v3, v4, v5, v6);
}

void sub_100425BB0()
{
  sub_100010524();
  sub_1000104E4((void *)&_mh_execute_header, v0, v1, "#find-range,setSignallingData, not activated", v2, v3, v4, v5, v6);
}

void sub_100425BE4()
{
  sub_100010524();
  sub_1000104E4((void *)&_mh_execute_header, v0, v1, "#find-range,setSignallingData, not ranging with specified peer", v2, v3, v4, v5, v6);
}

void sub_100425C18()
{
  sub_100010524();
  sub_1000104E4((void *)&_mh_execute_header, v0, v1, "#find-range,Reset ranging state for nil token in ranging provider", v2, v3, v4, v5, v6);
}

void sub_100425C4C()
{
  sub_100010524();
  sub_1000104E4((void *)&_mh_execute_header, v0, v1, "#find-range,NewSolution, not activated", v2, v3, v4, v5, v6);
}

void sub_100425C80()
{
  sub_100010524();
  sub_1000104E4((void *)&_mh_execute_header, v0, v1, "#find-range,Unsuccessful solution: not activated", v2, v3, v4, v5, v6);
}

void sub_100425CB4()
{
  sub_100010524();
  sub_1000104E4((void *)&_mh_execute_header, v0, v1, "#find-range,Session status update, not activated", v2, v3, v4, v5, v6);
}

void sub_100425CE8()
{
  sub_100010524();
  sub_1000104E4((void *)&_mh_execute_header, v0, v1, "#find-range,Consumer unexpectedly set to null", v2, v3, v4, v5, v6);
}

void sub_100425D1C()
{
  sub_100010524();
  sub_1000104E4((void *)&_mh_execute_header, v0, v1, "#find-range,didReceiveNbammsPeerAlgorithmAidingData:signallingData: not activated", v2, v3, v4, v5, v6);
}

void sub_100425D50()
{
  sub_100010524();
  sub_1000104E4((void *)&_mh_execute_header, v0, v1, "#find-range,didInvalidateNbammsSessionWithReason: not activated", v2, v3, v4, v5, v6);
}

void sub_100425D84()
{
  sub_10025539C();
  sub_1002552D8(v1, v2, v3, 4.8151e-34);
  sub_1002552B0((void *)&_mh_execute_header, "#find-range,[%s] Rose session invalidated unexpectedly. Reason: %s", v4, v5);
  if (*(char *)(v0 + 23) < 0) {
    operator delete(*(void **)v0);
  }
}

void sub_100425DD4()
{
  sub_100010524();
  sub_1000104E4((void *)&_mh_execute_header, v0, v1, "#find-range,didFailCrypto: not activated", v2, v3, v4, v5, v6);
}

void sub_100425E08(uint64_t a1, uint64_t a2, NSObject *a3)
{
  *(_DWORD *)a2 = 136315138;
  *(void *)(a2 + 4) = a1;
  sub_1001BE5D4((void *)&_mh_execute_header, a3, (uint64_t)a3, "#find-range,[%s] #crypto Failed (reached maximum)", (uint8_t *)a2);
}

void sub_100425E48()
{
  sub_100010524();
  sub_1000104E4((void *)&_mh_execute_header, v0, v1, "#find-range,didFailMutualAuth: not activated", v2, v3, v4, v5, v6);
}

void sub_100425E7C(uint64_t a1, uint64_t a2, NSObject *a3)
{
  *(_DWORD *)a2 = 136315138;
  *(void *)(a2 + 4) = a1;
  sub_1001BE5D4((void *)&_mh_execute_header, a3, (uint64_t)a3, "#find-range,[%s] #auth Failed mutual auth", (uint8_t *)a2);
}

void sub_100425EBC()
{
  sub_100010524();
  sub_1000104E4((void *)&_mh_execute_header, v0, v1, "#find-range,_didReceiveUWBSessionStatusUpdate: not activated", v2, v3, v4, v5, v6);
}

void sub_100425EF0()
{
}

void sub_100425F1C()
{
  sub_100010524();
  sub_1000104E4((void *)&_mh_execute_header, v0, v1, "#find-range,Secondary scheduling duty cycle > Primary scheduling duty cycle, do not process backoff acquisition policy", v2, v3, v4, v5, v6);
}

void sub_100425F50()
{
  sub_100010524();
  sub_10016F0D8((void *)&_mh_execute_header, v0, v1, "#find-range,Secondary acquisiton scheme not enabled for initiator", v2, v3, v4, v5, v6);
}

void sub_100425F84(uint64_t a1)
{
  if (*(char *)(a1 + 23) < 0) {
    operator delete(*(void **)a1);
  }
}

void sub_100425F98(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = a1 - 24;
  do
  {
    sub_10003E96C(v3, *(void **)(v3 + 8));
    if (*(char *)(v3 - 1) < 0) {
      operator delete(*(void **)(v3 - 24));
    }
    v3 -= 48;
  }
  while (v3 + 24 != a2);
}

void sub_100425FE8()
{
}

void sub_100426014()
{
}

void sub_100426040()
{
  __assert_rtn("-[NIServerNearbyPeerSession configure]", "NIServerNearbyPeerSession.mm", 228, "_peerTokenDict != nil");
}

void sub_10042606C()
{
  sub_100010524();
  sub_100056C38((void *)&_mh_execute_header, v0, v1, "#ses-nrby-peer,Nearby Peer does not support BG mode with known devices", v2, v3, v4, v5, v6);
}

void sub_1004260A0()
{
  sub_10001AC8C();
  sub_10000B3E0((void *)&_mh_execute_header, v0, v1, "#ses-nrby-peer,Discovery token failed validation %@", v2, v3, v4, v5, v6);
}

void sub_100426108()
{
  sub_100010524();
  sub_1000104E4((void *)&_mh_execute_header, v0, v1, "#ses-nrby-peer,Discovery token doesn't contain an identifier", v2, v3, v4, v5, v6);
}

void sub_10042613C()
{
  sub_100010524();
  sub_1000104E4((void *)&_mh_execute_header, v0, v1, "#ses-nrby-peer,Discovery token doesn't contain IRK", v2, v3, v4, v5, v6);
}

void sub_100426170()
{
  sub_100010524();
  sub_100056C38((void *)&_mh_execute_header, v0, v1, "#ses-nrby-peer,Identical LocalNumber and PeerNumber using legacy initiator selection logic", v2, v3, v4, v5, v6);
}

void sub_1004261A4()
{
  sub_100010524();
  sub_1000104E4((void *)&_mh_execute_header, v0, v1, "#ses-nrby-peer,skipping measurement due to a lack of mach continuous timestamp.", v2, v3, v4, v5, v6);
}

void sub_1004261D8()
{
  sub_10020E5CC(__stack_chk_guard);
  sub_100010500();
  _os_log_debug_impl((void *)&_mh_execute_header, v0, OS_LOG_TYPE_DEBUG, "#ses-nrby-peer,Solution mac_addr = %llu", v1, 0xCu);
}

void sub_10042624C()
{
  sub_10020E5CC(__stack_chk_guard);
  sub_100010500();
  sub_10000B3E0((void *)&_mh_execute_header, v0, v1, "#ses-nrby-peer,Address 0x%{private}llx has no mapping to a discovery token.", v2, v3, v4, v5, v6);
}

void sub_1004262B4()
{
  sub_100010524();
  sub_1000104E4((void *)&_mh_execute_header, v0, v1, "#ses-nrby-peer,Malformed findee data detected", v2, v3, v4, v5, v6);
}

void sub_1004262E8()
{
  sub_100010524();
  sub_10016F0D8((void *)&_mh_execute_header, v0, v1, "#ses-nrby-peer,Received remote data", v2, v3, v4, v5, v6);
}

void sub_10042631C(_DWORD *a1, _DWORD *a2, os_log_t log)
{
  int v3 = *a1 - *a2;
  v4[0] = 67109376;
  v4[1] = v3;
  __int16 v5 = 1024;
  int v6 = 16;
  _os_log_error_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_ERROR, "#ses-nrby-peer,Received unexpected remote data: too small (%d < %d)", (uint8_t *)v4, 0xEu);
}

void sub_1004263B4()
{
  sub_100010524();
  sub_1000104E4((void *)&_mh_execute_header, v0, v1, "#ses-nrby-peer,Received unexpected remote data: incorrect type", v2, v3, v4, v5, v6);
}

void sub_1004263E8()
{
  sub_100010524();
  sub_10016F0D8((void *)&_mh_execute_header, v0, v1, "#ses-nrby-peer,Sending hangup signal", v2, v3, v4, v5, v6);
}

void sub_10042641C()
{
  sub_10001AC8C();
  sub_10000B3E0((void *)&_mh_execute_header, v0, v1, "#ses-nrby-peer,#warning, failed to pause session inside _peerInactivityPeriodExceeded: %@", v2, v3, v4, v5, v6);
}

void sub_100426484()
{
  sub_100010524();
  sub_100056C38((void *)&_mh_execute_header, v0, v1, "#ses-nrby-peer,kInternalTrackingStopReason_LocalForceRemoved is not supported for this session type.", v2, v3, v4, v5, v6);
}

void sub_1004264B8()
{
  sub_10001AC8C();
  sub_10000B3E0((void *)&_mh_execute_header, v0, v1, "#ses-nrby-peer,#warning, _peerInactivityPeriodExceeded but peer token is not cached %@", v2, v3, v4, v5, v6);
}

void sub_100426520()
{
  sub_100010524();
  sub_1000104E4((void *)&_mh_execute_header, v0, v1, "#ses-nrby-peer,FindingDataFrameFormat::encode failed", v2, v3, v4, v5, v6);
}

void sub_100426554()
{
  sub_100010524();
  sub_1000104E4((void *)&_mh_execute_header, v0, v1, "#ses-nrby-peer,Invalid token. Token provided does not match peer discovery token", v2, v3, v4, v5, v6);
}

void sub_100426588()
{
  sub_100010524();
  sub_1000104E4((void *)&_mh_execute_header, v0, v1, "#ses-nrby-peer,altitudeData is nil", v2, v3, v4, v5, v6);
}

void sub_1004265BC()
{
  sub_10001AC8C();
  sub_10000B3E0((void *)&_mh_execute_header, v0, v1, "#ses-nrby-peer,error receiving altimeter data: %{public}@", v2, v3, v4, v5, v6);
}

void sub_100426624()
{
  sub_100010524();
  sub_10016F0D8((void *)&_mh_execute_header, v0, v1, "#ses-nrby-peer,Pedometer data update", v2, v3, v4, v5, v6);
}

void sub_100426658()
{
  sub_100010524();
  sub_1000104E4((void *)&_mh_execute_header, v0, v1, "#ses-nrby-peer,pedometerData is nil", v2, v3, v4, v5, v6);
}

void sub_10042668C()
{
  sub_100010524();
  sub_10016F0D8((void *)&_mh_execute_header, v0, v1, "#ses-nrby-peer,sending pedometer data to NUE", v2, v3, v4, v5, v6);
}

void sub_1004266C0()
{
  sub_10020E5CC(__stack_chk_guard);
  sub_100010500();
  sub_10000B3E0((void *)&_mh_execute_header, v0, v1, "#ses-nrby-peer,error receiving pedometer data: %{public}@", v2, v3, v4, v5, v6);
}

void sub_100426728()
{
  sub_100010524();
  sub_10016F0D8((void *)&_mh_execute_header, v0, v1, "#ses-nrby-peer,Pedometer event update", v2, v3, v4, v5, v6);
}

void sub_10042675C()
{
  sub_10020E5CC(__stack_chk_guard);
  sub_100010500();
  sub_10000B3E0((void *)&_mh_execute_header, v0, v1, "#ses-nrby-peer,error receiving pedometer event: %{public}@", v2, v3, v4, v5, v6);
}

void sub_1004267C4()
{
  sub_100010524();
  sub_1000104E4((void *)&_mh_execute_header, v0, v1, "#ses-nrby-peer,motion activity is nil", v2, v3, v4, v5, v6);
}

void sub_1004267F8()
{
  sub_100010524();
  sub_10016F0D8((void *)&_mh_execute_header, v0, v1, "#ses-nrby-peer,sending motion activity to NUE", v2, v3, v4, v5, v6);
}

void sub_10042682C()
{
  sub_100010524();
  sub_10016F0D8((void *)&_mh_execute_header, v0, v1, "#ses-nrby-peer,Motion activity update", v2, v3, v4, v5, v6);
}

void sub_100426860()
{
  sub_100010524();
  sub_1000104E4((void *)&_mh_execute_header, v0, v1, "#ses-nrby-peer,device motion is nil", v2, v3, v4, v5, v6);
}

void sub_100426894()
{
  sub_100010524();
  sub_1000104E4((void *)&_mh_execute_header, v0, v1, "#ses-nrby-peer,Could not convert pdr state time to mach continuous", v2, v3, v4, v5, v6);
}

void sub_1004268C8()
{
  sub_10001AC8C();
  _os_log_debug_impl((void *)&_mh_execute_header, v0, OS_LOG_TYPE_DEBUG, "#ses-nrby-peer,pdr state received: %@", v1, 0xCu);
}

void sub_10042693C()
{
  sub_10001AC8C();
  sub_10000B3E0((void *)&_mh_execute_header, v0, v1, "#ses-nrby-peer,error receiving PDRState: %{public}@", v2, v3, v4, v5, v6);
}

void sub_1004269A4()
{
  sub_100010524();
  sub_10016F0D8((void *)&_mh_execute_header, v0, v1, "#ses-nrby-peer,PDR update", v2, v3, v4, v5, v6);
}

void sub_1004269D8()
{
  sub_100010524();
  sub_1000104E4((void *)&_mh_execute_header, v0, v1, "#ses-nrby-peer,Could not convert device motion time to mach continuous", v2, v3, v4, v5, v6);
}

void sub_100426A0C()
{
  sub_10001AC8C();
  sub_10000B3E0((void *)&_mh_execute_header, v0, v1, "#ses-nrby-peer,error receiving DeviceMotion: %{public}@", v2, v3, v4, v5, v6);
}

void sub_100426A74()
{
  sub_100010524();
  sub_1000104E4((void *)&_mh_execute_header, v0, v1, "#ses-nrby-peer,failed creating CMPDRManager", v2, v3, v4, v5, v6);
}

void sub_100426AA8()
{
  sub_100010524();
  sub_100056C38((void *)&_mh_execute_header, v0, v1, "#ses-nrby-peer,Failed to create motion activity manager", v2, v3, v4, v5, v6);
}

void sub_100426ADC()
{
  sub_100010524();
  sub_100056C38((void *)&_mh_execute_header, v0, v1, "#ses-nrby-peer,Failed to create pedometer manager", v2, v3, v4, v5, v6);
}

void sub_100426B10()
{
  sub_100010524();
  sub_100056C38((void *)&_mh_execute_header, v0, v1, "#ses-nrby-peer,Failed to create altimeter manager", v2, v3, v4, v5, v6);
}

void sub_100426B44()
{
  sub_100010524();
  sub_100056C38((void *)&_mh_execute_header, v0, v1, "#ses-nrby-peer,Failed to create motion manager", v2, v3, v4, v5, v6);
}

void sub_100426B78()
{
  sub_100010524();
  sub_10016F0D8((void *)&_mh_execute_header, v0, v1, "#ses-nrby-peer,didUpdateFindeeData", v2, v3, v4, v5, v6);
}

void sub_100426BAC(os_log_t log)
{
  *(_WORD *)uint64_t v1 = 0;
  _os_log_error_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_ERROR, "#alisha-cert,Error serializing to JSON", v1, 2u);
}

void sub_100426BF0(int a1, void *a2)
{
  uint64_t v3 = @"Unknown";
  if (a1 == 1) {
    uint64_t v3 = @"AlishaURSKRetrievalFailed";
  }
  if (!a1) {
    uint64_t v3 = @"AlishaGetKeyTimedOut";
  }
  uint64_t v4 = v3;
  int v6 = 138412290;
  int v7 = v4;
  uint64_t v5 = a2;
  _os_log_error_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_ERROR, "#ttr,Another alert is being presented. Do not present alert for event %@", (uint8_t *)&v6, 0xCu);
}

void sub_100426CBC(os_log_t log)
{
  *(_WORD *)uint64_t v1 = 0;
  _os_log_error_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_ERROR, "failed to create nw monitor path", v1, 2u);
}

void sub_100426D00()
{
  sub_100010524();
  sub_1000104E4((void *)&_mh_execute_header, v0, v1, "#ses-carkey,#lab-test Test mode wasn't disabled on invalidation", v2, v3, v4, v5, v6);
}

void sub_100426D34()
{
}

void sub_100426D60(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_100426DD8(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_100426E50(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_100426EC8(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_100426F40()
{
  sub_10001AC8C();
  sub_10000B3E0((void *)&_mh_execute_header, v0, v1, "#ses-carkey,%@", v2, v3, v4, v5, v6);
}

void sub_100426FA8(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_100427020(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_100427098(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_100427110(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_100427188()
{
  sub_100010524();
  sub_1000104E4((void *)&_mh_execute_header, v0, v1, "#ses-carkey,_processCarKeyEvent: event is nil", v2, v3, v4, v5, v6);
}

void sub_1004271BC()
{
  sub_100010524();
  sub_1000104E4((void *)&_mh_execute_header, v0, v1, "#ses-carkey,_processCarKeyEvent: event type key not found or invalid", v2, v3, v4, v5, v6);
}

void sub_1004271F0(int a1, void *a2, uint8_t *buf, os_log_t log)
{
  *(_DWORD *)buf = 67109378;
  *((_DWORD *)buf + 1) = a1;
  *((_WORD *)buf + 4) = 2112;
  *(void *)(buf + 10) = a2;
  _os_log_error_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_ERROR, "#ses-carkey,_processCarKeyEvent: unknown event type %d for vehicle identifier: %@", buf, 0x12u);
}

void sub_100427258()
{
  sub_100010524();
  sub_1000104E4((void *)&_mh_execute_header, v0, v1, "#ses-carkey,_processCarKeyEvent: invalid ranging intent reason", v2, v3, v4, v5, v6);
}

void sub_10042728C(void *a1, uint8_t *buf, os_log_t log)
{
  *(_DWORD *)buf = 138412290;
  *(void *)(buf + 4) = a1;
  _os_log_fault_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_FAULT, "#ses-carkey,_processCarKeyEvent: vehicle sent ranging terminated sub-event. Vehicle identifier: %@. No Alisha manager, nothing to do here.", buf, 0xCu);
}

void sub_1004272E4(void *a1, uint8_t *buf, os_log_t log)
{
  *(_DWORD *)buf = 138412290;
  *(void *)(buf + 4) = a1;
  _os_log_fault_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_FAULT, "#ses-carkey,_processCarKeyEvent: vehicle sent ranging suspension sub-event. Vehicle identifier: %@. No Alisha manager, nothing to do here.", buf, 0xCu);
}

void sub_10042733C()
{
  sub_100175C1C();
  if (v6 != v7) {
    uint64_t v8 = v5;
  }
  else {
    uint64_t v8 = v1;
  }
  *(_DWORD *)uint64_t v2 = 136315138;
  *(void *)(v2 + 4) = v8;
  _os_log_error_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_ERROR, "#ses-carkey,Failed to allocate Alisha session. Error: %s", v4, 0xCu);
  if (*(char *)(v0 + 23) < 0) {
    operator delete(*(void **)v0);
  }
}

void sub_1004273A0()
{
  sub_100175C1C();
  if (v6 != v7) {
    uint64_t v8 = v5;
  }
  else {
    uint64_t v8 = v1;
  }
  *(_DWORD *)uint64_t v2 = 136315138;
  *(void *)(v2 + 4) = v8;
  _os_log_error_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_ERROR, "#ses-carkey,Alisha session invalidated unexpectedly. Reason: %s", v4, 0xCu);
  if (*(char *)(v0 + 23) < 0) {
    operator delete(*(void **)v0);
  }
}

void sub_100427404()
{
  __assert_rtn("-[NIServerCarKeySession _configureForOwnerDevice]", "NIServerCarKeySession.mm", 880, "_passthroughParams.anchorSimulation == false");
}

void sub_100427430()
{
  __assert_rtn("-[NIServerCarKeySession _configureForOwnerDevice]", "NIServerCarKeySession.mm", 879, "_passthroughParams.isPassthroughSession == false");
}

void sub_10042745C(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_1004274D4(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_10042754C(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_1004275C4(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_10042763C(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_1004276B4(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_10042772C()
{
  sub_10001AC8C();
  sub_10000B3E0((void *)&_mh_execute_header, v0, v1, "#ses-carkey,#lab-test %@", v2, v3, v4, v5, v6);
}

void sub_100427794(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_10042780C(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_100427884(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_1004278FC(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_100427974()
{
}

void sub_1004279A0()
{
  sub_1002849D0();
  sub_10001ACCC((void *)&_mh_execute_header, v0, v1, "#ses-carkey,Result raw: %u, Error string: %@");
}

void sub_100427A08()
{
}

void sub_100427A34()
{
}

void sub_100427A60()
{
}

void sub_100427A8C()
{
}

void sub_100427AB8()
{
}

void sub_100427AE4(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_100427B5C()
{
  sub_1002849D0();
  sub_10001ACCC((void *)&_mh_execute_header, v0, v1, "#ses-carkey,Result raw: %u, %@");
}

void sub_100427BC4()
{
}

void sub_100427BF0()
{
}

void sub_100427C1C()
{
}

void sub_100427C48()
{
}

void sub_100427C74()
{
  __assert_rtn("AlishaConfigProvider", "NIServerCarKeySession.mm", 143, "minRanMultiplier <= std::numeric_limits<decltype(_minRanMultiplier)>::max()");
}

void sub_100427CA0()
{
}

void sub_100427CCC()
{
  sub_100010524();
  _os_log_fault_impl((void *)&_mh_execute_header, v0, OS_LOG_TYPE_FAULT, "#ses-carkey,Existing service request does not have tx_preamble. Cannot add it to running count.", v1, 2u);
}

void sub_100427D0C()
{
  sub_100010524();
  _os_log_fault_impl((void *)&_mh_execute_header, v0, OS_LOG_TYPE_FAULT, "#ses-carkey,Not supported tx_preamble in service request", v1, 2u);
}

void sub_100427D4C()
{
  sub_100010524();
  sub_1000104E4((void *)&_mh_execute_header, v0, v1, "#ses-carkey,Failed to create alisha session.", v2, v3, v4, v5, v6);
}

void sub_100427D80(uint64_t a1)
{
}

void sub_100427DAC()
{
  sub_10020E5CC(__stack_chk_guard);
  sub_100010500();
  sub_10000B3E0((void *)&_mh_execute_header, v0, v1, "#configurator,Add client %@ but client already registered", v2, v3, v4, v5, v6);
}

void sub_100427E14()
{
  sub_10020E5CC(__stack_chk_guard);
  sub_100010500();
  sub_10000B3E0((void *)&_mh_execute_header, v0, v1, "#configurator,Remove client %@ but client not found", v2, v3, v4, v5, v6);
}

void sub_100427E7C()
{
  sub_10020E5CC(__stack_chk_guard);
  sub_100010500();
  sub_10000B3E0((void *)&_mh_execute_header, v0, v1, "#configurator,Client %@ requested prewarm but client not found", v2, v3, v4, v5, v6);
}

void sub_100427EE4()
{
  sub_10020E5CC(__stack_chk_guard);
  sub_100010500();
  sub_10000B3E0((void *)&_mh_execute_header, v0, v1, "#configurator,Client %@ notified resource usage but client not found", v2, v3, v4, v5, v6);
}

void sub_100427F4C(unsigned __int8 a1, void *a2, uint8_t *buf, os_log_t log)
{
  *(_DWORD *)buf = 67109378;
  *((_DWORD *)buf + 1) = a1;
  *((_WORD *)buf + 4) = 2112;
  *(void *)(buf + 10) = a2;
  _os_log_fault_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_FAULT, "#configurator,Client notified resource usage limit exceeded (%d) for unsupported configuration type %@", buf, 0x12u);
}

void sub_100427FB8()
{
  sub_10020E5CC(__stack_chk_guard);
  sub_100010500();
  sub_10000B3E0((void *)&_mh_execute_header, v0, v1, "#configurator,Client %@ notified passive access but client not found", v2, v3, v4, v5, v6);
}

void sub_100428020(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_100428058(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_100428090(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_1004280C8()
{
  sub_100010524();
  sub_10016F0D8((void *)&_mh_execute_header, v0, v1, "#convertAlgorithmFindeeDataToRoseFindeeData BoundedDisplacementCategory::STATIC", v2, v3, v4, v5, v6);
}

void sub_1004280FC()
{
  sub_100010524();
  sub_10016F0D8((void *)&_mh_execute_header, v0, v1, "#convertAlgorithmFindeeDataToRoseFindeeData BoundedDisplacementCategory::SLOWLY_MOVING", v2, v3, v4, v5, v6);
}

void sub_100428130()
{
  sub_100010524();
  sub_10016F0D8((void *)&_mh_execute_header, v0, v1, "#convertAlgorithmFindeeDataToRoseFindeeData BoundedDisplacementCategory::WALKING_OR_UNKNOWN", v2, v3, v4, v5, v6);
}

void sub_100428164(os_log_t log, double a2)
{
  int v2 = 134217984;
  double v3 = a2;
  _os_log_debug_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_DEBUG, "#convertAlgorithmFindeeDataToRoseFindeeData BoundedDisplacementEnterTimestamp=%lf", (uint8_t *)&v2, 0xCu);
}

void sub_1004281E0()
{
  sub_100010524();
  sub_10016F0D8((void *)&_mh_execute_header, v0, v1, "#convertAlgorithmFindeeDataToRoseFindeeData", v2, v3, v4, v5, v6);
}

void sub_100428214()
{
  sub_100010524();
  sub_10016F0D8((void *)&_mh_execute_header, v0, v1, "#convertToAlgorithmFindeeData BoundedDisplacementCategory::STATIC", v2, v3, v4, v5, v6);
}

void sub_100428248()
{
  sub_100010524();
  sub_10016F0D8((void *)&_mh_execute_header, v0, v1, "#convertToAlgorithmFindeeData BoundedDisplacementCategory::SLOWLY_MOVING", v2, v3, v4, v5, v6);
}

void sub_10042827C()
{
  sub_100010524();
  sub_10016F0D8((void *)&_mh_execute_header, v0, v1, "#convertToAlgorithmFindeeData BoundedDisplacementCategory::WALKING_OR_UNKNOWN", v2, v3, v4, v5, v6);
}

void sub_1004282B0(os_log_t log, double a2)
{
  int v2 = 134217984;
  double v3 = a2;
  _os_log_debug_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_DEBUG, "#convertToAlgorithmFindeeData BoundedDisplacementEnterTimestamp=%lf", (uint8_t *)&v2, 0xCu);
}

void sub_10042832C(uint64_t *a1, uint8_t *buf, os_log_t log)
{
  uint64_t v3 = *a1;
  *(_DWORD *)buf = 134217984;
  *(void *)(buf + 4) = v3;
  _os_log_debug_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_DEBUG, "#convertToAlgorithmFindeeData mach_absolute_receipt_timestamp=%lf", buf, 0xCu);
}

void sub_100428378()
{
  sub_100010524();
  sub_10016F0D8((void *)&_mh_execute_header, v0, v1, "#convertToAlgorithmFindeeData", v2, v3, v4, v5, v6);
}

void sub_1004283AC(void *a1, NSObject *a2, double a3)
{
  uint64_t v3 = a1[67];
  uint64_t v4 = a1[68];
  uint64_t v5 = a1[69];
  uint64_t v6 = a1[70];
  int v7 = 134284545;
  uint64_t v8 = v3;
  __int16 v9 = 2049;
  uint64_t v10 = v4;
  __int16 v11 = 2049;
  uint64_t v12 = v5;
  __int16 v13 = 2048;
  uint64_t v14 = v6;
  __int16 v15 = 2048;
  double v16 = a3;
  _os_log_debug_impl((void *)&_mh_execute_header, a2, OS_LOG_TYPE_DEBUG, "regulatory,geof,processLocation,%{private}.6f,%{private}.6f,%{private}.2f,age,%.3f,logInterval,%.2f", (uint8_t *)&v7, 0x34u);
}

void sub_10042845C(os_log_t log)
{
  *(_WORD *)uint64_t v1 = 0;
  _os_log_debug_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_DEBUG, "regulatory,geof,default,cleared geof sites", v1, 2u);
}

void sub_1004284A0(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_100428510(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_100428580(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_1004285F0(char a1, NSObject *a2)
{
  v2[0] = 67109120;
  v2[1] = a1 & 1;
  _os_log_debug_impl((void *)&_mh_execute_header, a2, OS_LOG_TYPE_DEBUG, "regulatory,geof,ls:%d", (uint8_t *)v2, 8u);
}

void sub_10042866C()
{
  sub_1001659E8(__stack_chk_guard);
  v3[0] = 67109378;
  v3[1] = v0;
  __int16 v4 = 2080;
  uint64_t v5 = v1;
  _os_log_debug_impl((void *)&_mh_execute_header, v2, OS_LOG_TYPE_DEBUG, "regulatory,geof,processIsoChange,slot:%d,iso:%s", (uint8_t *)v3, 0x12u);
}

void sub_1004286F4(unsigned __int8 a1, NSObject *a2)
{
  v2[0] = 67109120;
  v2[1] = a1;
  _os_log_debug_impl((void *)&_mh_execute_header, a2, OS_LOG_TYPE_DEBUG, "regulatory,geof,processAirplaneMode:%d", (uint8_t *)v2, 8u);
}

void sub_100428770()
{
  __assert_rtn("_updateRecommendationAndDeliverIfPossible", "NIServerBackoffResumeManager.mm", 431, "timeSinceLastRecommendationSeconds >= 0");
}

void sub_10042879C(os_log_t log)
{
  *(_WORD *)uint64_t v1 = 0;
  _os_log_error_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_ERROR, "#backoff,Got FBSDisplayLayoutMonitor callback with nil layout.", v1, 2u);
}

void sub_1004287E0(os_log_t log)
{
  *(_WORD *)uint64_t v1 = 0;
  _os_log_fault_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_FAULT, "#backoff,Unhandled branch in _getRecommendation()", v1, 2u);
}

void sub_100428824()
{
}

void sub_100428850()
{
}

void sub_10042887C()
{
}

void sub_1004288A8(char *a1, uint8_t *buf, os_log_t log)
{
  if (a1[23] >= 0) {
    __int16 v4 = a1;
  }
  else {
    __int16 v4 = *(char **)a1;
  }
  *(_DWORD *)buf = 136315138;
  *(void *)(buf + 4) = v4;
  _os_log_error_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_ERROR, "pblogger, protobuf Trying to log before opening log file. %s", buf, 0xCu);
  if (a1[23] < 0) {
    operator delete(*(void **)a1);
  }
}

void sub_10042891C()
{
}

void sub_100428948()
{
  sub_100010524();
  sub_1000104E4((void *)&_mh_execute_header, v0, v1, "pblogger, PRProtobufLogger failed to populate logEntry timestamps", v2, v3, v4, v5, v6);
}

void sub_10042897C()
{
  sub_100010524();
  sub_10016F0D8((void *)&_mh_execute_header, v0, v1, "pblogger, Logger::logNotifyServiceCancelEvent end", v2, v3, v4, v5, v6);
}

void sub_1004289B0()
{
  sub_100010524();
  sub_10016F0D8((void *)&_mh_execute_header, v0, v1, "pblogger, Logger::logNotifyServiceCancelEvent start", v2, v3, v4, v5, v6);
}

void sub_1004289E4()
{
  sub_100010524();
  sub_10016F0D8((void *)&_mh_execute_header, v0, v1, "pblogger, Logger::logNotifyServiceStopEvent end", v2, v3, v4, v5, v6);
}

void sub_100428A18()
{
  sub_100010524();
  sub_10016F0D8((void *)&_mh_execute_header, v0, v1, "pblogger, Logger::logNotifyServiceStopEvent start", v2, v3, v4, v5, v6);
}

void sub_100428A4C()
{
  sub_100010524();
  sub_10016F0D8((void *)&_mh_execute_header, v0, v1, "pblogger, Logger::logNotifyServiceStartEvent end", v2, v3, v4, v5, v6);
}

void sub_100428A80()
{
  sub_100010524();
  sub_10016F0D8((void *)&_mh_execute_header, v0, v1, "pblogger, Logger::logNotifyServiceStartEvent start", v2, v3, v4, v5, v6);
}

void sub_100428AB4()
{
  sub_100029E4C();
  sub_10001AC98((void *)&_mh_execute_header, v0, v1, "pblogger, Error code not supported by protobuf %d", v2, v3, v4, v5, v6);
}

void sub_100428B1C()
{
  sub_100010524();
  sub_10016F0D8((void *)&_mh_execute_header, v0, v1, "pblogger, Logger::logHelloCommand end", v2, v3, v4, v5, v6);
}

void sub_100428B50()
{
  sub_100010524();
  sub_10016F0D8((void *)&_mh_execute_header, v0, v1, "pblogger, Logger::logHelloCommand start", v2, v3, v4, v5, v6);
}

void sub_100428B84()
{
  sub_100029E4C();
  sub_10001AC98((void *)&_mh_execute_header, v0, v1, "pblogger, Session type not supported by protobuf %d", v2, v3, v4, v5, v6);
}

void sub_100428BEC()
{
  sub_100029E4C();
  sub_10001AC98((void *)&_mh_execute_header, v0, v1, "pblogger, Session role not supported by protobuf %d", v2, v3, v4, v5, v6);
}

void sub_100428C54()
{
  sub_100010524();
  sub_10016F0D8((void *)&_mh_execute_header, v0, v1, "pblogger, Logger::logHelloResponse end", v2, v3, v4, v5, v6);
}

void sub_100428C88()
{
  sub_100010524();
  sub_10016F0D8((void *)&_mh_execute_header, v0, v1, "pblogger, Logger::logHelloResponse start", v2, v3, v4, v5, v6);
}

void sub_100428CBC()
{
  sub_100010524();
  sub_10016F0D8((void *)&_mh_execute_header, v0, v1, "pblogger, Logger log Test NMI Range Enable Command end", v2, v3, v4, v5, v6);
}

void sub_100428CF0()
{
  sub_100010524();
  sub_10016F0D8((void *)&_mh_execute_header, v0, v1, "pblogger, Logger log Test NMI Range Enable Command start", v2, v3, v4, v5, v6);
}

void sub_100428D24()
{
  sub_100010524();
  sub_10016F0D8((void *)&_mh_execute_header, v0, v1, "pblogger, Logger::logRangeResultEvent end", v2, v3, v4, v5, v6);
}

void sub_100428D58()
{
  sub_100029E4C();
  sub_10001AC98((void *)&_mh_execute_header, v0, v1, "pblogger, Band select not supported by protobuf %d", v2, v3, v4, v5, v6);
}

void sub_100428DC0()
{
  sub_100010524();
  sub_10016F0D8((void *)&_mh_execute_header, v0, v1, "pblogger, Logger::logRangeResult start", v2, v3, v4, v5, v6);
}

void sub_100428DF4()
{
  sub_100010524();
  sub_10016F0D8((void *)&_mh_execute_header, v0, v1, "pblogger, Logger::logRangeCIRData end", v2, v3, v4, v5, v6);
}

void sub_100428E28()
{
  sub_100010524();
  sub_1000104E4((void *)&_mh_execute_header, v0, v1, "pblogger, logRangeCIREvent failure 2", v2, v3, v4, v5, v6);
}

void sub_100428E5C(char *a1, uint8_t *buf, os_log_t log, void *a4)
{
  if (a1[23] >= 0) {
    uint8_t v6 = a1;
  }
  else {
    uint8_t v6 = *(char **)a1;
  }
  *(_DWORD *)buf = 136315138;
  *(void *)(buf + 4) = v6;
  _os_log_error_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_ERROR, "pblogger, getPbCIRPacketType: unrecognized CIR packet type: %s", buf, 0xCu);
  if (a1[23] < 0) {
    operator delete(*(void **)a1);
  }
  *a4 = qword_1008ABDE0;
}

void sub_100428EE4(uint8_t *buf, unsigned char *a2, os_log_t log)
{
  *buf = 0;
  *a2 = 0;
  _os_log_error_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_ERROR, "pblogger, logRangeCIREvent failure 3", buf, 2u);
}

void sub_100428F24()
{
  sub_100010524();
  sub_1000104E4((void *)&_mh_execute_header, v0, v1, "pblogger, logRangeCIREvent failure 1", v2, v3, v4, v5, v6);
}

void sub_100428F58()
{
  sub_100010524();
  sub_10016F0D8((void *)&_mh_execute_header, v0, v1, "pblogger, Logger::logRangeCIRData start", v2, v3, v4, v5, v6);
}

void sub_100428F8C()
{
  sub_100010524();
  sub_10016F0D8((void *)&_mh_execute_header, v0, v1, "pblogger, Logger::logAOACIRDataEvent end", v2, v3, v4, v5, v6);
}

void sub_100428FC0()
{
  sub_100010524();
  sub_10016F0D8((void *)&_mh_execute_header, v0, v1, "pblogger, Logger::logAOACIRDataEvent start", v2, v3, v4, v5, v6);
}

void sub_100428FF4()
{
  sub_100010524();
  sub_10016F0D8((void *)&_mh_execute_header, v0, v1, "pblogger, Logger::logTOACIRDataEvent end", v2, v3, v4, v5, v6);
}

void sub_100429028()
{
  sub_100010524();
  sub_10016F0D8((void *)&_mh_execute_header, v0, v1, "pblogger, Logger::logTOACIRDataEvent start", v2, v3, v4, v5, v6);
}

void sub_10042905C()
{
  sub_100010524();
  sub_10016F0D8((void *)&_mh_execute_header, v0, v1, "pblogger, Logger::logTOACIRDataV2Event end", v2, v3, v4, v5, v6);
}

void sub_100429090()
{
  sub_100010524();
  sub_10016F0D8((void *)&_mh_execute_header, v0, v1, "pblogger, Logger::logTOACIRDataV2Event start", v2, v3, v4, v5, v6);
}

void sub_1004290C4()
{
  sub_100010524();
  sub_10016F0D8((void *)&_mh_execute_header, v0, v1, "pblogger, Logger::logRangeResultDebugEvent end", v2, v3, v4, v5, v6);
}

void sub_1004290F8()
{
  sub_100010524();
  sub_1000104E4((void *)&_mh_execute_header, v0, v1, "pblogger, Failed to populate range debug event session type.", v2, v3, v4, v5, v6);
}

void sub_10042912C()
{
  sub_100010524();
  sub_10016F0D8((void *)&_mh_execute_header, v0, v1, "pblogger, Logger::logRangeResultDebugEvent start", v2, v3, v4, v5, v6);
}

void sub_100429160()
{
}

void sub_10042918C()
{
  sub_100010524();
  sub_10016F0D8((void *)&_mh_execute_header, v0, v1, "pblogger, Logger::logLocalP2PTimestampEvent end", v2, v3, v4, v5, v6);
}

void sub_1004291C0()
{
  sub_100010524();
  sub_10016F0D8((void *)&_mh_execute_header, v0, v1, "pblogger, Logger::logLocalP2PTimestampEvent start", v2, v3, v4, v5, v6);
}

void sub_1004291F4()
{
  __assert_rtn("logLocalP2PTimestampEvent", "PRProtobufLogger.cpp", 1197, "localP2PTimestampEvent.eventSource() == RangeTimestampEvent::Source::Local");
}

void sub_100429220()
{
  sub_100010524();
  sub_10016F0D8((void *)&_mh_execute_header, v0, v1, "pblogger, Logger::logRemoteP2PTimestampEvent end", v2, v3, v4, v5, v6);
}

void sub_100429254()
{
  sub_100010524();
  sub_10016F0D8((void *)&_mh_execute_header, v0, v1, "pblogger, Logger::logRemoteP2PTimestampEvent start", v2, v3, v4, v5, v6);
}

void sub_100429288()
{
  __assert_rtn("logRemoteP2PTimestampEvent", "PRProtobufLogger.cpp", 1275, "remoteP2PTimestampEvent.eventSource() == RangeTimestampEvent::Source::Remote");
}

void sub_1004292B4()
{
  sub_100010524();
  sub_10016F0D8((void *)&_mh_execute_header, v0, v1, "pblogger, Logger::logResponderSuperframeCompleteEvent end", v2, v3, v4, v5, v6);
}

void sub_1004292E8()
{
  sub_100010524();
  sub_10016F0D8((void *)&_mh_execute_header, v0, v1, "pblogger, Logger::logResponderSuperframeCompleteEvent start", v2, v3, v4, v5, v6);
}

void sub_10042931C()
{
}

void sub_100429348(uint64_t *a1, NSObject *a2)
{
  uint64_t v3 = *a1;
  uint64_t v2 = a1[1];
  uint64_t v4 = a1[5];
  uint64_t v5 = a1[6];
  uint64_t v6 = a1[7];
  int v7 = 134219008;
  uint64_t v8 = v2;
  __int16 v9 = 2048;
  uint64_t v10 = v3;
  __int16 v11 = 2048;
  uint64_t v12 = v4;
  __int16 v13 = 2048;
  uint64_t v14 = v5;
  __int16 v15 = 2048;
  uint64_t v16 = v6;
  _os_log_debug_impl((void *)&_mh_execute_header, a2, OS_LOG_TYPE_DEBUG, "pblogger, RoseSensorFusion: logSensorFusionInputAndOutputWithMotion. Solution = ID: 0x%llx Timestamp: %f Range: %f El: %f Az: %f", (uint8_t *)&v7, 0x34u);
}

void sub_1004293F0()
{
  sub_100010524();
  sub_10016F0D8((void *)&_mh_execute_header, v0, v1, "pblogger, Logger::logDeviceType", v2, v3, v4, v5, v6);
}

void sub_100429424()
{
  sub_100010524();
  sub_10016F0D8((void *)&_mh_execute_header, v0, v1, "pblogger, Logger::logMeasurementEngineDefaultsWrites", v2, v3, v4, v5, v6);
}

void sub_100429458()
{
  sub_100010524();
  sub_1000104E4((void *)&_mh_execute_header, v0, v1, "pblogger, PRProtobufLogger logCalForwardLUTs fails: calBlob misses one or more calibration files!", v2, v3, v4, v5, v6);
}

void sub_10042948C(uint64_t a1, NSObject *a2)
{
  int v2 = 134218240;
  uint64_t v3 = a1;
  __int16 v4 = 1024;
  int v5 = 11;
  _os_log_error_impl((void *)&_mh_execute_header, a2, OS_LOG_TYPE_ERROR, "pblogger, outputProbabilities size (%lu) does not match expected size (%d). Some fields in RangeBiasEstimatorUpdate will not be logged", (uint8_t *)&v2, 0x12u);
}

void sub_100429514()
{
  sub_100010524();
  _os_log_fault_impl((void *)&_mh_execute_header, v0, OS_LOG_TYPE_FAULT, "pblogger, Logger::logLocationInputData, shouldn't get kCLLocationType_Max as a case", v1, 2u);
}

void sub_100429554()
{
  __assert_rtn("operator()", "cnmatrixbase.h", 945, "data_ != __null");
}

void sub_100429580()
{
  __assert_rtn("operator()", "cnmatrixbase.h", 946, "idx >= 0");
}

void sub_1004295AC()
{
}

void sub_1004295D8()
{
  __assert_rtn("operator()", "cnmatrixbase.h", 815, "data_ != __null");
}

void sub_100429604()
{
  __assert_rtn("operator()", "cnmatrixbase.h", 816, "idx >= 0");
}

void sub_100429630()
{
}

void sub_10042965C()
{
}

void sub_10042967C()
{
}

void sub_10042969C()
{
  sub_100010524();
  sub_1000104E4((void *)&_mh_execute_header, v0, v1, "#peer-nba,Resource manager did not provide discovery token", v2, v3, v4, v5, v6);
}

void sub_1004296D0()
{
  sub_100010524();
  sub_100056C38((void *)&_mh_execute_header, v0, v1, "#peer-nba,Cannot configure session, service request is nil", v2, v3, v4, v5, v6);
}

void sub_100429704()
{
  sub_100010524();
  sub_100056C38((void *)&_mh_execute_header, v0, v1, "#peer-nba,Session cannot be configured", v2, v3, v4, v5, v6);
}

void sub_100429738()
{
  sub_100010524();
  sub_1000104E4((void *)&_mh_execute_header, v0, v1, "#peer-nba,Attempted NBAMMS session without request from configuration", v2, v3, v4, v5, v6);
}

void sub_10042976C()
{
  sub_100010524();
  sub_1000104E4((void *)&_mh_execute_header, v0, v1, "#peer-nba,NBAMMS session already exists. exiting.", v2, v3, v4, v5, v6);
}

void sub_1004297A0()
{
  sub_100010524();
  sub_100056C38((void *)&_mh_execute_header, v0, v1, "#peer-nba,Run called without a successful configuration.", v2, v3, v4, v5, v6);
}

void sub_1004297D4()
{
  sub_100010524();
  sub_10016F0D8((void *)&_mh_execute_header, v0, v1, "#peer-nba,sending data from nbamms session to rose base session", v2, v3, v4, v5, v6);
}

void sub_100429808(int *a1, NSObject *a2)
{
  int v2 = *a1;
  v3[0] = 67109120;
  v3[1] = v2;
  _os_log_fault_impl((void *)&_mh_execute_header, a2, OS_LOG_TYPE_FAULT, "#peer-nba,Unexpected RoseSolutionType: %d", (uint8_t *)v3, 8u);
}

void sub_100429884()
{
  sub_100010524();
  sub_10016F0D8((void *)&_mh_execute_header, v0, v1, "#peer-nba,nbamms session received remote data", v2, v3, v4, v5, v6);
}

void sub_1004298B8()
{
  sub_100010524();
  sub_100056C38((void *)&_mh_execute_header, v0, v1, "#peer-nba,Session does not exists, cannot trigger ranging start", v2, v3, v4, v5, v6);
}

void sub_1004298EC()
{
  sub_100175C1C();
  if (v6 != v7) {
    uint64_t v8 = v5;
  }
  else {
    uint64_t v8 = v1;
  }
  *(_DWORD *)uint64_t v2 = 136315138;
  *(void *)(v2 + 4) = v8;
  sub_1001BE59C((void *)&_mh_execute_header, v2, v3, "#peer-nba,Failed to start ranging. Return code: %s", v4);
  if (*(char *)(v0 + 23) < 0) {
    operator delete(*(void **)v0);
  }
}

void sub_100429944()
{
  sub_100010524();
  sub_1000104E4((void *)&_mh_execute_header, v0, v1, "#peer-nba,Secondary scheduling duty cycle > Primary scheduling duty cycle, do not process backoff acquisition policy", v2, v3, v4, v5, v6);
}

void sub_100429978()
{
  sub_100175C1C();
  if (v6 != v7) {
    uint64_t v8 = v5;
  }
  else {
    uint64_t v8 = v1;
  }
  *(_DWORD *)uint64_t v2 = 136315138;
  *(void *)(v2 + 4) = v8;
  sub_1001BE59C((void *)&_mh_execute_header, v2, v3, "#peer-nba,Rose session invalidated unexpectedly. Reason: %s", v4);
  if (*(char *)(v0 + 23) < 0) {
    operator delete(*(void **)v0);
  }
}

void sub_1004299D0()
{
  sub_100175C1C();
  if (v6 != v7) {
    uint64_t v8 = v5;
  }
  else {
    uint64_t v8 = v1;
  }
  *(_DWORD *)uint64_t v2 = 136315138;
  *(void *)(v2 + 4) = v8;
  sub_1001BE59C((void *)&_mh_execute_header, v2, v3, "#peer-nba,Failed to allocate a UWB session. Error: %s", v4);
  if (*(char *)(v0 + 23) < 0) {
    operator delete(*(void **)v0);
  }
}

void sub_100429A28()
{
  sub_100010524();
  sub_1000104E4((void *)&_mh_execute_header, v0, v1, "#peer-nba,Discovery token doesn't contain valid IRK", v2, v3, v4, v5, v6);
}

void sub_100429A5C()
{
  sub_100010524();
  sub_1000104E4((void *)&_mh_execute_header, v0, v1, "#peer-nba,Could not create a valid combination IRK with local and peer IRKs", v2, v3, v4, v5, v6);
}

void sub_100429A90()
{
  sub_100010524();
  sub_1000104E4((void *)&_mh_execute_header, v0, v1, "#peer-nba,Invalid inputs provided for creating combination IRK of local and peer IRKs", v2, v3, v4, v5, v6);
}

void sub_100429AC4()
{
  __assert_rtn("-[NIServerNearbyPeerNbammsSession _getRangingTriggerType]", "NIServerNearbyPeerNbammsSession.mm", 805, "_useTestNbammsMode == false");
}

void sub_100429AF0()
{
  __assert_rtn("-[NIServerNearbyPeerNbammsSession _getRangingAcquisitionType]", "NIServerNearbyPeerNbammsSession.mm", 841, "_useTestNbammsMode == false");
}

void sub_100429B1C()
{
  sub_100010524();
  sub_10016F0D8((void *)&_mh_execute_header, v0, v1, "#peer-nba,Secondary acquisiton scheme not enabled for initiator", v2, v3, v4, v5, v6);
}

void sub_100429B50(os_log_t log)
{
  v1[0] = 67109120;
  v1[1] = 2;
  _os_log_error_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_ERROR, "#peer-nba,NIDiscoveryTokenToDictionary errored out, using default nap channel index: %d", (uint8_t *)v1, 8u);
}

void sub_100429BD0(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_100429C48(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_100429CC0(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_100429D38(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_100429DB0(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_100429E1C()
{
  sub_100010524();
  sub_1000104E4((void *)&_mh_execute_header, v0, v1, "#accessory-service,Waiting for rdar://129298922 to support this mode [1]", v2, v3, v4, v5, v6);
}

void sub_100429E50()
{
  sub_100010524();
  sub_1000104E4((void *)&_mh_execute_header, v0, v1, "#accessory-service,Prep session objects: can't parse accessory configuration data", v2, v3, v4, v5, v6);
}

void sub_100429E84()
{
  sub_100010524();
  sub_1000104E4((void *)&_mh_execute_header, v0, v1, "#accessory-service,Prep session objects: Configuration Manager error", v2, v3, v4, v5, v6);
}

void sub_100429EB8()
{
  sub_100010524();
  _os_log_fault_impl((void *)&_mh_execute_header, v0, OS_LOG_TYPE_FAULT, "#accessory-service,Prep session objects: Unable to determine ISO country code", v1, 2u);
}

void sub_100429EF8()
{
  sub_100010524();
  sub_1000104E4((void *)&_mh_execute_header, v0, v1, "#accessory-service,Prep session objects: Unable to determine UWB channels", v2, v3, v4, v5, v6);
}

void sub_100429F2C()
{
  sub_100010524();
  sub_1000104E4((void *)&_mh_execute_header, v0, v1, "#accessory-service,Prep session objects: responder role not supported for this configuration", v2, v3, v4, v5, v6);
}

void sub_100429F60()
{
  __assert_rtn("ComputeRangingIntervalMs", "NIFiRaDefinitions.h", 628, "fractional == 0");
}

void sub_100429F8C()
{
  __assert_rtn("ComputeRangingIntervalMs", "NIFiRaDefinitions.h", 631, "integral <= std::numeric_limits<uint16_t>::max()");
}

void sub_100429FB8()
{
}

void sub_100429FE4()
{
}

void sub_10042A010()
{
  __assert_rtn("CreateAppleShareableConfigurationData", "NIFiRaDefinitions.h", 716, "isoCountryCode.length() == sizeof(AppleShareableConfigurationData::V10_Fields::regulatoryCountryCode)");
}

void sub_10042A03C()
{
  sub_100175C1C();
  if (v4 != v5) {
    uint64_t v6 = v3;
  }
  else {
    uint64_t v6 = v1;
  }
  sub_1001BE5EC(v2, v6, 4.8149e-34);
  _os_log_fault_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_FAULT, "#accessory-service,Not able to convert preamble %s to FiRa preamble index", v8, 0xCu);
  if (*(char *)(v0 + 23) < 0) {
    operator delete(*(void **)v0);
  }
}

void sub_10042A09C()
{
}

void sub_10042A0C8()
{
  sub_100010524();
  sub_1000104E4((void *)&_mh_execute_header, v0, v1, "#accessory-service,Couldn't decode UWB channel override", v2, v3, v4, v5, v6);
}

void sub_10042A0FC()
{
  sub_100010524();
  sub_1000104E4((void *)&_mh_execute_header, v0, v1, "#accessory-service,Failed to add subrate config 0 override", v2, v3, v4, v5, v6);
}

void sub_10042A130()
{
  sub_100010524();
  sub_1000104E4((void *)&_mh_execute_header, v0, v1, "#accessory-service,Failed to add subrate config 1 override", v2, v3, v4, v5, v6);
}

void sub_10042A164()
{
  sub_100010524();
  sub_1000104E4((void *)&_mh_execute_header, v0, v1, "#accessory-service,Waiting for rdar://129298922 to support this mode [2]", v2, v3, v4, v5, v6);
}

void sub_10042A198()
{
  sub_100010524();
  sub_1000104E4((void *)&_mh_execute_header, v0, v1, "#accessory-service,One or more required debug parameters were missing, unable to prep UWB session objects", v2, v3, v4, v5, v6);
}

void sub_10042A1CC(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_10042A238()
{
  sub_100010524();
  sub_1000104E4((void *)&_mh_execute_header, v0, v1, "#accessory-service,Build and run session: Failed to allocate", v2, v3, v4, v5, v6);
}

void sub_10042A26C()
{
  sub_100175C1C();
  if (v4 != v5) {
    uint64_t v6 = v3;
  }
  else {
    uint64_t v6 = v1;
  }
  sub_1001BE5EC(v2, v6, 4.8149e-34);
  sub_1001BE59C((void *)&_mh_execute_header, v7, v8, "#accessory-service,Build and run session: Failed to start. Error: %s", v9);
  if (*(char *)(v0 + 23) < 0) {
    operator delete(*(void **)v0);
  }
}

void sub_10042A2C0()
{
  sub_100175C1C();
  if (v4 != v5) {
    uint64_t v6 = v3;
  }
  else {
    uint64_t v6 = v1;
  }
  sub_1001BE5EC(v2, v6, 4.8149e-34);
  sub_1001BE59C((void *)&_mh_execute_header, v7, v8, "#accessory-service,Build and run session: Failed to initalize. Error: %s", v9);
  if (*(char *)(v0 + 23) < 0) {
    operator delete(*(void **)v0);
  }
}

void sub_10042A314()
{
  sub_100010524();
  _os_log_fault_impl((void *)&_mh_execute_header, v0, OS_LOG_TYPE_FAULT, "#accessory-service,Update session state - should be tracking but not currently tracking - unexpected!", v1, 2u);
}

void sub_10042A354()
{
  sub_100175C1C();
  if (v4 != v5) {
    uint64_t v6 = v3;
  }
  else {
    uint64_t v6 = v1;
  }
  sub_1001BE5EC(v2, v6, 4.8149e-34);
  sub_1001BE59C((void *)&_mh_execute_header, v7, v8, "#accessory-service,Failed to restart ranging. Error: %s", v9);
  if (*(char *)(v0 + 23) < 0) {
    operator delete(*(void **)v0);
  }
}

void sub_10042A3A8(uint64_t a1)
{
}

void sub_10042A3CC(uint64_t a1)
{
}

void sub_10042A3D8()
{
  sub_100010524();
  sub_10016F0D8((void *)&_mh_execute_header, v0, v1, "PRMachTimeConverter constructor:", v2, v3, v4, v5, v6);
}

void sub_10042A40C()
{
  sub_100010524();
  sub_10016F0D8((void *)&_mh_execute_header, v0, v1, "updateTimes: offsets missing or inconsistent; setting fStartTimes = newTimes and fEndTimes = invalid",
    v2,
    v3,
    v4,
    v5,
    v6);
}

void sub_10042A440()
{
  sub_100010524();
  sub_10016F0D8((void *)&_mh_execute_header, v0, v1, "updateTimes: offsetsConsistent(fEndTimes, newTimes); setting fStartTimes = fEndTimes and fEndTimes = newTimes",
    v2,
    v3,
    v4,
    v5,
    v6);
}

void sub_10042A474()
{
  sub_100010524();
  sub_10016F0D8((void *)&_mh_execute_header, v0, v1, "updateTimes: offsetsConsistent(fStartTimes, newTimes); setting fEndTimes = newTimes",
    v2,
    v3,
    v4,
    v5,
    v6);
}

void sub_10042A4A8()
{
  sub_100010524();
  sub_10016F0D8((void *)&_mh_execute_header, v0, v1, "PRMachTimeConverter::updateTimes", v2, v3, v4, v5, v6);
}

void sub_10042A4DC()
{
  sub_1002B6514();
  sub_1002B652C((void *)&_mh_execute_header, v0, v1, "getMachContinuousTimeSec: offset %.9f machCont %.9f", v2, v3, v4, v5, v6);
}

void sub_10042A548(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_10042A5B8()
{
  sub_1002B6514();
  sub_1002B652C((void *)&_mh_execute_header, v0, v1, "getMachAbsoluteTimeSec: offset %.9f machAbs %.9f", v2, v3, v4, v5, v6);
}

void sub_10042A624(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_10042A694()
{
  sub_1002B6514();
  sub_1002B652C((void *)&_mh_execute_header, v0, v1, "getCFAbsoluteTimeSec: offset %.9f cfAbs %.9f", v2, v3, v4, v5, v6);
}

void sub_10042A700()
{
  sub_100010524();
  _os_log_error_impl((void *)&_mh_execute_header, v0, OS_LOG_TYPE_ERROR, "getAllTimes() failed", v1, 2u);
}

void sub_10042A740(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_10042A7B0()
{
  sub_100010524();
  sub_10016F0D8((void *)&_mh_execute_header, v0, v1, "PRMachTimeConverter: endTimes invalid", v2, v3, v4, v5, v6);
}

void sub_10042A7E4(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_10042A854()
{
  sub_100010524();
  sub_10016F0D8((void *)&_mh_execute_header, v0, v1, "PRMachTimeConverter: startTimes invalid", v2, v3, v4, v5, v6);
}

void sub_10042A888(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_10042A8F8(void *a1, uint64_t a2, uint8_t *buf, os_log_t log)
{
  *(_DWORD *)buf = 138412546;
  *(void *)(buf + 4) = a1;
  *((_WORD *)buf + 6) = 2112;
  *(void *)(buf + 14) = a2;
  _os_log_error_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_ERROR, "#ses-base,Error while invalidating session. Session identifier: %@. Error: %@", buf, 0x16u);
}

void sub_10042A960(uint64_t a1, NSObject *a2)
{
  int v2 = 134217984;
  uint64_t v3 = a1;
  _os_log_error_impl((void *)&_mh_execute_header, a2, OS_LOG_TYPE_ERROR, "#ses-base,No device for identifier: 0x%llx", (uint8_t *)&v2, 0xCu);
}

void sub_10042A9D8(os_log_t log)
{
  *(_WORD *)uint64_t v1 = 0;
  _os_log_error_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_ERROR, "#ses-base,Failed to decode discovery token.", v1, 2u);
}

void sub_10042AA1C(os_log_t log)
{
  *(_WORD *)uint64_t v1 = 0;
  _os_log_error_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_ERROR, "#ses-base,Failed to encode discovery token.", v1, 2u);
}

void sub_10042AA60()
{
  sub_100010524();
  sub_1000104E4((void *)&_mh_execute_header, v0, v1, "Connection to wireless Coex manager fails", v2, v3, v4, v5, v6);
}

void sub_10042AA94()
{
  sub_100010524();
  sub_1000104E4((void *)&_mh_execute_header, v0, v1, "#coex,onIncomingUCMEvent-Coex Event: XPC_ERROR_CONNECTION_INTERRUPTED", v2, v3, v4, v5, v6);
}

void sub_10042AAC8(uint64_t a1, uint8_t *buf, os_log_t log)
{
  *(_DWORD *)buf = 136446210;
  *(void *)(buf + 4) = a1;
  _os_log_error_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_ERROR, "#coex,onIncomingUCMEvent-XPC connection error: %{public}s", buf, 0xCu);
}

void sub_10042AB10(uint64_t a1, NSObject *a2)
{
  int v2 = 136446210;
  uint64_t v3 = a1;
  _os_log_error_impl((void *)&_mh_execute_header, a2, OS_LOG_TYPE_ERROR, "#coex,onIncomingUCMEvent-Unexpected XPC connection event: %{public}s", (uint8_t *)&v2, 0xCu);
}

void sub_10042AB88()
{
  sub_100010524();
  sub_1000104E4((void *)&_mh_execute_header, v0, v1, "#coex,recieved incorrect channel to trigger blanking on, returning", v2, v3, v4, v5, v6);
}

void sub_10042ABBC()
{
  sub_100010524();
  sub_1000104E4((void *)&_mh_execute_header, v0, v1, "#coex,parseIncomingEvent-Received wrong message from UCM", v2, v3, v4, v5, v6);
}

void sub_10042ABF0()
{
  sub_100010524();
  sub_1000104E4((void *)&_mh_execute_header, v0, v1, "#coex,relayToProvider-Invalid message type", v2, v3, v4, v5, v6);
}

void sub_10042AC24()
{
  sub_100010524();
  sub_1000104E4((void *)&_mh_execute_header, v0, v1, "#coex,relayToProvider,ChannelChange", v2, v3, v4, v5, v6);
}

void sub_10042AC58(os_log_t log)
{
  *(_WORD *)uint64_t v1 = 0;
  _os_log_error_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_ERROR, "#GestureFileUtils Resource bundle does not exist in system volume for Primary and Secondary predictor.", v1, 2u);
}

void sub_10042AC9C(uint64_t a1, uint64_t a2, NSObject *a3)
{
  *(_DWORD *)a2 = 136315138;
  *(void *)(a2 + 4) = a1;
  sub_1001BE59C((void *)&_mh_execute_header, a2, a3, "#GestureFileUtils Secondary Resource bundle '%s' does not exist in system volume.", (uint8_t *)a2);
}

void sub_10042ACD8(uint64_t a1, uint64_t a2, NSObject *a3)
{
  *(_DWORD *)a2 = 136315138;
  *(void *)(a2 + 4) = a1;
  sub_1001BE59C((void *)&_mh_execute_header, a2, a3, "#GestureFileUtils Resource bundle '%s' does not exist in system volume.", (uint8_t *)a2);
}

void sub_10042AD14(uint64_t a1, uint64_t a2, NSObject *a3)
{
  *(_DWORD *)a2 = 136315138;
  *(void *)(a2 + 4) = a1;
  sub_1001BE59C((void *)&_mh_execute_header, a2, a3, "#GestureFileUtils System volume folder '%s' does not exist.", (uint8_t *)a2);
}

void sub_10042AD50(uint64_t a1, uint64_t a2)
{
  do
  {
    if (*(unsigned char *)(a1 - 8))
    {
      if (*(char *)(a1 - 9) < 0) {
        operator delete(*(void **)(a1 - 32));
      }
    }
    a1 -= 32;
  }
  while (a1 != a2);
}

void sub_10042AD98(os_log_t log)
{
  *(_WORD *)uint64_t v1 = 0;
  _os_log_error_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_ERROR, "#fu,writeHeader failed, file not open.", v1, 2u);
}

void sub_10042ADDC()
{
  sub_1002BB54C(__stack_chk_guard);
  sub_1002BB564();
  sub_10001ACCC((void *)&_mh_execute_header, v0, v1, "#fu,writeHeader failed, header copyright size %zu, expected %d", v2, v3);
}

void sub_10042AE50()
{
  sub_1002BB54C(__stack_chk_guard);
  sub_1002BB564();
  sub_10001ACCC((void *)&_mh_execute_header, v0, v1, "#fu,writeHeader failed, header typeStr size %zu, expected %d", v2, v3);
}

void sub_10042AEC4(os_log_t log)
{
  *(_WORD *)os_log_t v1 = 0;
  _os_log_error_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_ERROR, "#fu,getHeader,failed,attemptOnInvalidFileHandle", v1, 2u);
}

void sub_10042AF08(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_10042AF78(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_10042AFE8(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_10042B058(uint64_t a1, NSObject *a2)
{
  int v2 = 134218240;
  uint64_t v3 = a1;
  __int16 v4 = 1024;
  int v5 = 178;
  _os_log_error_impl((void *)&_mh_execute_header, a2, OS_LOG_TYPE_ERROR, "#fu,getHeader,failed,fileToSmall,size,%lu,expected,%d", (uint8_t *)&v2, 0x12u);
}

void sub_10042B0E0()
{
  sub_1002BB534(__stack_chk_guard);
  sub_100010500();
  sub_1001BE5D4((void *)&_mh_execute_header, v0, (uint64_t)v0, "#fu,getHeader,failed,file,%s,notFound", v1);
}

void sub_10042B150()
{
  sub_1002BB534(__stack_chk_guard);
  sub_100010500();
  sub_1001BE5D4((void *)&_mh_execute_header, v0, (uint64_t)v0, "#fu,getHeader,failed,file,%s,failedToOpen", v1);
}

void sub_10042B1C0()
{
  sub_1002BB534(__stack_chk_guard);
  sub_100010500();
  sub_1001BE5D4((void *)&_mh_execute_header, v0, (uint64_t)v0, "#fu,getHeader,failed,doesNotExist,%s", v1);
}

void sub_10042B230()
{
  sub_1001659E8(__stack_chk_guard);
  sub_100010500();
  WORD2(v4) = 2080;
  HIWORD(v4) = v0;
  sub_10001AC6C((void *)&_mh_execute_header, v1, v2, "#fu,calcCrc called from %s,file,%s,cantOpen", v3, v4);
}

void sub_10042B2B4()
{
  sub_1001659E8(__stack_chk_guard);
  sub_100010500();
  sub_1001BE5D4((void *)&_mh_execute_header, v0, v1, "#fu,isCrcOkay,getHeaderFailed,%s", v2);
}

void sub_10042B320()
{
  sub_1001659E8(__stack_chk_guard);
  sub_100010500();
  sub_1001BE5D4((void *)&_mh_execute_header, v0, v1, "#fu,crc check fails for %s", v2);
}

void sub_10042B38C(uint64_t a1, uint64_t a2, NSObject *a3)
{
  *(_DWORD *)uint64_t v3 = 134349312;
  *(void *)&v3[4] = a1;
  *(_WORD *)&uint8_t v3[12] = 2050;
  *(void *)&uint8_t v3[14] = a2;
  sub_10001AC6C((void *)&_mh_execute_header, a2, a3, "#fu,expected file size %{public}zu, actual file size %{public}zu", *(void *)v3, *(void *)&v3[8], *(void *)&v3[16]);
}

void sub_10042B404(os_log_t log)
{
  *(_WORD *)uint64_t v1 = 0;
  _os_log_fault_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_FAULT, "#ni-km,Delete all failed", v1, 2u);
}

void sub_10042B448(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_10042B4B4(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_10042B520(uint64_t a1, NSObject *a2)
{
  int v2 = 134217984;
  uint64_t v3 = a1;
  _os_log_error_impl((void *)&_mh_execute_header, a2, OS_LOG_TYPE_ERROR, "FATAL CLIENT ERROR: Client hasn't dequeued %zu xpc messages. Invalidating connection.", (uint8_t *)&v2, 0xCu);
}

void sub_10042B598()
{
  sub_1001659E8(__stack_chk_guard);
  int v2 = 136315138;
  uint64_t v3 = v0;
  _os_log_fault_impl((void *)&_mh_execute_header, v1, OS_LOG_TYPE_FAULT, "#ota,file %s did not contain a dictionary as expected", (uint8_t *)&v2, 0xCu);
}

void sub_10042B610()
{
  sub_1001659E8(__stack_chk_guard);
  int v3 = 136315394;
  uint64_t v4 = v0;
  __int16 v5 = 2112;
  uint64_t v6 = v1;
  _os_log_error_impl((void *)&_mh_execute_header, v2, OS_LOG_TYPE_ERROR, "#ota,error reading file %s (%@)", (uint8_t *)&v3, 0x16u);
}

void sub_10042B698(uint64_t a1, void **a2)
{
  int v3 = (void **)(a1 - 24);
  do
  {
    uint64_t v4 = v3;
    sub_1002C5AC0(&v4);
    if (*((char *)v3 - 1) < 0) {
      operator delete(*(v3 - 3));
    }
    v3 -= 6;
  }
  while (v3 + 3 != a2);
}

void sub_10042B6F0(uint64_t a1, void **a2)
{
  int v3 = (void **)(a1 - 24);
  do
  {
    uint64_t v4 = v3;
    sub_1002C5AC0(&v4);
    if (*((char *)v3 - 1) < 0) {
      operator delete(*(v3 - 3));
    }
    v3 -= 6;
  }
  while (v3 + 3 != a2);
}

void sub_10042B748(uint64_t a1, NSObject *a2)
{
  uint64_t v4 = *(void *)(a1 + 8);
  uint64_t v2 = a1 + 8;
  uint64_t v3 = v4;
  if (*(char *)(v2 + 23) >= 0) {
    uint64_t v3 = v2;
  }
  int v5 = 136315138;
  uint64_t v6 = v3;
  _os_log_error_impl((void *)&_mh_execute_header, a2, OS_LOG_TYPE_ERROR, "Did fail with error: %s", (uint8_t *)&v5, 0xCu);
}

void sub_10042B7D0()
{
  sub_100010524();
  sub_1000104E4((void *)&_mh_execute_header, v0, v1, "PRSystemSettingsMonitor: Failed to create _radioPrefs.", v2, v3, v4, v5, v6);
}

void sub_10042B804()
{
  sub_100010524();
  sub_1000104E4((void *)&_mh_execute_header, v0, v1, "regulatory,ap,Failed to schedule Airplane Mode notifications.", v2, v3, v4, v5, v6);
}

void sub_10042B838()
{
  sub_100010524();
  sub_1000104E4((void *)&_mh_execute_header, v0, v1, "regulatory,ap,Failed to set Airplane Mode notifications client.", v2, v3, v4, v5, v6);
}

void sub_10042B86C()
{
  sub_100010524();
  sub_1000104E4((void *)&_mh_execute_header, v0, v1, "regulatory,ap,fetchAndUpdateAirplaneModeStatus failed - _radioPrefs is nil.", v2, v3, v4, v5, v6);
}

void sub_10042B8A0()
{
  sub_100010500();
  _os_log_error_impl((void *)&_mh_execute_header, v0, OS_LOG_TYPE_ERROR, "fileutil,decompress,cantOpenSrcFile,%s", v1, 0xCu);
}

void sub_10042B928()
{
  sub_1001659E8(__stack_chk_guard);
  sub_100010500();
  sub_10000B3E0((void *)&_mh_execute_header, v0, v1, "fileutil,decompress,cantOpenDstFile,%s", v2, v3, v4, v5, v6);
}

void sub_10042B990()
{
  sub_1001659E8(__stack_chk_guard);
  sub_100010500();
  __int16 v3 = 2080;
  uint64_t v4 = v0;
  _os_log_debug_impl((void *)&_mh_execute_header, v1, OS_LOG_TYPE_DEBUG, "fileutil,decompress,src,%s,dst,%s,done", v2, 0x16u);
}

void sub_10042BA24()
{
  sub_1001659E8(__stack_chk_guard);
  sub_100010500();
  sub_10000B3E0((void *)&_mh_execute_header, v0, v1, "fileutil,decompress,cantReadCompressedFile,%s", v2, v3, v4, v5, v6);
}

void sub_10042BA8C()
{
  sub_1001659E8(__stack_chk_guard);
  sub_100010500();
  sub_10000B3E0((void *)&_mh_execute_header, v0, v1, "fileutil,decompress,cantWriteDecompressedFile,%s", v2, v3, v4, v5, v6);
}

void sub_10042BAF4()
{
  sub_1001659E8(__stack_chk_guard);
  sub_100010500();
  sub_10000B3E0((void *)&_mh_execute_header, v0, v1, "fileutil,decompress,cantWriteDecompressedFile,%s, fstream write error", v2, v3, v4, v5, v6);
}

void sub_10042BB5C(uint64_t a1, NSObject *a2)
{
  uint64_t v3 = (*(uint64_t (**)(uint64_t))(*(void *)a1 + 16))(a1);
  int v4 = 136315138;
  uint64_t v5 = v3;
  _os_log_error_impl((void *)&_mh_execute_header, a2, OS_LOG_TYPE_ERROR, "Caught Exception: %s", (uint8_t *)&v4, 0xCu);
}

void sub_10042BC08(os_log_t log)
{
  *(_WORD *)uint64_t v1 = 0;
  _os_log_error_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_ERROR, "PRConfigurationManager: UWB is not allowed.", v1, 2u);
}

void sub_10042BC4C(int a1, NSObject *a2)
{
  v2[0] = 67109120;
  v2[1] = a1;
  _os_log_fault_impl((void *)&_mh_execute_header, a2, OS_LOG_TYPE_FAULT, "[PRConfigurationManager] %d is invalid value for preferred channel in default write.", (uint8_t *)v2, 8u);
}

void sub_10042BCC4(os_log_t log)
{
  *(_WORD *)uint64_t v1 = 0;
  _os_log_fault_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_FAULT, "[PRConfigurationManager] At least one of Ch5 or Ch9 must be allowed.", v1, 2u);
}

void sub_10042BD08(os_log_t log)
{
  *(_WORD *)uint64_t v1 = 0;
  _os_log_error_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_ERROR, "[PRConfigurationManager] No valid RF channel.", v1, 2u);
}

void sub_10042BD4C()
{
  sub_100010524();
  sub_10016F0D8((void *)&_mh_execute_header, v0, v1, "regulatory,geo,locmgr,startMonitoring,done", v2, v3, v4, v5, v6);
}

void sub_10042BD80()
{
  sub_100010524();
  sub_10016F0D8((void *)&_mh_execute_header, v0, v1, "regulatory,geo,locmgr,startMonitoring,skipped,reason,alreadyStarted", v2, v3, v4, v5, v6);
}

void sub_10042BDB4(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_10042BE24()
{
  sub_100010524();
  sub_10016F0D8((void *)&_mh_execute_header, v0, v1, "regulatory,geo,locmgr,startMonitoring,skipped,reason,notInitialized", v2, v3, v4, v5, v6);
}

void sub_10042BE58()
{
  sub_100010524();
  sub_10016F0D8((void *)&_mh_execute_header, v0, v1, "regulatory,geo,locmgr,stopMonitoring,skipped,reason,alreadyStopped", v2, v3, v4, v5, v6);
}

void sub_10042BE8C()
{
  sub_100010524();
  sub_10016F0D8((void *)&_mh_execute_header, v0, v1, "regulatory,geo,locmgr,stopMonitoring,done.", v2, v3, v4, v5, v6);
}

void sub_10042BEC0()
{
  sub_100010524();
  sub_10016F0D8((void *)&_mh_execute_header, v0, v1, "regulatory,geo,locmgr,stopMonitoring,skipped,reason,notInitialized", v2, v3, v4, v5, v6);
}

void sub_10042BEF4()
{
  sub_100010524();
  sub_10016F0D8((void *)&_mh_execute_header, v0, v1, "regulatory,geo,locmgr,upgradeToBestAccuracyMonitoring,skipped,reason,alreadyStopped", v2, v3, v4, v5, v6);
}

void sub_10042BF28()
{
  sub_100010524();
  sub_10016F0D8((void *)&_mh_execute_header, v0, v1, "regulatory,geo,locmgr,upgradeToBestAccuracyMonitoring,skipped,reason,notInitialized", v2, v3, v4, v5, v6);
}

void sub_10042BF5C()
{
  sub_100010524();
  sub_10016F0D8((void *)&_mh_execute_header, v0, v1, "regulatory,geo,locmgr,dowgradeToBystanderMonitoring,skipped,reason,alreadyStopped", v2, v3, v4, v5, v6);
}

void sub_10042BF90()
{
  sub_100010524();
  sub_10016F0D8((void *)&_mh_execute_header, v0, v1, "regulatory,geo,locmgr,dowgradeToBystanderMonitoring,skipped,reason,notInitialized", v2, v3, v4, v5, v6);
}

void sub_10042BFC4(uint64_t a1, NSObject *a2)
{
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_debug_impl((void *)&_mh_execute_header, a2, OS_LOG_TYPE_DEBUG, "regulatory,geo,locmgr,didFailWithError,%@", (uint8_t *)&v2, 0xCu);
}

void sub_10042C03C()
{
  sub_100010524();
  sub_10016F0D8((void *)&_mh_execute_header, v0, v1, "regulatory,geo,locmgr,didChangeAuthorizationStatus,skipped,reason,notMonitoring", v2, v3, v4, v5, v6);
}

void sub_10042C070(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_10042C0DC(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_10042C14C()
{
  sub_100010524();
  sub_10016F0D8((void *)&_mh_execute_header, v0, v1, "regulatory,geo,loc,startMonitoring", v2, v3, v4, v5, v6);
}

void sub_10042C180()
{
  sub_100010524();
  sub_10016F0D8((void *)&_mh_execute_header, v0, v1, "regulatory,geo,loc,upgradeMonitoring", v2, v3, v4, v5, v6);
}

void sub_10042C1B4()
{
  sub_100010524();
  sub_10016F0D8((void *)&_mh_execute_header, v0, v1, "regulatory,geo,loc,downgradeMonitoring", v2, v3, v4, v5, v6);
}

void sub_10042C1E8()
{
}

void sub_10042C214()
{
  sub_100010524();
  sub_100056C38((void *)&_mh_execute_header, v0, v1, "regulatory,geo,loc,checkRegulatoryIso,assertionRefCountTooLarge", v2, v3, v4, v5, v6);
}

void sub_10042C248()
{
  sub_100010524();
  sub_100056C38((void *)&_mh_execute_header, v0, v1, "regulatory,geo,loc,checkRegulatoryIso,assertionAlreadyAcquired", v2, v3, v4, v5, v6);
}

void sub_10042C27C(uint64_t a1, NSObject *a2)
{
  int v2 = 138477827;
  uint64_t v3 = a1;
  _os_log_debug_impl((void *)&_mh_execute_header, a2, OS_LOG_TYPE_DEBUG, "regulatory,geo,loc,checkRegulatoryIso,geoServices,results,%{private}@", (uint8_t *)&v2, 0xCu);
}

void sub_10042C2F4(uint64_t a1, NSObject *a2)
{
  int v2 = 138477827;
  uint64_t v3 = a1;
  _os_log_error_impl((void *)&_mh_execute_header, a2, OS_LOG_TYPE_ERROR, "regulatory,geo,loc,checkRegulatoryIso,geoServices,error,%{private}@", (uint8_t *)&v2, 0xCu);
}

void sub_10042C36C()
{
  sub_100010524();
  sub_100056C38((void *)&_mh_execute_header, v0, v1, "regulatory,geo,loc,checkRegulatoryIso,assertionRefCountTooSmall", v2, v3, v4, v5, v6);
}

void sub_10042C3A0()
{
  sub_100010524();
  sub_100056C38((void *)&_mh_execute_header, v0, v1, "regulatory,geo,loc,checkRegulatoryIso,assertionAlreadyReleased", v2, v3, v4, v5, v6);
}

void sub_10042C3D4()
{
}

void sub_10042C400()
{
  __assert_rtn("decodeSystemFactoryCalVersion", "roseCalFileParser.cpp", 310, "tlv.val.size() >= 2");
}

void sub_10042C42C()
{
  __assert_rtn("decodeSystemFactoryCalVersion", "roseCalFileParser.cpp", 309, "tlv.tagId == toUnderlyingType(TagId::System_Factory_Cal_Version)");
}

void sub_10042C458(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  sub_1003A9600("RoseCalFileParser::getUnsignedIntVal called with invalid numBytes = %zu", a2, a3, a4, a5, a6, a7, a8, a1);
  __assert_rtn("getUnsignedIntVal", "roseCalFileParser.cpp", 338, "false");
}

void sub_10042C498()
{
  __assert_rtn("getUnsignedIntVal", "roseCalFileParser.cpp", 323, "idx + 2 <= data.size()");
}

void sub_10042C4C4()
{
  __assert_rtn("getUnsignedIntVal", "roseCalFileParser.cpp", 331, "idx + 4 <= data.size()");
}

void sub_10042C4F0()
{
  __assert_rtn("getPDOA_Forward_LUT", "roseCalFileParser.cpp", 297, "startIdx + numEntries * kNumBytesPerTableEntry <= byteVec.size()");
}

void sub_10042C51C()
{
  sub_1002D4A98();
  sub_1002D4ABC(4.8151e-34, v1, v2, v3);
  _os_log_error_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_ERROR, "#rlm,Ignoring duplicate indicateRangingStarted for '%s' with sessionIdentifier %@", v4, 0x16u);
  if (*(char *)(v0 + 23) < 0) {
    operator delete(*(void **)v0);
  }
}

void sub_10042C578()
{
  sub_1002D4A98();
  sub_1002D4ABC(4.8151e-34, v1, v2, v3);
  _os_log_error_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_ERROR, "#rlm,Ignoring duplicate indicateRangingStopped for '%s' with sessionIdentifier %@", v4, 0x16u);
  if (*(char *)(v0 + 23) < 0) {
    operator delete(*(void **)v0);
  }
}

void sub_10042C5D4()
{
  sub_100175C1C();
  if (v4 != v5) {
    uint64_t v6 = v3;
  }
  else {
    uint64_t v6 = v1;
  }
  sub_1001BE5EC(v2, v6, 4.8149e-34);
  _os_log_debug_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEBUG, "#rlm,RangingDurationTracker(%s): ranging started, first one", v8, 0xCu);
  if (*(char *)(v0 + 23) < 0) {
    operator delete(*(void **)v0);
  }
}

void sub_10042C634()
{
  sub_100175C1C();
  if (v4 != v5) {
    uint64_t v6 = v3;
  }
  else {
    uint64_t v6 = v1;
  }
  sub_1001BE5EC(v2, v6, 4.8149e-34);
  _os_log_debug_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEBUG, "#rlm,RangingDurationTracker(%s): ranging started, subsequent one", v8, 0xCu);
  if (*(char *)(v0 + 23) < 0) {
    operator delete(*(void **)v0);
  }
}

void sub_10042C694()
{
  sub_100175C1C();
  if (v4 != v5) {
    uint64_t v6 = v3;
  }
  else {
    uint64_t v6 = v1;
  }
  sub_1001BE5EC(v2, v6, 4.8149e-34);
  sub_1002D4A7C((void *)&_mh_execute_header, v7, v8, "#rlm,Attempt to stop ranging for '%s' when there is none ongoing", v9);
  if (*(char *)(v0 + 23) < 0) {
    operator delete(*(void **)v0);
  }
}

void sub_10042C6E8(os_log_t log)
{
  *(_WORD *)uint64_t v1 = 0;
  _os_log_fault_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_FAULT, "#rlm,useCases empty", v1, 2u);
}

void sub_10042C72C()
{
  sub_100175C1C();
  if (v4 != v5) {
    uint64_t v6 = v3;
  }
  else {
    uint64_t v6 = v1;
  }
  sub_1001BE5EC(v2, v6, 4.8149e-34);
  sub_1002D4A7C((void *)&_mh_execute_header, v7, v8, "#rlm,RangingBudgetTracker not setup for use case '%s'", v9);
  if (*(char *)(v0 + 23) < 0) {
    operator delete(*(void **)v0);
  }
}

void sub_10042C780()
{
  sub_100175C1C();
  if (v4 != v5) {
    uint64_t v6 = v3;
  }
  else {
    uint64_t v6 = v1;
  }
  sub_1001BE5EC(v2, v6, 4.8149e-34);
  sub_1002D4A7C((void *)&_mh_execute_header, v7, v8, "#rlm,Unsupported use case '%s'", v9);
  if (*(char *)(v0 + 23) < 0) {
    operator delete(*(void **)v0);
  }
}

void sub_10042C7D4(os_log_t log)
{
  *(_WORD *)uint64_t v1 = 0;
  _os_log_error_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_ERROR, "Motion is also nil", v1, 2u);
}

void sub_10042C818(uint64_t a1, NSObject *a2)
{
  int v2 = 138543362;
  uint64_t v3 = a1;
  _os_log_error_impl((void *)&_mh_execute_header, a2, OS_LOG_TYPE_ERROR, "error receiving DeviceMotion: %{public}@", (uint8_t *)&v2, 0xCu);
}

void sub_10042C890()
{
}

void sub_10042C8BC(os_log_t log)
{
  *(_WORD *)uint64_t v1 = 0;
  _os_log_error_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_ERROR, "Message type RoseMotionMessageType::Unspecified", v1, 2u);
}

void sub_10042C900()
{
  sub_100010524();
  sub_1000104E4((void *)&_mh_execute_header, v0, v1, "#rose-ses,fServiceTicketId does not have value", v2, v3, v4, v5, v6);
}

void sub_10042C934()
{
  sub_100010524();
  sub_1000104E4((void *)&_mh_execute_header, v0, v1, "#rose-ses,Unable to obtain configuration manager.", v2, v3, v4, v5, v6);
}

void sub_10042C968()
{
  sub_100010524();
  sub_1000104E4((void *)&_mh_execute_header, v0, v1, "#rose-ses,Unable to register for service.", v2, v3, v4, v5, v6);
}

void sub_10042C99C()
{
  sub_100010524();
  sub_100056C38((void *)&_mh_execute_header, v0, v1, "#rose-ses,Cannot initialize() an already initialized session object.", v2, v3, v4, v5, v6);
}

void sub_10042C9D0()
{
  sub_100010524();
  sub_100056C38((void *)&_mh_execute_header, v0, v1, "#rose-ses,STATE ERROR: using session after invalidation.", v2, v3, v4, v5, v6);
}

void sub_10042CA04()
{
  __assert_rtn("isInitiator", "NIServerRoseSession.mm", 117, "fServiceRequest.role != serviceattributes::Role::Unspecified");
}

void sub_10042CA30()
{
  sub_100010524();
  sub_100056C38((void *)&_mh_execute_header, v0, v1, "#rose-ses,#throttle got didReceiveRangingRateUpdateEvent but fServiceTicketId == std::nullopt", v2, v3, v4, v5, v6);
}

void sub_10042CA64(unsigned __int8 *a1, unsigned __int8 *a2, os_log_t log)
{
  int v3 = *a1;
  int v4 = atomic_load(a2);
  v5[0] = 67109376;
  v5[1] = v3;
  __int16 v6 = 1024;
  int v7 = v4;
  _os_log_fault_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_FAULT, "#rose-ses,state inconsistency: mismatching subrates %d != %d.", (uint8_t *)v5, 0xEu);
}

void sub_10042CAF4()
{
  sub_100010524();
  sub_100056C38((void *)&_mh_execute_header, v0, v1, "#rose-ses,logic error: notify reason must be FW event.", v2, v3, v4, v5, v6);
}

void sub_10042CB28()
{
  sub_100010524();
  sub_100056C38((void *)&_mh_execute_header, v0, v1, "#rose-ses,logic error: mismatching tickets.", v2, v3, v4, v5, v6);
}

void sub_10042CB5C(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_10042CBD4()
{
  sub_100010524();
  sub_100056C38((void *)&_mh_execute_header, v0, v1, "#rose-ses,Unexpected Alisha update.", v2, v3, v4, v5, v6);
}

void sub_10042CC08()
{
  sub_100010524();
  sub_100056C38((void *)&_mh_execute_header, v0, v1, "#rose-ses,Converting aop alisha health to nearbyd alisha health failed", v2, v3, v4, v5, v6);
}

void sub_10042CC3C(uint64_t *a1, char a2, os_log_t log)
{
  uint64_t v3 = *a1;
  int v4 = *((char *)a1 + 31);
  int v7 = (uint64_t *)a1[1];
  uint64_t v5 = a1 + 1;
  uint8_t v6 = v7;
  if (v4 >= 0) {
    os_log_t v8 = v5;
  }
  else {
    os_log_t v8 = v6;
  }
  int v10 = 134218498;
  uint64_t v11 = v3;
  if (a2) {
    __int16 v9 = "Notify";
  }
  else {
    __int16 v9 = "Invalidate";
  }
  __int16 v12 = 2080;
  __int16 v13 = v8;
  __int16 v14 = 2080;
  __int16 v15 = v9;
  _os_log_error_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_ERROR, "#rose-ses,Failed with error. Code: %ld, Description: %s. Action: %s", (uint8_t *)&v10, 0x20u);
}

void sub_10042CCF8(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_10042CD70()
{
  sub_100010524();
  sub_100056C38((void *)&_mh_execute_header, v0, v1, "#rose-ses,Given negative throttle rate.", v2, v3, v4, v5, v6);
}

void sub_10042CDA4()
{
  sub_100010524();
  sub_100056C38((void *)&_mh_execute_header, v0, v1, "#rose-ses,Throttle rate must be between 0 and 1.", v2, v3, v4, v5, v6);
}

void sub_10042CDD8()
{
  sub_100010524();
  sub_1000104E4((void *)&_mh_execute_header, v0, v1, "#rose-ses,#throttle no ticket.", v2, v3, v4, v5, v6);
}

void sub_10042CE0C()
{
  sub_100175C1C();
  if (v6 != v7) {
    uint64_t v8 = v5;
  }
  else {
    uint64_t v8 = v1;
  }
  *(_DWORD *)uint64_t v2 = 136380675;
  *(void *)(v2 + 4) = v8;
  _os_log_debug_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEBUG, "#rose-ses,updatePeerData: %{private}s", v4, 0xCu);
  if (*(char *)(v0 + 23) < 0) {
    operator delete(*(void **)v0);
  }
}

void sub_10042CE70(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_10042CF0C()
{
  sub_100010524();
  sub_100056C38((void *)&_mh_execute_header, v0, v1, "#rose-ses,Did not expect successful KeyResponse in AlishaSubsystem::getKey.", v2, v3, v4, v5, v6);
}

void sub_10042CF40()
{
  sub_100010524();
  sub_1000104E4((void *)&_mh_execute_header, v0, v1, "#rose-ses,AlishaSubsystem: conversion failed", v2, v3, v4, v5, v6);
}

void sub_10042CF74()
{
  sub_100010524();
  sub_100056C38((void *)&_mh_execute_header, v0, v1, "#rose-ses,AlishaSubsystem: #time-convert wrong conversion result. Original time doesn't match", v2, v3, v4, v5, v6);
}

void sub_10042CFA8()
{
  sub_100010524();
  sub_100056C38((void *)&_mh_execute_header, v0, v1, "#rose-ses,AlishaSubsystem: #time-convert wrong conversion result. Timebase-to not Rose", v2, v3, v4, v5, v6);
}

void sub_10042CFDC()
{
  sub_100010524();
  sub_100056C38((void *)&_mh_execute_header, v0, v1, "#rose-ses,AlishaSubsystem: #time-convert wrong conversion result. Timebase-from not BT", v2, v3, v4, v5, v6);
}

void sub_10042D010(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_10042D0A8()
{
}

void sub_10042D0D4()
{
  sub_100010524();
  sub_1000104E4((void *)&_mh_execute_header, v0, v1, "#rose-ses,Called Alisha range enable but does not have a service ticket.", v2, v3, v4, v5, v6);
}

void sub_10042D108()
{
}

void sub_10042D134()
{
}

void sub_10042D160(uint64_t a1)
{
  uint64_t v2 = *(void **)(a1 + 8);
  if (v2)
  {
    *(void *)(a1 + 16) = v2;
    operator delete(v2);
  }
}

void sub_10042D188()
{
  sub_100010524();
  sub_1000104E4((void *)&_mh_execute_header, v0, v1, "#rose-ses,Called Alisha range disable, but already invalidated.", v2, v3, v4, v5, v6);
}

void sub_10042D1BC()
{
  sub_100010524();
  sub_1000104E4((void *)&_mh_execute_header, v0, v1, "#rose-ses,Called Alisha range disable, but invalidate failed. Service request likely speculatively cleaned up.", v2, v3, v4, v5, v6);
}

void sub_10042D1F0()
{
  sub_100010524();
  sub_1000104E4((void *)&_mh_execute_header, v0, v1, "#rose-ses,Timed out waiting for alisha session stats with reason ResponseToCommand", v2, v3, v4, v5, v6);
}

void sub_10042D224()
{
  sub_100175C1C();
  if (v6 != v7) {
    uint64_t v8 = v5;
  }
  else {
    uint64_t v8 = v1;
  }
  *(_DWORD *)uint64_t v2 = 136315138;
  *(void *)(v2 + 4) = v8;
  _os_log_error_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_ERROR, "#rose-ses,triggerAlishaSessionStats failed with status code %s", v4, 0xCu);
  if (*(char *)(v0 + 23) < 0) {
    operator delete(*(void **)v0);
  }
}

void sub_10042D288()
{
}

void sub_10042D2B4()
{
}

void sub_10042D2E0()
{
}

void sub_10042D30C(uint64_t a1)
{
  uint64_t v2 = *(void **)(a1 + 8);
  if (v2)
  {
    *(void *)(a1 + 16) = v2;
    operator delete(v2);
  }
}

void sub_10042D324(uint64_t a1)
{
  if (*(char *)(a1 + 23) < 0) {
    operator delete(*(void **)a1);
  }
}

void sub_10042D348()
{
}

void sub_10042D374()
{
}

void sub_10042D3A0()
{
}

void sub_10042D3CC()
{
}

void sub_10042D3F8()
{
}

void sub_10042D424(os_log_t log)
{
  *(_WORD *)uint64_t v1 = 0;
  _os_log_error_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_ERROR, "#ses-sptbrows,Could not get recently observed objects cache session.", v1, 2u);
}

void sub_10042D468()
{
  sub_100010524();
  sub_1000104E4((void *)&_mh_execute_header, v0, v1, "DiscoveryToken getter returning nil", v2, v3, v4, v5, v6);
}

void sub_10042D49C()
{
  sub_10001AC8C();
  sub_10000B3E0((void *)&_mh_execute_header, v0, v1, "DelegateProxy: session failed with error: %{private}@", v2, v3, v4, v5, v6);
}

void sub_10042D504()
{
  sub_10001AC8C();
  sub_10000B3E0((void *)&_mh_execute_header, v0, v1, "DelegateProxy: session invalidated with error: %{private}@", v2, v3, v4, v5, v6);
}

void sub_10042D56C()
{
  sub_100010524();
  sub_1000104E4((void *)&_mh_execute_header, v0, v1, "Suspension end does not match any stored suspensions.", v2, v3, v4, v5, v6);
}

void sub_10042D5A0()
{
  sub_10001AC8C();
  sub_10000B3E0((void *)&_mh_execute_header, v0, v1, "ARSession: failed with error: %{private}@", v2, v3, v4, v5, v6);
}

void sub_10042D608()
{
  sub_10001AC8C();
  sub_10000B3E0((void *)&_mh_execute_header, v0, v1, "ARSession: running with invalid config: %{private}@", v2, v3, v4, v5, v6);
}

void sub_10042D670()
{
  sub_100010524();
  sub_1000104E4((void *)&_mh_execute_header, v0, v1, "External ARSession provided but camera assistance requested in server", v2, v3, v4, v5, v6);
}

void sub_10042D6A4()
{
  sub_100010524();
  sub_1000104E4((void *)&_mh_execute_header, v0, v1, "No cached suspensions found.", v2, v3, v4, v5, v6);
}

void sub_10042D6D8(void *a1, uint8_t *buf, os_log_t log)
{
  *(_DWORD *)buf = 138477827;
  *(void *)(buf + 4) = a1;
  _os_log_error_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_ERROR, "%{private}@", buf, 0xCu);
}

void sub_10042D730()
{
  sub_10001AC8C();
  __int16 v3 = 2112;
  uint64_t v4 = v0;
  _os_log_error_impl((void *)&_mh_execute_header, v1, OS_LOG_TYPE_ERROR, "Delegate: notify invalidation: %@. Sanitized: %@", v2, 0x16u);
}

void sub_10042D7B4(os_log_t log)
{
  *(_WORD *)os_log_t v1 = 0;
  _os_log_error_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_ERROR, "#regulatory,regulatory,geo,mcc,onCellMonitorUpdate,invalidSimSlot", v1, 2u);
}

void sub_10042D7F8(uint64_t a1, NSObject *a2)
{
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_error_impl((void *)&_mh_execute_header, a2, OS_LOG_TYPE_ERROR, "#regulatory,regulatory,geo,mcc,copyCellInfo,error:%@", (uint8_t *)&v2, 0xCu);
}

void sub_10042D870()
{
  __assert_rtn("setAirplaneMode", "PRMccMonitor.mm", 132, "airplaneMode != Rose::AirplaneMode::UNKNOWN");
}

void sub_10042D89C(os_log_t log)
{
  *(_WORD *)os_log_t v1 = 0;
  _os_log_error_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_ERROR, "#regulatory,regulatory,geo,mcc,setAirplaneMode called with invalid input argument value.", v1, 2u);
}

void sub_10042D8E0(os_log_t log)
{
  *(_WORD *)os_log_t v1 = 0;
  _os_log_debug_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_DEBUG, "#regulatory,regulatory,geo,mcc,processMcc,ignoreInAirplaneMode", v1, 2u);
}

void sub_10042D924(uint64_t *a1, NSObject *a2)
{
  if (*((char *)a1 + 23) >= 0) {
    int v2 = a1;
  }
  else {
    int v2 = (uint64_t *)*a1;
  }
  int v3 = 136315138;
  uint64_t v4 = v2;
  _os_log_error_impl((void *)&_mh_execute_header, a2, OS_LOG_TYPE_ERROR, "BT Advertising Address was nullopt. CBManager state is %s", (uint8_t *)&v3, 0xCu);
}

void sub_10042D9AC(uint8_t *buf, uint64_t a2, os_log_t log)
{
  *(_DWORD *)buf = 134218240;
  *(void *)(buf + 4) = a2;
  *((_WORD *)buf + 6) = 1024;
  *(_DWORD *)(buf + 14) = 6;
  _os_log_error_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_ERROR, "advertisingAddress.length (%lu) != rose::kBtAdvAddressByteLength (%d)", buf, 0x12u);
}

void sub_10042DA04(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_10042DA3C(uint64_t a1, NSObject *a2)
{
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_error_impl((void *)&_mh_execute_header, a2, OS_LOG_TYPE_ERROR, "Failed to enable SPMI messages via WiProx with error: %@", (uint8_t *)&v2, 0xCu);
}

void sub_10042DAB4(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_10042DAEC(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_10042DB24(uint64_t a1, NSObject *a2)
{
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_error_impl((void *)&_mh_execute_header, a2, OS_LOG_TYPE_ERROR, "Remote object error: %@", (uint8_t *)&v2, 0xCu);
}

void sub_10042DB9C(uint64_t a1, NSObject *a2)
{
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_error_impl((void *)&_mh_execute_header, a2, OS_LOG_TYPE_ERROR, "Synchronous remote object error: %@", (uint8_t *)&v2, 0xCu);
}

void sub_10042DC14()
{
  sub_100010524();
  sub_1000104E4((void *)&_mh_execute_header, v0, v1, "Failed to register as power budget client.", v2, v3, v4, v5, v6);
}

void sub_10042DC48()
{
  sub_100010524();
  sub_1000104E4((void *)&_mh_execute_header, v0, v1, "Was not able to log device meta information after protobuf log creation.", v2, v3, v4, v5, v6);
}

void sub_10042DC7C()
{
  sub_100010524();
  sub_1000104E4((void *)&_mh_execute_header, v0, v1, "Failed to open protobuf logger upon creation.", v2, v3, v4, v5, v6);
}

void sub_10042DCB0()
{
}

void sub_10042DCDC()
{
  sub_100010524();
  sub_1000104E4((void *)&_mh_execute_header, v0, v1, "Failed to write protobuf device meta information after first unlock.", v2, v3, v4, v5, v6);
}

void sub_10042DD10()
{
  sub_100010524();
  sub_1000104E4((void *)&_mh_execute_header, v0, v1, "Failed to open protobuf log on first unlock.", v2, v3, v4, v5, v6);
}

void sub_10042DD44()
{
  sub_100010524();
  sub_1000104E4((void *)&_mh_execute_header, v0, v1, "protoLogDeviceMetaInformation protobuf no pbLogger", v2, v3, v4, v5, v6);
}

void sub_10042DD78()
{
  sub_100010524();
  sub_1000104E4((void *)&_mh_execute_header, v0, v1, "Caller to probe has expired", v2, v3, v4, v5, v6);
}

void sub_10042DDAC()
{
  sub_100010524();
  sub_1000104E4((void *)&_mh_execute_header, v0, v1, "Caller to registerForService has expired", v2, v3, v4, v5, v6);
}

void sub_10042DDE0(char *a1, uint8_t *buf, os_log_t log)
{
  if (a1[23] >= 0) {
    uint64_t v4 = a1;
  }
  else {
    uint64_t v4 = *(char **)a1;
  }
  *(_DWORD *)buf = 136315138;
  *(void *)(buf + 4) = v4;
  _os_log_error_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_ERROR, "Failed to place service request: %s", buf, 0xCu);
  if (a1[23] < 0) {
    operator delete(*(void **)a1);
  }
}

void sub_10042DE54()
{
  sub_100186D80();
  sub_10016F0F4();
  sub_10001AC98((void *)&_mh_execute_header, v0, v1, "fRequestToClientMap.find(ticketId (%d)) != fRequestToClientMap.end()", v2, v3, v4, v5, v6);
}

void sub_10042DEBC()
{
  sub_100010524();
  sub_1000104E4((void *)&_mh_execute_header, v0, v1, "Caller to unregisterForService has expired", v2, v3, v4, v5, v6);
}

void sub_10042DEF0()
{
  sub_100010524();
  sub_1000104E4((void *)&_mh_execute_header, v0, v1, "Client asked to cancel service, but has no registered requests.", v2, v3, v4, v5, v6);
}

void sub_10042DF24()
{
  sub_100010524();
  sub_1000104E4((void *)&_mh_execute_header, v0, v1, "Client asked to cancel service with invalid ticket id.", v2, v3, v4, v5, v6);
}

void sub_10042DF58()
{
  sub_1002FD1E8();
  sub_1002FD1C4(1.5047e-36, v1, v2, v3);
  sub_1002FD200((void *)&_mh_execute_header, "Failed to unregister for service. Ticket ID: %d. Error: %s", v4, v5);
  if (*(char *)(v0 + 23) < 0) {
    operator delete(*(void **)v0);
  }
}

void sub_10042DFA8()
{
  sub_100010524();
  sub_1000104E4((void *)&_mh_execute_header, v0, v1, "Caller to startUserTriggeredRanging has expired", v2, v3, v4, v5, v6);
}

void sub_10042DFDC()
{
  sub_100010524();
  sub_1000104E4((void *)&_mh_execute_header, v0, v1, "Client asked to trigger service, but has no registered requests.", v2, v3, v4, v5, v6);
}

void sub_10042E010()
{
  sub_10016F0F4();
  sub_10001AC98((void *)&_mh_execute_header, v0, v1, "Client asked to trigger service with invalid ticket id %d.", v2, v3, v4, v5, v6);
}

void sub_10042E07C()
{
  sub_1002FD1E8();
  sub_1002FD1C4(1.5047e-36, v1, v2, v3);
  sub_1002FD200((void *)&_mh_execute_header, "Failed to trigger ranging. Ticket ID: %d. Error: %s", v4, v5);
  if (*(char *)(v0 + 23) < 0) {
    operator delete(*(void **)v0);
  }
}

void sub_10042E0CC()
{
  sub_100010524();
  sub_1000104E4((void *)&_mh_execute_header, v0, v1, "#throttle Caller to startUserTriggeredRanging has expired", v2, v3, v4, v5, v6);
}

void sub_10042E100()
{
  sub_100010524();
  sub_1000104E4((void *)&_mh_execute_header, v0, v1, "#throttle Client asked to trigger service, but has no registered requests.", v2, v3, v4, v5, v6);
}

void sub_10042E134()
{
  sub_100186D80();
  sub_10016F0F4();
  sub_10001AC98((void *)&_mh_execute_header, v0, v1, "#throttle Client asked to trigger service with invalid ticket id %d.", v2, v3, v4, v5, v6);
}

void sub_10042E19C()
{
  sub_100010524();
  sub_1000104E4((void *)&_mh_execute_header, v0, v1, "Caller to stopRanging has expired", v2, v3, v4, v5, v6);
}

void sub_10042E1D0()
{
  sub_100010524();
  sub_1000104E4((void *)&_mh_execute_header, v0, v1, "Client asked to stop service with invalid ticket id.", v2, v3, v4, v5, v6);
}

void sub_10042E204()
{
  sub_1002FD1E8();
  sub_1002FD1C4(1.5047e-36, v1, v2, v3);
  sub_1002FD200((void *)&_mh_execute_header, "Failed to stop ranging. Ticket ID: %d. Error: %s", v4, v5);
  if (*(char *)(v0 + 23) < 0) {
    operator delete(*(void **)v0);
  }
}

void sub_10042E254()
{
}

void sub_10042E280()
{
  sub_100010524();
  sub_1000104E4((void *)&_mh_execute_header, v0, v1, "PRRangingManager: Failed to push beacon allowlist.", v2, v3, v4, v5, v6);
}

void sub_10042E2B4()
{
  sub_100010524();
  sub_1000104E4((void *)&_mh_execute_header, v0, v1, "PRRangingManager: Failed to clear beacon allowlist.", v2, v3, v4, v5, v6);
}

void sub_10042E2E8()
{
  sub_10016F0F4();
  sub_10001AC98((void *)&_mh_execute_header, v0, v1, "Received solution, but nullptr client. Ticket_id %d", v2, v3, v4, v5, v6);
}

void sub_10042E354()
{
  sub_10016F0F4();
  sub_10001AC98((void *)&_mh_execute_header, v0, v1, "Received session start notification, but nullptr client. Ticket_id %d", v2, v3, v4, v5, v6);
}

void sub_10042E3C0()
{
  sub_100186D80();
  sub_10016F0F4();
  sub_10001AC98((void *)&_mh_execute_header, v0, v1, "Received remote data for ticket_id %d but nullptr client", v2, v3, v4, v5, v6);
}

void sub_10042E428()
{
  sub_100186D80();
  sub_10016F0F4();
  sub_10001AC98((void *)&_mh_execute_header, v0, v1, "Received subrate event for ticket_id %d but nullptr client", v2, v3, v4, v5, v6);
}

void sub_10042E490()
{
  sub_100186D80();
  sub_10016F0F4();
  sub_10001AC98((void *)&_mh_execute_header, v0, v1, "Received alisha update for ticket_id %u but nullptr client", v2, v3, v4, v5, v6);
}

void sub_10042E4F8()
{
  sub_100186D80();
  sub_10016F0F4();
  sub_10001AC98((void *)&_mh_execute_header, v0, v1, "Received fira update for ticket_id %u but nullptr client", v2, v3, v4, v5, v6);
}

void sub_10042E560()
{
}

void sub_10042E58C()
{
}

void sub_10042E5B8()
{
  sub_10016F0F4();
  sub_10001AC98((void *)&_mh_execute_header, v0, v1, "Received service request status update, but nullptr client. Ticket_id %d", v2, v3, v4, v5, v6);
}

void sub_10042E624()
{
  sub_100186D80();
  sub_10016F0F4();
  sub_10001AC98((void *)&_mh_execute_header, v0, v1, "Speculative Cleanup: nullptr client for ticket: %d", v2, v3, v4, v5, v6);
}

void sub_10042E68C(uint64_t *a1, NSObject *a2)
{
  uint64_t v2 = *a1;
  int v3 = 134217984;
  uint64_t v4 = v2;
  _os_log_debug_impl((void *)&_mh_execute_header, a2, OS_LOG_TYPE_DEBUG, "Speculative Cleanup: no requests for client %p.", (uint8_t *)&v3, 0xCu);
}

void sub_10042E708()
{
  sub_100010524();
  sub_1000104E4((void *)&_mh_execute_header, v0, v1, "Caller to connect() has expired", v2, v3, v4, v5, v6);
}

void sub_10042E73C()
{
  sub_100010524();
  sub_1000104E4((void *)&_mh_execute_header, v0, v1, "Caller to disconnect() has expired", v2, v3, v4, v5, v6);
}

void sub_10042E770()
{
  sub_100010524();
  _os_log_debug_impl((void *)&_mh_execute_header, v0, OS_LOG_TYPE_DEBUG, "disconnect called", v1, 2u);
}

void sub_10042E7B0()
{
  sub_100010524();
  sub_1000104E4((void *)&_mh_execute_header, v0, v1, "cleanupAfterClientDisconnection but client is nullptr", v2, v3, v4, v5, v6);
}

void sub_10042E7E4()
{
  sub_100010524();
  _os_log_debug_impl((void *)&_mh_execute_header, v0, OS_LOG_TYPE_DEBUG, "cleanupAfterClientDisconnection called", v1, 2u);
}

void sub_10042E824()
{
}

void sub_10042E850()
{
  sub_10001AC8C();
  sub_10000B3E0((void *)&_mh_execute_header, v0, v1, "#ses-wifi-test,[Session] failed to add peers. %@", v2, v3, v4, v5, v6);
}

void sub_10042E8B8(os_log_t log)
{
  *(_WORD *)uint64_t v1 = 0;
  _os_log_fault_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_FAULT, "#ses-wifi-test,NINearbyObject objectFromBluetoothDevice returned nil.", v1, 2u);
}

void sub_10042E8FC(os_log_t log)
{
  *(_WORD *)uint64_t v1 = 0;
  _os_log_error_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_ERROR, "#ses-wifi-test,device is nil for triggering wifi ranging", v1, 2u);
}

void sub_10042E940(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_10042E9B8(uint64_t *a1, NSObject *a2)
{
  uint64_t v2 = *a1;
  int v3 = 138412290;
  uint64_t v4 = v2;
  _os_log_fault_impl((void *)&_mh_execute_header, a2, OS_LOG_TYPE_FAULT, "#ses-wifi-test,Configuration did not contain expected role: %@", (uint8_t *)&v3, 0xCu);
}

void sub_10042EA34()
{
  sub_10001AC8C();
  _os_log_fault_impl((void *)&_mh_execute_header, v0, OS_LOG_TYPE_FAULT, "#ses-wifi-test,Invalid ranging role: %@", v1, 0xCu);
}

void sub_10042EAA8(os_log_t log)
{
  *(_WORD *)uint64_t v1 = 0;
  _os_log_error_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_ERROR, "#ses-wifi-test,device is nil for stopping wifi ranging", v1, 2u);
}

void sub_10042EAEC(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_10042EB64(char *a1, void *a2, os_log_t log)
{
  if (*a1 >= 0) {
    int v3 = a2;
  }
  else {
    int v3 = (void *)*a2;
  }
  int v4 = 136380675;
  uint64_t v5 = v3;
  _os_log_error_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_ERROR, "#ses-wifi-test,WiFi ranging error:%{private}s", (uint8_t *)&v4, 0xCu);
}

void sub_10042EBF0()
{
  sub_10001AC8C();
  sub_10000B3E0((void *)&_mh_execute_header, v0, v1, "#ses-wifi-test,failed to pause session inside _peerInactivityPeriodExceeded: %@", v2, v3, v4, v5, v6);
}

void sub_10042EC58()
{
  sub_10001AC8C();
  sub_10000B3E0((void *)&_mh_execute_header, v0, v1, "#ses-wifi-test,_peerInactivityPeriodExceeded but peer token is not cached %@", v2, v3, v4, v5, v6);
}

void sub_10042ECC0(char a1, uint64_t a2, os_log_t log)
{
  CFStringRef v3 = @"YES";
  if ((a1 & 1) == 0) {
    CFStringRef v3 = @"NO";
  }
  int v4 = 138412546;
  CFStringRef v5 = v3;
  __int16 v6 = 2112;
  uint64_t v7 = a2;
  _os_log_error_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_ERROR, "Accessory notify is attached: %@ accessory: %@ but modelNumber is nil", (uint8_t *)&v4, 0x16u);
}

void sub_10042ED60(uint64_t a1, NSObject *a2)
{
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_error_impl((void *)&_mh_execute_header, a2, OS_LOG_TYPE_ERROR, "regulatory,acc,Accessory detached, but was not connected. UUID: %@", (uint8_t *)&v2, 0xCu);
}

void sub_10042EDD8()
{
  sub_100010524();
  _os_log_debug_impl((void *)&_mh_execute_header, v0, OS_LOG_TYPE_DEBUG, "#reg-prov,using default regulatory group: US", v1, 2u);
}

void sub_10042EE18(uint64_t a1, NSObject *a2)
{
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_debug_impl((void *)&_mh_execute_header, a2, OS_LOG_TYPE_DEBUG, "#reg-prov,user provided regulatory group: %@", (uint8_t *)&v2, 0xCu);
}

void sub_10042EE90()
{
  sub_100010524();
  _os_log_error_impl((void *)&_mh_execute_header, v0, OS_LOG_TYPE_ERROR, "#reg-prov,received invalid message", v1, 2u);
}

void sub_10042EED0()
{
  sub_100010524();
  _os_log_fault_impl((void *)&_mh_execute_header, v0, OS_LOG_TYPE_FAULT, "#reg-prov,PRRegulatoryNBUWBState is disallowed, but does not have a reason.", v1, 2u);
}

void sub_10042EF10()
{
  sub_100010524();
  _os_log_fault_impl((void *)&_mh_execute_header, v0, OS_LOG_TYPE_FAULT, "#reg-prov,PRRegulatoryUWBState is disallowed with reason UwbSwitch.", v1, 2u);
}

void sub_10042EF50(uint64_t *a1, char a2, os_log_t log)
{
  if (*((char *)a1 + 23) >= 0) {
    uint64_t v3 = a1;
  }
  else {
    uint64_t v3 = (uint64_t *)*a1;
  }
  int v4 = 136315394;
  CFStringRef v5 = v3;
  __int16 v6 = 1024;
  int v7 = a2 & 1;
  _os_log_debug_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_DEBUG, "#reg-prov,injectIsoCode,isoCountryCode:%s,success:%d", (uint8_t *)&v4, 0x12u);
}

void sub_10042EFEC()
{
  sub_100010524();
  _os_log_error_impl((void *)&_mh_execute_header, v0, OS_LOG_TYPE_ERROR, "#reg-prov,injectNarrowbandSARState,exited early,device does not support SAR", v1, 2u);
}

void sub_10042F02C()
{
}

void sub_10042F058()
{
  __assert_rtn("-[_FindingAdvertiser _peerIndexReferenceForAdvertisementType:outPeers:outAdvertisements:]", "NIServerFindingDiscovery.mm", 345, "(*outPeers).count == 0 || _spatialInteractionCurrentPeerIndex < (*outPeers).count");
}

void sub_10042F084()
{
  __assert_rtn("-[_FindingAdvertiser _peerIndexReferenceForAdvertisementType:outPeers:outAdvertisements:]", "NIServerFindingDiscovery.mm", 344, "(*outPeers).count == (*outAdvertisements).count");
}

void sub_10042F0B0()
{
  __assert_rtn("-[_FindingAdvertiser _peerIndexReferenceForAdvertisementType:outPeers:outAdvertisements:]", "NIServerFindingDiscovery.mm", 352, "(*outPeers).count == 0 || _nearbyActionNoWakeCurrentPeerIndex < (*outPeers).count");
}

void sub_10042F0DC()
{
  __assert_rtn("-[_FindingAdvertiser _peerIndexReferenceForAdvertisementType:outPeers:outAdvertisements:]", "NIServerFindingDiscovery.mm", 351, "(*outPeers).count == (*outAdvertisements).count");
}

void sub_10042F108()
{
  sub_100010524();
  sub_100056C38((void *)&_mh_execute_header, v0, v1, "#find-disc,NearbyActionNoWake: could not generate auth tag for advertiser", v2, v3, v4, v5, v6);
}

void sub_10042F13C()
{
  sub_10019B14C();
  sub_10031306C((void *)&_mh_execute_header, v0, v1, "#find-disc,NearbyActionNoWake: advertiser activation error [%0.6f s]: %@", v2, v3, v4, v5, v6);
}

void sub_10042F1A4()
{
  sub_100010524();
  sub_100056C38((void *)&_mh_execute_header, v0, v1, "#find-disc,Invalid key for auth tag", v2, v3, v4, v5, v6);
}

void sub_10042F1D8()
{
  sub_100010524();
  sub_100056C38((void *)&_mh_execute_header, v0, v1, "#find-disc,SpatialInteraction: could not extract token contents", v2, v3, v4, v5, v6);
}

void sub_10042F20C()
{
  sub_10019B14C();
  sub_10031306C((void *)&_mh_execute_header, v0, v1, "#find-disc,SpatialInteraction: advertiser activation error [%0.6f s]: %@", v2, v3, v4, v5, v6);
}

void sub_10042F274()
{
  sub_10019B14C();
  sub_10031306C((void *)&_mh_execute_header, v0, v1, "#find-disc,Controller activation error [%0.6f s]: %@", v2, v3, v4, v5, v6);
}

void sub_10042F2DC()
{
  sub_10019B14C();
  sub_10031306C((void *)&_mh_execute_header, v0, v1, "#find-disc,Address observer activation error [%0.6f s]: %@", v2, v3, v4, v5, v6);
}

void sub_10042F344(uint64_t a1, NSObject *a2)
{
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_error_impl((void *)&_mh_execute_header, a2, OS_LOG_TYPE_ERROR, "#find-disc,Start advertising error: %@", (uint8_t *)&v2, 0xCu);
}

void sub_10042F3BC(uint64_t a1, NSObject *a2)
{
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_error_impl((void *)&_mh_execute_header, a2, OS_LOG_TYPE_ERROR, "#find-disc,Stop advertising error: %@", (uint8_t *)&v2, 0xCu);
}

void sub_10042F434()
{
  sub_100010524();
  sub_1000104E4((void *)&_mh_execute_header, v0, v1, "#find-disc,Race condition (scan peer was removed before device found)", v2, v3, v4, v5, v6);
}

void sub_10042F468()
{
  sub_100010524();
  sub_1000104E4((void *)&_mh_execute_header, v0, v1, "#find-disc,Device found, but scanner nil / not activated", v2, v3, v4, v5, v6);
}

void sub_10042F49C(uint64_t a1, uint64_t a2, uint8_t *buf, os_log_t log)
{
  *(_DWORD *)buf = 136315395;
  *(void *)(buf + 4) = a1;
  *((_WORD *)buf + 6) = 2113;
  *(void *)(buf + 14) = a2;
  _os_log_error_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_ERROR, "#find-disc,[%s] Found device (BT) but does not contain advertisement. Device: %{private}@", buf, 0x16u);
}

void sub_10042F4F4()
{
  sub_100010524();
  sub_1000104E4((void *)&_mh_execute_header, v0, v1, "#find-disc,Address changed, but observer nil / not activated", v2, v3, v4, v5, v6);
}

void sub_10042F528()
{
  sub_100010524();
  sub_1000104E4((void *)&_mh_execute_header, v0, v1, "#find-disc,State changed, but controller nil / not activated", v2, v3, v4, v5, v6);
}

void sub_10042F55C(unint64_t a1, NSObject *a2)
{
  int v3 = 136315138;
  uint64_t v4 = sub_10030D990(a1);
  _os_log_fault_impl((void *)&_mh_execute_header, a2, OS_LOG_TYPE_FAULT, "#find-disc,Unexpected BT state: %s", (uint8_t *)&v3, 0xCu);
}

void sub_10042F5E8()
{
  sub_100010524();
  sub_1000104E4((void *)&_mh_execute_header, v0, v1, "#find-disc,BT interrupted, but controller nil / not activated", v2, v3, v4, v5, v6);
}

void sub_10042F61C(uint64_t a1, uint64_t a2, uint8_t *buf, os_log_t log)
{
  *(_DWORD *)buf = 136315394;
  *(void *)(buf + 4) = a1;
  *((_WORD *)buf + 6) = 2112;
  *(void *)(buf + 14) = a2;
  _os_log_error_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_ERROR, "#find-disc,[%s] BT error: %@", buf, 0x16u);
}

void sub_10042F674()
{
  sub_10019B14C();
  sub_10031306C((void *)&_mh_execute_header, v0, v1, "#find-disc,NearbyActionNoWake: scanner activation error [%0.6f s]: %@", v2, v3, v4, v5, v6);
}

void sub_10042F6DC()
{
  sub_10019B14C();
  sub_10031306C((void *)&_mh_execute_header, v0, v1, "#find-disc,SpatialInteraction: scanner activation error [%0.6f s]: %@", v2, v3, v4, v5, v6);
}

void sub_10042F744()
{
  sub_10019B14C();
  sub_10031306C((void *)&_mh_execute_header, v0, v1, "#find-disc,SpatialInteraction: error adding token [%0.6f s]: %@", v2, v3, v4, v5, v6);
}

void sub_10042F7AC()
{
  sub_100010524();
  sub_1000104E4((void *)&_mh_execute_header, v0, v1, "#find-disc,CBDevice doesn't contain address", v2, v3, v4, v5, v6);
}

void sub_10042F7E0()
{
  sub_100010524();
  sub_1000104E4((void *)&_mh_execute_header, v0, v1, "#find-disc,CBDevice doesn't contain token data", v2, v3, v4, v5, v6);
}

void sub_10042F814()
{
  sub_100010524();
  sub_1000104E4((void *)&_mh_execute_header, v0, v1, "#find-disc,CBDevice doesn't contain auth tag", v2, v3, v4, v5, v6);
}

void sub_10042F848()
{
  sub_100010524();
  sub_1000104E4((void *)&_mh_execute_header, v0, v1, "#find-disc,CBDevice spatialInteractionUWBConfigData doesn't contain expected number of bytes", v2, v3, v4, v5, v6);
}

void sub_10042F87C()
{
  sub_100010524();
  sub_1000104E4((void *)&_mh_execute_header, v0, v1, "#find-disc,CBDevice spatialInteractionUWBConfigData PrecisionFindingEnabled flag not set", v2, v3, v4, v5, v6);
}

void sub_10042F8B0()
{
  sub_100010524();
  sub_100056C38((void *)&_mh_execute_header, v0, v1, "#find-disc,Couldn't generate advertisement from byte representation: too big", v2, v3, v4, v5, v6);
}

void sub_10042F8E4(int *a1, NSObject *a2)
{
  int v2 = *a1;
  v3[0] = 67109120;
  v3[1] = v2;
  _os_log_fault_impl((void *)&_mh_execute_header, a2, OS_LOG_TYPE_FAULT, "#find-disc,Couldn't generate advertisement from byte representation: decode error: %d", (uint8_t *)v3, 8u);
}

void sub_10042F960()
{
  sub_100010524();
  sub_1000104E4((void *)&_mh_execute_header, v0, v1, "#nrby-eng,Could not configure bias estimator, bypassing bias estimation.", v2, v3, v4, v5, v6);
}

void sub_10042F994()
{
  sub_100010524();
  sub_1000104E4((void *)&_mh_execute_header, v0, v1, "#nrby-eng,#spatialGesturesPredictor Error in obtaining trained model weights filepath, defaulting to no intent predictor", v2, v3, v4, v5, v6);
}

void sub_10042F9C8(uint8_t *buf, uint64_t a2, os_log_t log)
{
  *(_DWORD *)buf = 134217984;
  *(void *)(buf + 4) = a2;
  _os_log_debug_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_DEBUG, "#nrby-eng,#region-class elements in regionDict: %lu", buf, 0xCu);
}

void sub_10042FA10(int a1, NSObject *a2)
{
  v2[0] = 67109120;
  v2[1] = a1;
  _os_log_error_impl((void *)&_mh_execute_header, a2, OS_LOG_TYPE_ERROR, "#nrby-eng,#intentPredictorDefaultsWrite Invalid defaults write value of %d for type of user intent predictor, defaulting to Spatial Gestures predictor.", (uint8_t *)v2, 8u);
}

void sub_10042FA88()
{
  sub_100010524();
  _os_log_fault_impl((void *)&_mh_execute_header, v0, OS_LOG_TYPE_FAULT, "#nrby-eng,Unexpected call to provideFindingSolution", v1, 2u);
}

void sub_10042FAC8()
{
  sub_100010524();
  sub_1000104E4((void *)&_mh_execute_header, v0, v1, "#nrby-eng,acceptRoseSolution - rejected due to missing timestamp.", v2, v3, v4, v5, v6);
}

void sub_10042FAFC()
{
  sub_100010524();
  sub_1000104E4((void *)&_mh_execute_header, v0, v1, "#nrby-eng,Solution does not have raw rose measurement.", v2, v3, v4, v5, v6);
}

void sub_10042FB30()
{
  sub_100010524();
  sub_10016F0D8((void *)&_mh_execute_header, v0, v1, "#nrby-eng,#pb-bias Logging bias est input", v2, v3, v4, v5, v6);
}

void sub_10042FB64()
{
  sub_100010524();
  sub_1000104E4((void *)&_mh_execute_header, v0, v1, "#nrby-eng,acceptRoseSolution - OTHER", v2, v3, v4, v5, v6);
}

void sub_10042FB98()
{
}

void sub_10042FBC4()
{
  sub_100010524();
  sub_10016F0D8((void *)&_mh_execute_header, v0, v1, "#nrby-eng,Can not create a token, skipping fetching peer data from container", v2, v3, v4, v5, v6);
}

void sub_10042FBF8()
{
  sub_100010524();
  sub_10016F0D8((void *)&_mh_execute_header, v0, v1, "#nrby-eng,Fetching peer data from container using cached finding peer token", v2, v3, v4, v5, v6);
}

void sub_10042FC2C()
{
  sub_100010524();
  sub_10016F0D8((void *)&_mh_execute_header, v0, v1, "#nrby-eng,Fetching peer data from container using token derived from missed range mac addr", v2, v3, v4, v5, v6);
}

void sub_10042FC60()
{
  sub_100010524();
  sub_10016F0D8((void *)&_mh_execute_header, v0, v1, "#nrby-eng,acceptMissedRangeResult", v2, v3, v4, v5, v6);
}

void sub_10042FC94()
{
  sub_100010524();
  sub_10016F0D8((void *)&_mh_execute_header, v0, v1, "#nrby-eng,unsuccessful ranging solution received", v2, v3, v4, v5, v6);
}

void sub_10042FCC8(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_10042FD38()
{
}

void sub_10042FD64()
{
}

void sub_10042FD90()
{
  sub_100010524();
  sub_1000104E4((void *)&_mh_execute_header, v0, v1, "#nrby-eng,#bias-est Did not receive RTT-TAT info, cannot estimate bias.", v2, v3, v4, v5, v6);
}

void sub_10042FDC4()
{
}

void sub_10042FDF0()
{
}

void sub_10042FE1C()
{
  sub_100010524();
  sub_1000104E4((void *)&_mh_execute_header, v0, v1, "#nrby-eng,_handleRangeOnlySolution failed to convert identifier to object.", v2, v3, v4, v5, v6);
}

void sub_10042FE50()
{
  sub_100010524();
  sub_1000104E4((void *)&_mh_execute_header, v0, v1, "#nrby-eng,Solution input to _shouldConsumeRoseSolution has no raw rose measurement.", v2, v3, v4, v5, v6);
}

void sub_10042FE84()
{
  sub_100010524();
  sub_10016F0D8((void *)&_mh_execute_header, v0, v1, "#nrby-eng,Session type does not support mmsValStatus info.", v2, v3, v4, v5, v6);
}

void sub_10042FEB8()
{
  sub_10001AC8C();
  sub_10000B3E0((void *)&_mh_execute_header, v0, v1, "#nrby-eng,#regions, no object for identifier 0x%llx", v2, v3, v4, v5, v6);
}

void sub_10042FF20()
{
  sub_10001AC8C();
  _os_log_fault_impl((void *)&_mh_execute_header, v0, OS_LOG_TYPE_FAULT, "#nrby-eng,#regions no region for key: %@", v1, 0xCu);
}

void sub_10042FF94()
{
}

void sub_10042FFC0(char a1, uint64_t a2, os_log_t log)
{
  uint64_t v3 = "activated";
  if ((a1 & 1) == 0) {
    uint64_t v3 = "deactivated";
  }
  int v4 = 134218242;
  uint64_t v5 = a2;
  __int16 v6 = 2080;
  int v7 = v3;
  _os_log_debug_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_DEBUG, "#nrby-eng,#region-class device monitor for device 0x%llx was %s", (uint8_t *)&v4, 0x16u);
}

void sub_100430060(uint64_t *a1, uint8_t *buf, os_log_t log)
{
  uint64_t v3 = *a1;
  *(_DWORD *)buf = 134217984;
  *(void *)(buf + 4) = v3;
  _os_log_error_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_ERROR, "#nrby-eng,no object for identifier 0x%llx", buf, 0xCu);
}

void sub_1004300AC(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_100430128(uint64_t *a1, uint64_t a2, uint8_t *buf, os_log_t log)
{
  uint64_t v4 = *a1;
  uint64_t v5 = (void *)(a2 + 136);
  if (*(char *)(a2 + 159) < 0) {
    uint64_t v5 = (void *)*v5;
  }
  *(_DWORD *)buf = 134218242;
  *(void *)(buf + 4) = v4;
  *((_WORD *)buf + 6) = 2080;
  *(void *)(buf + 14) = v5;
  _os_log_debug_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_DEBUG, "#nrby-eng,#sa_algo,New measurement for SA with timestamp %f - unaccepted type for SA. Unique identifier: %s", buf, 0x16u);
}

void sub_100430194()
{
  sub_100010524();
  sub_10016F0D8((void *)&_mh_execute_header, v0, v1, "#nrby-eng,CLGnssExtensions,acceptGnssSatelliteData", v2, v3, v4, v5, v6);
}

void sub_1004301C8()
{
  sub_100010524();
  sub_10016F0D8((void *)&_mh_execute_header, v0, v1, "#nrby-eng,acceptPedometerData", v2, v3, v4, v5, v6);
}

void sub_1004301FC()
{
  sub_100010524();
  sub_10016F0D8((void *)&_mh_execute_header, v0, v1, "#nrby-eng,acceptPedometerEvent", v2, v3, v4, v5, v6);
}

void sub_100430230()
{
  sub_100010524();
  sub_10016F0D8((void *)&_mh_execute_header, v0, v1, "#nrby-eng,acceptMotionActivity", v2, v3, v4, v5, v6);
}

void sub_100430264()
{
  sub_100010524();
  sub_10016F0D8((void *)&_mh_execute_header, v0, v1, "#nrby-eng,acceptPDRInput", v2, v3, v4, v5, v6);
}

void sub_100430298(uint64_t *a1, uint64_t a2, os_log_t log)
{
  uint64_t v3 = *a1;
  int v4 = 138412546;
  uint64_t v5 = v3;
  __int16 v6 = 2112;
  uint64_t v7 = a2;
  _os_log_fault_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_FAULT, "#nrby-eng,Mismatching finding peer token: %@ != %@", (uint8_t *)&v4, 0x16u);
}

void sub_100430324()
{
  sub_100010524();
  sub_1000104E4((void *)&_mh_execute_header, v0, v1, "#nrby-eng,_nearbyObjectFromSolution:ForPeer - failed to create NI Object", v2, v3, v4, v5, v6);
}

void sub_100430358()
{
  sub_100010524();
  sub_1000104E4((void *)&_mh_execute_header, v0, v1, "#nrby-eng,_nearbyObjectFromToken - no data source", v2, v3, v4, v5, v6);
}

void sub_10043038C()
{
  sub_10001AC8C();
  sub_10000B3E0((void *)&_mh_execute_header, v0, v1, "#nrby-eng,_nearbyObjectFromToken - no identifier for token: %@", v2, v3, v4, v5, v6);
}

void sub_1004303F4()
{
  sub_10001AC8C();
  sub_10000B3E0((void *)&_mh_execute_header, v0, v1, "#nrby-eng,_nearbyObjectFromToken - no NINearbyObject for identifier: %lld", v2, v3, v4, v5, v6);
}

void sub_10043045C()
{
  sub_10001AC8C();
  sub_10000B3E0((void *)&_mh_execute_header, v0, v1, "#nrby-eng,nearbyObjectFromDeviceIdentifier - convert token %@ to object", v2, v3, v4, v5, v6);
}

void sub_1004304C4(char *a1, uint8_t *buf, os_log_t log)
{
  if (a1[23] >= 0) {
    uint64_t v4 = a1;
  }
  else {
    uint64_t v4 = *(char **)a1;
  }
  *(_DWORD *)buf = 136315138;
  *(void *)(buf + 4) = v4;
  _os_log_debug_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_DEBUG, "#nrby-eng,%s", buf, 0xCu);
  if (a1[23] < 0) {
    operator delete(*(void **)a1);
  }
}

void sub_100430538()
{
  sub_10001AC8C();
  _os_log_debug_impl((void *)&_mh_execute_header, v0, OS_LOG_TYPE_DEBUG, "#nrby-eng,Peer data token hash %{private}llu", v1, 0xCu);
}

void sub_1004305AC(void **a1)
{
  if (*((char *)a1 + 23) < 0) {
    sub_1003220B8(a1);
  }
}

void sub_1004305BC()
{
}

void sub_1004305DC()
{
}

void sub_1004305FC(os_log_t log)
{
  *(_WORD *)uint64_t v1 = 0;
  _os_log_error_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_ERROR, "Failed to format protobuf file name", v1, 2u);
}

void sub_100430640(os_log_t log)
{
  *(_WORD *)uint64_t v1 = 0;
  _os_log_error_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_ERROR, "Failed to observe default. defaultName or callback is nil", v1, 2u);
}

void sub_100430684(uint64_t a1, NSObject *a2)
{
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_error_impl((void *)&_mh_execute_header, a2, OS_LOG_TYPE_ERROR, "No subscription for user default change: %@", (uint8_t *)&v2, 0xCu);
}

void sub_1004306FC()
{
  __assert_rtn("append", "AlishaDCKCoder.cpp", 232, "msg.size() + sizeof(data) <= kMaxMessageSize");
}

void sub_100430728()
{
  __assert_rtn("append", "AlishaDCKCoder.cpp", 240, "msg.size() + sizeof(data) <= kMaxMessageSize");
}

void sub_100430754()
{
  __assert_rtn("append", "AlishaDCKCoder.cpp", 250, "msg.size() + sizeof(data) <= kMaxMessageSize");
}

void sub_100430780()
{
  __assert_rtn("readAndAdvance", "AlishaDCKCoder.cpp", 182, "msg.size() <= kMaxMessageSize");
}

void sub_1004307AC()
{
  __assert_rtn("readAndAdvance", "AlishaDCKCoder.cpp", 183, "offset + sizeof(val) <= msg.size()");
}

void sub_1004307D8()
{
  __assert_rtn("readAndAdvance", "AlishaDCKCoder.cpp", 191, "offset + sizeof(val) <= msg.size()");
}

void sub_100430804()
{
  __assert_rtn("readAndAdvance", "AlishaDCKCoder.cpp", 200, "offset + sizeof(val) <= msg.size()");
}

void sub_100430830()
{
  __assert_rtn("decodeRangingSessionRQ", "AlishaDCKCoder.cpp", 744, "offset == msg.size()");
}

void sub_10043085C()
{
  __assert_rtn("decodeRangingSessionSetupRQ", "AlishaDCKCoder.cpp", 813, "offset == msg.size()");
}

void sub_100430888()
{
  __assert_rtn("decodeRangingSuspendRQ", "AlishaDCKCoder.cpp", 865, "offset == msg.size()");
}

void sub_1004308B4()
{
  __assert_rtn("decodeRangingSuspendRS", "AlishaDCKCoder.cpp", 884, "offset == msg.size()");
}

void sub_1004308E0()
{
  __assert_rtn("decodeRangingRecoveryRQ", "AlishaDCKCoder.cpp", 903, "offset == msg.size()");
}

void sub_10043090C()
{
  __assert_rtn("decodeConfigurableRangingRecoveryRQ", "AlishaDCKCoder.cpp", 945, "offset == msg.size()");
}

void sub_100430938(uint64_t a1)
{
  int v2 = *(void **)a1;
  if (v2)
  {
    *(void *)(a1 + 8) = v2;
    operator delete(v2);
  }
}

void sub_100430950(int a1)
{
  sub_100333FC8(a1, __p);
  sub_100186DAC();
  sub_1003376D0();
  sub_100186D8C((void *)&_mh_execute_header, v1, v2, "#alisha-sm,Session RQ Get Key Failure (%s)", v3, v4, v5, v6, v7, (uint64_t)__p[0], (uint64_t)__p[1], v9, v10);
  if (SHIBYTE(v9) < 0) {
    operator delete(__p[0]);
  }
}

void sub_1004309E8(uint64_t a1)
{
  int v2 = *(void **)(a1 + 16);
  if (v2)
  {
    *(void *)(a1 + 24) = v2;
    operator delete(v2);
  }
}

void sub_100430A10(uint64_t a1, void *a2)
{
  sub_100004950(__p, "SecureRangingSetupFlow");
  sub_1003376DC();
  sub_1003376D0();
  sub_1003376F0((void *)&_mh_execute_header, v3, v4, "#alisha-sm,%s is not a recovery flow", v5, v6, v7, v8, v9, (uint64_t)__p[0], (uint64_t)__p[1], v11, v12);
  if (SHIBYTE(v11) < 0) {
    operator delete(__p[0]);
  }
  *a2 = qword_1008ABDE0;
}

void sub_100430ACC(int a1)
{
  sub_100333FC8(a1, __p);
  sub_100186DAC();
  sub_1003376D0();
  sub_100186D8C((void *)&_mh_execute_header, v1, v2, "#alisha-sm,Recovery RQ Get Key Failure (%s)", v3, v4, v5, v6, v7, (uint64_t)__p[0], (uint64_t)__p[1], v9, v10);
  if (SHIBYTE(v9) < 0) {
    operator delete(__p[0]);
  }
}

void sub_100430B64()
{
}

void sub_100430B90(int a1)
{
  sub_100333FC8(a1, __p);
  sub_100186DAC();
  sub_1003376D0();
  sub_100186D8C((void *)&_mh_execute_header, v1, v2, "#alisha-sm,processDCKSuspendRS error: disable ranging failed (%s)", v3, v4, v5, v6, v7, (uint64_t)__p[0], (uint64_t)__p[1], v9, v10);
  if (SHIBYTE(v9) < 0) {
    operator delete(__p[0]);
  }
}

void sub_100430C28(char a1, NSObject *a2)
{
  sub_100334B30(a1, &__p);
  sub_100186DAC();
  sub_1003376D0();
  _os_log_fault_impl((void *)&_mh_execute_header, a2, OS_LOG_TYPE_FAULT, "#alisha-sm,processDCKSuspendRS error: not expecting suspend response in state %s", buf, 0xCu);
  if (v4 < 0) {
    operator delete(__p);
  }
}

void sub_100430CD4(uint64_t a1, void *a2)
{
  sub_100004950(__p, "SessionRequested");
  sub_1003376DC();
  sub_1003376D0();
  sub_1003376F0((void *)&_mh_execute_header, v3, v4, "#alisha-sm,Unexpected alisha timeout event %s is sent to alisha state machine", v5, v6, v7, v8, v9, (uint64_t)__p[0], (uint64_t)__p[1], v11, v12);
  if (SHIBYTE(v11) < 0) {
    operator delete(__p[0]);
  }
  *a2 = qword_1008ABDE0;
}

void sub_100430D90(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_100430E08(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_100430E80(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_100430EF8(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_100430F70(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_100430FE8()
{
}

void sub_100431014(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_10043108C(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_100431104(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_10043117C(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_1004311F4(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_10043126C()
{
}

void sub_100431298(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_100431310(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_100431388()
{
}

void sub_1004313B4()
{
}

void sub_1004313E0()
{
}

void sub_10043140C()
{
}

void sub_100431438()
{
  __assert_rtn("processErrorCodeFromDCKMessageProcessing", "AlishaDCKEventNotificationGenerator.cpp", 23, "errorCode != StatusCode::SUCCESS");
}

void sub_100431464()
{
  sub_1001BE628();
  _os_log_error_impl((void *)&_mh_execute_header, v0, OS_LOG_TYPE_ERROR, "#sa_algo,Received pose earlier than the last pose in history with timestamp: %f - pose rejected", v1, 0xCu);
}

void sub_1004314DC()
{
  sub_100010524();
  sub_10016F0D8((void *)&_mh_execute_header, v0, v1, "#sa_algo,Rejected measurement without AoA for the AoA cache", v2, v3, v4, v5, v6);
}

void sub_100431510()
{
  sub_1002B6514();
  sub_1002B652C((void *)&_mh_execute_header, v0, v1, "#sa_algo,Populating range output with range filter, range: %0.2f m, timestamp: %f s", v2, v3, v4, v5, v6);
}

void sub_10043157C()
{
  sub_1002B6514();
  sub_1002B652C((void *)&_mh_execute_header, v0, v1, "#sa_algo,Populating range output from AoA meas without VIO, range: %0.2f m, timestamp: %f s", v2, v3, v4, v5, v6);
}

void sub_1004315E8()
{
  sub_1002B6514();
  sub_1002B652C((void *)&_mh_execute_header, v0, v1, "#sa_algo,Not populating direction or range output from AoA meas without VIO, measurement time %f s is too stale compared to current time %f s", v2, v3, v4, v5, v6);
}

void sub_100431654()
{
  sub_1002B6514();
  sub_1002B652C((void *)&_mh_execute_header, v0, v1, "#sa_algo,Populating range output from AoA meas with VIO, range: %0.2f m, timestamp: %f s", v2, v3, v4, v5, v6);
}

void sub_1004316C0()
{
  sub_1002B6514();
  sub_1002B652C((void *)&_mh_execute_header, v0, v1, "#sa_algo,Not populating direction from AoA meas with VIO, timestamp: %f s, calculated range %5.4f is too small to calculate direction", v2, v3, v4, v5, v6);
}

void sub_10043172C()
{
  sub_1002B6514();
  sub_1002B652C((void *)&_mh_execute_header, v0, v1, "#sa_algo,Populating horizontal angle output with SA, angle: %3.2f deg, timestamp: %f s", v2, v3, v4, v5, v6);
}

double sub_100431798(uint64_t a1, float *a2, uint8_t *buf, os_log_t log)
{
  uint64_t v4 = *(void *)(a1 + 24);
  double v5 = *a2;
  *(_DWORD *)buf = 134218240;
  *(double *)(buf + 4) = v5;
  *((_WORD *)buf + 6) = 2048;
  *(void *)(buf + 14) = v4;
  _os_log_debug_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_DEBUG, "#sa_algo,Populating range output with SA, range: %0.2f m, timestamp: %f s", buf, 0x16u);
  return result;
}

void sub_1004317FC()
{
  sub_1001BE628();
  sub_1001BE5B8((void *)&_mh_execute_header, v0, v1, "#sa_algo,Populating vertical state output with SA, VerticalStateUnknown, timestamp: %f s", v2, v3, v4, v5, v6);
}

void sub_100431868()
{
  sub_1001BE628();
  sub_1001BE5B8((void *)&_mh_execute_header, v0, v1, "#sa_algo,Populating vertical state output with SA, VerticalStateSame, timestamp: %f s", v2, v3, v4, v5, v6);
}

void sub_1004318D4()
{
  sub_1001BE628();
  sub_1001BE5B8((void *)&_mh_execute_header, v0, v1, "#sa_algo,Populating vertical state output with SA, VerticalStateAbove, timestamp: %f s", v2, v3, v4, v5, v6);
}

void sub_100431940()
{
  sub_1001BE628();
  sub_1001BE5B8((void *)&_mh_execute_header, v0, v1, "#sa_algo,Populating vertical state output with SA, VerticalStateBelow, timestamp: %f s", v2, v3, v4, v5, v6);
}

void sub_1004319AC()
{
  sub_1001BE628();
  sub_1001BE5B8((void *)&_mh_execute_header, v0, v1, "#sa_algo,Populating vertical state output with SA, VerticalStateAboveOrBelow, timestamp: %f s", v2, v3, v4, v5, v6);
}

void sub_100431A18()
{
  sub_100010524();
  sub_10016F0D8((void *)&_mh_execute_header, v0, v1, "#sa_algo,AoA cache: empty", v2, v3, v4, v5, v6);
}

void sub_100431A4C()
{
  sub_100010524();
  sub_10016F0D8((void *)&_mh_execute_header, v0, v1, "#sa_algo,AoA cache: no world position", v2, v3, v4, v5, v6);
}

void sub_100431A80()
{
  sub_100010524();
  sub_10016F0D8((void *)&_mh_execute_header, v0, v1, "#sa_algo,AoA cache: NotPossibleToInterpolate", v2, v3, v4, v5, v6);
}

void sub_100431AB4()
{
  sub_100010524();
  sub_10016F0D8((void *)&_mh_execute_header, v0, v1, "#sa_algo,AoA cache: Interpolatable", v2, v3, v4, v5, v6);
}

void sub_100431AE8()
{
  sub_100010524();
  sub_10016F0D8((void *)&_mh_execute_header, v0, v1, "#sa_algo,AoA cache: Interpolated", v2, v3, v4, v5, v6);
}

void sub_100431B1C(void *a1, NSObject *a2)
{
  uint64_t v3 = a1[49];
  uint64_t v2 = a1[50];
  uint64_t v5 = a1[47];
  uint64_t v4 = a1[48];
  int v6 = 134218752;
  uint64_t v7 = v5;
  __int16 v8 = 2048;
  uint64_t v9 = v4;
  __int16 v10 = 2048;
  uint64_t v11 = v3;
  __int16 v12 = 2048;
  uint64_t v13 = v2;
  _os_log_debug_impl((void *)&_mh_execute_header, a2, OS_LOG_TYPE_DEBUG, "#sa_algo,AoA cache: time %f s, distance: %0.2f m, az: %3.2f rad, el: %3.2f rad", (uint8_t *)&v6, 0x2Au);
}

void sub_100431BB8()
{
  sub_1002B6514();
  sub_1002B652C((void *)&_mh_execute_header, v0, v1, "#sa_algo,Populating stale range filter solution, range: %0.2f m, timestamp: %f s", v2, v3, v4, v5, v6);
}

void sub_100431C24()
{
  sub_1002B6514();
  sub_1002B652C((void *)&_mh_execute_header, v0, v1, "#sa_algo,Populating range filter solution, range: %0.2f m, timestamp: %f s", v2, v3, v4, v5, v6);
}

void sub_100431C90()
{
  sub_1002B6514();
  sub_1002B652C((void *)&_mh_execute_header, v0, v1, "#sa_algo,Not populating range filter solution, filter time %f s is too stale compared to current time %f s", v2, v3, v4, v5, v6);
}

void sub_100431CFC(uint64_t a1)
{
  uint64_t v2 = *(void **)(a1 + 16);
  if (v2)
  {
    *(void *)(a1 + 24) = v2;
    operator delete(v2);
  }
}

void sub_100431D14()
{
  __assert_rtn("TransposeDataFootprint", "cnmatrix.h", 122, "scratch != nullptr");
}

void sub_100431D40()
{
}

void sub_100431D6C()
{
  __assert_rtn("FastResize", "cnmatrixbase.h", 2337, "in_nr >= 0");
}

void sub_100431D98()
{
  __assert_rtn("FastResize", "cnmatrixbase.h", 2339, "in_nr <= max_nr");
}

void sub_100431DC4()
{
  __assert_rtn("FastResize", "cnmatrixbase.h", 2340, "in_nc >= 0");
}

void sub_100431DF0()
{
  __assert_rtn("FastResize", "cnmatrixbase.h", 2342, "in_nc <= max_nc");
}

void sub_100431E1C()
{
  __assert_rtn("WriteValue", "cnmatrixbase.h", 1104, "data_ != __null");
}

void sub_100431E48()
{
  __assert_rtn("operator()", "cnmatrixbase.h", 913, "data_ != __null");
}

void sub_100431E74()
{
  __assert_rtn("operator()", "cnmatrixbase.h", 914, "idx >= 0");
}

void sub_100431EA0()
{
}

void sub_100431ECC()
{
  __assert_rtn("Transpose", "cnmatrixbase.h", 5010, "&(A) != &(B)");
}

void sub_100431EF8()
{
  __assert_rtn("operator()", "cnmatrixbase.h", 782, "data_ != __null");
}

void sub_100431F24()
{
  __assert_rtn("operator()", "cnmatrixbase.h", 783, "idx >= 0");
}

void sub_100431F50()
{
}

void sub_100431F7C()
{
  __assert_rtn("Subtract", "cnmatrixbase.h", 3677, "&(A) != &(C)");
}

void sub_100431FA8()
{
  __assert_rtn("Subtract", "cnmatrixbase.h", 3678, "&(B) != &(C)");
}

void sub_100431FD4()
{
  __assert_rtn("Subtract", "cnmatrixbase.h", 3675, "A.num_cols_ == B.num_cols_");
}

void sub_100432000()
{
  __assert_rtn("Subtract", "cnmatrixbase.h", 3674, "A.num_rows_ == B.num_rows_");
}

void sub_10043202C()
{
  __assert_rtn("Multiply", "cnmatrixbase.h", 3887, "&(A) != &(C)");
}

void sub_100432058()
{
  __assert_rtn("Multiply", "cnmatrixbase.h", 3888, "&(B) != &(C)");
}

void sub_100432084()
{
  __assert_rtn("Multiply", "cnmatrixbase.h", 3885, "A.num_cols_ == B.num_rows_");
}

void sub_1004320B0()
{
  __assert_rtn("Norm", "cnmatrixbase.h", 4504, "&A != &Acopy");
}

void sub_1004320DC()
{
  __assert_rtn("Norm", "cnmatrixbase.h", 4505, "&A != &Work");
}

void sub_100432108()
{
  __assert_rtn("Norm", "cnmatrixbase.h", 4506, "&A != &S");
}

void sub_100432134()
{
  __assert_rtn("Norm", "cnmatrixbase.h", 4507, "&Acopy != &Work");
}

void sub_100432160()
{
  __assert_rtn("Norm", "cnmatrixbase.h", 4508, "&Acopy != &S");
}

void sub_10043218C()
{
  __assert_rtn("Norm", "cnmatrixbase.h", 4509, "&Work != &S");
}

void sub_1004321B8()
{
  __assert_rtn("Norm", "cnmatrixbase.h", 4512, "Acopy.num_elements_ >= A.num_elements_");
}

void sub_1004321E4()
{
}

void sub_10043223C()
{
  __assert_rtn("Norm", "cnmatrixbase.h", 4716, "ret == 1");
}

void sub_100432294()
{
  __assert_rtn("SingularValues", "cnmatrixbase.h", 7028, "&A != &Acopy");
}

void sub_1004322C0()
{
  __assert_rtn("SingularValues", "cnmatrixbase.h", 7029, "&A != &Work");
}

void sub_1004322EC()
{
  __assert_rtn("SingularValues", "cnmatrixbase.h", 7030, "&A != &S");
}

void sub_100432318()
{
  __assert_rtn("SingularValues", "cnmatrixbase.h", 7031, "&Acopy != &Work");
}

void sub_100432344()
{
  __assert_rtn("SingularValues", "cnmatrixbase.h", 7032, "&Acopy != &S");
}

void sub_100432370()
{
  __assert_rtn("SingularValues", "cnmatrixbase.h", 7033, "&Work != &S");
}

void sub_10043239C()
{
  __assert_rtn("SingularValues", "cnmatrixbase.h", 7036, "ne >= 1");
}

void sub_1004323C8()
{
  __assert_rtn("SingularValues", "cnmatrixbase.h", 7037, "ne >= 3*minnrnc + maxnrnc");
}

void sub_1004323F4()
{
  __assert_rtn("SingularValues", "cnmatrixbase.h", 7038, "ne >= 5*minnrnc");
}

void sub_100432420()
{
  __assert_rtn("SingularValues", "cnmatrixbase.h", 7040, "Acopy.max_num_rows_ >= nrA");
}

void sub_10043244C()
{
  __assert_rtn("SingularValues", "cnmatrixbase.h", 7041, "Acopy.max_num_cols_ >= ncA");
}

void sub_100432478()
{
  __assert_rtn("SingularValues", "cnmatrixbase.h", 7042, "S.max_num_rows_ >= minnrnc");
}

void sub_1004324A4()
{
  __assert_rtn("SingularValues", "cnmatrixbase.h", 7043, "S.max_num_cols_ >= 1");
}

void sub_1004324D0()
{
  __assert_rtn("SingularValues", "cnmatrixbase.h", 7111, "info == 0");
}

void sub_1004324FC()
{
  __assert_rtn("operator=", "cnmatrixbase.h", 619, "this->max_num_rows_ >= A.num_rows_");
}

void sub_100432528()
{
  __assert_rtn("operator=", "cnmatrixbase.h", 620, "this->max_num_cols_ >= A.num_cols_");
}

void sub_100432554()
{
  __assert_rtn("Add", "cnmatrixbase.h", 3536, "&(A) != &(C)");
}

void sub_100432580()
{
  __assert_rtn("Add", "cnmatrixbase.h", 3537, "&(B) != &(C)");
}

void sub_1004325AC()
{
  __assert_rtn("Add", "cnmatrixbase.h", 3534, "A.num_cols_ == B.num_cols_");
}

void sub_1004325D8()
{
  __assert_rtn("Add", "cnmatrixbase.h", 3533, "A.num_rows_ == B.num_rows_");
}

void sub_100432604(os_log_t log)
{
  *(_WORD *)uint64_t v1 = 0;
  _os_log_debug_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_DEBUG, "#threshold-detector, Instantiated KALMAN_FILTER for bounded region range estimation", v1, 2u);
}

void sub_100432648(os_log_t log)
{
  *(_WORD *)uint64_t v1 = 0;
  _os_log_debug_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_DEBUG, "#threshold-detector, Instantiated MAX_OF_MEAN_OF_CHAN_FILTER for bounded region range estimation", v1, 2u);
}

void sub_10043268C(os_log_t log, __n128 a2)
{
  int v2 = 134218752;
  double v3 = a2.n128_f32[3];
  __int16 v4 = 2048;
  double v5 = a2.n128_f32[0];
  __int16 v6 = 2048;
  double v7 = a2.n128_f32[1];
  __int16 v8 = 2048;
  double v9 = a2.n128_f32[2];
  _os_log_debug_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_DEBUG, "#sa_algo_finder_io,io propagated pose, quatw: %f, quatx: %f, quaty: %f, quatz: %f", (uint8_t *)&v2, 0x2Au);
}

void sub_100432740()
{
  sub_100010524();
  sub_10016F0D8((void *)&_mh_execute_header, v0, v1, "#findalgs-findee, Providing BoundedDisplacement::WALKING_OR_UNKNOWN due to unknown motion state", v2, v3, v4, v5, v6);
}

void sub_100432774()
{
  sub_100010524();
  sub_10016F0D8((void *)&_mh_execute_header, v0, v1, "#findalgs-findee, Providing BoundedDisplacement::SLOWLY_MOVING", v2, v3, v4, v5, v6);
}

void sub_1004327A8()
{
  sub_100010524();
  sub_10016F0D8((void *)&_mh_execute_header, v0, v1, "#findalgs-findee, Providing BoundedDisplacement::WALKING_OR_UNKNOWN due to walking", v2, v3, v4, v5, v6);
}

void sub_1004327DC()
{
  sub_100010524();
  sub_10016F0D8((void *)&_mh_execute_header, v0, v1, "#findalgs-findee, Providing BoundedDisplacement::STATIC", v2, v3, v4, v5, v6);
}

void sub_100432810()
{
  sub_1001BE628();
  sub_1001BE5B8((void *)&_mh_execute_header, v0, v1, "#findalgs-findee, Velocity change applicability time %3.1f is larger than max - not providing velocity change", v2, v3, v4, v5, v6);
}

void sub_10043287C()
{
  sub_100347030();
  uint64_t v6 = v0;
  __int16 v7 = v1;
  uint64_t v8 = v2;
  __int16 v9 = v1;
  uint64_t v10 = v3;
  _os_log_debug_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEBUG, "#findalgs-findee, Providing measured delta v, H1: %f, H2: %f , applicable time: %f, transmission time: %f", v5, 0x2Au);
}

void sub_100432910()
{
  sub_1001BE628();
  sub_1001BE5B8((void *)&_mh_execute_header, v0, v1, "#findalgs-findee, PDR displacement applicability time %3.1f is larger than max - not providing PDR displacement", v2, v3, v4, v5, v6);
}

void sub_10043297C()
{
  sub_1001BE628();
  sub_1001BE5B8((void *)&_mh_execute_header, v0, v1, "#findalgs-findee, VIO applicability time %3.1f is larger than max - not providing VIO", v2, v3, v4, v5, v6);
}

void sub_1004329E8()
{
  sub_100010524();
  sub_10016F0D8((void *)&_mh_execute_header, v0, v1, "#findalgs-findee, providePeerData()", v2, v3, v4, v5, v6);
}

void sub_100432A1C()
{
  sub_1001BE628();
  sub_10000B3E0((void *)&_mh_execute_header, v0, v1, "#findalgs-findee, Calculated easterly offset %.1f is larger than max that can be sent over", v2, v3, v4, v5, v6);
}

void sub_100432A88()
{
  sub_1001BE628();
  sub_10000B3E0((void *)&_mh_execute_header, v0, v1, "#findalgs-findee, Calculated easterly offset %.1f is smaller than min that can be sent over", v2, v3, v4, v5, v6);
}

void sub_100432AF4()
{
  sub_1001BE628();
  sub_10000B3E0((void *)&_mh_execute_header, v0, v1, "#findalgs-findee, Calculated northerly offset %.1f is larger than max that can be sent over", v2, v3, v4, v5, v6);
}

void sub_100432B60()
{
  sub_1001BE628();
  sub_10000B3E0((void *)&_mh_execute_header, v0, v1, "#findalgs-findee, Calculated northerly offset %.1f is smaller than min that can be sent over", v2, v3, v4, v5, v6);
}

void sub_100432BCC()
{
  sub_1001BE628();
  sub_1001BE5B8((void *)&_mh_execute_header, v0, v1, "#findalgs-findee, FindeeAlgorithms::buildLocationData() Location recency = %f", v2, v3, v4, v5, v6);
}

void sub_100432C38()
{
  sub_100010524();
  _os_log_fault_impl((void *)&_mh_execute_header, v0, OS_LOG_TYPE_FAULT, "#findalgs-findee, FindeeAlgorithms::buildLocationData() Conversion of peer location time to mach continuous time failed", v1, 2u);
}

void sub_100432C78()
{
  sub_100010524();
  _os_log_error_impl((void *)&_mh_execute_header, v0, OS_LOG_TYPE_ERROR, "#findalgs-findee, cycleSkipping not populated in common::RangeResult", v1, 2u);
}

void sub_100432CB8()
{
  sub_1001BE634();
  _os_log_debug_impl((void *)&_mh_execute_header, v0, OS_LOG_TYPE_DEBUG, "#findalgs-findee, Got range result at timestamp %f, cycleIndex %u", v1, 0x12u);
}

void sub_100432D44()
{
  sub_1001BE634();
  _os_log_debug_impl((void *)&_mh_execute_header, v0, OS_LOG_TYPE_DEBUG, "#findalgs-findee, Got missed range result at timestamp %f, cycleIndex %u", v1, 0x12u);
}

void sub_100432DC0()
{
  sub_1001BE628();
  sub_10000B3E0((void *)&_mh_execute_header, v0, v1, "#findalgs-findee, Received pose earlier than the last pose in peer history with timestamp: %f - pose rejected", v2, v3, v4, v5, v6);
}

void sub_100432E2C()
{
  sub_100010524();
  sub_10016F0D8((void *)&_mh_execute_header, v0, v1, "#findalgs-findee, process(const common::Pose &pose)", v2, v3, v4, v5, v6);
}

void sub_100432E60()
{
  sub_100010524();
  sub_10016F0D8((void *)&_mh_execute_header, v0, v1, "#findalgs-findee, process(const common::DeviceMotion &deviceMotion)", v2, v3, v4, v5, v6);
}

void sub_100432E94(int a1, NSObject *a2)
{
  v2[0] = 67109120;
  v2[1] = a1;
  _os_log_debug_impl((void *)&_mh_execute_header, a2, OS_LOG_TYPE_DEBUG, "#findalgs-findee, Walking set to true, steps since last deleted step count: %d", (uint8_t *)v2, 8u);
}

void sub_100432F0C()
{
  sub_100010524();
  sub_10016F0D8((void *)&_mh_execute_header, v0, v1, "#findalgs-findee, process(const AltimeterInput &altData)", v2, v3, v4, v5, v6);
}

void sub_100432F40()
{
  sub_100010524();
  _os_log_fault_impl((void *)&_mh_execute_header, v0, OS_LOG_TYPE_FAULT, "#findalgs-findee, Received peer data on findee, unexpected.", v1, 2u);
}

void sub_100432F80()
{
  sub_100010524();
  sub_10016F0D8((void *)&_mh_execute_header, v0, v1, "#findalgs-findee, process(const LocationInput &loc)", v2, v3, v4, v5, v6);
}

void sub_100432FB4()
{
  sub_100010524();
  sub_10016F0D8((void *)&_mh_execute_header, v0, v1, "#findalgs-findee, #gri,findee,process(const std::vector<nearby::algorithms::finding::GnssSatelliteData> &gnssSatelliteData)", v2, v3, v4, v5, v6);
}

void sub_100432FE8()
{
  sub_100010524();
  sub_10016F0D8((void *)&_mh_execute_header, v0, v1, "#findalgs-findee, process(const MotionActivityInput &activity)", v2, v3, v4, v5, v6);
}

void sub_10043301C()
{
  sub_100010524();
  sub_10016F0D8((void *)&_mh_execute_header, v0, v1, "#findalgs-findee, missing a delta velocity input", v2, v3, v4, v5, v6);
}

void sub_100433050()
{
  sub_100010524();
  sub_10016F0D8((void *)&_mh_execute_header, v0, v1, "#findalgs-findee, no pdr input, processing delta velocity input", v2, v3, v4, v5, v6);
}

void sub_100433084()
{
  sub_100347030();
  uint64_t v3 = v0;
  _os_log_debug_impl((void *)&_mh_execute_header, v1, OS_LOG_TYPE_DEBUG, "#findalgs-findee, pdr mach time: %f, pdr cont time: %f", v2, 0x16u);
}

void sub_100433100()
{
  sub_100010524();
  sub_10016F0D8((void *)&_mh_execute_header, v0, v1, "#findalgs-findee, process(const PDRInput &pdr)", v2, v3, v4, v5, v6);
}

void sub_100433134()
{
  sub_100010524();
  sub_10016F0D8((void *)&_mh_execute_header, v0, v1, "#findalgs-findee, process(const WatchOrientationInput &watchOrientation)", v2, v3, v4, v5, v6);
}

void sub_100433168()
{
  sub_100010524();
  sub_10016F0D8((void *)&_mh_execute_header, v0, v1, "#findalgs-findee, process(const PedometerDataInput &pedData)", v2, v3, v4, v5, v6);
}

void sub_10043319C()
{
  sub_100010524();
  sub_10016F0D8((void *)&_mh_execute_header, v0, v1, "#findalgs-findee, process(const PedometerEventInput &pedEvent)", v2, v3, v4, v5, v6);
}

void sub_1004331D8(uint64_t a1, NSObject *a2, double a3)
{
  uint64_t v3 = *(void *)(a1 + 8);
  int v4 = 134218240;
  uint64_t v5 = v3;
  __int16 v6 = 2048;
  double v7 = a3;
  _os_log_error_impl((void *)&_mh_execute_header, a2, OS_LOG_TYPE_ERROR, "#sa_algo_batchfilter_with,Invalid measurement rejected by the batch filter filter, range passed: %f m, range uncertainty passed: %f m", (uint8_t *)&v4, 0x16u);
}

uint64_t sub_100433260(uint64_t result, uint64_t a2)
{
  uint64_t v2 = result + 112;
  do
  {
    *(void *)(result + 112) = off_100853598;
    *(void *)(result + 40) = off_100853598;
    result += 176;
    v2 += 176;
  }
  while (result != a2);
  return result;
}

void sub_1004332B4()
{
  __assert_rtn("operator()", "cnmatrixbase.h", 749, "data_ != __null");
}

void sub_1004332E0()
{
  __assert_rtn("operator()", "cnmatrixbase.h", 750, "idx >= 0");
}

void sub_10043330C()
{
}

void (***sub_100433338())(void)
{
  sub_100352E58();
  do
  {
    uint64_t v3 = *v2;
    v2 += 9;
    (*v3)();
    v1 += 72;
    double result = v2;
  }
  while (v2 != v0);
  return result;
}

void (***sub_100433394())(void)
{
  sub_100352E58();
  do
  {
    uint64_t v3 = *v2;
    v2 += 8;
    (*v3)();
    v1 += 64;
    double result = v2;
  }
  while (v2 != v0);
  return result;
}

uint64_t sub_1004333F0(uint64_t result, uint64_t a2)
{
  uint64_t v2 = result + 80;
  do
  {
    *(void *)(result + 80) = off_100853598;
    *(void *)(result + 8) = off_100853598;
    result += 152;
    v2 += 152;
  }
  while (result != a2);
  return result;
}

void sub_100433444()
{
  __assert_rtn("Inv", "cnmatrixbase.h", 6077, "&A != &Work");
}

void sub_100433470()
{
  __assert_rtn("Inv", "cnmatrixbase.h", 6078, "&A != &B");
}

void sub_10043349C()
{
  __assert_rtn("Inv", "cnmatrixbase.h", 6081, "&Work != &B");
}

void sub_1004334C8()
{
  __assert_rtn("Inv", "cnmatrixbase.h", 6086, "Ipiv.max_num_rows_ * Ipiv.max_num_cols_ >= A.num_rows_");
}

void sub_1004334F4()
{
  __assert_rtn("Inv", "cnmatrixbase.h", 6088, "Work.max_num_rows_ * Work.max_num_cols_ >= 4 * A.num_rows_");
}

void sub_100433520()
{
  __assert_rtn("Inv", "cnmatrixbase.h", 6090, "B.max_num_rows_ >= A.num_rows_");
}

void sub_10043354C()
{
  __assert_rtn("Inv", "cnmatrixbase.h", 6091, "B.max_num_cols_ >= A.num_cols_");
}

void sub_100433578()
{
  __assert_rtn("Inv", "cnmatrixbase.h", 6127, "info >= 0");
}

void sub_1004335D4()
{
  __assert_rtn("Inv", "cnmatrixbase.h", 6159, "info >= 0");
}

void sub_100433600()
{
  __assert_rtn("Inv", "cnmatrixbase.h", 6084, "A.num_rows_ == A.num_cols_");
}

void sub_10043362C()
{
  __assert_rtn("Multiply", "cnmatrixbase.h", 3818, "&(B) != &(C)");
}

void (***sub_100433658())(void)
{
  sub_100352E58();
  do
  {
    uint64_t v3 = *v2;
    v2 += 7;
    (*v3)();
    v1 += 56;
    double result = v2;
  }
  while (v2 != v0);
  return result;
}

void sub_1004336B4()
{
  __assert_rtn("Eig", "cnmatrixbase.h", 5690, "&A != &Acopy");
}

void sub_1004336E0()
{
  __assert_rtn("Eig", "cnmatrixbase.h", 5691, "&A != &Dr");
}

void sub_10043370C()
{
  __assert_rtn("Eig", "cnmatrixbase.h", 5692, "&A != &Di");
}

void sub_100433738()
{
  __assert_rtn("Eig", "cnmatrixbase.h", 5693, "&A != &Vr");
}

void sub_100433764()
{
  __assert_rtn("Eig", "cnmatrixbase.h", 5694, "&A != &Vi");
}

void sub_100433790()
{
  __assert_rtn("Eig", "cnmatrixbase.h", 5695, "&A != &Swork");
}

void sub_1004337BC()
{
  __assert_rtn("Eig", "cnmatrixbase.h", 5696, "&A != &Rwork");
}

void sub_1004337E8()
{
  __assert_rtn("Eig", "cnmatrixbase.h", 5697, "&A != &Work");
}

void sub_100433814()
{
  __assert_rtn("Eig", "cnmatrixbase.h", 5698, "&Acopy != &Dr");
}

void sub_100433840()
{
  __assert_rtn("Eig", "cnmatrixbase.h", 5699, "&Acopy != &Di");
}

void sub_10043386C()
{
  __assert_rtn("Eig", "cnmatrixbase.h", 5700, "&Acopy != &Vr");
}

void sub_100433898()
{
  __assert_rtn("Eig", "cnmatrixbase.h", 5701, "&Acopy != &Vi");
}

void sub_1004338C4()
{
  __assert_rtn("Eig", "cnmatrixbase.h", 5702, "&Acopy != &Swork");
}

void sub_1004338F0()
{
  __assert_rtn("Eig", "cnmatrixbase.h", 5703, "&Acopy != &Rwork");
}

void sub_10043391C()
{
  __assert_rtn("Eig", "cnmatrixbase.h", 5704, "&Acopy != &Work");
}

void sub_100433948()
{
  __assert_rtn("Eig", "cnmatrixbase.h", 5705, "&Dr != &Di");
}

void sub_100433974()
{
  __assert_rtn("Eig", "cnmatrixbase.h", 5706, "&Dr != &Vr");
}

void sub_1004339A0()
{
  __assert_rtn("Eig", "cnmatrixbase.h", 5707, "&Dr != &Vi");
}

void sub_1004339CC()
{
  __assert_rtn("Eig", "cnmatrixbase.h", 5708, "&Dr != &Swork");
}

void sub_1004339F8()
{
  __assert_rtn("Eig", "cnmatrixbase.h", 5709, "&Dr != &Rwork");
}

void sub_100433A24()
{
  __assert_rtn("Eig", "cnmatrixbase.h", 5710, "&Dr != &Work");
}

void sub_100433A50()
{
  __assert_rtn("Eig", "cnmatrixbase.h", 5711, "&Di != &Vr");
}

void sub_100433A7C()
{
  __assert_rtn("Eig", "cnmatrixbase.h", 5712, "&Di != &Vi");
}

void sub_100433AA8()
{
  __assert_rtn("Eig", "cnmatrixbase.h", 5713, "&Di != &Swork");
}

void sub_100433AD4()
{
  __assert_rtn("Eig", "cnmatrixbase.h", 5714, "&Di != &Rwork");
}

void sub_100433B00()
{
  __assert_rtn("Eig", "cnmatrixbase.h", 5715, "&Di != &Work");
}

void sub_100433B2C()
{
  __assert_rtn("Eig", "cnmatrixbase.h", 5716, "&Vr != &Vi");
}

void sub_100433B58()
{
  __assert_rtn("Eig", "cnmatrixbase.h", 5717, "&Vr != &Swork");
}

void sub_100433B84()
{
  __assert_rtn("Eig", "cnmatrixbase.h", 5718, "&Vr != &Rwork");
}

void sub_100433BB0()
{
  __assert_rtn("Eig", "cnmatrixbase.h", 5719, "&Vr != &Work");
}

void sub_100433BDC()
{
  __assert_rtn("Eig", "cnmatrixbase.h", 5720, "&Vi != &Swork");
}

void sub_100433C08()
{
  __assert_rtn("Eig", "cnmatrixbase.h", 5721, "&Vi != &Rwork");
}

void sub_100433C34()
{
  __assert_rtn("Eig", "cnmatrixbase.h", 5722, "&Vi != &Work");
}

void sub_100433C60()
{
  __assert_rtn("Eig", "cnmatrixbase.h", 5723, "&Swork != &Rwork");
}

void sub_100433C8C()
{
  __assert_rtn("Eig", "cnmatrixbase.h", 5724, "&Swork != &Work");
}

void sub_100433CB8()
{
  __assert_rtn("Eig", "cnmatrixbase.h", 5725, "&Rwork != &Work");
}

void sub_100433CE4()
{
  __assert_rtn("Eig", "cnmatrixbase.h", 5730, "Swork.max_num_rows_ * Swork.max_num_cols_ >= nrA");
}

void sub_100433D10()
{
  __assert_rtn("Eig", "cnmatrixbase.h", 5731, "Rwork.max_num_rows_ * Rwork.max_num_cols_ >= nrA");
}

void sub_100433D3C()
{
  __assert_rtn("Eig", "cnmatrixbase.h", 5732, "ne >= 3*nrA");
}

void sub_100433D68()
{
  __assert_rtn("Eig", "cnmatrixbase.h", 5734, "Acopy.max_num_rows_ >= nrA");
}

void sub_100433D94()
{
  __assert_rtn("Eig", "cnmatrixbase.h", 5735, "Acopy.max_num_cols_ >= ncA");
}

void sub_100433DC0()
{
  __assert_rtn("Eig", "cnmatrixbase.h", 5736, "Dr.max_num_rows_ >= nrA");
}

void sub_100433DEC()
{
  __assert_rtn("Eig", "cnmatrixbase.h", 5737, "Dr.max_num_cols_ >= ncA");
}

void sub_100433E18()
{
  __assert_rtn("Eig", "cnmatrixbase.h", 5738, "Di.max_num_rows_ >= nrA");
}

void sub_100433E44()
{
  __assert_rtn("Eig", "cnmatrixbase.h", 5739, "Di.max_num_cols_ >= ncA");
}

void sub_100433E70()
{
  __assert_rtn("Eig", "cnmatrixbase.h", 5740, "Vr.max_num_rows_ >= nrA");
}

void sub_100433E9C()
{
  __assert_rtn("Eig", "cnmatrixbase.h", 5741, "Vr.max_num_cols_ >= ncA");
}

void sub_100433EC8()
{
  __assert_rtn("Eig", "cnmatrixbase.h", 5742, "Vi.max_num_rows_ >= nrA");
}

void sub_100433EF4()
{
  __assert_rtn("Eig", "cnmatrixbase.h", 5743, "Vi.max_num_cols_ >= ncA");
}

void sub_100433F20()
{
  __assert_rtn("Eig", "cnmatrixbase.h", 5744, "Swork.max_num_rows_ >= nrA");
}

void sub_100433F4C()
{
  __assert_rtn("Eig", "cnmatrixbase.h", 5745, "Rwork.max_num_rows_ >= nrA");
}

void sub_100433F78()
{
  __assert_rtn("Eig", "cnmatrixbase.h", 5834, "info == 0");
}

void sub_100433FA4()
{
  __assert_rtn("Eig", "cnmatrixbase.h", 5728, "nrA == ncA");
}

void sub_100433FD0()
{
}

void sub_100433FFC()
{
}

void sub_100434028()
{
  sub_100010524();
  sub_1000104E4((void *)&_mh_execute_header, v0, v1, "#spatialGesturesPredictor Unable to initialize Espresso Model, plan error.", v2, v3, v4, v5, v6);
}

void sub_10043405C()
{
  sub_100010524();
  sub_1000104E4((void *)&_mh_execute_header, v0, v1, "#spatialGesturesPredictor Unable to initialize Espresso Model", v2, v3, v4, v5, v6);
}

void sub_100434090()
{
  sub_100010524();
  sub_1000104E4((void *)&_mh_execute_header, v0, v1, "#spatialGesturesPredictor Unable to locate model weights filepath.", v2, v3, v4, v5, v6);
}

double sub_1004340C4(uint64_t a1, NSObject *a2)
{
  double v2 = **(float **)a1;
  double v3 = *(float *)(*(void *)a1 + 4);
  double v4 = *(float *)(*(void *)a1 + 8);
  int v6 = 134218496;
  double v7 = v2;
  __int16 v8 = 2048;
  double v9 = v3;
  __int16 v10 = 2048;
  double v11 = v4;
  _os_log_debug_impl((void *)&_mh_execute_header, a2, OS_LOG_TYPE_DEBUG, "#spatialGesturesPredictor #probabilities Other = %f, HighConfidenceHandoff = %f, LowConfidenceHandoff = %f", (uint8_t *)&v6, 0x20u);
  return result;
}

void sub_100434168(char *a1, uint8_t *buf, os_log_t log)
{
  if (a1[23] >= 0) {
    double v4 = a1;
  }
  else {
    double v4 = *(char **)a1;
  }
  *(_DWORD *)buf = 136315138;
  *(void *)(buf + 4) = v4;
  _os_log_debug_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_DEBUG, "#spatialGesturesPredictor Predicting intent using %s", buf, 0xCu);
  if (a1[23] < 0) {
    operator delete(*(void **)a1);
  }
}

void sub_1004341DC()
{
}

void sub_100434208()
{
}

void sub_100434234()
{
}

void sub_100434260()
{
}

void sub_10043428C()
{
}

void sub_1004342B8()
{
}

void sub_1004342E4()
{
}

void sub_100434310()
{
  sub_100010524();
  sub_10016F0D8((void *)&_mh_execute_header, v0, v1, "#spatialGesturesPredictor Gesture classifier preprocessing device motion and UWB inputs", v2, v3, v4, v5, v6);
}

void sub_100434344()
{
}

void sub_100434370()
{
  sub_100010524();
  sub_10016F0D8((void *)&_mh_execute_header, v0, v1, "#spatialGesturesPredictor Calculating handoff confidence for DualAnchorAntennaPredictor", v2, v3, v4, v5, v6);
}

void sub_1004343A4()
{
  sub_100010524();
  sub_10016F0D8((void *)&_mh_execute_header, v0, v1, "#spatialGesturesPredictor Calculating handoff confidence for SinglePredictor", v2, v3, v4, v5, v6);
}

void sub_1004343D8()
{
}

void sub_100434404()
{
}

void sub_100434430()
{
}

void sub_10043445C()
{
  sub_100010524();
  sub_1000104E4((void *)&_mh_execute_header, v0, v1, "#spatialGesturesPredictor Gesture classifier was not configured, not consuming device motion data", v2, v3, v4, v5, v6);
}

void sub_100434490()
{
  sub_100010524();
  sub_10016F0D8((void *)&_mh_execute_header, v0, v1, "#spatialGesturesPredictor GesturePredictor consumed device motion input and filtered", v2, v3, v4, v5, v6);
}

void sub_1004344C4()
{
  sub_100010524();
  sub_10016F0D8((void *)&_mh_execute_header, v0, v1, "#spatialGesturesPredictor GesturePredictor device motion input filtered", v2, v3, v4, v5, v6);
}

void sub_1004344F8(uint8_t *buf, unsigned char *a2, os_log_t log)
{
  *buf = 0;
  *a2 = 0;
  _os_log_error_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_ERROR, "#spatialGesturesPredictor Something wrong with filtering, using unfiltered signal", buf, 2u);
}

void sub_100434538()
{
}

void sub_100434564()
{
  sub_100010524();
  sub_10016F0D8((void *)&_mh_execute_header, v0, v1, "#spatialGesturesPredictor GesturePredictor necessary sampling done for device motion input", v2, v3, v4, v5, v6);
}

void sub_100434598()
{
}

void sub_1004345C4(os_log_t log)
{
  int v1 = 134217984;
  uint64_t v2 = 0x3FF0000000000000;
  _os_log_error_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_ERROR, "#spatialGesturesPredictor Gesture classifier was not configured, returning intent score = %f, no AoA and no Spatial Gestures predictor involved", (uint8_t *)&v1, 0xCu);
}

void sub_100434644()
{
}

void sub_100434670()
{
}

void sub_10043469C()
{
  sub_100010524();
  sub_1000104E4((void *)&_mh_execute_header, v0, v1, "#spatialGesturesPredictor Gesture classifier was not configured", v2, v3, v4, v5, v6);
}

void sub_1004346D0()
{
  sub_100010524();
  sub_10016F0D8((void *)&_mh_execute_header, v0, v1, "#spatialGesturesPredictor Not enough samples to run motion based spatial gestures.", v2, v3, v4, v5, v6);
}

void sub_100434704()
{
  sub_100010524();
  sub_1000104E4((void *)&_mh_execute_header, v0, v1, "#spatialGesturesPredictor Should not get here", v2, v3, v4, v5, v6);
}

void sub_100434738()
{
  sub_100010524();
  _os_log_fault_impl((void *)&_mh_execute_header, v0, OS_LOG_TYPE_FAULT, "#spatialGesturesPredictor Should never get here", v1, 2u);
}

uint64_t sub_100434780(uint64_t a1)
{
  return (*(uint64_t (**)(uint64_t))(*(void *)a1 + 8))(a1);
}

void sub_1004347B8(os_log_t log)
{
  *(_WORD *)uint64_t v1 = 0;
  _os_log_debug_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_DEBUG, "#boundedregiongrange-estimator, Filter is initialized", v1, 2u);
}

void sub_1004347FC(uint64_t a1, uint64_t **a2, os_log_t log)
{
  uint64_t v3 = *(void *)(a1 - 24);
  uint64_t v4 = **a2;
  uint64_t v5 = a1 - (void)*a2;
  int v6 = 134218496;
  uint64_t v7 = v3;
  __int16 v8 = 2048;
  uint64_t v9 = v4;
  __int16 v10 = 2048;
  uint64_t v11 = v5 / 24;
  _os_log_debug_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_DEBUG, "#boundedregiongrange-estimator, Buffer start and end after pruning: %3.2f - %3.2f s, size: %zu", (uint8_t *)&v6, 0x20u);
}

void sub_1004348A4(uint64_t a1, NSObject *a2, double a3)
{
  uint64_t v3 = *(void *)(a1 + 8);
  int v4 = 134218240;
  uint64_t v5 = v3;
  __int16 v6 = 2048;
  double v7 = a3;
  _os_log_error_impl((void *)&_mh_execute_header, a2, OS_LOG_TYPE_ERROR, "#sa_algo_batchfilter,Invalid measurement rejected by the batch filter filter, range passed: %f m, range uncertainty passed: %f m", (uint8_t *)&v4, 0x16u);
}

uint64_t sub_10043492C(uint64_t result, uint64_t a2)
{
  uint64_t v2 = result + 72;
  do
  {
    *(void *)(result + 72) = off_100853598;
    *(void *)(result + 8) = off_100853598;
    result += 136;
    v2 += 136;
  }
  while (result != a2);
  return result;
}

uint64_t sub_100434980(uint64_t result, uint64_t a2)
{
  uint64_t v2 = result + 104;
  do
  {
    *(void *)(result + 104) = off_100853598;
    *(void *)(result + 16) = off_100853598;
    result += 192;
    v2 += 192;
  }
  while (result != a2);
  return result;
}

uint64_t sub_1004349D4(uint64_t result, uint64_t a2)
{
  uint64_t v2 = result + 96;
  do
  {
    *(void *)(result + 96) = off_100853598;
    *(void *)(result + 32) = off_100853598;
    result += 208;
    v2 += 208;
  }
  while (result != a2);
  return result;
}

void sub_100434A28(os_log_t log, double a2)
{
  int v2 = 134283521;
  double v3 = a2;
  _os_log_fault_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_FAULT, "#hist-unlock, WRTT: rangeThreshold %{private}f resulted in 0 unlock probability, not unlocking", (uint8_t *)&v2, 0xCu);
}

void sub_100434AA4(os_log_t log, double a2)
{
  int v2 = 134283521;
  double v3 = a2;
  _os_log_fault_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_FAULT, "#hist-unlock, Measurement %{private}f outside of histogram range", (uint8_t *)&v2, 0xCu);
}

void sub_100434B20()
{
  sub_100010524();
  sub_100056C38((void *)&_mh_execute_header, v0, v1, "#bias-est, Issues with loading range bias estimator data transformer model", v2, v3, v4, v5, v6);
}

void sub_100434B54(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  sub_100029DF8((void *)&_mh_execute_header, a2, a3, "#bias-est, Errored when loading range bias estimator data transformer model, error = %@", a5, a6, a7, a8, 2u);
}

void sub_100434BC0(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_100434C2C()
{
  sub_100010524();
  sub_100056C38((void *)&_mh_execute_header, v0, v1, "#bias-est, Unable to obtain resource handler, bypassing bias estimation.", v2, v3, v4, v5, v6);
}

void sub_100434C60()
{
  sub_100010524();
  sub_1000104E4((void *)&_mh_execute_header, v0, v1, "#bias-est, inputFeatures to consume input features is nil, returning nil", v2, v3, v4, v5, v6);
}

void sub_100434C94()
{
  sub_100010524();
  sub_1000104E4((void *)&_mh_execute_header, v0, v1, "#bias-est, Error in creating estimator input, returning nil", v2, v3, v4, v5, v6);
}

void sub_100434CC8()
{
  sub_100010524();
  sub_1000104E4((void *)&_mh_execute_header, v0, v1, "#bias-est, inputFeatures to preprocessing are nil, returning nil", v2, v3, v4, v5, v6);
}

void sub_100434CFC()
{
  sub_100010524();
  sub_100056C38((void *)&_mh_execute_header, v0, v1, "#bias-est, Didnt receive expected antenna mask", v2, v3, v4, v5, v6);
}

void sub_100434D30()
{
  sub_100010524();
  sub_1000104E4((void *)&_mh_execute_header, v0, v1, "#bias-est, Model errored when applying NN standardization on input data, returning nil", v2, v3, v4, v5, v6);
}

void sub_100434D64()
{
  sub_100010524();
  sub_1000104E4((void *)&_mh_execute_header, v0, v1, "#bias-est, input features to prediction are nil, returning nil", v2, v3, v4, v5, v6);
}

void sub_100434D98(os_log_t log, double a2)
{
  int v2 = 134217984;
  double v3 = a2;
  _os_log_debug_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_DEBUG, "#bias-est, totalProbability = %f", (uint8_t *)&v2, 0xCu);
}

void sub_100434E14()
{
  sub_100010524();
  sub_1000104E4((void *)&_mh_execute_header, v0, v1, "#bias-est, Model errored when predicting, returning nil", v2, v3, v4, v5, v6);
}

void sub_100434E48()
{
  sub_100010524();
  sub_100056C38((void *)&_mh_execute_header, v0, v1, "#bias-est, Model resource path not available", v2, v3, v4, v5, v6);
}

void sub_100434E7C(uint64_t a1, uint8_t *buf, os_log_t log)
{
  *(_DWORD *)buf = 136315138;
  *(void *)(buf + 4) = a1;
  _os_log_error_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_ERROR, "#bias-est, Bundle path '%s' does not exist.", buf, 0xCu);
}

void sub_100434EC4(unsigned char *a1, unsigned char *a2)
{
  sub_100029E3C(a1, a2);
  sub_100029E20((void *)&_mh_execute_header, v2, v3, "#bias-est, Unable to build Espresso model plan, bypassing bias estimation.", v4);
}

void sub_100434EF0(unsigned char *a1, unsigned char *a2)
{
  sub_100029E3C(a1, a2);
  sub_100029E20((void *)&_mh_execute_header, v2, v3, "#bias-est, Unable to initialize Espresso Model, bypassing bias estimation", v4);
}

void sub_100434F1C(unsigned char *a1, unsigned char *a2)
{
  sub_100029E3C(a1, a2);
  sub_100029E20((void *)&_mh_execute_header, v2, v3, "#bias-est, Unable to load data transformer model, bypassing bias estimation.", v4);
}

void sub_100434F48()
{
  sub_100010524();
  sub_1000104E4((void *)&_mh_execute_header, v0, v1, "#bias-est, All CIR components are 0, not computing bias estimation for this range result event.", v2, v3, v4, v5, v6);
}

void sub_100434F7C()
{
  sub_100010524();
  sub_1000104E4((void *)&_mh_execute_header, v0, v1, "#bias-est, Sum of CIR values is 0, implying DC component of CIR FFT will be 0, not computing bias estimation for this range result event.", v2, v3, v4, v5, v6);
}

void sub_100434FB0(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  sub_100029DF8((void *)&_mh_execute_header, a2, a3, "#bias-est, unable to create biasEstimatorInputMLArray, error = %@", a5, a6, a7, a8, 2u);
}

void sub_10043501C()
{
  sub_100010524();
  sub_1000104E4((void *)&_mh_execute_header, v0, v1, "#bias-est, Error in executing espresso plan", v2, v3, v4, v5, v6);
}

void sub_100435050()
{
  sub_100010524();
  sub_1000104E4((void *)&_mh_execute_header, v0, v1, "#bias-est, Error in binding outputs to espresso network", v2, v3, v4, v5, v6);
}

void sub_100435084()
{
  sub_100010524();
  sub_1000104E4((void *)&_mh_execute_header, v0, v1, "#bias-est, Error in binding inputs to espresso network", v2, v3, v4, v5, v6);
}

void sub_1004350B8()
{
  sub_100010524();
  sub_1000104E4((void *)&_mh_execute_header, v0, v1, "#bias-est, Error in defining input buffer to espresso network", v2, v3, v4, v5, v6);
}

void sub_1004350EC()
{
  sub_100010524();
  sub_1000104E4((void *)&_mh_execute_header, v0, v1, "#bias-est, Invalid CIRs, unable to scale values", v2, v3, v4, v5, v6);
}

void sub_100435120()
{
}

void sub_100435140()
{
}

void sub_100435160()
{
  sub_100010524();
  _os_log_fault_impl((void *)&_mh_execute_header, v0, OS_LOG_TYPE_FAULT, "#sa_algo_particlefilter,CL arrow doesn't have horizontal angle and/or horizontal angle uncertainty fields", v1, 2u);
}

void sub_1004351A0()
{
  sub_100010524();
  _os_log_fault_impl((void *)&_mh_execute_header, v0, OS_LOG_TYPE_FAULT, "#sa_algo_particlefilter,last event timestamp should always have value if we have a particle filter state", v1, 2u);
}

void sub_1004351E0()
{
  sub_100010524();
  sub_10016F0D8((void *)&_mh_execute_header, v0, v1, "#sa_algo_particlefilter,ingesting delayed pose", v2, v3, v4, v5, v6);
}

void sub_100435214(void *a1, NSObject *a2)
{
  uint64_t v2 = a1[15];
  uint64_t v3 = a1[16];
  uint64_t v4 = a1[17];
  uint64_t v5 = a1[18];
  int v6 = 134218752;
  uint64_t v7 = v2;
  __int16 v8 = 2048;
  uint64_t v9 = v3;
  __int16 v10 = 2048;
  uint64_t v11 = v4;
  __int16 v12 = 2048;
  uint64_t v13 = v5;
  _os_log_debug_impl((void *)&_mh_execute_header, a2, OS_LOG_TYPE_DEBUG, "#sa_algo_particlefilter,ingesting current finder deltav IO data: quatw: %f, quatx: %f, quaty: %f, quatz: %f", (uint8_t *)&v6, 0x2Au);
}

void sub_1004352B0(os_log_t log, double a2, double a3)
{
  int v3 = 134218496;
  uint64_t v4 = 0x3FB999999999999ALL;
  __int16 v5 = 2048;
  double v6 = a2;
  __int16 v7 = 2048;
  double v8 = a3;
  _os_log_debug_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_DEBUG, "#sa_algo_particlefilter,ingesting finder kinematic data: deltaT: %f, delta Vx: %f, delta Vz: %f", (uint8_t *)&v3, 0x20u);
}

void sub_10043534C(uint64_t a1)
{
  v1.n128_f64[0] = sub_10037C3E4(a1, __stack_chk_guard);
  sub_10037C3B4(v1);
  sub_10037C418((void *)&_mh_execute_header, v2, v3, "#sa_algo_particlefilter,particle filter current pose, source: deltav , quatw: %f, quatx: %f, quaty: %f, quatz: %f", v4, v5, v6, v7, v8);
}

void sub_1004353C0(uint64_t a1, unsigned char *a2)
{
  sub_100010524();
  sub_10016F0D8((void *)&_mh_execute_header, v3, v4, "#sa_algo_particlefilter,ingesting delayed pose", v5, v6, v7, v8, v9);
  if (!*a2) {
    sub_10000AE44();
  }
}

void sub_10043540C(uint64_t a1)
{
  v1.n128_f64[0] = sub_10037C3E4(a1, __stack_chk_guard);
  sub_10037C3B4(v1);
  sub_10037C418((void *)&_mh_execute_header, v2, v3, "#sa_algo_particlefilter,particle filter current pose, source: pose , quatw: %f, quatx: %f, quaty: %f, quatz: %f", v4, v5, v6, v7, v8);
}

void sub_100435480()
{
  sub_100010524();
  sub_10016F0D8((void *)&_mh_execute_header, v0, v1, "#sa_algo_particlefilter,ingesting spliced vio pose", v2, v3, v4, v5, v6);
}

void sub_1004354B4()
{
  sub_100010524();
  sub_10016F0D8((void *)&_mh_execute_header, v0, v1, "#sa_algo_particlefilter,peer pdr data ingested", v2, v3, v4, v5, v6);
}

void sub_1004354E8(os_log_t log, unsigned char *a2, double a3)
{
  int v4 = 134217984;
  double v5 = a3;
  _os_log_debug_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_DEBUG, "#sa_algo_particlefilter,ingesting measurement: %f m", (uint8_t *)&v4, 0xCu);
  if (!*a2) {
    __assert_rtn("ingestMeasurement", "ParticleFilter.cpp", 907, "_currentPose.has_value()");
  }
}

void sub_1004355A0()
{
}

void sub_1004355CC()
{
}

void sub_100435600()
{
  sub_100010524();
  sub_1000104E4((void *)&_mh_execute_header, v0, v1, "Estimator: filter not initialized", v2, v3, v4, v5, v6);
}

void sub_100435634()
{
  sub_100010524();
  sub_1000104E4((void *)&_mh_execute_header, v0, v1, "Estimator: innovation negative", v2, v3, v4, v5, v6);
}

void sub_100435668()
{
}

void sub_100435694()
{
}

void sub_1004356C0()
{
  sub_100010524();
  sub_1000104E4((void *)&_mh_execute_header, v0, v1, "unexpected remote tx antenna mask. dropping calculation", v2, v3, v4, v5, v6);
}

void sub_1004356F4()
{
}

void sub_100435720()
{
}

void sub_10043574C()
{
}

void sub_100435778()
{
}

void sub_1004357A4()
{
  __assert_rtn("_measurementUpdate", "NRBYEstimator.cpp", 573, "remoteTxAntMask == kAnt1Mask || remoteTxAntMask == kAnt2Mask");
}

uint64_t sub_1004357D0(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)a1 + 8))();
}

void sub_1004357F4()
{
  sub_100010524();
  sub_1000104E4((void *)&_mh_execute_header, v0, v1, "null filter pointers", v2, v3, v4, v5, v6);
}

void sub_100435828()
{
}

void sub_100435854()
{
}

void sub_100435880()
{
  __assert_rtn("operator()", "cnmatrixbase.h", 711, "data_ != __null");
}

void sub_1004358AC()
{
  __assert_rtn("operator()", "cnmatrixbase.h", 712, "idx >= 0");
}

void sub_1004358D8()
{
}

void sub_100435904()
{
  __assert_rtn("Subtract", "cnmatrixbase.h", 3641, "&(B) != &(C)");
}

void sub_100435930()
{
  sub_100010524();
  sub_10016F0D8((void *)&_mh_execute_header, v0, v1, "#findalgs-peoplefinder,provided solution, SA (range only)", v2, v3, v4, v5, v6);
}

void sub_100435964()
{
  sub_100010524();
  sub_10016F0D8((void *)&_mh_execute_header, v0, v1, "#findalgs-peoplefinder,provided solution, PF", v2, v3, v4, v5, v6);
}

void sub_100435998()
{
  sub_100010524();
  sub_10016F0D8((void *)&_mh_execute_header, v0, v1, "#findalgs-peoplefinder,provided solution, SA", v2, v3, v4, v5, v6);
}

void sub_1004359CC()
{
  sub_100010524();
  sub_10016F0D8((void *)&_mh_execute_header, v0, v1, "#findalgs-peoplefinder,provided solution, SA with findee VIO", v2, v3, v4, v5, v6);
}

void sub_100435A00()
{
  sub_100010524();
  sub_10016F0D8((void *)&_mh_execute_header, v0, v1, "#findalgs-peoplefinder,provideSolution()", v2, v3, v4, v5, v6);
}

void sub_100435A34()
{
  sub_100010524();
  sub_10016F0D8((void *)&_mh_execute_header, v0, v1, "#findalgs-peoplefinder,provided solution, CL", v2, v3, v4, v5, v6);
}

void sub_100435A68()
{
  sub_100010524();
  sub_10016F0D8((void *)&_mh_execute_header, v0, v1, "#findalgs-peoplefinder,getFusionSolution()", v2, v3, v4, v5, v6);
}

void sub_100435A9C()
{
  sub_100010524();
  sub_10016F0D8((void *)&_mh_execute_header, v0, v1, "#findalgs-peoplefinder,provided solution, empty", v2, v3, v4, v5, v6);
}

void sub_100435AD0()
{
  sub_100010524();
  sub_10016F0D8((void *)&_mh_execute_header, v0, v1, "#findalgs-peoplefinder,#negativeBiasRangeRejection, rejected first range measurement", v2, v3, v4, v5, v6);
}

void sub_100435B04()
{
  sub_100010524();
  sub_10016F0D8((void *)&_mh_execute_header, v0, v1, "#findalgs-peoplefinder,#negativeBiasRangeRejection, no measurements in the buffer to accept the new measurement", v2, v3, v4, v5, v6);
}

void sub_100435B38()
{
  sub_100010524();
  sub_10016F0D8((void *)&_mh_execute_header, v0, v1, "#findalgs-peoplefinder,#negativeBiasRangeRejection, accepted measurement with stricter mms validation status", v2, v3, v4, v5, v6);
}

void sub_100435B6C()
{
  sub_100010524();
  sub_1000104E4((void *)&_mh_execute_header, v0, v1, "#findalgs-peoplefinder,cycleSkipping not populated in common::RangeResult", v2, v3, v4, v5, v6);
}

void sub_100435BA0()
{
  sub_100010524();
  sub_10016F0D8((void *)&_mh_execute_header, v0, v1, "#findalgs-peoplefinder,process(const common::RangeResult &result)", v2, v3, v4, v5, v6);
}

void sub_100435BD4()
{
  sub_100010524();
  sub_10016F0D8((void *)&_mh_execute_header, v0, v1, "#findalgs-peoplefinder,ignoring finder IO since it is disabled by config", v2, v3, v4, v5, v6);
}

void sub_100435C08()
{
  sub_100010524();
  sub_10016F0D8((void *)&_mh_execute_header, v0, v1, "#findalgs-peoplefinder,no pdr attitude input, not processing finder pdr", v2, v3, v4, v5, v6);
}

void sub_100435C3C()
{
  sub_100010524();
  sub_10016F0D8((void *)&_mh_execute_header, v0, v1, "#findalgs-peoplefinder,process(const PDRInput &pdr)", v2, v3, v4, v5, v6);
}

void sub_100435C70()
{
  sub_100010524();
  sub_10016F0D8((void *)&_mh_execute_header, v0, v1, "#findalgs-peoplefinder,process(const common::Pose &pose)", v2, v3, v4, v5, v6);
}

void sub_100435CA4(NSObject *a1, unsigned char *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  if (!*a2) {
    sub_10000AE44();
  }
}

void sub_100435D34(int a1, NSObject *a2)
{
  v2[0] = 67109120;
  v2[1] = a1;
  _os_log_error_impl((void *)&_mh_execute_header, a2, OS_LOG_TYPE_ERROR, "#findalgs-peoplefinder,Unhandled value for _lastSignalEnvironment,%d", (uint8_t *)v2, 8u);
}

void sub_100435DAC(char a1, NSObject *a2)
{
  uint64_t v2 = "Self";
  if (a1) {
    uint64_t v2 = "Peer";
  }
  int v3 = 136315138;
  uint64_t v4 = v2;
  _os_log_fault_impl((void *)&_mh_execute_header, a2, OS_LOG_TYPE_FAULT, "#findalgs-peoplefinder,Conversion of %s location time to mach continuous time failed", (uint8_t *)&v3, 0xCu);
}

void sub_100435E3C()
{
  sub_100010524();
  sub_10016F0D8((void *)&_mh_execute_header, v0, v1, "#findalgs-peoplefinder,process(const LocationInput &loc, const BOOL isPeerData", v2, v3, v4, v5, v6);
}

void sub_100435E70()
{
  sub_100010524();
  _os_log_fault_impl((void *)&_mh_execute_header, v0, OS_LOG_TYPE_FAULT, "#findalgs-peoplefinder,Conversion of heading time to mach continuous time failed", v1, 2u);
}

void sub_100435EB0()
{
  sub_100010524();
  sub_10016F0D8((void *)&_mh_execute_header, v0, v1, "#findalgs-peoplefinder,process(const HeadingInput &head)", v2, v3, v4, v5, v6);
}

void sub_100435EE4(unsigned __int8 *a1, NSObject *a2)
{
  int v2 = *a1;
  v3[0] = 67109120;
  v3[1] = v2;
  _os_log_debug_impl((void *)&_mh_execute_header, a2, OS_LOG_TYPE_DEBUG, "#findalgs-peoplefinder,#clcc,Failed arrow range cross check,_isLastSolFromCL,%d", (uint8_t *)v3, 8u);
}

void sub_100435F60(unsigned __int8 *a1, NSObject *a2)
{
  int v2 = *a1;
  v3[0] = 67109376;
  v3[1] = 1;
  __int16 v4 = 1024;
  int v5 = v2;
  _os_log_debug_impl((void *)&_mh_execute_header, a2, OS_LOG_TYPE_DEBUG, "#findalgs-peoplefinder,#clcc,unable to perform arrow range cross check,not failing,_isLastSolFromCL,%d,DO_NOT_FAIL_CROSS_CHECK_IF_UNAVAILABLE,%d", (uint8_t *)v3, 0xEu);
}

void sub_100435FEC(unsigned __int8 *a1, NSObject *a2)
{
  int v2 = *a1;
  v3[0] = 67109376;
  v3[1] = 0;
  __int16 v4 = 1024;
  int v5 = v2;
  _os_log_debug_impl((void *)&_mh_execute_header, a2, OS_LOG_TYPE_DEBUG, "#findalgs-peoplefinder,#clcc,Failed arrow range cross check,_isLastSolFromCL,%d,DO_NOT_FAIL_CROSS_CHECK_IF_UNAVAILABLE,%d", (uint8_t *)v3, 0xEu);
}

void sub_100436074()
{
  sub_100010524();
  sub_1000104E4((void *)&_mh_execute_header, v0, v1, "#findalgs-peoplefinder,Unhandled signal environment, convertSignalEnvironmentToBucketIndex", v2, v3, v4, v5, v6);
}

void sub_1004360A8()
{
  sub_100010524();
  sub_10016F0D8((void *)&_mh_execute_header, v0, v1, "#findalgs-peoplefinder,#gri,process(const std::vector<nearby::algorithms::finding::GnssSatelliteData> &gnssSatelliteData)", v2, v3, v4, v5, v6);
}

void sub_1004360DC(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_10043614C()
{
  sub_100010524();
  _os_log_fault_impl((void *)&_mh_execute_header, v0, OS_LOG_TYPE_FAULT, "#findalgs-peoplefinder,Peer data does not have receipt time and container hasn't received any time tuples, peer data can not be used", v1, 2u);
}

void sub_10043618C(uint64_t a1, NSObject *a2)
{
  if (*(unsigned char *)(a1 + 169)) {
    BOOL v2 = *(unsigned char *)(a1 + 168) == 0;
  }
  else {
    BOOL v2 = 1;
  }
  int v3 = !v2;
  v4[0] = 67109120;
  v4[1] = v3;
  _os_log_debug_impl((void *)&_mh_execute_header, a2, OS_LOG_TYPE_DEBUG, "#findalgs-peoplefinder,#gri,findee,processPeerLocation,good_gnss_conditions_detected,%d", (uint8_t *)v4, 8u);
}

void sub_100436218()
{
  sub_1002B6514();
  _os_log_error_impl((void *)&_mh_execute_header, v0, OS_LOG_TYPE_ERROR, "#findalgs-peoplefinder,#findeeVIO Received findee VIO start date %f s later than one stored %f s - VIO reset happened in between", v1, 0x16u);
}

void sub_100436290()
{
  sub_100010524();
  sub_1000104E4((void *)&_mh_execute_header, v0, v1, "#findalgs-peoplefinder,delta position caculation invalid, waiting for addtional PDR input before processing delta position", v2, v3, v4, v5, v6);
}

void sub_1004362C4(uint64_t a1, NSObject *a2, double a3)
{
  uint64_t v3 = *(void *)(a1 + 48);
  uint64_t v4 = *(void *)(a1 + 56);
  int v5 = 134218496;
  uint64_t v6 = v3;
  __int16 v7 = 2048;
  uint64_t v8 = v4;
  __int16 v9 = 2048;
  double v10 = a3;
  _os_log_debug_impl((void *)&_mh_execute_header, a2, OS_LOG_TYPE_DEBUG, "#findalgs-peoplefinder,integrated H1: %f, integrated H2: %f, deltaT: %f", (uint8_t *)&v5, 0x20u);
}

void sub_100436354()
{
  sub_1002B6514();
  _os_log_error_impl((void *)&_mh_execute_header, v0, OS_LOG_TYPE_ERROR, "#findalgs-peoplefinder,Received findee static info with start date %f s later than one stored %f s - motion happened in between", v1, 0x16u);
}

void sub_1004363CC()
{
  sub_100010524();
  sub_10016F0D8((void *)&_mh_execute_header, v0, v1, "#findalgs-peoplefinder,Received bounded displacement with max enter timestamp again.", v2, v3, v4, v5, v6);
}

void sub_100436400(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_100436470(uint64_t a1, NSObject *a2, unsigned char *a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  if (!*a3) {
    sub_10000AE44();
  }
}

void sub_100436500()
{
  sub_100010524();
  sub_10016F0D8((void *)&_mh_execute_header, v0, v1, "#findalgs-peoplefinder,process(const FindeeData &peer)", v2, v3, v4, v5, v6);
}

void sub_100436534()
{
  sub_100010524();
  sub_10016F0D8((void *)&_mh_execute_header, v0, v1, "#findalgs-peoplefinder,Handing SA w/ findee VIO solution to PF when findee VIO reset/revoke is detected", v2, v3, v4, v5, v6);
}

void sub_100436568()
{
  sub_100010524();
  sub_10016F0D8((void *)&_mh_execute_header, v0, v1, "#findalgs-peoplefinder,Handing SA solution to PF when findee motion is detected", v2, v3, v4, v5, v6);
}

void sub_10043659C(uint64_t a1, uint64_t a2, os_log_t log)
{
  int v3 = *(unsigned __int8 *)(a1 + 24);
  int v4 = *(unsigned __int8 *)(a2 + 8208);
  v5[0] = 67109376;
  v5[1] = v3;
  __int16 v6 = 1024;
  int v7 = v4;
  _os_log_debug_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_DEBUG, "#findalgs-peoplefinder,processPeerLocation,peerLoc.has_value(),%d,_lastSelfLocation.has_value(),%d", (uint8_t *)v5, 0xEu);
}

void sub_100436630()
{
  __assert_rtn("getAverage", "NRBYUserIntentPredictor.cpp", 48, "_buffer.size() <= _maxBufLength");
}

void sub_10043665C(os_log_t log)
{
  *(_WORD *)uint64_t v1 = 0;
  _os_log_error_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_ERROR, "#handoffPredictor delta time between range results is non positive", v1, 2u);
}

void sub_1004366A0()
{
  sub_100010524();
  sub_100056C38((void *)&_mh_execute_header, v0, v1, "#findalgs,NRBYFindingContainer::provideSolution unexpectedly called but not overridden", v2, v3, v4, v5, v6);
}

void sub_1004366D4()
{
  sub_100010524();
  sub_100056C38((void *)&_mh_execute_header, v0, v1, "#findalgs,NRBYFindingContainer::providePeerData unexpectedly called but not overridden", v2, v3, v4, v5, v6);
}

void sub_100436708()
{
  sub_100010524();
  sub_100056C38((void *)&_mh_execute_header, v0, v1, "#findalgs,NRBYFindingContainer::process(const common::Pose &pose) unexpectedly called but not overridden", v2, v3, v4, v5, v6);
}

void sub_10043673C()
{
  sub_100010524();
  sub_100056C38((void *)&_mh_execute_header, v0, v1, "#findalgs,NRBYFindingContainer::process(const AltimeterInput &altData) unexpectedly called but not overridden", v2, v3, v4, v5, v6);
}

void sub_100436770()
{
  sub_100010524();
  sub_100056C38((void *)&_mh_execute_header, v0, v1, "#findalgs,NRBYFindingContainer::process(const LocationInput &loc, const BOOL isPeerData) unexpectedly called but not overridden", v2, v3, v4, v5, v6);
}

void sub_1004367A4()
{
  sub_100010524();
  sub_100056C38((void *)&_mh_execute_header, v0, v1, "#findalgs,NRBYFindingContainer::process(const HeadingInput &head) unexpectedly called but not overridden", v2, v3, v4, v5, v6);
}

void sub_1004367D8()
{
  sub_100010524();
  sub_100056C38((void *)&_mh_execute_header, v0, v1, "#findalgs,NRBYFindingContainer::process(const std::vector<nearby::algorithms::finding::GnssSatelliteData> &gnssSatelliteData) unexpectedly called but not overridden", v2, v3, v4, v5, v6);
}

void sub_10043680C()
{
  sub_100010524();
  sub_100056C38((void *)&_mh_execute_header, v0, v1, "#findalgs,NRBYFindingContainer::process(const MotionActivityInput &activity) unexpectedly called but not overridden", v2, v3, v4, v5, v6);
}

void sub_100436840()
{
  sub_100010524();
  sub_100056C38((void *)&_mh_execute_header, v0, v1, "#findalgs,NRBYFindingContainer::process(const PedometerDataInput &pedData) unexpectedly called but not overridden", v2, v3, v4, v5, v6);
}

void sub_100436874()
{
  sub_100010524();
  sub_100056C38((void *)&_mh_execute_header, v0, v1, "#findalgs,NRBYFindingContainer::process(const PedometerEventInput &pedEvent) unexpectedly called but not overridden", v2, v3, v4, v5, v6);
}

void sub_1004368A8()
{
  sub_100010524();
  sub_100056C38((void *)&_mh_execute_header, v0, v1, "#findalgs,NRBYFindingContainer::process(const PDRInput &pdr) unexpectedly called but not overridden", v2, v3, v4, v5, v6);
}

void sub_1004368DC()
{
  sub_100010524();
  sub_100056C38((void *)&_mh_execute_header, v0, v1, "#findalgs,NRBYFindingContainer::process(const FindeeData &peer) unexpectedly called but not overridden", v2, v3, v4, v5, v6);
}

void sub_100436910()
{
  sub_100010524();
  sub_100056C38((void *)&_mh_execute_header, v0, v1, "#findalgs,NRBYFindingContainer::process(const WatchOrientationInput &watchOrientation) unexpectedly called but not overridden", v2, v3, v4, v5, v6);
}

void sub_100436944()
{
  sub_100010524();
  sub_100056C38((void *)&_mh_execute_header, v0, v1, "#findalgs,NRBYFindingContainer::processDiscoveryEvent(const double mach_absolute_time_s) unexpectedly called but not overridden", v2, v3, v4, v5, v6);
}

void sub_100436978()
{
  sub_100010524();
  sub_100056C38((void *)&_mh_execute_header, v0, v1, "#findalgs,NRBYFindingContainer::process(const common::MissedRangeResult &missedResult) unexpectedly called but not overridden", v2, v3, v4, v5, v6);
}

void sub_1004369AC()
{
  sub_100010524();
  sub_100056C38((void *)&_mh_execute_header, v0, v1, "#findalgs,NRBYFindingContainer::dismiss() unexpectedly called but not overridden", v2, v3, v4, v5, v6);
}

void sub_1004369E0()
{
}

void sub_100436A0C()
{
}

void sub_100436A38(os_log_t log)
{
  *(_WORD *)uint64_t v1 = 0;
  _os_log_fault_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_FAULT, "#regionmon technology mapping not found for ranging technology", v1, 2u);
}

void sub_100436A7C()
{
}

void sub_100436AA8()
{
  sub_10020E5CC(__stack_chk_guard);
  sub_100010500();
  sub_10000B3E0((void *)&_mh_execute_header, v0, v1, "#regionmon unexpected remote antenna mask in SG prediction for dev 0x%llx. skipping intent prediction", v2, v3, v4, v5, v6);
}

void sub_100436B10()
{
}

void sub_100436B3C(uint8_t *buf, uint64_t a2, int a3, os_log_t log)
{
  *(_DWORD *)buf = 134218240;
  *(void *)(buf + 4) = a2;
  *((_WORD *)buf + 6) = 1024;
  *(_DWORD *)(buf + 14) = a3;
  _os_log_fault_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_FAULT, "#regionmon Error unexpected BT threshold detector early return with out of bubble estimate, RSSI: %f, numSamples: %d", buf, 0x12u);
}

double sub_100436B94(uint64_t a1, NSObject *a2)
{
  double v2 = *(float *)(a1 + 24);
  int v4 = 134217984;
  double v5 = v2;
  _os_log_fault_impl((void *)&_mh_execute_header, a2, OS_LOG_TYPE_FAULT, "#regionmon more than one region with radius: %f\n", (uint8_t *)&v4, 0xCu);
  return result;
}

void sub_100436C14(char *a1, void *a2, os_log_t log)
{
  if (*a1 < 0) {
    a2 = (void *)*a2;
  }
  int v3 = 136315138;
  int v4 = a2;
  _os_log_fault_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_FAULT, "#regionmon more than one region with name: %s\n", (uint8_t *)&v3, 0xCu);
}

void sub_100436C9C()
{
}

void sub_100436CC8(os_log_t log, float a2)
{
  int v2 = 134218240;
  uint64_t v3 = 0x3FB99999A0000000;
  __int16 v4 = 2048;
  double v5 = a2;
  _os_log_fault_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_FAULT, "#regionmon Region spaced by less than %fm (%fm)\n", (uint8_t *)&v2, 0x16u);
}

void sub_100436D60()
{
  sub_100010524();
  _os_log_fault_impl((void *)&_mh_execute_header, v0, OS_LOG_TYPE_FAULT, "#regionmon region categories in same RegionSet don't match", v1, 2u);
}

void sub_100436DA0()
{
  sub_100160124();
  _os_log_error_impl((void *)&_mh_execute_header, v0, OS_LOG_TYPE_ERROR, "#regionmon #region-class region for class %d not found. will not create a device monitor for 0x%llx", v1, 0x12u);
}

void sub_100436E20()
{
  sub_100160124();
  _os_log_debug_impl((void *)&_mh_execute_header, v0, OS_LOG_TYPE_DEBUG, "#regionmon #region-class using class %d regions for device 0x%llx", v1, 0x12u);
}

void sub_100436EA0()
{
  sub_100010524();
  sub_1000104E4((void *)&_mh_execute_header, v0, v1, "#regionmon ERROR: Ideally should NOT enter this switch case since initStateForDevice in case of Bluetooth device is handled separately in a different function: RegionMonitor::initStateForBluetoothDevice(). Returning false.", v2, v3, v4, v5, v6);
}

void sub_100436ED4()
{
  sub_100010524();
  sub_1000104E4((void *)&_mh_execute_header, v0, v1, "#regionmon Location-based region monitoring not supported.", v2, v3, v4, v5, v6);
}

void sub_100436F08()
{
  sub_100010524();
  sub_1000104E4((void *)&_mh_execute_header, v0, v1, "#regionmon ERROR: Ideally should NOT enter this switch case since initStateForDevice is handled separately in a different function for non-BT samples. Returning false.", v2, v3, v4, v5, v6);
}

void sub_100436F3C(unsigned char *a1, uint64_t a2)
{
  if (*a1)
  {
    if (*(char *)(a2 + 23) < 0) {
      operator delete(*(void **)a2);
    }
  }
}

void sub_100436F68()
{
  sub_100010524();
  _os_log_error_impl((void *)&_mh_execute_header, v0, OS_LOG_TYPE_ERROR, "#findalgs-devicefinder,didUpdatePreciseDevicePosition called after invalidate. Possible race condition", v1, 2u);
}

void sub_100436FA8()
{
  sub_100010524();
  _os_log_error_impl((void *)&_mh_execute_header, v0, OS_LOG_TYPE_ERROR, "#findalgs-devicefinder,didUpdateAnalytics called after invalidate. Possible race condition", v1, 2u);
}

void sub_100436FE8(uint8_t *buf, int a2, os_log_t log)
{
  *(_DWORD *)buf = 67109120;
  *((_DWORD *)buf + 1) = a2;
  _os_log_error_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_ERROR, "#findalgs-devicefinder,Unknown motion state: %d", buf, 8u);
}

void sub_100437030()
{
  sub_100010524();
  _os_log_debug_impl((void *)&_mh_execute_header, v0, OS_LOG_TYPE_DEBUG, "#findalgs-devicefinder,Sending peer data to CMA", v1, 2u);
}

void sub_100437070()
{
  sub_100010524();
  _os_log_fault_impl((void *)&_mh_execute_header, v0, OS_LOG_TYPE_FAULT, "#findalgs-devicefinder,Failed to convert receipt time from mach absolute to mach continuous while updating peer data", v1, 2u);
}

void sub_1004370B0()
{
  sub_1001BE628();
  _os_log_error_impl((void *)&_mh_execute_header, v0, OS_LOG_TYPE_ERROR, "#sa_algo_moving_findee,Received pose earlier than the last pose in history with timestamp: %f - pose rejected", v1, 0xCu);
}

void sub_100437128(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_100437160()
{
  sub_1001BE628();
  _os_log_error_impl((void *)&_mh_execute_header, v0, OS_LOG_TYPE_ERROR, "#sa_algo_moving_findee,Received peer pose earlier than the last pose in history with timestamp: %f - pose rejected", v1, 0xCu);
}

void sub_1004371D8(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_100437210(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_100437248(uint64_t *a1, NSObject *a2)
{
  uint64_t v2 = *a1;
  uint64_t v3 = a1[1];
  uint64_t v4 = a1[2];
  int v5 = 134218496;
  uint64_t v6 = v2;
  __int16 v7 = 2048;
  uint64_t v8 = v3;
  __int16 v9 = 2048;
  uint64_t v10 = v4;
  _os_log_debug_impl((void *)&_mh_execute_header, a2, OS_LOG_TYPE_DEBUG, "#sa_algo_moving_findee,Populating world position output with SA, object position is [%4.2f, %4.2f, %4.2f] m", (uint8_t *)&v5, 0x20u);
}

void sub_1004372DC()
{
  sub_1002B6514();
  _os_log_debug_impl((void *)&_mh_execute_header, v0, OS_LOG_TYPE_DEBUG, "#sa_algo_moving_findee,Populating horizontal angle output with SA, angle: %3.2f deg, timestamp: %f s", v1, 0x16u);
}

double sub_100437354(uint64_t a1, float *a2, uint8_t *buf, os_log_t log)
{
  uint64_t v4 = *(void *)(a1 + 16);
  double v5 = *a2;
  *(_DWORD *)buf = 134218240;
  *(double *)(buf + 4) = v5;
  *((_WORD *)buf + 6) = 2048;
  *(void *)(buf + 14) = v4;
  _os_log_debug_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_DEBUG, "#sa_algo_moving_findee,Populating range output with SA, range: %0.2f m, timestamp: %f s", buf, 0x16u);
  return result;
}

void sub_1004373B8()
{
  sub_10039B55C();
  _os_log_debug_impl((void *)&_mh_execute_header, v0, OS_LOG_TYPE_DEBUG, "#sa_algo_moving_findee,#stalePeerVIO Peer VIO is too stale %f compared to threshold %f s BUT arrow uncertainty is %4.1f deg is sufficiently small - yielding the solution", v1, 0x20u);
}

void sub_100437430()
{
  sub_10039B55C();
  __int16 v3 = v0;
  uint64_t v4 = 0x4036800000000000;
  _os_log_debug_impl((void *)&_mh_execute_header, v1, OS_LOG_TYPE_DEBUG, "#sa_algo_moving_findee,#stalePeerVIO Peer VIO is too stale %f compared to threshold %f s AND arrow uncertainty is %4.1f deg is larger than threshold %4.1f deg - not yielding the solution", v2, 0x2Au);
}

void sub_1004374B8()
{
  sub_1002B6514();
  _os_log_debug_impl((void *)&_mh_execute_header, v0, OS_LOG_TYPE_DEBUG, "#sa_algo_moving_findee,#stalePeerVIO worstCaseSideMovement: %0.2f m, horizontal distance: %0.2f m", v1, 0x16u);
}

void sub_100437534()
{
  sub_1001BE628();
  sub_1001BE5B8((void *)&_mh_execute_header, v0, v1, "#sa_algo_moving_findee,Populating vertical state output with SA, VerticalStateUnknown, timestamp: %f s", v2, v3, v4, v5, v6);
}

void sub_1004375A0()
{
  sub_1001BE628();
  sub_1001BE5B8((void *)&_mh_execute_header, v0, v1, "#sa_algo_moving_findee,Populating vertical state output with SA, VerticalStateSame, timestamp: %f s", v2, v3, v4, v5, v6);
}

void sub_10043760C()
{
  sub_1001BE628();
  sub_1001BE5B8((void *)&_mh_execute_header, v0, v1, "#sa_algo_moving_findee,Populating vertical state output with SA, VerticalStateAbove, timestamp: %f s", v2, v3, v4, v5, v6);
}

void sub_100437678()
{
  sub_1001BE628();
  sub_1001BE5B8((void *)&_mh_execute_header, v0, v1, "#sa_algo_moving_findee,Populating vertical state output with SA, VerticalStateBelow, timestamp: %f s", v2, v3, v4, v5, v6);
}

void sub_1004376E4()
{
  sub_1001BE628();
  sub_1001BE5B8((void *)&_mh_execute_header, v0, v1, "#sa_algo_moving_findee,Populating vertical state output with SA, VerticalStateAboveOrBelow, timestamp: %f s", v2, v3, v4, v5, v6);
}

void sub_100437750()
{
  sub_100010524();
  _os_log_error_impl((void *)&_mh_execute_header, v0, OS_LOG_TYPE_ERROR, "[RoseSupervisorInterface] IOServiceGetMatchingService failed.", v1, 2u);
}

void sub_100437790(char *a1, uint8_t *buf, os_log_t log)
{
  if (a1[23] >= 0) {
    uint64_t v4 = a1;
  }
  else {
    uint64_t v4 = *(char **)a1;
  }
  *(_DWORD *)buf = 136315138;
  *(void *)(buf + 4) = v4;
  _os_log_error_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_ERROR, "[RoseSupervisorInterface] IOServiceOpen failed. Error: %s", buf, 0xCu);
  if (a1[23] < 0) {
    operator delete(*(void **)a1);
  }
}

void sub_100437804()
{
  sub_100010524();
  sub_10016F0D8((void *)&_mh_execute_header, v0, v1, "RoseSupervisorInterface::connectSupervisor", v2, v3, v4, v5, v6);
}

void sub_100437838()
{
}

void sub_100437864()
{
  sub_100010524();
  sub_10016F0D8((void *)&_mh_execute_header, v0, v1, "RoseSupervisorInterface::setHIDEventsHandler", v2, v3, v4, v5, v6);
}

void sub_100437898()
{
  __assert_rtn("sendCommandToRose", "RoseSupervisorInterface.mm", 103, "buffLen <= kRoseSupervisorOutPayloadLengthMax");
}

void sub_1004378C4()
{
  sub_100010524();
  sub_10016F0D8((void *)&_mh_execute_header, v0, v1, "RoseSupervisorInterface::sendCommandToRose", v2, v3, v4, v5, v6);
}

void sub_1004378F8()
{
  sub_100010524();
  sub_10016F0D8((void *)&_mh_execute_header, v0, v1, "RoseSupervisorInterface::setRoseProperty", v2, v3, v4, v5, v6);
}

void sub_10043792C()
{
  __assert_rtn("getRoseProperty", "RoseSupervisorInterface.mm", 161, "outPayloadLength <= kRoseSupervisorOutPayloadLengthMax");
}

void sub_100437958()
{
  sub_100010524();
  sub_10016F0D8((void *)&_mh_execute_header, v0, v1, "RoseSupervisorInterface::getRoseProperty", v2, v3, v4, v5, v6);
}

void sub_10043798C()
{
  sub_100010524();
  sub_10016F0D8((void *)&_mh_execute_header, v0, v1, "RoseSupervisorInterface::onHIDEvent", v2, v3, v4, v5, v6);
}

void sub_1004379C0()
{
  __assert_rtn("decodeCoexCriticalEvent", "roseEventHandler.cpp", 1025, "packet.size() == EXPECTED_PACKET_SIZE");
}

void sub_1004379EC()
{
}

void sub_100437A18()
{
  __assert_rtn("decodeCIRSampleSet", "roseCIRDataDecoderV2.cpp", 422, "len == numCIRs * cirSizeBytes");
}

void sub_100437A44()
{
  __assert_rtn("getNBMaskOOB", "roseSharedTypes.cpp", 1012, "unii5_subbands == 0 || unii5_subbands == 4");
}

void sub_100437A70()
{
  __assert_rtn("nbMaskAllowsUNII3", "roseSharedTypes.cpp", 1019, "nb_mask <= 3");
}

void sub_100437A9C()
{
  __assert_rtn("nbMaskAllowsUNII5", "roseSharedTypes.cpp", 1025, "nb_mask <= 3");
}

void sub_100437AC8()
{
}

uint64_t sub_100437AF4(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  sub_1003A9600("invalid refcon in rose event callback", a2, a3, a4, a5, a6, a7, a8, v10);
  uint64_t v8 = abort_report_np();
  return sub_100437B1C(v8);
}

uint64_t sub_100437B1C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  sub_1003A9600("invalid refcon in crash callback", a2, a3, a4, a5, a6, a7, a8, v10);
  uint64_t v8 = abort_report_np();
  return sub_100437B44(v8);
}

uint64_t sub_100437B44(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  sub_1003A9600("fCrashCallback not found", a2, a3, a4, a5, a6, a7, a8, v10);
  uint64_t v8 = abort_report_np();
  return sub_100437B6C(v8);
}

uint64_t sub_100437B6C(unsigned __int8 a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  sub_1003A9600("invalid refcon in FW State Change callback, state %u", a2, a3, a4, a5, a6, a7, a8, a1);
  uint64_t v8 = abort_report_np();
  return sub_100437BA4(v8);
}

uint64_t sub_100437BA4(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  sub_1003A9600("fStateChangeCb not found", a2, a3, a4, a5, a6, a7, a8, v10);
  uint64_t v8 = abort_report_np();
  return sub_100437BCC(v8);
}

uint64_t sub_100437BCC(unsigned __int8 a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  sub_1003A9600("invalid refcon in errorReportCallback, errorCode: %u", a2, a3, a4, a5, a6, a7, a8, a1);
  uint64_t v8 = abort_report_np();
  return sub_100437C04(v8);
}

uint64_t sub_100437C04(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  sub_1003A9600("fErrorReportCb not found", a2, a3, a4, a5, a6, a7, a8, v10);
  uint64_t v8 = abort_report_np();
  return sub_100437C2C(v8);
}

void sub_100437C2C()
{
  sub_1003D1068(__stack_chk_guard);
  sub_1003D1034();
  sub_100196ED4((void *)&_mh_execute_header, v0, v1, "regulatory,persistent,unlock,read,fRegulatoryArea,%s,ts,%.1f", v2, v3);
}

void sub_100437CA0()
{
  sub_1003D1058(__stack_chk_guard);
  sub_100196EA0();
  sub_1002B652C((void *)&_mh_execute_header, v0, v1, "regulatory,persistent,unlock,write,fRegulatoryArea,%s,ts,%.1f", v2, v3, v4, v5, v6);
}

void sub_100437D14()
{
  sub_1003D1058(__stack_chk_guard);
  sub_100196EA0();
  sub_1002B652C((void *)&_mh_execute_header, v0, v1, "regulatory,persistent,unlock,fRegulatoryArea,%s,ts,%.1f", v2, v3, v4, v5, v6);
}

void sub_100437D88()
{
  sub_100010524();
  sub_10016F0D8((void *)&_mh_execute_header, v0, v1, "regulatory,persistent,setRegulatoryArea,locked,notWriting", v2, v3, v4, v5, v6);
}

void sub_100437DBC()
{
  sub_10001AC8C();
  sub_1001BE5B8((void *)&_mh_execute_header, v0, v1, "regulatory,persistent,setRegulatoryArea,Cannot serialize regulatory settings, error,%@", v2, v3, v4, v5, v6);
}

void sub_100437E24()
{
  sub_10001AC8C();
  sub_1001BE5B8((void *)&_mh_execute_header, v0, v1, "regulatory,persistent,setRegulatoryArea,written,%@", v2, v3, v4, v5, v6);
}

void sub_100437E8C()
{
  sub_10001AC8C();
  sub_1001BE5B8((void *)&_mh_execute_header, v0, v1, "regulatory,persistent,setRegulatoryArea,Cant write to regulatory settings file, error, %@", v2, v3, v4, v5, v6);
}

void sub_100437EF4()
{
  sub_1003D1068(__stack_chk_guard);
  sub_1003D1034();
  sub_100196ED4((void *)&_mh_execute_header, v0, v1, "regulatory,persistent,setRegulatoryArea,fRegulatoryArea,%s,ts,%.1f", v2, v3);
}

void sub_100437F68()
{
  sub_100010524();
  sub_10016F0D8((void *)&_mh_execute_header, v0, v1, "regulatory,persistent,getRegulatoryArea,noCache,locked,returnNothing", v2, v3, v4, v5, v6);
}

void sub_100437F9C()
{
  sub_10001AC8C();
  sub_1001BE5B8((void *)&_mh_execute_header, v0, v1, "regulatory,persistent,getRegulatoryArea,Cant read from regulatory settings file, error, %@", v2, v3, v4, v5, v6);
}

void sub_100438004()
{
  sub_10001AC8C();
  sub_1001BE5B8((void *)&_mh_execute_header, v0, v1, "regulatory,persistent,getRegulatoryArea,Cannot deserialize regulatory settings, error,%@", v2, v3, v4, v5, v6);
}

void sub_10043806C()
{
  sub_100010524();
  sub_10016F0D8((void *)&_mh_execute_header, v0, v1, "regulatory,persistent,getRegulatoryArea,nsIsoCode,null", v2, v3, v4, v5, v6);
}

void sub_1004380A0()
{
  sub_1003D1058(__stack_chk_guard);
  sub_100196EA0();
  sub_1002B652C((void *)&_mh_execute_header, v0, v1, "regulatory,persistent,getRegulatoryArea,fromFile,fRegulatoryArea,%s,ts,%.1f", v2, v3, v4, v5, v6);
}

void sub_100438114()
{
  sub_100010524();
  sub_10016F0D8((void *)&_mh_execute_header, v0, v1, "regulatory,persistent,getRegulatoryArea,nsTimestamp,null", v2, v3, v4, v5, v6);
}

void sub_100438148()
{
  sub_1003D1068(__stack_chk_guard);
  sub_1003D1034();
  sub_100196ED4((void *)&_mh_execute_header, v0, v1, "regulatory,persistent,getRegulatoryArea,fromCache,fRegulatoryArea,%s,ts,%.1f", v2, v3);
}

void sub_1004381BC()
{
  sub_1003D104C(__stack_chk_guard);
  sub_1003D101C();
  sub_10016013C((void *)&_mh_execute_header, v0, v1, "regulatory,defaults,%s,%d", v2, v3);
}

void sub_100438224()
{
  sub_10001AC8C();
  sub_1001BE5B8((void *)&_mh_execute_header, v0, v1, "regulatory,defaults,%s,undefined", v2, v3, v4, v5, v6);
}

void sub_10043828C()
{
  sub_1003D1034();
  sub_100196ED4((void *)&_mh_execute_header, v0, v1, "regulatory,defaults,%s,%.2f", v2, v3);
}

void sub_1004382F8(char a1, NSObject *a2)
{
  if (a1)
  {
    *(_WORD *)uint64_t v2 = 0;
    _os_log_impl((void *)&_mh_execute_header, a2, OS_LOG_TYPE_DEFAULT, "regulatory,comp,getRegulatoryCountryParams,cantFind,kUnknownCountry", v2, 2u);
  }
  __assert_rtn("getRegulatoryCountryParams", "roseRegulatoryCompliance.mm", 559, "false");
}

void sub_100438350()
{
  sub_100010524();
  sub_10016F0D8((void *)&_mh_execute_header, v0, v1, "rdar://130935626 - CN Ch5 mitigation", v2, v3, v4, v5, v6);
}

void sub_100438384(char *a1, void *a2, NSObject *a3)
{
  if (*a1 < 0) {
    a2 = (void *)*a2;
  }
  LODWORD(v3) = 136315138;
  HIDWORD(v3) = a2;
  sub_100196EF4((void *)&_mh_execute_header, (uint64_t)a2, a3, "regulatory,comp,getRegulatoryCountryParams,found,country,%s", v3);
}

void sub_1004383FC(char a1, NSObject *a2)
{
  if (a1)
  {
    *(_WORD *)uint64_t v2 = 0;
    _os_log_impl((void *)&_mh_execute_header, a2, OS_LOG_TYPE_DEFAULT, "regulatory,comp,getRegulatoryNBCountryParams,cantFind,kUnknownCountry", v2, 2u);
  }
  __assert_rtn("getRegulatoryNBCountryParams", "roseRegulatoryCompliance.mm", 613, "false");
}

void sub_100438454(char *a1, void *a2, NSObject *a3)
{
  if (*a1 < 0) {
    a2 = (void *)*a2;
  }
  LODWORD(v3) = 136315138;
  HIDWORD(v3) = a2;
  sub_100196EF4((void *)&_mh_execute_header, (uint64_t)a2, a3, "regulatory,comp,getRegulatoryNBCountryParams,found,country,%s", v3);
}

void sub_1004384CC(char *a1, void *a2, os_log_t log)
{
  if (*a1 < 0) {
    a2 = (void *)*a2;
  }
  int v3 = 136315906;
  uint64_t v4 = a2;
  __int16 v5 = 1024;
  int v6 = 0;
  __int16 v7 = 1024;
  int v8 = 0;
  __int16 v9 = 2080;
  uint64_t v10 = "unknownCountry for UWB query";
  _os_log_debug_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_DEBUG, "regulatory,comp,getDesignatedRfChannels,country,%s,ch5,%d,ch9,%d,note,%s", (uint8_t *)&v3, 0x22u);
}

void sub_10043857C()
{
  sub_100010524();
  sub_10016F0D8((void *)&_mh_execute_header, v0, v1, "unknownCountry for NB query", v2, v3, v4, v5, v6);
}

void sub_1004385B0()
{
  sub_100196EA0();
  sub_100196ED4((void *)&_mh_execute_header, v0, v1, "regulatory,defaults,testLocation,lat,%.6f,lon,%.6f", v2, v3);
}

void sub_100438620(int *a1, NSObject *a2)
{
  int v2 = *a1;
  v3[0] = 67109120;
  v3[1] = v2;
  _os_log_debug_impl((void *)&_mh_execute_header, a2, OS_LOG_TYPE_DEBUG, "regulatory,defaults,backoffDuration,%d", (uint8_t *)v3, 8u);
}

void sub_10043869C()
{
  sub_10001AC8C();
  WORD2(v4) = 2080;
  HIWORD(v4) = v0;
  sub_100196ED4((void *)&_mh_execute_header, v1, v2, "regulatory,defaults,%s,%s", v3, v4);
}

void sub_100438720(uint64_t *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_100438760()
{
  __assert_rtn("x_write", "json.hpp", 8295, "x == 0");
}

void sub_10043878C()
{
}

void sub_1004387B8()
{
}

void sub_1004387E4()
{
  __assert_rtn("x_write", "json.hpp", 8337, "loc != nullptr");
}

void sub_100438810()
{
  __assert_rtn("x_write", "json.hpp", 8386, "m_buf[i - 1] != '\\0'");
}

void sub_10043883C()
{
  __assert_rtn("x_write", "json.hpp", 8393, "m_buf[i + 2] == '\\0'");
}

void sub_100438868()
{
}

void sub_100438894()
{
}

void sub_1004388C0()
{
  __assert_rtn("assert_invariant", "json.hpp", 1787, "m_type != value_t::object or m_value.object != nullptr");
}

void sub_1004388EC()
{
  __assert_rtn("assert_invariant", "json.hpp", 1788, "m_type != value_t::array or m_value.array != nullptr");
}

void sub_100438918()
{
  __assert_rtn("assert_invariant", "json.hpp", 1789, "m_type != value_t::string or m_value.string != nullptr");
}

void sub_100438944()
{
  sub_100010524();
  sub_1000104E4((void *)&_mh_execute_header, v0, v1, "#sf,RoseSensorFusionManager error:: add IMU data to MHT failed", v2, v3, v4, v5, v6);
}

void sub_100438978(void *a1, uint8_t *buf, uint64_t a3, os_log_t log)
{
  uint64_t v4 = a1[10];
  uint64_t v5 = *(void *)(*(void *)(v4 + ((a1[13] >> 6) & 0x3FFFFFFFFFFFFF8)) + 8 * (a1[13] & 0x1FFLL));
  uint64_t v6 = *(void *)(*(void *)(v4 + (((unint64_t)(a1[13] + a1[14] - 1) >> 6) & 0x3FFFFFFFFFFFFF8))
                 + 8 * ((a1[13] + a1[14] - 1) & 0x1FF));
  *(_DWORD *)buf = 134218496;
  *(void *)(buf + 4) = a3;
  *((_WORD *)buf + 6) = 2048;
  *(void *)(buf + 14) = v5;
  *((_WORD *)buf + 11) = 2048;
  *((void *)buf + 3) = v6;
  _os_log_debug_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_DEBUG, "#sf,RoseSensorFusionManager::addIMUdata: IMU buffer size is %lu, time stamps from %f to %f", buf, 0x20u);
}

void sub_100438A10()
{
  sub_100010524();
  sub_1000104E4((void *)&_mh_execute_header, v0, v1, "#sf,RoseSensorFusionManager error: empty rose measurement vector.", v2, v3, v4, v5, v6);
}

void sub_100438A44()
{
  sub_100010524();
  sub_1000104E4((void *)&_mh_execute_header, v0, v1, "#sf,RoseSensorFusionManager error: Rose measurement rejected because no IMU data has been received yet.", v2, v3, v4, v5, v6);
}

void sub_100438A78()
{
  sub_100010524();
  sub_1000104E4((void *)&_mh_execute_header, v0, v1, "#sf,RoseSensorFusionManager error: rose measurements vector contains measurements from different targets.", v2, v3, v4, v5, v6);
}

void sub_100438AAC()
{
  sub_100010524();
  sub_1000104E4((void *)&_mh_execute_header, v0, v1, "#sf,RoseSensorFusionManager::addRoseMeasurementsToTrackingTargetSet failed: IMU buffer is empty", v2, v3, v4, v5, v6);
}

void sub_100438AE0(uint64_t a1, void *a2, NSObject *a3)
{
  uint64_t v5 = sub_10040AC08(a1);
  uint64_t v6 = a2[10];
  uint64_t v7 = *(void *)(*(void *)(v6 + ((a2[13] >> 6) & 0x3FFFFFFFFFFFFF8)) + 8 * (a2[13] & 0x1FFLL));
  uint64_t v8 = *(void *)(*(void *)(v6 + (((unint64_t)(a2[13] + a2[14] - 1) >> 6) & 0x3FFFFFFFFFFFFF8))
                 + 8 * ((a2[13] + a2[14] - 1) & 0x1FF));
  int v9 = 134218496;
  uint64_t v10 = v5;
  __int16 v11 = 2048;
  uint64_t v12 = v7;
  __int16 v13 = 2048;
  uint64_t v14 = v8;
  _os_log_error_impl((void *)&_mh_execute_header, a3, OS_LOG_TYPE_ERROR, "#sf,RoseSensorFusionManager::addRoseMeasurementsToTrackingTargetSet failed: IMU buffer size is %lu, time stamps from %f to %f", (uint8_t *)&v9, 0x20u);
}

void sub_100438BBC()
{
  sub_100010524();
  sub_1000104E4((void *)&_mh_execute_header, v0, v1, "#sf,RoseSensorFusionManager: Attempt to clear IMU history is aborted because there are targets being tracked.", v2, v3, v4, v5, v6);
}

uint64_t sub_100438BF0(uint64_t a1)
{
  *(void *)(a1 + 448) = off_100853598;
  return sub_10016CC78((void *)(a1 + 392));
}

void sub_100438C2C(os_log_t log)
{
  *(_WORD *)uint64_t v1 = 0;
  _os_log_error_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_ERROR, "#sf,[RoseSensorFusionTrackingTargetSet: get empty rose measurements vector]", v1, 2u);
}

void sub_100438C70()
{
}

void sub_100438C9C()
{
}

void sub_100438CC8()
{
}

void sub_100438CF4()
{
}

void sub_100438D20()
{
}

void sub_100438D4C()
{
}

void sub_100438D78()
{
}

void sub_100438DA4()
{
}

void sub_100438DD0()
{
}

void sub_100438DFC()
{
  __assert_rtn("operator double", "cnmatrixbase.h", 979, "num_elements_ == 1");
}

void sub_100438E28(os_log_t log)
{
  *(_WORD *)uint64_t v1 = 0;
  _os_log_error_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_ERROR, "#sf,RoseSensorFusionTrackingTargetSet::findOptimalAssociation: assignment matrix is empty, return now", v1, 2u);
}

void sub_100438E6C()
{
}

void sub_100438E98()
{
  __assert_rtn("getAoaScaleFactor", "RoseSensorFusionTrackingTargetSet.cpp", 717, "probability_vector.size() == fNNClassifierPtr->getOutputSize()");
}

void sub_100438EC4()
{
  __assert_rtn("getAoaScaleFactor", "RoseSensorFusionTrackingTargetSet.cpp", 714, "azimuth_rose_deg >=0 && azimuth_rose_deg <= 180 && elevation_rose_deg >= 0 && elevation_rose_deg <= 180");
}

void sub_100438EF0()
{
}

uint64_t sub_100438F1C(uint64_t result, uint64_t a2)
{
  uint64_t v2 = result + 96;
  do
  {
    *(void *)(result + 96) = off_100853598;
    *(void *)(result + 8) = off_100853598;
    result += 584;
    v2 += 584;
  }
  while (result != a2);
  return result;
}

void sub_100438F70()
{
  __assert_rtn("Det", "cnmatrixbase.h", 5349, "Ipiv.max_num_rows_ >= A.num_rows_");
}

void sub_100438F9C()
{
  __assert_rtn("Det", "cnmatrixbase.h", 5351, "Work.max_num_rows_ >= A.num_rows_");
}

void sub_100438FC8()
{
  __assert_rtn("Det", "cnmatrixbase.h", 5352, "Work.max_num_cols_ >= A.num_cols_");
}

void sub_100438FF4()
{
  __assert_rtn("Det", "cnmatrixbase.h", 5381, "info >= 0");
}

void sub_100439050()
{
  __assert_rtn("Det", "cnmatrixbase.h", 5347, "A.num_rows_ == A.num_cols_");
}

void sub_10043907C()
{
  __assert_rtn("Dot", "cnmatrixbase.h", 4076, "a.num_rows_ == 1 || a.num_cols_ == 1");
}

void sub_1004390A8()
{
  __assert_rtn("Dot", "cnmatrixbase.h", 4077, "b.num_rows_ == 1 || b.num_cols_ == 1");
}

void sub_1004390D4()
{
  __assert_rtn("Dot", "cnmatrixbase.h", 4079, "a.num_elements_ == b.num_elements_");
}

void sub_100439100()
{
  sub_100010524();
  sub_1000104E4((void *)&_mh_execute_header, v0, v1, "#sf,Error: trying to normalize a zero quanternion - Setting the quaternion to a unit quaternion instead.", v2, v3, v4, v5, v6);
}

void sub_100439134()
{
  sub_100010524();
  sub_1000104E4((void *)&_mh_execute_header, v0, v1, "#sf,EKF is not initialized", v2, v3, v4, v5, v6);
}

void sub_100439168()
{
  sub_100010524();
  sub_1000104E4((void *)&_mh_execute_header, v0, v1, "#sf,Attempted to propagate state to the past - Filter time is ahead of the most current IMU time", v2, v3, v4, v5, v6);
}

void sub_10043919C()
{
  sub_100010524();
  sub_1000104E4((void *)&_mh_execute_header, v0, v1, "#sf,propagateEKF fails", v2, v3, v4, v5, v6);
}

void sub_1004391D0()
{
  sub_100010524();
  sub_1000104E4((void *)&_mh_execute_header, v0, v1, "#sf,Propagating state vector X fails", v2, v3, v4, v5, v6);
}

void sub_100439204()
{
  __assert_rtn("operator=", "cnsubmatrix.h", 377, "this->num_cols_ == A.num_cols_");
}

void sub_100439230()
{
  __assert_rtn("operator=", "cnsubmatrix.h", 376, "this->num_rows_ == A.num_rows_");
}

void sub_10043925C(os_log_t log, double a2, double a3)
{
  int v3 = 134218240;
  double v4 = a2;
  __int16 v5 = 2048;
  double v6 = a3;
  _os_log_error_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_ERROR, "#sf,RoseEKF error: Trying to propagate state backward from time %f to time %f", (uint8_t *)&v3, 0x16u);
}

void sub_1004392E4()
{
  sub_100175C1C();
  if (v6 != v7) {
    uint64_t v8 = v5;
  }
  else {
    uint64_t v8 = v1;
  }
  *(_DWORD *)uint64_t v2 = 136315138;
  *(void *)(v2 + 4) = v8;
  _os_log_error_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_ERROR, "#sf,%s", v4, 0xCu);
  if (*(char *)(v0 + 23) < 0) {
    operator delete(*(void **)v0);
  }
}

void sub_100439348()
{
  __assert_rtn("operator=", "cnsubvector.h", 347, "this->num_elements_ == A.num_elements_");
}

void sub_100439374()
{
  sub_100010524();
  sub_10016F0D8((void *)&_mh_execute_header, v0, v1, "#sf,RoseEKF-rangeElAz2x: Az angle close to singularity - converting the covariance matrix without measurement Jacobian", v2, v3, v4, v5, v6);
}

void sub_1004393A8()
{
  __assert_rtn("operator()", "cnmatrix.h", 1194, "strcmp(c, \":\") == 0");
}

void sub_1004393D4()
{
}

void sub_100439400(std::string *a1, NSObject *a2)
{
  sub_1003FFC94(a1, &__p);
  sub_100186DAC();
  int v6 = 136315138;
  uint64_t v7 = v3;
  sub_1001FDE5C((void *)&_mh_execute_header, a2, v4, "#sf,RoseEKF measUpdateAlt R: %s", (uint8_t *)&v6);
  if (SHIBYTE(__p.__r_.__value_.__r.__words[2]) < 0) {
    operator delete(__p.__r_.__value_.__l.__data_);
  }
}

void sub_1004394A4(uint64_t a1, NSObject *a2)
{
  int v4 = 134217984;
  double v5 = sub_1002A43FC(a1, 0, 0);
  sub_1001FDE5C((void *)&_mh_execute_header, a2, v3, "#sf,RoseEKF: measUpdateRange R: %f", (uint8_t *)&v4);
}

void sub_100439530()
{
  __assert_rtn("operator()", "cnmatrix.h", 992, "strcmp(c, \":\") == 0");
}

void sub_10043955C(uint64_t a1, NSObject *a2)
{
  int v4 = 134218752;
  double v5 = sub_1002A43FC(a1, 0, 0);
  __int16 v6 = 2048;
  double v7 = sub_1002A43FC(a1, 0, 1);
  __int16 v8 = 2048;
  double v9 = sub_1002A43FC(a1, 1, 0);
  __int16 v10 = 2048;
  double v11 = sub_1002A43FC(a1, 1, 1);
  _os_log_debug_impl((void *)&_mh_execute_header, a2, OS_LOG_TYPE_DEBUG, "#sf,RoseEKF: measUpdateAoA R: %f, %f; %f, %f",
    (uint8_t *)&v4,
    0x2Au);
}

void sub_10043965C()
{
  sub_100010524();
  sub_1000104E4((void *)&_mh_execute_header, v0, v1, "#sf,RoseEKF error: Rose AoA measurement rejected - Filter not initialized.", v2, v3, v4, v5, v6);
}

void sub_100439690()
{
  sub_100010524();
  sub_1000104E4((void *)&_mh_execute_header, v0, v1, "#sf,RoseEKF error: Rose AoA measurement rejected - Invalid angles.", v2, v3, v4, v5, v6);
}

void sub_1004396C4()
{
  sub_100010524();
  sub_10016F0D8((void *)&_mh_execute_header, v0, v1, "#sf,RoseEFK: to start propagate and measurement update", v2, v3, v4, v5, v6);
}

void sub_1004396F8()
{
  sub_100010524();
  sub_1000104E4((void *)&_mh_execute_header, v0, v1, "#sf,RoseEKF error: Rose range measurement rejected - Filter not initialized.", v2, v3, v4, v5, v6);
}

void sub_10043972C()
{
  sub_100010524();
  sub_1000104E4((void *)&_mh_execute_header, v0, v1, "#sf,RoseEKF error: Rose range measurement rejected - Invalid range.", v2, v3, v4, v5, v6);
}

void sub_100439760()
{
  sub_100010524();
  sub_1000104E4((void *)&_mh_execute_header, v0, v1, "#sf,RoseEKF error: Rose range&Aoa measurement rejected - Filter not initialized.", v2, v3, v4, v5, v6);
}

void sub_100439794()
{
  sub_100010524();
  sub_1000104E4((void *)&_mh_execute_header, v0, v1, "#sf,RoseEKF error: Rose range&Aoa measurement rejected - Invalid angles or range.", v2, v3, v4, v5, v6);
}

void sub_1004397C8()
{
  sub_100010524();
  sub_10016F0D8((void *)&_mh_execute_header, v0, v1, "#sf,RoseEFK: to start propagate and measurement update with alternative measurement model", v2, v3, v4, v5, v6);
}

void sub_1004397FC()
{
  sub_100010524();
  sub_10016F0D8((void *)&_mh_execute_header, v0, v1, "#sf,propAndMeasUpdateMain end", v2, v3, v4, v5, v6);
}

void sub_100439830()
{
  sub_100010524();
  sub_1000104E4((void *)&_mh_execute_header, v0, v1, "#sf,RoseEKF error: Trying to initialize EKF but IMU buffer is empty", v2, v3, v4, v5, v6);
}

void sub_100439864()
{
  sub_10020E5CC(__stack_chk_guard);
  sub_100196EA0();
  _os_log_error_impl((void *)&_mh_execute_header, v0, OS_LOG_TYPE_ERROR, "#sf,RoseEKF error: The measurement timestamp (%f) is older than the oldest IMU timestamp (%f) - rejecting the measurement for initialization", v1, 0x16u);
}

void sub_1004398F8()
{
  sub_100175C1C();
  if (v6 != v7) {
    uint64_t v8 = v5;
  }
  else {
    uint64_t v8 = v1;
  }
  *(_DWORD *)uint64_t v2 = 136315138;
  *(void *)(v2 + 4) = v8;
  sub_1001FDE5C((void *)&_mh_execute_header, v3, (uint64_t)v3, "#sf,RoseEKF: initial P matrix %s", v4);
  if (*(char *)(v0 + 23) < 0) {
    operator delete(*(void **)v0);
  }
}

void sub_100439954()
{
  sub_100010524();
  sub_1000104E4((void *)&_mh_execute_header, v0, v1, "#sf,RoseEKF: imuHistory is empty in propAndMeasUpdateMain()", v2, v3, v4, v5, v6);
}

void sub_100439988()
{
  sub_10020E5CC(__stack_chk_guard);
  sub_100010500();
  sub_10000B3E0((void *)&_mh_execute_header, v0, v1, "#sf,RoseEKF error: Aborting measurement update with a delayed measurement at t = %f s", v2, v3, v4, v5, v6);
}

void sub_1004399F0()
{
}

void sub_100439A1C()
{
  sub_10020E5CC(__stack_chk_guard);
  sub_100010500();
  sub_10000B3E0((void *)&_mh_execute_header, v0, v1, "#sf,RoseEKF error: Delayed Rose range measurement with negative range rejected at t = %f s", v2, v3, v4, v5, v6);
}

void sub_100439A84()
{
  sub_10020E5CC(__stack_chk_guard);
  sub_100010500();
  sub_1001FDE5C((void *)&_mh_execute_header, v0, v1, "#sf,RoseEKF: range measurement update done in the delayed measurement at t = %f s", v2);
}

void sub_100439AF0()
{
  sub_100010524();
  sub_1000104E4((void *)&_mh_execute_header, v0, v1, "#sf,RoseEKF error: Delayed rose range&Aoa measurement to be used in the alternative measurement update rejected - Invalid angles or range.", v2, v3, v4, v5, v6);
}

void sub_100439B24()
{
  sub_10020E5CC(__stack_chk_guard);
  sub_100196EA0();
  _os_log_debug_impl((void *)&_mh_execute_header, v0, OS_LOG_TYPE_DEBUG, "#sf,RoseEKF: Rewinding back to the last measurement at t = %f s from t = %f s", v1, 0x16u);
}

void sub_100439BA0()
{
  sub_10020E5CC(__stack_chk_guard);
  sub_100010500();
  sub_10000B3E0((void *)&_mh_execute_header, v0, v1, "#sf,RoseEKF error: Rose range measurement with negative range rejected at t = %f s", v2, v3, v4, v5, v6);
}

void sub_100439C08()
{
  sub_10020E5CC(__stack_chk_guard);
  sub_100010500();
  sub_1001FDE5C((void *)&_mh_execute_header, v0, v1, "#sf,RoseEKF: range measurement update done in the non-delayed measurement at t = %f s", v2);
}

void sub_100439C74()
{
  sub_10020E5CC(__stack_chk_guard);
  sub_100010500();
  sub_1001FDE5C((void *)&_mh_execute_header, v0, v1, "#sf,RoseEKF: AoA measurement update done in the non-delayed measurement at t = %f s", v2);
}

void sub_100439CE0()
{
  sub_100010524();
  sub_10016F0D8((void *)&_mh_execute_header, v0, v1, "#sf,RoseEKF: fetch last IMU data done", v2, v3, v4, v5, v6);
}

void sub_100439D14()
{
  sub_100010524();
  sub_10016F0D8((void *)&_mh_execute_header, v0, v1, "#sf,RoseEKF: fetch last IMU data", v2, v3, v4, v5, v6);
}

void sub_100439D48()
{
  sub_100010524();
  sub_10016F0D8((void *)&_mh_execute_header, v0, v1, "#sf,propAndMeasUpdateMain start", v2, v3, v4, v5, v6);
}

void sub_100439D7C()
{
  sub_100010524();
  sub_1000104E4((void *)&_mh_execute_header, v0, v1, "#sf,RoseEKF error: imuHistory is empty in dynamicPropMain()", v2, v3, v4, v5, v6);
}

void sub_100439DB0()
{
  __assert_rtn("operator()", "cnmatrixbase.h", 848, "data_ != __null");
}

void sub_100439DDC()
{
  __assert_rtn("operator()", "cnmatrixbase.h", 849, "idx >= 0");
}

void sub_100439E08()
{
}

void sub_100439E34()
{
  __assert_rtn("operator()", "cnmatrixbase.h", 881, "data_ != __null");
}

void sub_100439E60()
{
  __assert_rtn("operator()", "cnmatrixbase.h", 882, "idx >= 0");
}

void sub_100439E8C()
{
}

void sub_100439EB8()
{
}

void sub_100439EE4()
{
  __assert_rtn("Inv", "cnmatrixbase.h", 6212, "Ipiv.max_num_rows_ * Ipiv.max_num_cols_ >= A.num_rows_");
}

void sub_100439F10()
{
  __assert_rtn("Inv", "cnmatrixbase.h", 6214, "Iwork.max_num_rows_ * Iwork.max_num_cols_ >= A.num_rows_");
}

void sub_100439F3C()
{
  __assert_rtn("Inv", "cnmatrixbase.h", 6216, "Work.max_num_rows_ * Work.max_num_cols_ >= 4 * A.num_rows_");
}

void sub_100439F68()
{
  __assert_rtn("Inv", "cnmatrixbase.h", 6218, "B.max_num_rows_ >= A.num_rows_");
}

void sub_100439F94()
{
  __assert_rtn("Inv", "cnmatrixbase.h", 6219, "B.max_num_cols_ >= A.num_cols_");
}

void sub_100439FC0()
{
  __assert_rtn("Inv", "cnmatrixbase.h", 6258, "info >= 0");
}

void sub_10043A014()
{
  __assert_rtn("Inv", "cnmatrixbase.h", 6311, "info == 0");
}

void sub_10043A040()
{
  __assert_rtn("Inv", "cnmatrixbase.h", 6343, "info >= 0");
}

void sub_10043A06C()
{
  __assert_rtn("Inv", "cnmatrixbase.h", 6210, "A.num_rows_ == A.num_cols_");
}

void sub_10043A098()
{
  __assert_rtn("Multiply", "cnmatrixbase.h", 3749, "&(A) != &(C)");
}

void sub_10043A0C4()
{
  __assert_rtn("Negate", "cnmatrixbase.h", 3401, "&A != &B");
}

void sub_10043A0F0()
{
  __assert_rtn("Negate", "cnmatrixbase.h", 3403, "B.max_num_rows_ >= A.num_rows_");
}

void sub_10043A11C()
{
  __assert_rtn("Negate", "cnmatrixbase.h", 3404, "B.max_num_cols_ >= A.num_cols_");
}

void sub_10043A148()
{
  __assert_rtn("Chol", "cnmatrixbase.h", 5103, "B.max_num_rows_ >= A.num_rows_");
}

void sub_10043A174()
{
  __assert_rtn("Chol", "cnmatrixbase.h", 5104, "B.max_num_cols_ >= A.num_cols_");
}

void sub_10043A1A0()
{
  __assert_rtn("Chol", "cnmatrixbase.h", 5102, "A.num_rows_ == A.num_cols_");
}

void sub_10043A1CC()
{
  __assert_rtn("Qr", "cnmatrixbase.h", 6541, "&A != &Tau");
}

void sub_10043A1F8()
{
  __assert_rtn("Qr", "cnmatrixbase.h", 6542, "&A != &Work");
}

void sub_10043A224()
{
  __assert_rtn("Qr", "cnmatrixbase.h", 6543, "&A != &R");
}

void sub_10043A250()
{
  __assert_rtn("Qr", "cnmatrixbase.h", 6544, "&Tau != &Work");
}

void sub_10043A27C()
{
  __assert_rtn("Qr", "cnmatrixbase.h", 6545, "&Tau != &R");
}

void sub_10043A2A8()
{
  __assert_rtn("Qr", "cnmatrixbase.h", 6546, "&Work != &R");
}

void sub_10043A2D4()
{
  __assert_rtn("Qr", "cnmatrixbase.h", 6549, "R.max_num_rows_ >= A.num_rows_");
}

void sub_10043A300()
{
  __assert_rtn("Qr", "cnmatrixbase.h", 6550, "R.max_num_cols_ >= A.num_cols_");
}

void sub_10043A32C()
{
  __assert_rtn("Qr", "cnmatrixbase.h", 6553, "Tau.max_num_rows_ >= A.num_rows_");
}

void sub_10043A358()
{
  __assert_rtn("Qr", "cnmatrixbase.h", 6559, "Work.max_num_rows_ >= A.num_cols_");
}

void sub_10043A384()
{
  __assert_rtn("Qr", "cnmatrixbase.h", 6560, "Work.max_num_cols_ >= A.num_cols_");
}

void sub_10043A3B0()
{
  __assert_rtn("Qr", "cnmatrixbase.h", 6599, "info == 0");
}

void sub_10043A3DC()
{
  __assert_rtn("Qr", "cnmatrixbase.h", 6557, "Tau.max_num_rows_ >= A.num_cols_");
}

void sub_10043A408()
{
  __assert_rtn("Qr", "cnmatrixbase.h", 6659, "&A != &Tau");
}

void sub_10043A434()
{
  __assert_rtn("Qr", "cnmatrixbase.h", 6660, "&A != &Work");
}

void sub_10043A460()
{
  __assert_rtn("Qr", "cnmatrixbase.h", 6661, "&A != &Q");
}

void sub_10043A48C()
{
  __assert_rtn("Qr", "cnmatrixbase.h", 6662, "&A != &R");
}

void sub_10043A4B8()
{
  __assert_rtn("Qr", "cnmatrixbase.h", 6663, "&Tau != &Work");
}

void sub_10043A4E4()
{
  __assert_rtn("Qr", "cnmatrixbase.h", 6664, "&Tau != &Q");
}

void sub_10043A510()
{
  __assert_rtn("Qr", "cnmatrixbase.h", 6665, "&Tau != &R");
}

void sub_10043A53C()
{
  __assert_rtn("Qr", "cnmatrixbase.h", 6666, "&Work != &Q");
}

void sub_10043A568()
{
  __assert_rtn("Qr", "cnmatrixbase.h", 6667, "&Work != &R");
}

void sub_10043A594()
{
  __assert_rtn("Qr", "cnmatrixbase.h", 6668, "&Q != &R");
}

void sub_10043A5C0()
{
  __assert_rtn("Qr", "cnmatrixbase.h", 6671, "Q.max_num_rows_ >= A.num_rows_");
}

void sub_10043A5EC()
{
  __assert_rtn("Qr", "cnmatrixbase.h", 6672, "Q.max_num_rows_ >= A.num_cols_");
}

void sub_10043A618()
{
  __assert_rtn("Qr", "cnmatrixbase.h", 6673, "Q.max_num_cols_ >= A.num_rows_");
}

void sub_10043A644()
{
  __assert_rtn("Qr", "cnmatrixbase.h", 6674, "Q.max_num_cols_ >= A.num_cols_");
}

void sub_10043A670()
{
  __assert_rtn("Qr", "cnmatrixbase.h", 6675, "R.max_num_rows_ >= A.num_rows_");
}

void sub_10043A69C()
{
  __assert_rtn("Qr", "cnmatrixbase.h", 6676, "R.max_num_cols_ >= A.num_cols_");
}

void sub_10043A6C8()
{
  __assert_rtn("Qr", "cnmatrixbase.h", 6679, "Tau.max_num_rows_ >= A.num_rows_");
}

void sub_10043A6F4()
{
  __assert_rtn("Qr", "cnmatrixbase.h", 6685, "Work.max_num_rows_ >= A.num_cols_");
}

void sub_10043A720()
{
  __assert_rtn("Qr", "cnmatrixbase.h", 6686, "Work.max_num_cols_ >= A.num_cols_");
}

void sub_10043A74C()
{
  __assert_rtn("Qr", "cnmatrixbase.h", 6769, "info == 0");
}

void sub_10043A778()
{
  __assert_rtn("Qr", "cnmatrixbase.h", 6725, "info == 0");
}

void sub_10043A7A4()
{
  __assert_rtn("Qr", "cnmatrixbase.h", 6683, "Tau.max_num_rows_ >= A.num_cols_");
}

uint64_t ALBtAdvInfoType7.isLeftBud.getter()
{
  return ALBtAdvInfoType7.isLeftBud.getter();
}

uint64_t type metadata accessor for ALBtAdvInfoType7()
{
  return type metadata accessor for ALBtAdvInfoType7();
}

uint64_t ALBtNotification.isScreenOn.getter()
{
  return ALBtNotification.isScreenOn.getter();
}

uint64_t ALBtNotification.advertisements.getter()
{
  return ALBtNotification.advertisements.getter();
}

uint64_t type metadata accessor for ALBtNotification()
{
  return type metadata accessor for ALBtNotification();
}

uint64_t ALBtAdvertisement.identifier.getter()
{
  return ALBtAdvertisement.identifier.getter();
}

uint64_t ALBtAdvertisement.machContTimeNs.getter()
{
  return ALBtAdvertisement.machContTimeNs.getter();
}

uint64_t ALBtAdvertisement.type.getter()
{
  return ALBtAdvertisement.type.getter();
}

uint64_t type metadata accessor for ALBtAdvertisement.BtType()
{
  return type metadata accessor for ALBtAdvertisement.BtType();
}

uint64_t ALBtAdvertisement.rssidB.getter()
{
  return ALBtAdvertisement.rssidB.getter();
}

uint64_t ALBtAdvertisement.channel.getter()
{
  return ALBtAdvertisement.channel.getter();
}

uint64_t ALBtAdvertisement.productID.getter()
{
  return ALBtAdvertisement.productID.getter();
}

uint64_t ALBtAdvertisement.type7Info.getter()
{
  return ALBtAdvertisement.type7Info.getter();
}

uint64_t type metadata accessor for ALBtAdvertisement()
{
  return type metadata accessor for ALBtAdvertisement();
}

uint64_t os_log(_:dso:log:_:_:)()
{
  return os_log(_:dso:log:_:_:)();
}

uint64_t ALFBtAdvResultsRequester.init(queue:)()
{
  return ALFBtAdvResultsRequester.init(queue:)();
}

uint64_t dispatch thunk of ALFBtAdvResultsRequester.register(callback:intervalSec:)()
{
  return dispatch thunk of ALFBtAdvResultsRequester.register(callback:intervalSec:)();
}

uint64_t type metadata accessor for ALFBtAdvResultsRequester()
{
  return type metadata accessor for ALFBtAdvResultsRequester();
}

uint64_t dispatch thunk of static Equatable.== infix(_:_:)()
{
  return dispatch thunk of static Equatable.== infix(_:_:)();
}

NSString __swiftcall String._bridgeToObjectiveC()()
{
  return (NSString)String._bridgeToObjectiveC()();
}

uint64_t static String._unconditionallyBridgeFromObjectiveC(_:)()
{
  return static String._unconditionallyBridgeFromObjectiveC(_:)();
}

Swift::Void __swiftcall String.append(_:)(Swift::String a1)
{
}

uint64_t String.init(cString:)()
{
  return String.init(cString:)();
}

Swift::Int __swiftcall String.UTF8View._foreignCount()()
{
  return String.UTF8View._foreignCount()();
}

uint64_t static os_log_type_t.debug.getter()
{
  return static os_log_type_t.debug.getter();
}

uint64_t static os_log_type_t.error.getter()
{
  return static os_log_type_t.error.getter();
}

uint64_t static OS_os_log.default.getter()
{
  return static OS_os_log.default.getter();
}

uint64_t UnsafeMutableRawBufferPointer.copyMemory(from:)()
{
  return UnsafeMutableRawBufferPointer.copyMemory(from:)();
}

uint64_t UnsafeMutableRawBufferPointer.subscript.setter()
{
  return UnsafeMutableRawBufferPointer.subscript.setter();
}

uint64_t _StringGuts.copyUTF8(into:)()
{
  return _StringGuts.copyUTF8(into:)();
}

uint64_t _StringObject.sharedUTF8.getter()
{
  return _StringObject.sharedUTF8.getter();
}

uint64_t _assertionFailure(_:_:file:line:flags:)()
{
  return _assertionFailure(_:_:file:line:flags:)();
}

uint64_t _fatalErrorMessage(_:_:file:line:flags:)()
{
  return _fatalErrorMessage(_:_:file:line:flags:)();
}

uint64_t AnalyticsSendEventLazy()
{
  return _AnalyticsSendEventLazy();
}

uint64_t CBProductIDFromNSString()
{
  return _CBProductIDFromNSString();
}

uint64_t CCCryptorAddParameter()
{
  return _CCCryptorAddParameter();
}

CCCryptorStatus CCCryptorCreateWithMode(CCOperation op, CCMode mode, CCAlgorithm alg, CCPadding padding, const void *iv, const void *key, size_t keyLength, const void *tweak, size_t tweakLength, int numRounds, CCModeOptions options, CCCryptorRef *cryptorRef)
{
  return _CCCryptorCreateWithMode(op, mode, alg, padding, iv, key, keyLength, tweak, tweakLength, numRounds, options, cryptorRef);
}

CCCryptorStatus CCCryptorFinal(CCCryptorRef cryptorRef, void *dataOut, size_t dataOutAvailable, size_t *dataOutMoved)
{
  return _CCCryptorFinal(cryptorRef, dataOut, dataOutAvailable, dataOutMoved);
}

size_t CCCryptorGetOutputLength(CCCryptorRef cryptorRef, size_t inputLength, BOOL final)
{
  return _CCCryptorGetOutputLength(cryptorRef, inputLength, final);
}

uint64_t CCCryptorGetParameter()
{
  return _CCCryptorGetParameter();
}

CCCryptorStatus CCCryptorRelease(CCCryptorRef cryptorRef)
{
  return _CCCryptorRelease(cryptorRef);
}

CCCryptorStatus CCCryptorUpdate(CCCryptorRef cryptorRef, const void *dataIn, size_t dataInLength, void *dataOut, size_t dataOutAvailable, size_t *dataOutMoved)
{
  return _CCCryptorUpdate(cryptorRef, dataIn, dataInLength, dataOut, dataOutAvailable, dataOutMoved);
}

uint64_t CCDeriveKey()
{
  return _CCDeriveKey();
}

uint64_t CCKDFParametersCreateHkdf()
{
  return _CCKDFParametersCreateHkdf();
}

uint64_t CCKDFParametersDestroy()
{
  return _CCKDFParametersDestroy();
}

CFAbsoluteTime CFAbsoluteTimeGetCurrent(void)
{
  return _CFAbsoluteTimeGetCurrent();
}

CFIndex CFArrayGetCount(CFArrayRef theArray)
{
  return _CFArrayGetCount(theArray);
}

CFTypeID CFArrayGetTypeID(void)
{
  return _CFArrayGetTypeID();
}

const void *__cdecl CFArrayGetValueAtIndex(CFArrayRef theArray, CFIndex idx)
{
  return _CFArrayGetValueAtIndex(theArray, idx);
}

CFTypeRef CFAutorelease(CFTypeRef arg)
{
  return _CFAutorelease(arg);
}

CFDataRef CFDataCreateWithBytesNoCopy(CFAllocatorRef allocator, const UInt8 *bytes, CFIndex length, CFAllocatorRef bytesDeallocator)
{
  return _CFDataCreateWithBytesNoCopy(allocator, bytes, length, bytesDeallocator);
}

const UInt8 *__cdecl CFDataGetBytePtr(CFDataRef theData)
{
  return _CFDataGetBytePtr(theData);
}

CFIndex CFDataGetLength(CFDataRef theData)
{
  return _CFDataGetLength(theData);
}

CFTypeID CFDataGetTypeID(void)
{
  return _CFDataGetTypeID();
}

void CFDictionaryAddValue(CFMutableDictionaryRef theDict, const void *key, const void *value)
{
}

Boolean CFDictionaryContainsKey(CFDictionaryRef theDict, const void *key)
{
  return _CFDictionaryContainsKey(theDict, key);
}

CFDictionaryRef CFDictionaryCreate(CFAllocatorRef allocator, const void **keys, const void **values, CFIndex numValues, const CFDictionaryKeyCallBacks *keyCallBacks, const CFDictionaryValueCallBacks *valueCallBacks)
{
  return _CFDictionaryCreate(allocator, keys, values, numValues, keyCallBacks, valueCallBacks);
}

CFMutableDictionaryRef CFDictionaryCreateMutable(CFAllocatorRef allocator, CFIndex capacity, const CFDictionaryKeyCallBacks *keyCallBacks, const CFDictionaryValueCallBacks *valueCallBacks)
{
  return _CFDictionaryCreateMutable(allocator, capacity, keyCallBacks, valueCallBacks);
}

CFMutableDictionaryRef CFDictionaryCreateMutableCopy(CFAllocatorRef allocator, CFIndex capacity, CFDictionaryRef theDict)
{
  return _CFDictionaryCreateMutableCopy(allocator, capacity, theDict);
}

CFTypeID CFDictionaryGetTypeID(void)
{
  return _CFDictionaryGetTypeID();
}

const void *__cdecl CFDictionaryGetValue(CFDictionaryRef theDict, const void *key)
{
  return _CFDictionaryGetValue(theDict, key);
}

Boolean CFDictionaryGetValueIfPresent(CFDictionaryRef theDict, const void *key, const void **value)
{
  return _CFDictionaryGetValueIfPresent(theDict, key, value);
}

void CFDictionaryRemoveAllValues(CFMutableDictionaryRef theDict)
{
}

void CFDictionarySetValue(CFMutableDictionaryRef theDict, const void *key, const void *value)
{
}

Boolean CFEqual(CFTypeRef cf1, CFTypeRef cf2)
{
  return _CFEqual(cf1, cf2);
}

CFTypeID CFGetTypeID(CFTypeRef cf)
{
  return _CFGetTypeID(cf);
}

void CFNotificationCenterAddObserver(CFNotificationCenterRef center, const void *observer, CFNotificationCallback callBack, CFStringRef name, const void *object, CFNotificationSuspensionBehavior suspensionBehavior)
{
}

CFNotificationCenterRef CFNotificationCenterGetDarwinNotifyCenter(void)
{
  return _CFNotificationCenterGetDarwinNotifyCenter();
}

void CFNotificationCenterPostNotification(CFNotificationCenterRef center, CFNotificationName name, const void *object, CFDictionaryRef userInfo, Boolean deliverImmediately)
{
}

void CFNotificationCenterRemoveObserver(CFNotificationCenterRef center, const void *observer, CFNotificationName name, const void *object)
{
}

CFNumberRef CFNumberCreate(CFAllocatorRef allocator, CFNumberType theType, const void *valuePtr)
{
  return _CFNumberCreate(allocator, theType, valuePtr);
}

CFTypeID CFNumberGetTypeID(void)
{
  return _CFNumberGetTypeID();
}

Boolean CFNumberGetValue(CFNumberRef number, CFNumberType theType, void *valuePtr)
{
  return _CFNumberGetValue(number, theType, valuePtr);
}

Boolean CFPreferencesGetAppBooleanValue(CFStringRef key, CFStringRef applicationID, Boolean *keyExistsAndHasValidFormat)
{
  return _CFPreferencesGetAppBooleanValue(key, applicationID, keyExistsAndHasValidFormat);
}

CFIndex CFPreferencesGetAppIntegerValue(CFStringRef key, CFStringRef applicationID, Boolean *keyExistsAndHasValidFormat)
{
  return _CFPreferencesGetAppIntegerValue(key, applicationID, keyExistsAndHasValidFormat);
}

void CFRelease(CFTypeRef cf)
{
}

CFTypeRef CFRetain(CFTypeRef cf)
{
  return _CFRetain(cf);
}

CFRunLoopRef CFRunLoopGetCurrent(void)
{
  return _CFRunLoopGetCurrent();
}

void CFRunLoopRun(void)
{
}

CFStringRef CFStringCreateWithCString(CFAllocatorRef alloc, const char *cStr, CFStringEncoding encoding)
{
  return _CFStringCreateWithCString(alloc, cStr, encoding);
}

CFTypeID CFStringGetTypeID(void)
{
  return _CFStringGetTypeID();
}

CFUUIDRef CFUUIDGetConstantUUIDWithBytes(CFAllocatorRef alloc, UInt8 byte0, UInt8 byte1, UInt8 byte2, UInt8 byte3, UInt8 byte4, UInt8 byte5, UInt8 byte6, UInt8 byte7, UInt8 byte8, UInt8 byte9, UInt8 byte10, UInt8 byte11, UInt8 byte12, UInt8 byte13, UInt8 byte14, UInt8 byte15)
{
  return _CFUUIDGetConstantUUIDWithBytes(alloc, byte0, byte1, byte2, byte3, byte4, byte5, byte6, byte7, byte8, byte9, byte10, byte11, byte12, byte13, byte14, byte15);
}

CFUUIDBytes CFUUIDGetUUIDBytes(CFUUIDRef uuid)
{
  CFUUIDBytes v3 = _CFUUIDGetUUIDBytes(uuid);
  uint64_t v2 = *(void *)&v3.byte8;
  uint64_t v1 = *(void *)&v3.byte0;
  result.byte8 = v2;
  result.byte9 = BYTE1(v2);
  result.byte10 = BYTE2(v2);
  result.byte11 = BYTE3(v2);
  result.byte12 = BYTE4(v2);
  result.byte13 = BYTE5(v2);
  result.byte14 = BYTE6(v2);
  result.byte15 = HIBYTE(v2);
  result.byte0 = v1;
  result.byte1 = BYTE1(v1);
  result.byte2 = BYTE2(v1);
  result.byte3 = BYTE3(v1);
  result.byte4 = BYTE4(v1);
  result.byte5 = BYTE5(v1);
  result.byte6 = BYTE6(v1);
  result.byte7 = HIBYTE(v1);
  return result;
}

SInt32 CFUserNotificationDisplayAlert(CFTimeInterval timeout, CFOptionFlags flags, CFURLRef iconURL, CFURLRef soundURL, CFURLRef localizationURL, CFStringRef alertHeader, CFStringRef alertMessage, CFStringRef defaultButtonTitle, CFStringRef alternateButtonTitle, CFStringRef otherButtonTitle, CFOptionFlags *responseFlags)
{
  return _CFUserNotificationDisplayAlert(timeout, flags, iconURL, soundURL, localizationURL, alertHeader, alertMessage, defaultButtonTitle, alternateButtonTitle, otherButtonTitle, responseFlags);
}

uint64_t CLClientGetDistanceCoordinates()
{
  return _CLClientGetDistanceCoordinates();
}

uint64_t CLCopyNearbyAssetSettings()
{
  return _CLCopyNearbyAssetSettings();
}

uint64_t CLCopyNearbyAssetSettingsOfAccessoryFile()
{
  return _CLCopyNearbyAssetSettingsOfAccessoryFile();
}

uint64_t CUObfuscatedPtr()
{
  return _CUObfuscatedPtr();
}

uint64_t CUPrintNSDataAddress()
{
  return _CUPrintNSDataAddress();
}

uint64_t CUPrintNSDataHex()
{
  return _CUPrintNSDataHex();
}

uint64_t CUPrintNSObjectMasked()
{
  return _CUPrintNSObjectMasked();
}

uint64_t CUPrintXPC()
{
  return _CUPrintXPC();
}

kern_return_t IOConnectCallMethod(mach_port_t connection, uint32_t selector, const uint64_t *input, uint32_t inputCnt, const void *inputStruct, size_t inputStructCnt, uint64_t *output, uint32_t *outputCnt, void *outputStruct, size_t *outputStructCnt)
{
  return _IOConnectCallMethod(connection, selector, input, inputCnt, inputStruct, inputStructCnt, output, outputCnt, outputStruct, outputStructCnt);
}

kern_return_t IOCreatePlugInInterfaceForService(io_service_t service, CFUUIDRef pluginType, CFUUIDRef interfaceType, IOCFPlugInInterface ***theInterface, SInt32 *theScore)
{
  return _IOCreatePlugInInterfaceForService(service, pluginType, interfaceType, theInterface, theScore);
}

kern_return_t IODestroyPlugInInterface(IOCFPlugInInterface **interface)
{
  return _IODestroyPlugInInterface(interface);
}

uint64_t IOHIDEventGetDataValue()
{
  return _IOHIDEventGetDataValue();
}

io_object_t IOIteratorNext(io_iterator_t iterator)
{
  return _IOIteratorNext(iterator);
}

IONotificationPortRef IONotificationPortCreate(mach_port_t mainPort)
{
  return _IONotificationPortCreate(mainPort);
}

void IONotificationPortDestroy(IONotificationPortRef notify)
{
}

void IONotificationPortSetDispatchQueue(IONotificationPortRef notify, dispatch_queue_t queue)
{
}

kern_return_t IOObjectRelease(io_object_t object)
{
  return _IOObjectRelease(object);
}

IOReturn IOPMAssertionCreateWithName(CFStringRef AssertionType, IOPMAssertionLevel AssertionLevel, CFStringRef AssertionName, IOPMAssertionID *AssertionID)
{
  return _IOPMAssertionCreateWithName(AssertionType, AssertionLevel, AssertionName, AssertionID);
}

IOReturn IOPMAssertionRelease(IOPMAssertionID AssertionID)
{
  return _IOPMAssertionRelease(AssertionID);
}

CFTypeRef IORegistryEntryCreateCFProperty(io_registry_entry_t entry, CFStringRef key, CFAllocatorRef allocator, IOOptionBits options)
{
  return _IORegistryEntryCreateCFProperty(entry, key, allocator, options);
}

kern_return_t IORegistryEntryGetChildEntry(io_registry_entry_t entry, const io_name_t plane, io_registry_entry_t *child)
{
  return _IORegistryEntryGetChildEntry(entry, plane, child);
}

kern_return_t IORegistryEntryGetName(io_registry_entry_t entry, io_name_t name)
{
  return _IORegistryEntryGetName(entry, name);
}

kern_return_t IOServiceAddMatchingNotification(IONotificationPortRef notifyPort, const io_name_t notificationType, CFDictionaryRef matching, IOServiceMatchingCallback callback, void *refCon, io_iterator_t *notification)
{
  return _IOServiceAddMatchingNotification(notifyPort, notificationType, matching, callback, refCon, notification);
}

kern_return_t IOServiceClose(io_connect_t connect)
{
  return _IOServiceClose(connect);
}

io_service_t IOServiceGetMatchingService(mach_port_t mainPort, CFDictionaryRef matching)
{
  return _IOServiceGetMatchingService(mainPort, matching);
}

CFMutableDictionaryRef IOServiceMatching(const char *name)
{
  return _IOServiceMatching(name);
}

CFMutableDictionaryRef IOServiceNameMatching(const char *name)
{
  return _IOServiceNameMatching(name);
}

kern_return_t IOServiceOpen(io_service_t service, task_port_t owningTask, uint32_t type, io_connect_t *connect)
{
  return _IOServiceOpen(service, owningTask, type, connect);
}

uint64_t MGCopyAnswer()
{
  return _MGCopyAnswer();
}

uint64_t MGCopyAnswerWithError()
{
  return _MGCopyAnswerWithError();
}

uint64_t MGGetBoolAnswer()
{
  return _MGGetBoolAnswer();
}

uint64_t MGGetProductType()
{
  return _MGGetProductType();
}

uint64_t MGGetSInt32Answer()
{
  return _MGGetSInt32Answer();
}

uint64_t MKBDeviceUnlockedSinceBoot()
{
  return _MKBDeviceUnlockedSinceBoot();
}

Class NSClassFromString(NSString *aClassName)
{
  return _NSClassFromString(aClassName);
}

uint64_t NSRandomData()
{
  return _NSRandomData();
}

NSString *__cdecl NSStringFromClass(Class aClass)
{
  return _NSStringFromClass(aClass);
}

NSString *__cdecl NSStringFromSelector(SEL aSelector)
{
  return _NSStringFromSelector(aSelector);
}

NSString *NSTemporaryDirectory(void)
{
  return _NSTemporaryDirectory();
}

uint64_t OPACKDecodeData()
{
  return _OPACKDecodeData();
}

uint64_t OPACKEncoderCreateData()
{
  return _OPACKEncoderCreateData();
}

uint64_t PAAuthenticatedClientIdentity()
{
  return _PAAuthenticatedClientIdentity();
}

uint64_t PLLogRegisteredEvent()
{
  return _PLLogRegisteredEvent();
}

SCPreferencesRef SCPreferencesCreate(CFAllocatorRef allocator, CFStringRef name, CFStringRef prefsID)
{
  return _SCPreferencesCreate(allocator, name, prefsID);
}

CFPropertyListRef SCPreferencesGetValue(SCPreferencesRef prefs, CFStringRef key)
{
  return _SCPreferencesGetValue(prefs, key);
}

Boolean SCPreferencesLock(SCPreferencesRef prefs, Boolean wait)
{
  return _SCPreferencesLock(prefs, wait);
}

Boolean SCPreferencesSetCallback(SCPreferencesRef prefs, SCPreferencesCallBack callout, SCPreferencesContext *context)
{
  return _SCPreferencesSetCallback(prefs, callout, context);
}

Boolean SCPreferencesSetDispatchQueue(SCPreferencesRef prefs, dispatch_queue_t queue)
{
  return _SCPreferencesSetDispatchQueue(prefs, queue);
}

void SCPreferencesSynchronize(SCPreferencesRef prefs)
{
}

Boolean SCPreferencesUnlock(SCPreferencesRef prefs)
{
  return _SCPreferencesUnlock(prefs);
}

OSStatus SecItemAdd(CFDictionaryRef attributes, CFTypeRef *result)
{
  return _SecItemAdd(attributes, result);
}

OSStatus SecItemCopyMatching(CFDictionaryRef query, CFTypeRef *result)
{
  return _SecItemCopyMatching(query, result);
}

OSStatus SecItemDelete(CFDictionaryRef query)
{
  return _SecItemDelete(query);
}

OSStatus SecItemUpdate(CFDictionaryRef query, CFDictionaryRef attributesToUpdate)
{
  return _SecItemUpdate(query, attributesToUpdate);
}

int SecRandomCopyBytes(SecRandomRef rnd, size_t count, void *bytes)
{
  return _SecRandomCopyBytes(rnd, count, bytes);
}

uint64_t SipHash()
{
  return _SipHash();
}

uint64_t TCCAccessCheckAuditToken()
{
  return _TCCAccessCheckAuditToken();
}

uint64_t TMConvertTicksToSeconds()
{
  return _TMConvertTicksToSeconds();
}

uint64_t WiFiDeviceClientCopyInterfaceStateInfo()
{
  return _WiFiDeviceClientCopyInterfaceStateInfo();
}

uint64_t WiFiDeviceClientGetInterfaceRoleIndex()
{
  return _WiFiDeviceClientGetInterfaceRoleIndex();
}

uint64_t WiFiDeviceClientIsInterfaceAWDL()
{
  return _WiFiDeviceClientIsInterfaceAWDL();
}

uint64_t WiFiDeviceClientRangingStartAsync()
{
  return _WiFiDeviceClientRangingStartAsync();
}

uint64_t WiFiDeviceClientRegisterRangingReportCallback()
{
  return _WiFiDeviceClientRegisterRangingReportCallback();
}

uint64_t WiFiDeviceClientRegisterVirtualInterfaceStateChangeCallback()
{
  return _WiFiDeviceClientRegisterVirtualInterfaceStateChangeCallback();
}

uint64_t WiFiDeviceClientSetRangeable()
{
  return _WiFiDeviceClientSetRangeable();
}

uint64_t WiFiDeviceClientSetRangingIdentifier()
{
  return _WiFiDeviceClientSetRangingIdentifier();
}

uint64_t WiFiDeviceClientStartNetwork()
{
  return _WiFiDeviceClientStartNetwork();
}

uint64_t WiFiDeviceClientStopNetwork()
{
  return _WiFiDeviceClientStopNetwork();
}

uint64_t WiFiManagerClientCopyInterfaces()
{
  return _WiFiManagerClientCopyInterfaces();
}

uint64_t WiFiManagerClientCreate()
{
  return _WiFiManagerClientCreate();
}

uint64_t WiFiManagerClientRegisterDeviceAttachmentCallback()
{
  return _WiFiManagerClientRegisterDeviceAttachmentCallback();
}

uint64_t WiFiManagerClientScheduleWithRunLoop()
{
  return _WiFiManagerClientScheduleWithRunLoop();
}

void *__cdecl _Block_copy(const void *aBlock)
{
  return __Block_copy(aBlock);
}

void _Block_object_dispose(const void *a1, const int a2)
{
}

void _Block_release(const void *aBlock)
{
}

uint64_t _CTServerConnectionCopyISOForMCC()
{
  return __CTServerConnectionCopyISOForMCC();
}

uint64_t _CTServerConnectionCreateOnTargetQueue()
{
  return __CTServerConnectionCreateOnTargetQueue();
}

void _Unwind_Resume(_Unwind_Exception *exception_object)
{
}

uint64_t wireless_diagnostics::google::protobuf::DescriptorPool::generated_pool(wireless_diagnostics::google::protobuf::DescriptorPool *this)
{
  return wireless_diagnostics::google::protobuf::DescriptorPool::generated_pool(this);
}

uint64_t wireless_diagnostics::google::protobuf::DescriptorPool::InternalAddGeneratedFile(wireless_diagnostics::google::protobuf::DescriptorPool *this, const void *a2, int a3)
{
  return wireless_diagnostics::google::protobuf::DescriptorPool::InternalAddGeneratedFile(this, a2, a3);
}

uint64_t wireless_diagnostics::google::protobuf::MessageFactory::generated_factory(wireless_diagnostics::google::protobuf::MessageFactory *this)
{
  return wireless_diagnostics::google::protobuf::MessageFactory::generated_factory(this);
}

uint64_t wireless_diagnostics::google::protobuf::MessageFactory::InternalRegisterGeneratedFile()
{
  return wireless_diagnostics::google::protobuf::MessageFactory::InternalRegisterGeneratedFile();
}

uint64_t wireless_diagnostics::google::protobuf::MessageFactory::InternalRegisterGeneratedMessage()
{
  return wireless_diagnostics::google::protobuf::MessageFactory::InternalRegisterGeneratedMessage();
}

uint64_t wireless_diagnostics::google::protobuf::UnknownFieldSet::ClearFallback(wireless_diagnostics::google::protobuf::UnknownFieldSet *this)
{
  return wireless_diagnostics::google::protobuf::UnknownFieldSet::ClearFallback(this);
}

uint64_t wireless_diagnostics::google::protobuf::UnknownFieldSet::AddVarint(wireless_diagnostics::google::protobuf::UnknownFieldSet *this, int a2, unint64_t a3)
{
  return wireless_diagnostics::google::protobuf::UnknownFieldSet::AddVarint(this, a2, a3);
}

uint64_t wireless_diagnostics::google::protobuf::UnknownFieldSet::MergeFrom(wireless_diagnostics::google::protobuf::UnknownFieldSet *this, const wireless_diagnostics::google::protobuf::UnknownFieldSet *a2)
{
  return wireless_diagnostics::google::protobuf::UnknownFieldSet::MergeFrom(this, a2);
}

uint64_t wireless_diagnostics::google::protobuf::UnknownFieldSet::UnknownFieldSet(wireless_diagnostics::google::protobuf::UnknownFieldSet *this)
{
  return wireless_diagnostics::google::protobuf::UnknownFieldSet::UnknownFieldSet(this);
}

void wireless_diagnostics::google::protobuf::UnknownFieldSet::~UnknownFieldSet(wireless_diagnostics::google::protobuf::UnknownFieldSet *this)
{
}

uint64_t wireless_diagnostics::google::protobuf::GoogleOnceInitImpl()
{
  return wireless_diagnostics::google::protobuf::GoogleOnceInitImpl();
}

uint64_t wireless_diagnostics::google::protobuf::io::CodedInputStream::ReadTagFallback(wireless_diagnostics::google::protobuf::io::CodedInputStream *this)
{
  return wireless_diagnostics::google::protobuf::io::CodedInputStream::ReadTagFallback(this);
}

uint64_t wireless_diagnostics::google::protobuf::io::CodedInputStream::ReadVarint32Fallback(wireless_diagnostics::google::protobuf::io::CodedInputStream *this, unsigned int *a2)
{
  return wireless_diagnostics::google::protobuf::io::CodedInputStream::ReadVarint32Fallback(this, a2);
}

uint64_t wireless_diagnostics::google::protobuf::io::CodedInputStream::ReadVarint64Fallback(wireless_diagnostics::google::protobuf::io::CodedInputStream *this, unint64_t *a2)
{
  return wireless_diagnostics::google::protobuf::io::CodedInputStream::ReadVarint64Fallback(this, a2);
}

uint64_t wireless_diagnostics::google::protobuf::io::CodedInputStream::ReadLittleEndian32Fallback(wireless_diagnostics::google::protobuf::io::CodedInputStream *this, unsigned int *a2)
{
  return wireless_diagnostics::google::protobuf::io::CodedInputStream::ReadLittleEndian32Fallback(this, a2);
}

uint64_t wireless_diagnostics::google::protobuf::io::CodedInputStream::ReadLittleEndian64Fallback(wireless_diagnostics::google::protobuf::io::CodedInputStream *this, unint64_t *a2)
{
  return wireless_diagnostics::google::protobuf::io::CodedInputStream::ReadLittleEndian64Fallback(this, a2);
}

uint64_t wireless_diagnostics::google::protobuf::io::CodedInputStream::Skip(wireless_diagnostics::google::protobuf::io::CodedInputStream *this, int a2)
{
  return wireless_diagnostics::google::protobuf::io::CodedInputStream::Skip(this, a2);
}

uint64_t wireless_diagnostics::google::protobuf::io::CodedInputStream::PopLimit(wireless_diagnostics::google::protobuf::io::CodedInputStream *this, int a2)
{
  return wireless_diagnostics::google::protobuf::io::CodedInputStream::PopLimit(this, a2);
}

uint64_t wireless_diagnostics::google::protobuf::io::CodedInputStream::PushLimit(wireless_diagnostics::google::protobuf::io::CodedInputStream *this, int a2)
{
  return wireless_diagnostics::google::protobuf::io::CodedInputStream::PushLimit(this, a2);
}

uint64_t wireless_diagnostics::google::protobuf::io::ArrayOutputStream::ArrayOutputStream(wireless_diagnostics::google::protobuf::io::ArrayOutputStream *this, void *a2, int a3, int a4)
{
  return wireless_diagnostics::google::protobuf::io::ArrayOutputStream::ArrayOutputStream(this, a2, a3, a4);
}

void wireless_diagnostics::google::protobuf::io::ArrayOutputStream::~ArrayOutputStream(wireless_diagnostics::google::protobuf::io::ArrayOutputStream *this)
{
}

uint64_t wireless_diagnostics::google::protobuf::io::CodedOutputStream::VarintSize64(wireless_diagnostics::google::protobuf::io::CodedOutputStream *this, unint64_t a2)
{
  return wireless_diagnostics::google::protobuf::io::CodedOutputStream::VarintSize64(this, a2);
}

uint64_t wireless_diagnostics::google::protobuf::io::CodedOutputStream::WriteVarint32(wireless_diagnostics::google::protobuf::io::CodedOutputStream *this, unsigned int a2)
{
  return wireless_diagnostics::google::protobuf::io::CodedOutputStream::WriteVarint32(this, a2);
}

uint64_t wireless_diagnostics::google::protobuf::io::CodedOutputStream::WriteRawToArray(wireless_diagnostics::google::protobuf::io::CodedOutputStream *this, const void *a2, int a3, unsigned __int8 *a4)
{
  return wireless_diagnostics::google::protobuf::io::CodedOutputStream::WriteRawToArray(this, a2, a3, a4);
}

uint64_t wireless_diagnostics::google::protobuf::io::CodedOutputStream::WriteLittleEndian32(wireless_diagnostics::google::protobuf::io::CodedOutputStream *this, unsigned int a2)
{
  return wireless_diagnostics::google::protobuf::io::CodedOutputStream::WriteLittleEndian32(this, a2);
}

uint64_t wireless_diagnostics::google::protobuf::io::CodedOutputStream::VarintSize32Fallback(wireless_diagnostics::google::protobuf::io::CodedOutputStream *this, unsigned int a2)
{
  return wireless_diagnostics::google::protobuf::io::CodedOutputStream::VarintSize32Fallback(this, a2);
}

uint64_t wireless_diagnostics::google::protobuf::io::CodedOutputStream::WriteVarint64ToArray(wireless_diagnostics::google::protobuf::io::CodedOutputStream *this, unint64_t a2, unsigned __int8 *a3)
{
  return wireless_diagnostics::google::protobuf::io::CodedOutputStream::WriteVarint64ToArray(this, a2, a3);
}

uint64_t wireless_diagnostics::google::protobuf::io::CodedOutputStream::WriteVarint32FallbackToArray(wireless_diagnostics::google::protobuf::io::CodedOutputStream *this, unsigned int a2, unsigned __int8 *a3)
{
  return wireless_diagnostics::google::protobuf::io::CodedOutputStream::WriteVarint32FallbackToArray(this, a2, a3);
}

uint64_t wireless_diagnostics::google::protobuf::io::CodedOutputStream::CodedOutputStream()
{
  return wireless_diagnostics::google::protobuf::io::CodedOutputStream::CodedOutputStream();
}

void wireless_diagnostics::google::protobuf::io::CodedOutputStream::~CodedOutputStream(wireless_diagnostics::google::protobuf::io::CodedOutputStream *this)
{
}

void wireless_diagnostics::google::protobuf::Message::~Message(wireless_diagnostics::google::protobuf::Message *this)
{
}

uint64_t wireless_diagnostics::google::protobuf::internal::LogMessage::LogMessage()
{
  return wireless_diagnostics::google::protobuf::internal::LogMessage::LogMessage();
}

void wireless_diagnostics::google::protobuf::internal::LogMessage::~LogMessage(wireless_diagnostics::google::protobuf::internal::LogMessage *this)
{
}

uint64_t wireless_diagnostics::google::protobuf::internal::LogMessage::operator<<()
{
  return wireless_diagnostics::google::protobuf::internal::LogMessage::operator<<();
}

uint64_t wireless_diagnostics::google::protobuf::internal::NameOfEnum()
{
  return wireless_diagnostics::google::protobuf::internal::NameOfEnum();
}

uint64_t wireless_diagnostics::google::protobuf::internal::WireFormat::SerializeUnknownFields(wireless_diagnostics::google::protobuf::internal::WireFormat *this, const wireless_diagnostics::google::protobuf::UnknownFieldSet *a2, wireless_diagnostics::google::protobuf::io::CodedOutputStream *a3)
{
  return wireless_diagnostics::google::protobuf::internal::WireFormat::SerializeUnknownFields(this, a2, a3);
}

uint64_t wireless_diagnostics::google::protobuf::internal::WireFormat::ComputeUnknownFieldsSize(wireless_diagnostics::google::protobuf::internal::WireFormat *this, const wireless_diagnostics::google::protobuf::UnknownFieldSet *a2)
{
  return wireless_diagnostics::google::protobuf::internal::WireFormat::ComputeUnknownFieldsSize(this, a2);
}

uint64_t wireless_diagnostics::google::protobuf::internal::WireFormat::VerifyUTF8StringFallback()
{
  return wireless_diagnostics::google::protobuf::internal::WireFormat::VerifyUTF8StringFallback();
}

uint64_t wireless_diagnostics::google::protobuf::internal::WireFormat::SerializeUnknownFieldsToArray(wireless_diagnostics::google::protobuf::internal::WireFormat *this, const wireless_diagnostics::google::protobuf::UnknownFieldSet *a2, unsigned __int8 *a3)
{
  return wireless_diagnostics::google::protobuf::internal::WireFormat::SerializeUnknownFieldsToArray(this, a2, a3);
}

uint64_t wireless_diagnostics::google::protobuf::internal::WireFormat::SkipField(wireless_diagnostics::google::protobuf::internal::WireFormat *this, wireless_diagnostics::google::protobuf::io::CodedInputStream *a2, unsigned int a3, wireless_diagnostics::google::protobuf::UnknownFieldSet *a4)
{
  return wireless_diagnostics::google::protobuf::internal::WireFormat::SkipField(this, a2, a3, a4);
}

uint64_t wireless_diagnostics::google::protobuf::internal::LogFinisher::operator=()
{
  return wireless_diagnostics::google::protobuf::internal::LogFinisher::operator=();
}

uint64_t wireless_diagnostics::google::protobuf::internal::ExtensionSet::ParseField(wireless_diagnostics::google::protobuf::internal::ExtensionSet *this, unsigned int a2, wireless_diagnostics::google::protobuf::io::CodedInputStream *a3, const wireless_diagnostics::google::protobuf::Message *a4, wireless_diagnostics::google::protobuf::UnknownFieldSet *a5)
{
  return wireless_diagnostics::google::protobuf::internal::ExtensionSet::ParseField(this, a2, a3, a4, a5);
}

uint64_t wireless_diagnostics::google::protobuf::internal::ExtensionSet::Clear(wireless_diagnostics::google::protobuf::internal::ExtensionSet *this)
{
  return wireless_diagnostics::google::protobuf::internal::ExtensionSet::Clear(this);
}

uint64_t wireless_diagnostics::google::protobuf::internal::ExtensionSet::MergeFrom(wireless_diagnostics::google::protobuf::internal::ExtensionSet *this, const wireless_diagnostics::google::protobuf::internal::ExtensionSet *a2)
{
  return wireless_diagnostics::google::protobuf::internal::ExtensionSet::MergeFrom(this, a2);
}

uint64_t wireless_diagnostics::google::protobuf::internal::ExtensionSet::ExtensionSet(wireless_diagnostics::google::protobuf::internal::ExtensionSet *this)
{
  return wireless_diagnostics::google::protobuf::internal::ExtensionSet::ExtensionSet(this);
}

void wireless_diagnostics::google::protobuf::internal::ExtensionSet::~ExtensionSet(wireless_diagnostics::google::protobuf::internal::ExtensionSet *this)
{
}

uint64_t wireless_diagnostics::google::protobuf::internal::ReflectionOps::Merge(wireless_diagnostics::google::protobuf::internal::ReflectionOps *this, const wireless_diagnostics::google::protobuf::Message *a2, wireless_diagnostics::google::protobuf::Message *a3)
{
  return wireless_diagnostics::google::protobuf::internal::ReflectionOps::Merge(this, a2, a3);
}

uint64_t wireless_diagnostics::google::protobuf::internal::VerifyVersion(wireless_diagnostics::google::protobuf::internal *this, int a2, int a3, const char *a4)
{
  return wireless_diagnostics::google::protobuf::internal::VerifyVersion(this, a2, a3, a4);
}

uint64_t wireless_diagnostics::google::protobuf::internal::WireFormatLite::ReadString()
{
  return wireless_diagnostics::google::protobuf::internal::WireFormatLite::ReadString();
}

uint64_t wireless_diagnostics::google::protobuf::internal::WireFormatLite::WriteBytes()
{
  return wireless_diagnostics::google::protobuf::internal::WireFormatLite::WriteBytes();
}

uint64_t wireless_diagnostics::google::protobuf::internal::WireFormatLite::WriteFloat(wireless_diagnostics::google::protobuf::internal::WireFormatLite *this, int a2, float a3, wireless_diagnostics::google::protobuf::io::CodedOutputStream *a4)
{
  return wireless_diagnostics::google::protobuf::internal::WireFormatLite::WriteFloat(this, a2, a3, a4);
}

uint64_t wireless_diagnostics::google::protobuf::internal::WireFormatLite::WriteInt32(wireless_diagnostics::google::protobuf::internal::WireFormatLite *this, int a2, int a3, wireless_diagnostics::google::protobuf::io::CodedOutputStream *a4)
{
  return wireless_diagnostics::google::protobuf::internal::WireFormatLite::WriteInt32(this, a2, a3, a4);
}

uint64_t wireless_diagnostics::google::protobuf::internal::WireFormatLite::WriteInt64(wireless_diagnostics::google::protobuf::internal::WireFormatLite *this, int a2, uint64_t a3, wireless_diagnostics::google::protobuf::io::CodedOutputStream *a4)
{
  return wireless_diagnostics::google::protobuf::internal::WireFormatLite::WriteInt64(this, a2, a3, a4);
}

uint64_t wireless_diagnostics::google::protobuf::internal::WireFormatLite::WriteDouble(wireless_diagnostics::google::protobuf::internal::WireFormatLite *this, int a2, double a3, wireless_diagnostics::google::protobuf::io::CodedOutputStream *a4)
{
  return wireless_diagnostics::google::protobuf::internal::WireFormatLite::WriteDouble(this, a2, a3, a4);
}

uint64_t wireless_diagnostics::google::protobuf::internal::WireFormatLite::WriteString()
{
  return wireless_diagnostics::google::protobuf::internal::WireFormatLite::WriteString();
}

uint64_t wireless_diagnostics::google::protobuf::internal::WireFormatLite::WriteUInt32(wireless_diagnostics::google::protobuf::internal::WireFormatLite *this, int a2, unsigned int a3, wireless_diagnostics::google::protobuf::io::CodedOutputStream *a4)
{
  return wireless_diagnostics::google::protobuf::internal::WireFormatLite::WriteUInt32(this, a2, a3, a4);
}

uint64_t wireless_diagnostics::google::protobuf::internal::WireFormatLite::WriteUInt64(wireless_diagnostics::google::protobuf::internal::WireFormatLite *this, int a2, unint64_t a3, wireless_diagnostics::google::protobuf::io::CodedOutputStream *a4)
{
  return wireless_diagnostics::google::protobuf::internal::WireFormatLite::WriteUInt64(this, a2, a3, a4);
}

uint64_t wireless_diagnostics::google::protobuf::internal::WireFormatLite::WriteMessageMaybeToArray(wireless_diagnostics::google::protobuf::internal::WireFormatLite *a1, int a2, const wireless_diagnostics::google::protobuf::MessageLite *a3, wireless_diagnostics::google::protobuf::io::CodedOutputStream *a4)
{
  return wireless_diagnostics::google::protobuf::internal::WireFormatLite::WriteMessageMaybeToArray(a1, a2, a3, a4);
}

uint64_t wireless_diagnostics::google::protobuf::internal::WireFormatLite::ReadBytes()
{
  return wireless_diagnostics::google::protobuf::internal::WireFormatLite::ReadBytes();
}

uint64_t wireless_diagnostics::google::protobuf::internal::WireFormatLite::WriteBool(wireless_diagnostics::google::protobuf::internal::WireFormatLite *this, int a2, BOOL a3, wireless_diagnostics::google::protobuf::io::CodedOutputStream *a4)
{
  return wireless_diagnostics::google::protobuf::internal::WireFormatLite::WriteBool(this, a2, a3, a4);
}

uint64_t wireless_diagnostics::google::protobuf::internal::WireFormatLite::WriteEnum(wireless_diagnostics::google::protobuf::internal::WireFormatLite *this, int a2, int a3, wireless_diagnostics::google::protobuf::io::CodedOutputStream *a4)
{
  return wireless_diagnostics::google::protobuf::internal::WireFormatLite::WriteEnum(this, a2, a3, a4);
}

void wireless_diagnostics::google::protobuf::internal::FunctionClosure0::~FunctionClosure0(wireless_diagnostics::google::protobuf::internal::FunctionClosure0 *this)
{
}

uint64_t wireless_diagnostics::google::protobuf::internal::RepeatedPtrFieldBase::Reserve(wireless_diagnostics::google::protobuf::internal::RepeatedPtrFieldBase *this, int a2)
{
  return wireless_diagnostics::google::protobuf::internal::RepeatedPtrFieldBase::Reserve(this, a2);
}

uint64_t wireless_diagnostics::google::protobuf::internal::StringTypeHandlerBase::New(wireless_diagnostics::google::protobuf::internal::StringTypeHandlerBase *this)
{
  return wireless_diagnostics::google::protobuf::internal::StringTypeHandlerBase::New(this);
}

uint64_t wireless_diagnostics::google::protobuf::internal::StringTypeHandlerBase::Delete()
{
  return wireless_diagnostics::google::protobuf::internal::StringTypeHandlerBase::Delete();
}

uint64_t wireless_diagnostics::google::protobuf::internal::GeneratedMessageReflection::GeneratedMessageReflection()
{
  return wireless_diagnostics::google::protobuf::internal::GeneratedMessageReflection::GeneratedMessageReflection();
}

uint64_t cnprint::CNPrinter::GetLogLevel(cnprint::CNPrinter *this)
{
  return cnprint::CNPrinter::GetLogLevel(this);
}

uint64_t cnprint::CNPrinter::Print()
{
  return cnprint::CNPrinter::Print();
}

uint64_t wireless_diagnostics::google::protobuf::MessageLite::SerializeAsString(wireless_diagnostics::google::protobuf::MessageLite *this)
{
  return wireless_diagnostics::google::protobuf::MessageLite::SerializeAsString(this);
}

uint64_t wireless_diagnostics::google::protobuf::MessageLite::SerializeToCodedStream(wireless_diagnostics::google::protobuf::MessageLite *this, wireless_diagnostics::google::protobuf::io::CodedOutputStream *a2)
{
  return wireless_diagnostics::google::protobuf::MessageLite::SerializeToCodedStream(this, a2);
}

uint64_t wireless_diagnostics::google::protobuf::DescriptorPool::FindFileByName()
{
  return wireless_diagnostics::google::protobuf::DescriptorPool::FindFileByName();
}

uint64_t wireless_diagnostics::google::protobuf::io::CodedInputStream::BytesUntilLimit(wireless_diagnostics::google::protobuf::io::CodedInputStream *this)
{
  return wireless_diagnostics::google::protobuf::io::CodedInputStream::BytesUntilLimit(this);
}

uint64_t wireless_diagnostics::google::protobuf::internal::ExtensionSet::SerializeWithCachedSizes(wireless_diagnostics::google::protobuf::internal::ExtensionSet *this, uint64_t a2, uint64_t a3, wireless_diagnostics::google::protobuf::io::CodedOutputStream *a4)
{
  return wireless_diagnostics::google::protobuf::internal::ExtensionSet::SerializeWithCachedSizes(this, a2, a3, a4);
}

uint64_t wireless_diagnostics::google::protobuf::internal::ExtensionSet::SerializeWithCachedSizesToArray(wireless_diagnostics::google::protobuf::internal::ExtensionSet *this, uint64_t a2, uint64_t a3, unsigned __int8 *a4)
{
  return wireless_diagnostics::google::protobuf::internal::ExtensionSet::SerializeWithCachedSizesToArray(this, a2, a3, a4);
}

uint64_t wireless_diagnostics::google::protobuf::internal::ExtensionSet::ByteSize(wireless_diagnostics::google::protobuf::internal::ExtensionSet *this)
{
  return wireless_diagnostics::google::protobuf::internal::ExtensionSet::ByteSize(this);
}

std::string *__cdecl std::error_code::message(std::string *__return_ptr retstr, const std::error_code *this)
{
  return std::error_code::message(retstr, this);
}

std::string::const_reference std::string::at(const std::string *this, std::string::size_type __n)
{
  return std::string::at(this, __n);
}

int std::string::compare(const std::string *this, const std::string::value_type *__s)
{
  return std::string::compare(this, __s);
}

uint64_t std::stringbuf::str()
{
  return std::stringbuf::str();
}

const std::__fs::filesystem::directory_entry *__cdecl std::__fs::filesystem::directory_iterator::__dereference(const std::__fs::filesystem::directory_iterator *this)
{
  return std::__fs::filesystem::directory_iterator::__dereference(this);
}

const std::__fs::filesystem::directory_entry *__cdecl std::__fs::filesystem::recursive_directory_iterator::__dereference(const std::__fs::filesystem::recursive_directory_iterator *this)
{
  return std::__fs::filesystem::recursive_directory_iterator::__dereference(this);
}

std::__fs::filesystem::path::__string_view std::__fs::filesystem::path::__filename(const std::__fs::filesystem::path *this)
{
  std::__fs::filesystem::path::__string_view v3 = std::__fs::filesystem::path::__filename(this);
  std::basic_string_view<_CharT, _Traits>::size_type size = v3.__size_;
  data = v3.__data_;
  result.__size_ = size;
  result.__data_ = data;
  return result;
}

const std::locale::facet *__cdecl std::locale::use_facet(const std::locale *this, std::locale::id *a2)
{
  return std::locale::use_facet(this, a2);
}

std::locale std::ios_base::getloc(const std::ios_base *this)
{
  return std::ios_base::getloc(this);
}

std::logic_error *__cdecl std::logic_error::logic_error(std::logic_error *this, const char *a2)
{
  return std::logic_error::logic_error(this, a2);
}

{
  return std::logic_error::logic_error(this, a2);
}

std::logic_error *__cdecl std::logic_error::logic_error(std::logic_error *this, const std::string *a2)
{
  return std::logic_error::logic_error(this, a2);
}

std::runtime_error *__cdecl std::runtime_error::runtime_error(std::runtime_error *this, const char *a2)
{
  return std::runtime_error::runtime_error(this, a2);
}

{
  return std::runtime_error::runtime_error(this, a2);
}

std::runtime_error *__cdecl std::runtime_error::runtime_error(std::runtime_error *this, const std::string *a2)
{
  return std::runtime_error::runtime_error(this, a2);
}

{
  return std::runtime_error::runtime_error(this, a2);
}

std::runtime_error *__cdecl std::runtime_error::runtime_error(std::runtime_error *this, const std::runtime_error *a2)
{
  return std::runtime_error::runtime_error(this, a2);
}

std::bad_array_new_length *__cdecl std::bad_array_new_length::bad_array_new_length(std::bad_array_new_length *this)
{
  return std::bad_array_new_length::bad_array_new_length(this);
}

void std::this_thread::sleep_for (const std::chrono::nanoseconds *__ns)
{
}

size_t std::__next_prime(size_t __n)
{
  return std::__next_prime(__n);
}

std::string *__cdecl std::string::append(std::string *this, const std::string::value_type *__s)
{
  return std::string::append(this, __s);
}

std::string *__cdecl std::string::append(std::string *this, const std::string::value_type *__s, std::string::size_type __n)
{
  return std::string::append(this, __s, __n);
}

std::string *__cdecl std::string::assign(std::string *this, const std::string::value_type *__s)
{
  return std::string::assign(this, __s);
}

std::string *__cdecl std::string::assign(std::string *this, const std::string::value_type *__s, std::string::size_type __n)
{
  return std::string::assign(this, __s, __n);
}

std::string *__cdecl std::string::insert(std::string *this, std::string::size_type __pos, const std::string::value_type *__s)
{
  return std::string::insert(this, __pos, __s);
}

std::string *__cdecl std::string::insert(std::string *this, std::string::size_type __pos, const std::string::value_type *__s, std::string::size_type __n)
{
  return std::string::insert(this, __pos, __s, __n);
}

void std::string::resize(std::string *this, std::string::size_type __n, std::string::value_type __c)
{
}

void std::string::__grow_by(std::string *this, std::string::size_type __old_cap, std::string::size_type __delta_cap, std::string::size_type __old_sz, std::string::size_type __n_copy, std::string::size_type __n_del, std::string::size_type __n_add)
{
}

std::string *__cdecl std::string::basic_string(std::string *this, const std::string *__str, std::string::size_type __pos, std::string::size_type __n, std::allocator<char> *__a)
{
  return std::string::basic_string(this, __str, __pos, __n, __a);
}

std::string *__cdecl std::string::operator=(std::string *this, const std::string *__str)
{
  return std::string::operator=(this, __str);
}

uint64_t std::filebuf::open()
{
  return std::filebuf::open();
}

uint64_t std::filebuf::close()
{
  return std::filebuf::close();
}

uint64_t std::filebuf::basic_filebuf()
{
  return std::filebuf::basic_filebuf();
}

uint64_t std::filebuf::~filebuf()
{
  return std::filebuf::~filebuf();
}

uint64_t std::istream::read()
{
  return std::istream::read();
}

uint64_t std::istream::seekg()
{
  return std::istream::seekg();
}

uint64_t std::istream::tellg()
{
  return std::istream::tellg();
}

uint64_t std::istream::~istream()
{
  return std::istream::~istream();
}

uint64_t std::ostream::put()
{
  return std::ostream::put();
}

uint64_t std::ostream::flush()
{
  return std::ostream::flush();
}

uint64_t std::ostream::write()
{
  return std::ostream::write();
}

uint64_t std::ostream::sentry::sentry()
{
  return std::ostream::sentry::sentry();
}

uint64_t std::ostream::sentry::~sentry()
{
  return std::ostream::sentry::~sentry();
}

uint64_t std::ostream::~ostream()
{
  return std::ostream::~ostream();
}

uint64_t std::ostream::operator<<()
{
  return std::ostream::operator<<();
}

{
  return std::ostream::operator<<();
}

{
  return std::ostream::operator<<();
}

{
  return std::ostream::operator<<();
}

{
  return std::ostream::operator<<();
}

{
  return std::ostream::operator<<();
}

{
  return std::ostream::operator<<();
}

{
  return std::ostream::operator<<();
}

std::random_device *__cdecl std::random_device::random_device(std::random_device *this, const std::string *__token)
{
  return std::random_device::random_device(this, __token);
}

void std::random_device::~random_device(std::random_device *this)
{
}

std::random_device::result_type std::random_device::operator()(std::random_device *this)
{
  return std::random_device::operator()(this);
}

uint64_t std::iostream::~basic_iostream()
{
  return std::iostream::~basic_iostream();
}

uint64_t std::ofstream::open()
{
  return std::ofstream::open();
}

std::__thread_struct *__cdecl std::__thread_struct::__thread_struct(std::__thread_struct *this)
{
  return std::__thread_struct::__thread_struct(this);
}

void std::__thread_struct::~__thread_struct(std::__thread_struct *this)
{
}

uint64_t std::streambuf::basic_streambuf()
{
  return std::streambuf::basic_streambuf();
}

uint64_t std::streambuf::~streambuf()
{
  return std::streambuf::~streambuf();
}

void std::recursive_mutex::lock(std::recursive_mutex *this)
{
}

void std::recursive_mutex::unlock(std::recursive_mutex *this)
{
}

std::recursive_mutex *__cdecl std::recursive_mutex::recursive_mutex(std::recursive_mutex *this)
{
  return std::recursive_mutex::recursive_mutex(this);
}

void std::recursive_mutex::~recursive_mutex(std::recursive_mutex *this)
{
}

const std::error_category *std::system_category(void)
{
  return std::system_category();
}

uint64_t std::basic_stringstream<char,std::char_traits<char>,std::allocator<char>>::operator=()
{
  return std::basic_stringstream<char,std::char_traits<char>,std::allocator<char>>::operator=();
}

void std::condition_variable::notify_all(std::condition_variable *this)
{
}

void std::condition_variable::notify_one(std::condition_variable *this)
{
}

void std::condition_variable::__do_timed_wait(std::condition_variable *this, std::unique_lock<std::mutex> *__lk, std::chrono::time_point<std::chrono::system_clock, std::chrono::duration<long long, std::ratio<1, 1000000000>>> a3)
{
}

void std::condition_variable::wait(std::condition_variable *this, std::unique_lock<std::mutex> *__lk)
{
}

void std::condition_variable::~condition_variable(std::condition_variable *this)
{
}

void std::__shared_weak_count::__release_weak(std::__shared_weak_count *this)
{
}

std::__shared_weak_count *__cdecl std::__shared_weak_count::lock(std::__shared_weak_count *this)
{
  return std::__shared_weak_count::lock(this);
}

void std::__shared_weak_count::~__shared_weak_count(std::__shared_weak_count *this)
{
}

std::__thread_specific_ptr<std::__thread_struct> *std::__thread_local_data(void)
{
  return std::__thread_local_data();
}

void std::__throw_system_error(int __ev, const char *__what_arg)
{
}

uintmax_t std::__fs::filesystem::__file_size(const std::__fs::filesystem::path *a1, std::error_code *__ec)
{
  return std::__fs::filesystem::__file_size(a1, __ec);
}

uintmax_t std::__fs::filesystem::__remove_all(const std::__fs::filesystem::path *a1, std::error_code *__ec)
{
  return std::__fs::filesystem::__remove_all(a1, __ec);
}

void std::__fs::filesystem::filesystem_error::~filesystem_error(std::__fs::filesystem::filesystem_error *this)
{
}

std::__fs::filesystem::file_time_type std::__fs::filesystem::__last_write_time(const std::__fs::filesystem::path *a1, std::error_code *__ec)
{
  v4.__d_.__rep_ = std::__fs::filesystem::__last_write_time(a1, __ec).__d_.__rep_;
  uint64_t v3 = *((void *)&v4.__d_.__rep_ + 1);
  uint64_t v2 = *(void *)&v4.__d_.__rep_;
  *((void *)&result.__d_.__rep_ + 1) = v3;
  *(void *)&result.__d_.__rep_ = v2;
  return result;
}

std::__fs::filesystem::directory_iterator *__cdecl std::__fs::filesystem::directory_iterator::__increment(std::__fs::filesystem::directory_iterator *this, std::error_code *__ec)
{
  return std::__fs::filesystem::directory_iterator::__increment(this, __ec);
}

std::__fs::filesystem::directory_iterator *__cdecl std::__fs::filesystem::directory_iterator::directory_iterator(std::__fs::filesystem::directory_iterator *this, const std::__fs::filesystem::path *a2, std::error_code *a3, std::__fs::filesystem::directory_options a4)
{
  return std::__fs::filesystem::directory_iterator::directory_iterator(this, a2, a3, a4);
}

std::__fs::filesystem::recursive_directory_iterator *__cdecl std::__fs::filesystem::recursive_directory_iterator::__increment(std::__fs::filesystem::recursive_directory_iterator *this, std::error_code *__ec)
{
  return std::__fs::filesystem::recursive_directory_iterator::__increment(this, __ec);
}

std::__fs::filesystem::recursive_directory_iterator *__cdecl std::__fs::filesystem::recursive_directory_iterator::recursive_directory_iterator(std::__fs::filesystem::recursive_directory_iterator *this, const std::__fs::filesystem::path *__p, std::__fs::filesystem::directory_options __opt, std::error_code *__ec)
{
  return std::__fs::filesystem::recursive_directory_iterator::recursive_directory_iterator(this, __p, __opt, __ec);
}

void std::__fs::filesystem::__copy(const std::__fs::filesystem::path *__from, const std::__fs::filesystem::path *__to, std::__fs::filesystem::copy_options __opt, std::error_code *__ec)
{
}

std::__fs::filesystem::file_status std::__fs::filesystem::__status(const std::__fs::filesystem::path *a1, std::error_code *__ec)
{
  return std::__fs::filesystem::__status(a1, __ec);
}

void std::mutex::lock(std::mutex *this)
{
}

void std::mutex::unlock(std::mutex *this)
{
}

BOOL std::mutex::try_lock(std::mutex *this)
{
  return std::mutex::try_lock(this);
}

void std::mutex::~mutex(std::mutex *this)
{
}

uint64_t std::__sort<std::__less<double,double> &,double *>()
{
  return std::__sort<std::__less<double,double> &,double *>();
}

uint64_t std::__sort<std::__less<float,float> &,float *>()
{
  return std::__sort<std::__less<float,float> &,float *>();
}

uint64_t std::__sort<std::__less<int,int> &,int *>()
{
  return std::__sort<std::__less<int,int> &,int *>();
}

std::chrono::steady_clock::time_point std::chrono::steady_clock::now(void)
{
  return std::chrono::steady_clock::now();
}

std::chrono::system_clock::time_point std::chrono::system_clock::now(void)
{
  return std::chrono::system_clock::now();
}

time_t std::chrono::system_clock::to_time_t(const std::chrono::system_clock::time_point *__t)
{
  return std::chrono::system_clock::to_time_t(__t);
}

void std::locale::~locale(std::locale *this)
{
}

void std::thread::join(std::thread *this)
{
}

void std::thread::~thread(std::thread *this)
{
}

void std::ios_base::__set_badbit_and_consider_rethrow(std::ios_base *this)
{
}

void std::ios_base::init(std::ios_base *this, void *__sb)
{
}

void std::ios_base::clear(std::ios_base *this, std::ios_base::iostate __state)
{
}

void std::ios_base::failure::~failure(std::ios_base::failure *this)
{
}

uint64_t std::ios::~ios()
{
  return std::ios::~ios();
}

std::string *__cdecl std::to_string(std::string *__return_ptr retstr, double __val)
{
  return std::to_string(retstr, __val);
}

std::string *__cdecl std::to_string(std::string *__return_ptr retstr, float __val)
{
  return std::to_string(retstr, __val);
}

std::string *__cdecl std::to_string(std::string *__return_ptr retstr, int __val)
{
  return std::to_string(retstr, __val);
}

std::string *__cdecl std::to_string(std::string *__return_ptr retstr, unsigned int __val)
{
  return std::to_string(retstr, __val);
}

std::string *__cdecl std::to_string(std::string *__return_ptr retstr, unint64_t __val)
{
  return std::to_string(retstr, __val);
}

uint64_t std::operator+<char>()
{
  return std::operator+<char>();
}

void std::exception::~exception(std::exception *this)
{
}

void std::terminate(void)
{
}

void operator delete[]()
{
  while (1)
    ;
}

void operator delete(void *__p)
{
  while (1)
    ;
}

void operator delete()
{
  while (1)
    ;
}

void *__cdecl operator new[](size_t __sz, const std::nothrow_t *a2)
{
  while (1)
    ;
}

void operator new[]()
{
  while (1)
    ;
}

void *__cdecl operator new(size_t __sz)
{
  while (1)
    ;
}

void operator new()
{
  while (1)
    ;
}

void __assert_rtn(const char *a1, const char *a2, int a3, const char *a4)
{
}

void *__cxa_allocate_exception(size_t thrown_size)
{
  return ___cxa_allocate_exception(thrown_size);
}

int __cxa_atexit(void (*lpfunc)(void *), void *obj, void *lpdso_handle)
{
  return ___cxa_atexit(lpfunc, obj, lpdso_handle);
}

void *__cxa_begin_catch(void *a1)
{
  return ___cxa_begin_catch(a1);
}

void __cxa_end_catch(void)
{
}

void __cxa_free_exception(void *a1)
{
}

void *__cxa_get_exception_ptr(void *a1)
{
  return ___cxa_get_exception_ptr(a1);
}

void __cxa_guard_abort(__guard *a1)
{
}

int __cxa_guard_acquire(__guard *a1)
{
  return ___cxa_guard_acquire((uint64_t *)a1);
}

void __cxa_guard_release(__guard *a1)
{
}

void __cxa_rethrow(void)
{
}

void __cxa_throw(void *a1, struct type_info *lptinfo, void (*a3)(void *))
{
}

void *__dynamic_cast(const void *lpsrc, const struct __class_type_info *lpstype, const struct __class_type_info *lpdtype, ptrdiff_t s2d)
{
  return (void *)___dynamic_cast(lpsrc, lpstype, lpdtype, s2d);
}

int *__error(void)
{
  return ___error();
}

double __exp10(double a1)
{
  return ___exp10(a1);
}

simd_float2x2 __invert_f2(simd_float2x2 a1)
{
  simd_float2x2 v3 = ___invert_f2(a1);
  simd_float2 v2 = v3.columns[1];
  simd_float2 v1 = v3.columns[0];
  result.columns[1] = v2;
  result.columns[0] = v1;
  return result;
}

__double2 __sincos_stret(double a1)
{
  __double2 v3 = ___sincos_stret(a1);
  double cosval = v3.__cosval;
  double sinval = v3.__sinval;
  result.__double cosval = cosval;
  result.__double sinval = sinval;
  return result;
}

__float2 __sincosf_stret(float a1)
{
  __float2 v3 = ___sincosf_stret(a1);
  float cosval = v3.__cosval;
  float sinval = v3.__sinval;
  result.__float cosval = cosval;
  result.__float sinval = sinval;
  return result;
}

__darwin_ct_rune_t __tolower(__darwin_ct_rune_t a1)
{
  return ___tolower(a1);
}

__darwin_ct_rune_t __toupper(__darwin_ct_rune_t a1)
{
  return ___toupper(a1);
}

uint64_t _os_feature_enabled_impl()
{
  return __os_feature_enabled_impl();
}

void _os_log_debug_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
}

void _os_log_error_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
}

void _os_log_fault_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
}

void _os_log_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
}

uint64_t _set_user_dir_suffix()
{
  return __set_user_dir_suffix();
}

void abort(void)
{
}

uint64_t abort_report_np()
{
  return _abort_report_np();
}

long double acos(long double __x)
{
  return _acos(__x);
}

float acosf(float a1)
{
  return _acosf(a1);
}

uint32_t arc4random_uniform(uint32_t __upper_bound)
{
  return _arc4random_uniform(__upper_bound);
}

long double asin(long double __x)
{
  return _asin(__x);
}

float asinf(float a1)
{
  return _asinf(a1);
}

long double atan(long double __x)
{
  return _atan(__x);
}

long double atan2(long double __y, long double __x)
{
  return _atan2(__y, __x);
}

float atan2f(float a1, float a2)
{
  return _atan2f(a1, a2);
}

void bzero(void *a1, size_t a2)
{
}

void cblas_dgemm(const CBLAS_ORDER __Order, const CBLAS_TRANSPOSE __TransA, const CBLAS_TRANSPOSE __TransB, const int __M, const int __N, const int __K, const double __alpha, const double *__A, const int __lda, const double *__B, const int __ldb, const double __beta, double *__C, const int __ldc)
{
}

int chmod(const char *a1, mode_t a2)
{
  return _chmod(a1, a2);
}

int chown(const char *a1, uid_t a2, gid_t a3)
{
  return _chown(a1, a2, a3);
}

int clock_gettime(clockid_t __clock_id, timespec *__tp)
{
  return _clock_gettime(__clock_id, __tp);
}

__uint64_t clock_gettime_nsec_np(clockid_t __clock_id)
{
  return _clock_gettime_nsec_np(__clock_id);
}

size_t confstr(int a1, char *a2, size_t a3)
{
  return _confstr(a1, a2, a3);
}

uint64_t container_system_group_path_for_identifier()
{
  return _container_system_group_path_for_identifier();
}

long double cos(long double __x)
{
  return _cos(__x);
}

float cosf(float a1)
{
  return _cosf(a1);
}

int dgecon_(char *__norm, __CLPK_integer *__n, __CLPK_doublereal *__a, __CLPK_integer *__lda, __CLPK_doublereal *__anorm, __CLPK_doublereal *__rcond, __CLPK_doublereal *__work, __CLPK_integer *__iwork, __CLPK_integer *__info)
{
  return _dgecon_(__norm, __n, __a, __lda, __anorm, __rcond, __work, __iwork, __info);
}

int dgeevx_(char *__balanc, char *__jobvl, char *__jobvr, char *__sense, __CLPK_integer *__n, __CLPK_doublereal *__a, __CLPK_integer *__lda, __CLPK_doublereal *__wr, __CLPK_doublereal *__wi, __CLPK_doublereal *__vl, __CLPK_integer *__ldvl, __CLPK_doublereal *__vr, __CLPK_integer *__ldvr, __CLPK_integer *__ilo, __CLPK_integer *__ihi, __CLPK_doublereal *__scale, __CLPK_doublereal *__abnrm, __CLPK_doublereal *__rconde, __CLPK_doublereal *__rcondv, __CLPK_doublereal *__work,__CLPK_integer *__lwork,__CLPK_integer *__iwork,__CLPK_integer *__info)
{
  return _dgeevx_(__balanc, __jobvl, __jobvr, __sense, __n, __a, __lda, __wr, __wi, __vl, __ldvl, __vr, __ldvr, __ilo, __ihi, __scale, __abnrm, __rconde, __rcondv,
           __work,
           __lwork,
           __iwork,
           __info);
}

int dgeqrf_(__CLPK_integer *__m, __CLPK_integer *__n, __CLPK_doublereal *__a, __CLPK_integer *__lda, __CLPK_doublereal *__tau, __CLPK_doublereal *__work, __CLPK_integer *__lwork, __CLPK_integer *__info)
{
  return _dgeqrf_(__m, __n, __a, __lda, __tau, __work, __lwork, __info);
}

int dgesvd_(char *__jobu, char *__jobvt, __CLPK_integer *__m, __CLPK_integer *__n, __CLPK_doublereal *__a, __CLPK_integer *__lda, __CLPK_doublereal *__s, __CLPK_doublereal *__u, __CLPK_integer *__ldu, __CLPK_doublereal *__vt, __CLPK_integer *__ldvt, __CLPK_doublereal *__work, __CLPK_integer *__lwork, __CLPK_integer *__info)
{
  return _dgesvd_(__jobu, __jobvt, __m, __n, __a, __lda, __s, __u, __ldu, __vt, __ldvt, __work, __lwork, __info);
}

int dgetrf_(__CLPK_integer *__m, __CLPK_integer *__n, __CLPK_doublereal *__a, __CLPK_integer *__lda, __CLPK_integer *__ipiv, __CLPK_integer *__info)
{
  return _dgetrf_(__m, __n, __a, __lda, __ipiv, __info);
}

int dgetri_(__CLPK_integer *__n, __CLPK_doublereal *__a, __CLPK_integer *__lda, __CLPK_integer *__ipiv, __CLPK_doublereal *__work, __CLPK_integer *__lwork, __CLPK_integer *__info)
{
  return _dgetri_(__n, __a, __lda, __ipiv, __work, __lwork, __info);
}

void dispatch_after(dispatch_time_t when, dispatch_queue_t queue, dispatch_block_t block)
{
}

void dispatch_assert_queue_V2(dispatch_queue_t queue)
{
}

void dispatch_assert_queue_not_V2(dispatch_queue_t queue)
{
}

void dispatch_async(dispatch_queue_t queue, dispatch_block_t block)
{
}

void dispatch_async_and_wait(dispatch_queue_t queue, dispatch_block_t block)
{
}

void *__cdecl dispatch_get_specific(const void *key)
{
  return _dispatch_get_specific(key);
}

void dispatch_once(dispatch_once_t *predicate, dispatch_block_t block)
{
}

dispatch_queue_attr_t dispatch_queue_attr_make_with_qos_class(dispatch_queue_attr_t attr, dispatch_qos_class_t qos_class, int relative_priority)
{
  return _dispatch_queue_attr_make_with_qos_class(attr, qos_class, relative_priority);
}

dispatch_queue_t dispatch_queue_create(const char *label, dispatch_queue_attr_t attr)
{
  return _dispatch_queue_create(label, attr);
}

void dispatch_queue_set_specific(dispatch_queue_t queue, const void *key, void *context, dispatch_function_t destructor)
{
}

void dispatch_release(dispatch_object_t object)
{
}

void dispatch_resume(dispatch_object_t object)
{
}

dispatch_semaphore_t dispatch_semaphore_create(intptr_t value)
{
  return _dispatch_semaphore_create(value);
}

intptr_t dispatch_semaphore_signal(dispatch_semaphore_t dsema)
{
  return _dispatch_semaphore_signal(dsema);
}

intptr_t dispatch_semaphore_wait(dispatch_semaphore_t dsema, dispatch_time_t timeout)
{
  return _dispatch_semaphore_wait(dsema, timeout);
}

void dispatch_source_cancel(dispatch_source_t source)
{
}

dispatch_source_t dispatch_source_create(dispatch_source_type_t type, uintptr_t handle, uintptr_t mask, dispatch_queue_t queue)
{
  return _dispatch_source_create(type, handle, mask, queue);
}

void dispatch_source_set_event_handler(dispatch_source_t source, dispatch_block_t handler)
{
}

void dispatch_source_set_timer(dispatch_source_t source, dispatch_time_t start, uint64_t interval, uint64_t leeway)
{
}

void dispatch_suspend(dispatch_object_t object)
{
}

void dispatch_sync(dispatch_queue_t queue, dispatch_block_t block)
{
}

dispatch_time_t dispatch_time(dispatch_time_t when, int64_t delta)
{
  return _dispatch_time(when, delta);
}

dispatch_time_t dispatch_walltime(const timespec *when, int64_t delta)
{
  return _dispatch_walltime(when, delta);
}

int dlclose(void *__handle)
{
  return _dlclose(__handle);
}

char *dlerror(void)
{
  return _dlerror();
}

void *__cdecl dlopen(const char *__path, int __mode)
{
  return _dlopen(__path, __mode);
}

void *__cdecl dlsym(void *__handle, const char *__symbol)
{
  return _dlsym(__handle, __symbol);
}

int dorgqr_(__CLPK_integer *__m, __CLPK_integer *__n, __CLPK_integer *__k, __CLPK_doublereal *__a, __CLPK_integer *__lda, __CLPK_doublereal *__tau, __CLPK_doublereal *__work, __CLPK_integer *__lwork, __CLPK_integer *__info)
{
  return _dorgqr_(__m, __n, __k, __a, __lda, __tau, __work, __lwork, __info);
}

int dpotrf_(char *__uplo, __CLPK_integer *__n, __CLPK_doublereal *__a, __CLPK_integer *__lda, __CLPK_integer *__info)
{
  return _dpotrf_(__uplo, __n, __a, __lda, __info);
}

long double erf(long double __x)
{
  return _erf(__x);
}

uint64_t espresso_buffer_pack_tensor_shape()
{
  return _espresso_buffer_pack_tensor_shape();
}

uint64_t espresso_context_destroy()
{
  return _espresso_context_destroy();
}

uint64_t espresso_create_context()
{
  return _espresso_create_context();
}

uint64_t espresso_create_plan()
{
  return _espresso_create_plan();
}

uint64_t espresso_network_bind_buffer()
{
  return _espresso_network_bind_buffer();
}

uint64_t espresso_plan_add_network()
{
  return _espresso_plan_add_network();
}

uint64_t espresso_plan_build()
{
  return _espresso_plan_build();
}

uint64_t espresso_plan_destroy()
{
  return _espresso_plan_destroy();
}

uint64_t espresso_plan_execute_sync()
{
  return _espresso_plan_execute_sync();
}

long double exp(long double __x)
{
  return _exp(__x);
}

int fclose(FILE *a1)
{
  return _fclose(a1);
}

int fflush(FILE *a1)
{
  return _fflush(a1);
}

long double fmod(long double __x, long double __y)
{
  return _fmod(__x, __y);
}

FILE *__cdecl fopen(const char *__filename, const char *__mode)
{
  return _fopen(__filename, __mode);
}

size_t fread(void *__ptr, size_t __size, size_t __nitems, FILE *__stream)
{
  return _fread(__ptr, __size, __nitems, __stream);
}

void free(void *a1)
{
}

int fseek(FILE *a1, uint64_t a2, int a3)
{
  return _fseek(a1, a2, a3);
}

passwd *__cdecl getpwnam(const char *a1)
{
  return _getpwnam(a1);
}

int gzclose(gzFile file)
{
  return _gzclose(file);
}

int gzeof(gzFile file)
{
  return _gzeof(file);
}

gzFile gzopen(const char *a1, const char *a2)
{
  return _gzopen(a1, a2);
}

int gzread(gzFile file, voidp buf, unsigned int len)
{
  return _gzread(file, buf, len);
}

long double hypot(long double __x, long double __y)
{
  return _hypot(__x, __y);
}

float hypotf(float a1, float a2)
{
  return _hypotf(a1, a2);
}

uint64_t kdebug_trace()
{
  return _kdebug_trace();
}

lconv *localeconv(void)
{
  return _localeconv();
}

tm *__cdecl localtime(const time_t *a1)
{
  return _localtime(a1);
}

long double log(long double __x)
{
  return _log(__x);
}

long double log10(long double __x)
{
  return _log10(__x);
}

long double logb(long double __x)
{
  return _logb(__x);
}

uint64_t mach_absolute_time(void)
{
  return _mach_absolute_time();
}

uint64_t mach_continuous_time(void)
{
  return _mach_continuous_time();
}

uint64_t mach_get_times()
{
  return _mach_get_times();
}

kern_return_t mach_timebase_info(mach_timebase_info_t info)
{
  return _mach_timebase_info(info);
}

size_t malloc_size(const void *ptr)
{
  return _malloc_size(ptr);
}

void *__cdecl malloc_type_calloc(size_t count, size_t size, malloc_type_id_t type_id)
{
  return _malloc_type_calloc(count, size, type_id);
}

void *__cdecl memchr(void *__s, int __c, size_t __n)
{
  return _memchr(__s, __c, __n);
}

int memcmp(const void *__s1, const void *__s2, size_t __n)
{
  return _memcmp(__s1, __s2, __n);
}

void *__cdecl memcpy(void *__dst, const void *__src, size_t __n)
{
  return _memcpy(__dst, __src, __n);
}

void *__cdecl memmove(void *__dst, const void *__src, size_t __len)
{
  return _memmove(__dst, __src, __len);
}

void *__cdecl memset(void *__b, int __c, size_t __len)
{
  return _memset(__b, __c, __len);
}

void memset_pattern16(void *__b, const void *__pattern16, size_t __len)
{
}

int mkdir(const char *a1, mode_t a2)
{
  return _mkdir(a1, a2);
}

long double modf(long double __x, long double *__y)
{
  return _modf(__x, __y);
}

uint32_t notify_cancel(int token)
{
  return _notify_cancel(token);
}

uint32_t notify_get_state(int token, uint64_t *state64)
{
  return _notify_get_state(token, state64);
}

uint32_t notify_register_dispatch(const char *name, int *out_token, dispatch_queue_t queue, notify_handler_t handler)
{
  return _notify_register_dispatch(name, out_token, queue, handler);
}

uint64_t nw_path_create_evaluator_for_endpoint()
{
  return _nw_path_create_evaluator_for_endpoint();
}

uint64_t nw_path_evaluator_copy_path()
{
  return _nw_path_evaluator_copy_path();
}

nw_path_status_t nw_path_get_status(nw_path_t path)
{
  return _nw_path_get_status(path);
}

BOOL nw_path_is_equal(nw_path_t path, nw_path_t other_path)
{
  return _nw_path_is_equal(path, other_path);
}

void nw_path_monitor_cancel(nw_path_monitor_t monitor)
{
}

nw_path_monitor_t nw_path_monitor_create(void)
{
  return _nw_path_monitor_create();
}

void nw_path_monitor_set_queue(nw_path_monitor_t monitor, dispatch_queue_t queue)
{
}

void nw_path_monitor_set_update_handler(nw_path_monitor_t monitor, nw_path_monitor_update_handler_t update_handler)
{
}

void nw_path_monitor_start(nw_path_monitor_t monitor)
{
}

BOOL nw_path_uses_interface_type(nw_path_t path, nw_interface_type_t interface_type)
{
  return _nw_path_uses_interface_type(path, interface_type);
}

id objc_alloc(Class a1)
{
  return _[a1 alloc];
}

id objc_allocWithZone(Class a1)
{
  return _objc_allocWithZone(a1);
}

uint64_t objc_alloc_init()
{
  return _objc_alloc_init();
}

id objc_autorelease(id a1)
{
  return _objc_autorelease(a1);
}

{
}

{
}

id objc_autoreleaseReturnValue(id a1)
{
  return _objc_autoreleaseReturnValue(a1);
}

uint64_t objc_claimAutoreleasedReturnValue()
{
  return _objc_claimAutoreleasedReturnValue();
}

void objc_copyCppObjectAtomic(void *dest, const void *src, void (__cdecl *copyHelper)(void *, const void *))
{
}

void objc_copyStruct(void *dest, const void *src, ptrdiff_t size, BOOL atomic, BOOL hasStrong)
{
}

void objc_copyWeak(id *to, id *from)
{
}

void objc_destroyWeak(id *location)
{
}

void objc_enumerationMutation(id obj)
{
}

id objc_getProperty(id self, SEL _cmd, ptrdiff_t offset, BOOL atomic)
{
  return _objc_getProperty(self, _cmd, offset, atomic);
}

id objc_initWeak(id *location, id val)
{
  return _objc_initWeak(location, val);
}

id objc_loadWeakRetained(id *location)
{
  return _objc_loadWeakRetained(location);
}

id objc_msgSend(id a1, SEL a2, ...)
{
  return _[a1 a2];
}

id objc_msgSendSuper2(objc_super *a1, SEL a2, ...)
{
  return [super a2];
}

uint64_t objc_opt_class()
{
  return _objc_opt_class();
}

uint64_t objc_opt_isKindOfClass()
{
  return _objc_opt_isKindOfClass();
}

uint64_t objc_opt_new()
{
  return _objc_opt_new();
}

uint64_t objc_opt_respondsToSelector()
{
  return _objc_opt_respondsToSelector();
}

uint64_t self
{
  return _self;
}

void objc_release(id a1)
{
}

id objc_retain(id a1)
{
  return _objc_retain(a1);
}

id objc_retainAutorelease(id a1)
{
  return _a1;
}

id objc_retainAutoreleaseReturnValue(id a1)
{
  return _a1;
}

id objc_retainAutoreleasedReturnValue(id a1)
{
  return _a1;
}

id objc_retainBlock(id a1)
{
  return _objc_retainBlock(a1);
}

void objc_setProperty_atomic(id self, SEL _cmd, id newValue, ptrdiff_t offset)
{
}

void objc_setProperty_atomic_copy(id self, SEL _cmd, id newValue, ptrdiff_t offset)
{
}

void objc_setProperty_nonatomic_copy(id self, SEL _cmd, id newValue, ptrdiff_t offset)
{
}

void objc_storeStrong(id *location, id obj)
{
}

id objc_storeWeak(id *location, id obj)
{
  return _objc_storeWeak(location, obj);
}

int objc_sync_enter(id obj)
{
  return _objc_sync_enter(obj);
}

int objc_sync_exit(id obj)
{
  return _objc_sync_exit(obj);
}

id objc_unsafeClaimAutoreleasedReturnValue(id a1)
{
  return _objc_unsafeClaimAutoreleasedReturnValue(a1);
}

os_log_t os_log_create(const char *subsystem, const char *category)
{
  return _os_log_create(subsystem, category);
}

BOOL os_log_type_enabled(os_log_t oslog, os_log_type_t type)
{
  return _os_log_type_enabled(oslog, type);
}

uint64_t os_log_with_args()
{
  return _os_log_with_args();
}

void os_release(void *object)
{
}

uint64_t os_state_add_handler()
{
  return _os_state_add_handler();
}

uint64_t os_transaction_create()
{
  return _os_transaction_create();
}

void os_unfair_lock_assert_owner(const os_unfair_lock *lock)
{
}

void os_unfair_lock_lock(os_unfair_lock_t lock)
{
}

void os_unfair_lock_unlock(os_unfair_lock_t lock)
{
}

uint64_t os_variant_allows_internal_security_policies()
{
  return _os_variant_allows_internal_security_policies();
}

long double pow(long double __x, long double __y)
{
  return _pow(__x, __y);
}

float powf(float a1, float a2)
{
  return _powf(a1, a2);
}

int printf(const char *a1, ...)
{
  return _printf(a1);
}

int pthread_attr_destroy(pthread_attr_t *a1)
{
  return _pthread_attr_destroy(a1);
}

int pthread_attr_init(pthread_attr_t *a1)
{
  return _pthread_attr_init(a1);
}

int pthread_attr_setdetachstate(pthread_attr_t *a1, int a2)
{
  return _pthread_attr_setdetachstate(a1, a2);
}

int pthread_cancel(pthread_t a1)
{
  return _pthread_cancel(a1);
}

int pthread_create(pthread_t *a1, const pthread_attr_t *a2, void *(__cdecl *a3)(void *), void *a4)
{
  return _pthread_create(a1, a2, a3, a4);
}

int pthread_setname_np(const char *a1)
{
  return _pthread_setname_np(a1);
}

int pthread_setspecific(pthread_key_t a1, const void *a2)
{
  return _pthread_setspecific(a1, a2);
}

long double scalbn(long double __x, int __y)
{
  return _scalbn(__x, __y);
}

int sched_yield(void)
{
  return _sched_yield();
}

long double sin(long double __x)
{
  return _sin(__x);
}

float sinf(float a1)
{
  return _sinf(a1);
}

unsigned int sleep(unsigned int a1)
{
  return _sleep(a1);
}

int snprintf(char *__str, size_t __size, const char *__format, ...)
{
  return _snprintf(__str, __size, __format);
}

int sscanf(const char *a1, const char *a2, ...)
{
  return _sscanf(a1, a2);
}

int stat(const char *a1, stat *a2)
{
  return _stat(a1, a2);
}

int strcmp(const char *__s1, const char *__s2)
{
  return _strcmp(__s1, __s2);
}

size_t strftime(char *a1, size_t a2, const char *a3, const tm *a4)
{
  return _strftime(a1, a2, a3, a4);
}

size_t strlcpy(char *__dst, const char *__source, size_t __size)
{
  return _strlcpy(__dst, __source, __size);
}

size_t strlen(const char *__s)
{
  return _strlen(__s);
}

uint64_t swift_allocObject()
{
  return _swift_allocObject();
}

uint64_t swift_arrayDestroy()
{
  return _swift_arrayDestroy();
}

uint64_t swift_bridgeObjectRelease()
{
  return _swift_bridgeObjectRelease();
}

uint64_t swift_bridgeObjectRetain()
{
  return _swift_bridgeObjectRetain();
}

uint64_t swift_getObjCClassMetadata()
{
  return _swift_getObjCClassMetadata();
}

uint64_t swift_getObjectType()
{
  return _swift_getObjectType();
}

uint64_t swift_getTypeByMangledNameInContext2()
{
  return _swift_getTypeByMangledNameInContext2();
}

uint64_t swift_getWitnessTable()
{
  return _swift_getWitnessTable();
}

uint64_t swift_isUniquelyReferenced_nonNull_native()
{
  return _swift_isUniquelyReferenced_nonNull_native();
}

uint64_t swift_once()
{
  return _swift_once();
}

uint64_t swift_release()
{
  return _swift_release();
}

uint64_t swift_retain()
{
  return _swift_retain();
}

uint64_t swift_slowAlloc()
{
  return _swift_slowAlloc();
}

uint64_t swift_slowDealloc()
{
  return _swift_slowDealloc();
}

uint64_t swift_unknownObjectRetain()
{
  return _swift_unknownObjectRetain();
}

int sysctlbyname(const char *a1, void *a2, size_t *a3, void *a4, size_t a5)
{
  return _sysctlbyname(a1, a2, a3, a4, a5);
}

long double tanh(long double __x)
{
  return _tanh(__x);
}

int unlink(const char *a1)
{
  return _unlink(a1);
}

int usleep(useconds_t a1)
{
  return _usleep(a1);
}

int vfprintf(FILE *a1, const char *a2, va_list a3)
{
  return _vfprintf(a1, a2, a3);
}

uint64_t voucher_adopt()
{
  return _voucher_adopt();
}

uint64_t voucher_copy()
{
  return _voucher_copy();
}

int vprintf(const char *a1, va_list a2)
{
  return _vprintf(a1, a2);
}

__int32 *__cdecl wmemchr(__int32 *__s, __int32 __c, size_t __n)
{
  return _wmemchr(__s, __c, __n);
}

xpc_object_t xpc_activity_copy_criteria(xpc_activity_t activity)
{
  return _xpc_activity_copy_criteria(activity);
}

xpc_activity_state_t xpc_activity_get_state(xpc_activity_t activity)
{
  return _xpc_activity_get_state(activity);
}

void xpc_activity_register(const char *identifier, xpc_object_t criteria, xpc_activity_handler_t handler)
{
}

void xpc_activity_set_criteria(xpc_activity_t activity, xpc_object_t criteria)
{
}

BOOL xpc_activity_set_state(xpc_activity_t activity, xpc_activity_state_t state)
{
  return _xpc_activity_set_state(activity, state);
}

void xpc_activity_unregister(const char *identifier)
{
}

xpc_object_t xpc_array_create(xpc_object_t *objects, size_t count)
{
  return _xpc_array_create(objects, count);
}

void xpc_array_set_string(xpc_object_t xarray, size_t index, const char *string)
{
}

void xpc_array_set_value(xpc_object_t xarray, size_t index, xpc_object_t value)
{
}

BOOL xpc_BOOL_get_value(xpc_object_t xBOOL)
{
  return _xpc_BOOL_get_value(xBOOL);
}

xpc_connection_t xpc_connection_create_mach_service(const char *name, dispatch_queue_t targetq, uint64_t flags)
{
  return _xpc_connection_create_mach_service(name, targetq, flags);
}

void xpc_connection_resume(xpc_connection_t connection)
{
}

void xpc_connection_send_message(xpc_connection_t connection, xpc_object_t message)
{
}

void xpc_connection_set_event_handler(xpc_connection_t connection, xpc_handler_t handler)
{
}

uint64_t xpc_copy_code_signing_identity_for_token()
{
  return _xpc_copy_code_signing_identity_for_token();
}

char *__cdecl xpc_copy_description(xpc_object_t object)
{
  return _xpc_copy_description(object);
}

uint64_t xpc_copy_event()
{
  return _xpc_copy_event();
}

xpc_object_t xpc_dictionary_create(const char *const *keys, xpc_object_t *values, size_t count)
{
  return _xpc_dictionary_create(keys, values, count);
}

const char *__cdecl xpc_dictionary_get_string(xpc_object_t xdict, const char *key)
{
  return _xpc_dictionary_get_string(xdict, key);
}

uint64_t xpc_dictionary_get_uint64(xpc_object_t xdict, const char *key)
{
  return _xpc_dictionary_get_uint64(xdict, key);
}

xpc_object_t xpc_dictionary_get_value(xpc_object_t xdict, const char *key)
{
  return _xpc_dictionary_get_value(xdict, key);
}

void xpc_dictionary_set_BOOL(xpc_object_t xdict, const char *key, BOOL value)
{
}

void xpc_dictionary_set_data(xpc_object_t xdict, const char *key, const void *bytes, size_t length)
{
}

void xpc_dictionary_set_int64(xpc_object_t xdict, const char *key, int64_t value)
{
}

void xpc_dictionary_set_string(xpc_object_t xdict, const char *key, const char *string)
{
}

void xpc_dictionary_set_uint64(xpc_object_t xdict, const char *key, uint64_t value)
{
}

void xpc_dictionary_set_value(xpc_object_t xdict, const char *key, xpc_object_t value)
{
}

xpc_type_t xpc_get_type(xpc_object_t object)
{
  return _xpc_get_type(object);
}

uint64_t xpc_set_event()
{
  return _xpc_set_event();
}

void xpc_set_event_stream_handler(const char *stream, dispatch_queue_t targetq, xpc_handler_t handler)
{
}

xpc_object_t xpc_uint64_create(uint64_t value)
{
  return _xpc_uint64_create(value);
}

uint64_t xpc_uint64_get_value(xpc_object_t xuint)
{
  return _xpc_uint64_get_value(xuint);
}

id objc_msgSend_AONSENSE_FRAMEWORK_AVAILABLE(void *a1, const char *a2, ...)
{
  return [a1 AONSENSE_FRAMEWORK_AVAILABLE];
}

id objc_msgSend_AntennaDiversityOverrideToString_(void *a1, const char *a2, ...)
{
  return [_objc_msgSend(a1, "AntennaDiversityOverrideToString:");
}

id objc_msgSend_DataCallback_(void *a1, const char *a2, ...)
{
  return [a1 DataCallback:];
}

id objc_msgSend_ErrorCallback_(void *a1, const char *a2, ...)
{
  return [a1 ErrorCallback:];
}

id objc_msgSend_NINearbyObjectUpdateRateToShortString_(void *a1, const char *a2, ...)
{
  return [_objc_msgSend(a1, "NINearbyObjectUpdateRateToShortString:");
}

id objc_msgSend_NINearbyObjectUpdateRateToString_(void *a1, const char *a2, ...)
{
  return [a1 NINearbyObjectUpdateRateToString:];
}

id objc_msgSend_NIRelationshipSpecifierToString_(void *a1, const char *a2, ...)
{
  return [_objc_msgSend(a1, "NIRelationshipSpecifierToString:");
}

id objc_msgSend_NISessionBackgroundModeToString_(void *a1, const char *a2, ...)
{
  return [_objc_msgSend(a1, "NISessionBackgroundModeToString:");
}

id objc_msgSend_NISystemPassiveAccessIntentToString_(void *a1, const char *a2, ...)
{
  return [a1 NISystemPassiveAccessIntentToString:];
}

id objc_msgSend_NISystemResourceAvailabilityToString_(void *a1, const char *a2, ...)
{
  return [_objc_msgSend(a1, "NISystemResourceAvailabilityToString:");
}

id objc_msgSend_URL(void *a1, const char *a2, ...)
{
  return _[a1 URL];
}

id objc_msgSend_URLForKey_(void *a1, const char *a2, ...)
{
  return [a1 URLForKey:];
}

id objc_msgSend_UTF8String(void *a1, const char *a2, ...)
{
  return _[a1 UTF8String];
}

id objc_msgSend_UUID(void *a1, const char *a2, ...)
{
  return _[a1 UUID];
}

id objc_msgSend_UUIDString(void *a1, const char *a2, ...)
{
  return _[a1 UUIDString];
}

id objc_msgSend_UUIDWithString_(void *a1, const char *a2, ...)
{
  return [a1 UUIDWithString:];
}

id objc_msgSend__NIDevicePresenceMonitoringOptionToString_(void *a1, const char *a2, ...)
{
  return [_objc_msgSend(a1, "_NIDevicePresenceMonitoringOptionToString:");
}

id objc_msgSend__acquireClientAssertionIfNecessary(void *a1, const char *a2, ...)
{
  return _[a1 _acquireClientAssertionIfNecessary];
}

id objc_msgSend__activateAssertionsWhileFindable(void *a1, const char *a2, ...)
{
  return _[a1 _activateAssertionsWhileFindable];
}

id objc_msgSend__activateAssertionsWhileInteracting(void *a1, const char *a2, ...)
{
  return _[a1 _activateAssertionsWhileInteracting];
}

id objc_msgSend__activateBluetoothResource(void *a1, const char *a2, ...)
{
  return _[a1 _activateBluetoothResource];
}

id objc_msgSend__activateProvidersLazy(void *a1, const char *a2, ...)
{
  return _[a1 _activateProvidersLazy];
}

id objc_msgSend__activateSensors(void *a1, const char *a2, ...)
{
  return _[a1 _activateSensors];
}

id objc_msgSend__addAlgorithmOutputFlagsToPeerTrackingState_(void *a1, const char *a2, ...)
{
  return [_objc_msgSend(a1, "_addAlgorithmOutputFlagsToPeerTrackingState:");
}

id objc_msgSend__addObject_reply_(void *a1, const char *a2, ...)
{
  return [a1 _addObject:reply:];
}

id objc_msgSend__addObserver_(void *a1, const char *a2, ...)
{
  return [a1 _addObserver:];
}

id objc_msgSend__addPeers_(void *a1, const char *a2, ...)
{
  return [a1 _addPeers:];
}

id objc_msgSend__adjustDutyCycleForInterfaceDelays_schedulingInterval_(void *a1, const char *a2, ...)
{
  return [_objc_msgSend(a1, "_adjustDutyCycleForInterfaceDelays:schedulingInterval:");
}

id objc_msgSend__advertiseAndRangeWithPeer_peerAdvertisement_(void *a1, const char *a2, ...)
{
  return [_objc_msgSend(a1, "_advertiseAndRangeWithPeer:peerAdvertisement:");
}

id objc_msgSend__advertisementCacheEnabled(void *a1, const char *a2, ...)
{
  return _[a1 _advertisementCacheEnabled];
}

id objc_msgSend__algorithmSourceToString_(void *a1, const char *a2, ...)
{
  return [_objc_msgSend(a1, "_algorithmSourceToString:");
}

id objc_msgSend__aopJobConfigWithTimeouts(void *a1, const char *a2, ...)
{
  return _[a1 _aopJobConfigWithTimeouts];
}

id objc_msgSend__armMutualAuthTimerForFinder_(void *a1, const char *a2, ...)
{
  return [a1 _armMutualAuthTimerForFinder:];
}

id objc_msgSend__assignDebugParametersIfAvailable_(void *a1, const char *a2, ...)
{
  return [_objc_msgSend(a1, "_assignDebugParametersIfAvailable:");
}

id objc_msgSend__augmentDiscoveryToken_withHomeAnchorVariant_(void *a1, const char *a2, ...)
{
  return [_objc_msgSend(a1, "_augmentDiscoveryToken:withHomeAnchorVariant:");
}

id objc_msgSend__augmentDiscoveryTokenWithDeviceCapabilities_(void *a1, const char *a2, ...)
{
  return [_objc_msgSend(a1, "_augmentDiscoveryTokenWithDeviceCapabilities:");
}

id objc_msgSend__augmentDiscoveryTokenWithNbUwbAcquisitionChannel_(void *a1, const char *a2, ...)
{
  return [a1 _augmentDiscoveryTokenWithNbUwbAcquisitionChannel:];
}

id objc_msgSend__biasCorrectionRequirementFromDiscoveryToken_(void *a1, const char *a2, ...)
{
  return [_objc_msgSend(a1, "_biasCorrectionRequirementFromDiscoveryToken:")];
}

id objc_msgSend__biasCorrectionRequirementFromModelString_(void *a1, const char *a2, ...)
{
  return [_objc_msgSend(a1, "_biasCorrectionRequirementFromModelString:");
}

id objc_msgSend__buildAlishaSession_(void *a1, const char *a2, ...)
{
  return [_objc_msgSend(a1, "_buildAlishaSession:");
}

id objc_msgSend__buildAndRunRangingSession_(void *a1, const char *a2, ...)
{
  return [_objc_msgSend(a1, "_buildAndRunRangingSession:");
}

id objc_msgSend__buildNbammsSession_(void *a1, const char *a2, ...)
{
  return [_objc_msgSend(a1, "_buildNbammsSession:");
}

id objc_msgSend__buildRoseSession_(void *a1, const char *a2, ...)
{
  return [_objc_msgSend(a1, "_buildRoseSession:");
}

id objc_msgSend__buildWifiSession(void *a1, const char *a2, ...)
{
  return _[a1 _buildWifiSession];
}

id objc_msgSend__cachePreloadValue(void *a1, const char *a2, ...)
{
  return _[a1 _cachePreloadValue];
}

id objc_msgSend__calculateAndLogErrorsFromIODeltaP_vioDeltaP_vioPos_(void *a1, const char *a2, ...)
{
  return [_objc_msgSend(a1, "_calculateAndLogErrorsFromIODeltaP:vioDeltaP:vioPos:");
}

id objc_msgSend__calculateErrorStatsFromVector_(void *a1, const char *a2, ...)
{
  return [_objc_msgSend(a1, "_calculateErrorStatsFromVector:");
}

id objc_msgSend__calculateIOMetrics_(void *a1, const char *a2, ...)
{
  return [a1 _calculateIOMetrics:];
}

id objc_msgSend__calculateMagneticFieldBias(void *a1, const char *a2, ...)
{
  return _[a1 _calculateMagneticFieldBias];
}

id objc_msgSend__calculateStraightLineDistance(void *a1, const char *a2, ...)
{
  return _[a1 _calculateStraightLineDistance];
}

id objc_msgSend__cancelScanRateAdjustmentTimer(void *a1, const char *a2, ...)
{
  return _[a1 _cancelScanRateAdjustmentTimer];
}

id objc_msgSend__cancelStateTimer(void *a1, const char *a2, ...)
{
  return _[a1 _cancelStateTimer];
}

id objc_msgSend__cbAdvertisingAddress(void *a1, const char *a2, ...)
{
  return _[a1 _cbAdvertisingAddress];
}

id objc_msgSend__cbAdvertisingAddressChanged(void *a1, const char *a2, ...)
{
  return _[a1 _cbAdvertisingAddressChanged];
}

id objc_msgSend__cbAdvertisingAddressChangedHandler(void *a1, const char *a2, ...)
{
  return _[a1 _cbAdvertisingAddressChangedHandler];
}

id objc_msgSend__cbBluetoothStateChangedHandler(void *a1, const char *a2, ...)
{
  return _[a1 _cbBluetoothStateChangedHandler];
}

id objc_msgSend__cbDeviceFoundHandler_(void *a1, const char *a2, ...)
{
  return [_objc_msgSend(a1, "_cbDeviceFoundHandler:");
}

id objc_msgSend__cbErrorHandler_(void *a1, const char *a2, ...)
{
  return [a1 _cbErrorHandler:];
}

id objc_msgSend__cbInterruptionHandler(void *a1, const char *a2, ...)
{
  return _[a1 _cbInterruptionHandler];
}

id objc_msgSend__changeSessionAuthStateTo_(void *a1, const char *a2, ...)
{
  return [a1 _changeSessionAuthStateTo:];
}

id objc_msgSend__checkAndExerciseAuthorizationForBundleID_error_(void *a1, const char *a2, ...)
{
  return [_objc_msgSend(a1, "_checkAndExerciseAuthorizationForBundleID:error:");
}

id objc_msgSend__cleanupExcessiveDetachedPeers(void *a1, const char *a2, ...)
{
  return _[a1 _cleanupExcessiveDetachedPeers];
}

id objc_msgSend__cleanupExcessiveDetachedSessions(void *a1, const char *a2, ...)
{
  return _[a1 _cleanupExcessiveDetachedSessions];
}

id objc_msgSend__cleanupStaleObservers(void *a1, const char *a2, ...)
{
  return _[a1 _cleanupStaleObservers];
}

id objc_msgSend__configureAdvertisementOOBRefreshTimerForToken_(void *a1, const char *a2, ...)
{
  return [_objc_msgSend(a1, "_configureAdvertisementOOBRefreshTimerForToken:");
}

id objc_msgSend__configureAdvertisementTimeout_forToken_(void *a1, const char *a2, ...)
{
  return [_objc_msgSend(a1, "_configureAdvertisementTimeout:forToken:");
}

id objc_msgSend__configureAdvertiserForType_toPeer_withAdvertisement_(void *a1, const char *a2, ...)
{
  return [_objc_msgSend(a1, "_configureAdvertiserForType:toPeer:withAdvertisement:");
}

id objc_msgSend__configureAndRunInternalARSession(void *a1, const char *a2, ...)
{
  return _[a1 _configureAndRunInternalARSession];
}

id objc_msgSend__configureCBSpatialSession(void *a1, const char *a2, ...)
{
  return _[a1 _configureCBSpatialSession];
}

id objc_msgSend__configureDiscoveryTimeout_forToken_(void *a1, const char *a2, ...)
{
  return [_objc_msgSend(a1, "_configureDiscoveryTimeout:forToken:");
}

id objc_msgSend__configureForLabTestModeSession(void *a1, const char *a2, ...)
{
  return _[a1 _configureForLabTestModeSession];
}

id objc_msgSend__configureForOwnerDevice(void *a1, const char *a2, ...)
{
  return _[a1 _configureForOwnerDevice];
}

id objc_msgSend__configureForPassthroughSession(void *a1, const char *a2, ...)
{
  return _[a1 _configureForPassthroughSession];
}

id objc_msgSend__configureForRegionMonitoring_(void *a1, const char *a2, ...)
{
  return [a1 _configureForRegionMonitoring:];
}

id objc_msgSend__configureKeepAliveTimeoutForPeer_useCase_isKeepAliveBluetooth_(void *a1, const char *a2, ...)
{
  return [_objc_msgSend(a1, "_configureKeepAliveTimeoutForPeer:useCase:isKeepAliveBluetooth:");
}

id objc_msgSend__configureNearbyActionNoWakeAdvertiserWithPeer_advertisement_(void *a1, const char *a2, ...)
{
  return [_objc_msgSend(a1, "_configureNearbyActionNoWakeAdvertiserWithPeer:advertisement:");
}

id objc_msgSend__configureNearbyActionNoWakeScannerAndRequestScan_(void *a1, const char *a2, ...)
{
  return [_objc_msgSend(a1, "_configureNearbyActionNoWakeScannerAndRequestScan:");
}

id objc_msgSend__configureRangeBiasEstimator(void *a1, const char *a2, ...)
{
  return _[a1 _configureRangeBiasEstimator];
}

id objc_msgSend__configureSpatialInteractionAdvertiserWithPeer_advertisement_(void *a1, const char *a2, ...)
{
  return [_objc_msgSend(a1, "_configureSpatialInteractionAdvertiserWithPeer:advertisement:");
}

id objc_msgSend__configureSpatialInteractionScannerAndRequestScan_(void *a1, const char *a2, ...)
{
  return [_objc_msgSend(a1, "_configureSpatialInteractionScannerAndRequestScan:");
}

id objc_msgSend__connectToPeer_(void *a1, const char *a2, ...)
{
  return [a1 _connectToPeer:];
}

id objc_msgSend__consolidateInputToMLModel_(void *a1, const char *a2, ...)
{
  return [_objc_msgSend(a1, "_consolidateInputToMLModel:");
}

id objc_msgSend__convertFromPointingCoordinatesToSpatial_(void *a1, const char *a2, ...)
{
  return [_objc_msgSend(a1, "_convertFromPointingCoordinatesToSpatial:");
}

id objc_msgSend__createDeviceFinderAlgoContainer(void *a1, const char *a2, ...)
{
  return _[a1 _createDeviceFinderAlgoContainer];
}

id objc_msgSend__createFindeeAlgoContainer(void *a1, const char *a2, ...)
{
  return _[a1 _createFindeeAlgoContainer];
}

id objc_msgSend__createPeerFindingAlgoContainer(void *a1, const char *a2, ...)
{
  return _[a1 _createPeerFindingAlgoContainer];
}

id objc_msgSend__createPeopleFinderAlgoContainer(void *a1, const char *a2, ...)
{
  return _[a1 _createPeopleFinderAlgoContainer];
}

id objc_msgSend__createSyntheticApertureAlgoContainer(void *a1, const char *a2, ...)
{
  return _[a1 _createSyntheticApertureAlgoContainer];
}

id objc_msgSend__deactivateAssertionsWhileFindable(void *a1, const char *a2, ...)
{
  return _[a1 _deactivateAssertionsWhileFindable];
}

id objc_msgSend__deactivateAssertionsWhileInteracting(void *a1, const char *a2, ...)
{
  return _[a1 _deactivateAssertionsWhileInteracting];
}

id objc_msgSend__deactivateSensors(void *a1, const char *a2, ...)
{
  return _[a1 _deactivateSensors];
}

id objc_msgSend__decrypt_(void *a1, const char *a2, ...)
{
  return [a1 _decrypt:];
}

id objc_msgSend__deltaDistanceFromVIOPoses::(void *a1, const char *a2, ...)
{
  return [_objc_msgSend(a1, "_deltaDistanceFromVIOPoses::")];
}

id objc_msgSend__deriveSessionKeyFromKeyDerivationKey_sessionIdentifier_(void *a1, const char *a2, ...)
{
  return [_objc_msgSend(a1, "_deriveSessionKeyFromKeyDerivationKey:sessionIdentifier:");
}

id objc_msgSend__disableAllServicesAndSendHangupSignal_(void *a1, const char *a2, ...)
{
  return [a1 _disableAllServicesAndSendHangupSignal:];
}

id objc_msgSend__disableInteractionAndKeepPersistedTokens(void *a1, const char *a2, ...)
{
  return _[a1 _disableInteractionAndKeepPersistedTokens];
}

id objc_msgSend__disableWiFiAndReturnError(void *a1, const char *a2, ...)
{
  return _[a1 _disableWiFiAndReturnError];
}

id objc_msgSend__displayPermissionsPromptIfNeeded(void *a1, const char *a2, ...)
{
  return _[a1 _displayPermissionsPromptIfNeeded];
}

id objc_msgSend__doesClientWantFinderObserverSession(void *a1, const char *a2, ...)
{
  return _[a1 _doesClientWantFinderObserverSession];
}

id objc_msgSend__doesWantTriggeredDutyCycledAcquisition(void *a1, const char *a2, ...)
{
  return _[a1 _doesWantTriggeredDutyCycledAcquisition];
}

id objc_msgSend__dumpInterruptionsMapWithDebugString_(void *a1, const char *a2, ...)
{
  return [_objc_msgSend(a1, "_dumpInterruptionsMapWithDebugString:");
}

id objc_msgSend__enableInteractionWithPersistedTokens(void *a1, const char *a2, ...)
{
  return _[a1 _enableInteractionWithPersistedTokens];
}

id objc_msgSend__encodeSignallingDataInMessageID_(void *a1, const char *a2, ...)
{
  return [_objc_msgSend(a1, "_encodeSignallingDataInMessageID:");
}

id objc_msgSend__encrypt_(void *a1, const char *a2, ...)
{
  return [_objc_msgSend(a1, "_encrypt:");
}

id objc_msgSend__encryptAndUpdateAidingAndSignallingPayload(void *a1, const char *a2, ...)
{
  return _[a1 _encryptAndUpdateAidingAndSignallingPayload];
}

id objc_msgSend__encryptAndUpdateMutualAuthPayload(void *a1, const char *a2, ...)
{
  return _[a1 _encryptAndUpdateMutualAuthPayload];
}

id objc_msgSend__executeActivationPendingOperations(void *a1, const char *a2, ...)
{
  return _[a1 _executeActivationPendingOperations];
}

id objc_msgSend__fatalErrorForUwbServiceState_cause_(void *a1, const char *a2, ...)
{
  return [_objc_msgSend(a1, "_fatalErrorForUwbServiceState:cause:");
}

id objc_msgSend__fillNearbyObject_fromRegionSizeCategory_(void *a1, const char *a2, ...)
{
  return [_objc_msgSend(a1, "_fillNearbyObject:fromRegionSizeCategory:");
}

id objc_msgSend__finalizeRunning(void *a1, const char *a2, ...)
{
  return _[a1 _finalizeRunning];
}

id objc_msgSend__finderTimeFromFirstPoseTo_(void *a1, const char *a2, ...)
{
  return [_objc_msgSend(a1, "_finderTimeFromFirstPoseTo:");
}

id objc_msgSend__flagsFromDiscoveryToken_(void *a1, const char *a2, ...)
{
  return [_objc_msgSend(a1, "_flagsFromDiscoveryToken:");
}

id objc_msgSend__generateUwbSessionIdForNewServiceClientWithProcessName_parsedAccessoryConfigData_debugParameters_(void *a1, const char *a2, ...)
{
  return [_objc_msgSend(a1, "_generateUwbSessionIdForNewServiceClientWithProcessName:parsedAccessoryConfigData:debugParameters:");
}

id objc_msgSend__getAdvertisementFromCBDevice_advertisementType_(void *a1, const char *a2, ...)
{
  return [_objc_msgSend(a1, "_getAdvertisementFromCBDevice:advertisementType:");
}

id objc_msgSend__getAuthenticatedFinderFindeeClients(void *a1, const char *a2, ...)
{
  return _[a1 _getAuthenticatedFinderFindeeClients];
}

id objc_msgSend__getCapabilities(void *a1, const char *a2, ...)
{
  return _[a1 _getCapabilities];
}

id objc_msgSend__getCommonConfiguration(void *a1, const char *a2, ...)
{
  return _[a1 _getCommonConfiguration];
}

id objc_msgSend__getDefaultNbammsRangingConfigParameters(void *a1, const char *a2, ...)
{
  return _[a1 _getDefaultNbammsRangingConfigParameters];
}

id objc_msgSend__getDiscoveryTokenFlags(void *a1, const char *a2, ...)
{
  return _[a1 _getDiscoveryTokenFlags];
}

id objc_msgSend__getDiscoveryTokenFromCBDevice_advertisementType_(void *a1, const char *a2, ...)
{
  return [_objc_msgSend(a1, "_getDiscoveryTokenFromCBDevice:advertisementType:");
}

id objc_msgSend__getDitherConst(void *a1, const char *a2, ...)
{
  return _[a1 _getDitherConst];
}

id objc_msgSend__getDutyCycleForTriggeredDutyCycledAcquisition(void *a1, const char *a2, ...)
{
  return _[a1 _getDutyCycleForTriggeredDutyCycledAcquisition];
}

id objc_msgSend__getExpandedCapabilities(void *a1, const char *a2, ...)
{
  return _[a1 _getExpandedCapabilities];
}

id objc_msgSend__getFindeeAlgorithmConfig(void *a1, const char *a2, ...)
{
  return _[a1 _getFindeeAlgorithmConfig];
}

id objc_msgSend__getFindingSecondarySchedulingParameters(void *a1, const char *a2, ...)
{
  return _[a1 _getFindingSecondarySchedulingParameters];
}

id objc_msgSend__getNbUwbAcquisitionBandChannel_(void *a1, const char *a2, ...)
{
  return [_objc_msgSend(a1, "_getNbUwbAcquisitionBandChannel:");
}

id objc_msgSend__getPeopleFinderAlgorithmConfig(void *a1, const char *a2, ...)
{
  return _[a1 _getPeopleFinderAlgorithmConfig];
}

id objc_msgSend__getPeopleFinderAlgorithmConfigForPeerSessions(void *a1, const char *a2, ...)
{
  return _[a1 _getPeopleFinderAlgorithmConfigForPeerSessions];
}

id objc_msgSend__getRangeUncertaintyWhenBiasEstimateNotAvailable(void *a1, const char *a2, ...)
{
  return _[a1 _getRangeUncertaintyWhenBiasEstimateNotAvailable];
}

id objc_msgSend__getRangingAcquisitionType(void *a1, const char *a2, ...)
{
  return _[a1 _getRangingAcquisitionType];
}

id objc_msgSend__getRangingTimeoutWithKey_timeoutIfNoOverride_(void *a1, const char *a2, ...)
{
  return [_objc_msgSend(a1, "_getRangingTimeoutWithKey:timeoutIfNoOverride:");
}

id objc_msgSend__getRangingTriggerType(void *a1, const char *a2, ...)
{
  return _[a1 _getRangingTriggerType];
}

id objc_msgSend__getRegionSizeCategoriesFromRegions_(void *a1, const char *a2, ...)
{
  return [_objc_msgSend(a1, "_getRegionSizeCategoriesFromRegions:");
}

id objc_msgSend__getSchedulingIntervalForTriggeredDutyCycledAcquisition(void *a1, const char *a2, ...)
{
  return _[a1 _getSchedulingIntervalForTriggeredDutyCycledAcquisition];
}

id objc_msgSend__getSecondarySchedulingParameters(void *a1, const char *a2, ...)
{
  return _[a1 _getSecondarySchedulingParameters];
}

id objc_msgSend__getSessionFailureError(void *a1, const char *a2, ...)
{
  return _[a1 _getSessionFailureError];
}

id objc_msgSend__getState(void *a1, const char *a2, ...)
{
  return _[a1 _getState];
}

id objc_msgSend__handleARSession_willRunWithConfiguration_(void *a1, const char *a2, ...)
{
  return [_objc_msgSend(a1, "_handleARSession:willRunWithConfiguration:");
}

id objc_msgSend__handleARSessionInterruptionEnded(void *a1, const char *a2, ...)
{
  return _[a1 _handleARSessionInterruptionEnded];
}

id objc_msgSend__handleActivationError_(void *a1, const char *a2, ...)
{
  return [_objc_msgSend(a1, "_handleActivationError:");
}

id objc_msgSend__handleActivationSuccess_(void *a1, const char *a2, ...)
{
  return [_objc_msgSend(a1, "_handleActivationSuccess:");
}

id objc_msgSend__handleBluetoothBecameAvailable(void *a1, const char *a2, ...)
{
  return _[a1 _handleBluetoothBecameAvailable];
}

id objc_msgSend__handleBluetoothBecameUnavailable(void *a1, const char *a2, ...)
{
  return _[a1 _handleBluetoothBecameUnavailable];
}

id objc_msgSend__handleBoundedRegionRange_forDevice_rangeResult_(void *a1, const char *a2, ...)
{
  return [_objc_msgSend(a1, "_handleBoundedRegionRange:forDevice:rangeResult:");
}

id objc_msgSend__handleCryptoFailure(void *a1, const char *a2, ...)
{
  return _[a1 _handleCryptoFailure];
}

id objc_msgSend__handleDeviceMonitorActivation_forDevice_timestamp_regionSizeCategory_regions_predictorType_(void *a1, const char *a2, ...)
{
  return [_objc_msgSend(a1, "_handleDeviceMonitorActivation:forDevice:timestamp:regionSizeCategory:regions:predictorType:");
}

id objc_msgSend__handleFailedToAddPeer(void *a1, const char *a2, ...)
{
  return _[a1 _handleFailedToAddPeer];
}

id objc_msgSend__handleInitiatorRangingBlockUpdate_(void *a1, const char *a2, ...)
{
  return [_objc_msgSend(a1, "_handleInitiatorRangingBlockUpdate:");
}

id objc_msgSend__handleNonMutualAuthMessage(void *a1, const char *a2, ...)
{
  return _[a1 _handleNonMutualAuthMessage];
}

id objc_msgSend__handleObserverSessionXPCDisconnection_(void *a1, const char *a2, ...)
{
  return [_objc_msgSend(a1, "_handleObserverSessionXPCDisconnection:");
}

id objc_msgSend__handlePauseSessionError_(void *a1, const char *a2, ...)
{
  return [_objc_msgSend(a1, "_handlePauseSessionError:");
}

id objc_msgSend__handlePauseSessionSuccess(void *a1, const char *a2, ...)
{
  return _[a1 _handlePauseSessionSuccess];
}

id objc_msgSend__handleRangeAndAoASolution_(void *a1, const char *a2, ...)
{
  return [_objc_msgSend(a1, "_handleRangeAndAoASolution:");
}

id objc_msgSend__handleRangeOnlySolution_(void *a1, const char *a2, ...)
{
  return [_objc_msgSend(a1, "_handleRangeOnlySolution:");
}

id objc_msgSend__handleRangingTerminatedCallbackForPeer_(void *a1, const char *a2, ...)
{
  return [_objc_msgSend(a1, "_handleRangingTerminatedCallbackForPeer:");
}

id objc_msgSend__handleRegionChangeForDevice_currentRegion_prevRegion_timestamp_rangeResult_intentPrediction_regionTransitionSuppressed_(void *a1, const char *a2, ...)
{
  return [_objc_msgSend(a1, "_handleRegionChangeForDevice:currentRegion:prevRegion:timestamp:rangeResult:intentPrediction:regionTransitionSuppressed:");
}

id objc_msgSend__handleRunSessionError_(void *a1, const char *a2, ...)
{
  return [_objc_msgSend(a1, "_handleRunSessionError:");
}

id objc_msgSend__handleRunSessionSuccess(void *a1, const char *a2, ...)
{
  return _[a1 _handleRunSessionSuccess];
}

id objc_msgSend__handleSessionBackgroundContinuationAuth_(void *a1, const char *a2, ...)
{
  return [_objc_msgSend(a1, "_handleSessionBackgroundContinuationAuth:");
}

id objc_msgSend__handleSessionStats_(void *a1, const char *a2, ...)
{
  return [_objc_msgSend(a1, "_handleSessionStats:");
}

id objc_msgSend__handleSpecializedSessionBackgroundSupportUpdate_(void *a1, const char *a2, ...)
{
  return [_objc_msgSend(a1, "_handleSpecializedSessionBackgroundSupportUpdate:");
}

id objc_msgSend__handleSpecializedSessionInvalidation_(void *a1, const char *a2, ...)
{
  return [_objc_msgSend(a1, "_handleSpecializedSessionInvalidation:");
}

id objc_msgSend__handleWifiRangingAvailableUpdate_(void *a1, const char *a2, ...)
{
  return [_objc_msgSend(a1, "_handleWifiRangingAvailableUpdate:");
}

id objc_msgSend__handleXPCDisconnection_(void *a1, const char *a2, ...)
{
  return [_objc_msgSend(a1, "_handleXPCDisconnection:");
}

id objc_msgSend__homeAnchorVariantFromDiscoveryToken_(void *a1, const char *a2, ...)
{
  return [_objc_msgSend(a1, "_homeAnchorVariantFromDiscoveryToken:");
}

id objc_msgSend__identifyingSequenceFromBytes_(void *a1, const char *a2, ...)
{
  return [a1 _identifyingSequenceFromBytes:];
}

id objc_msgSend__initAndConnectToServerWithOptions_(void *a1, const char *a2, ...)
{
  return [_objc_msgSend(a1, "_initAndConnectToServerWithOptions:");
}

id objc_msgSend__initInternal(void *a1, const char *a2, ...)
{
  return _[a1 _initInternal];
}

id objc_msgSend__initInternalWithConfigType_isFinder_isObserver_specifiedToken_preferredUpdateRate_(void *a1, const char *a2, ...)
{
  return [_objc_msgSend(a1, "_initInternalWithConfigType:isFinder:isObserver:specifiedToken:preferredUpdateRate:");
}

id objc_msgSend__initLowPowerModeListner(void *a1, const char *a2, ...)
{
  return _[a1 _initLowPowerModeListner];
}

id objc_msgSend__initPrivate(void *a1, const char *a2, ...)
{
  return _[a1 _initPrivate];
}

id objc_msgSend__initializeEncryptionSessionIfNecessary(void *a1, const char *a2, ...)
{
  return _[a1 _initializeEncryptionSessionIfNecessary];
}

id objc_msgSend__intentPredictorConfigFromDiscoveryToken_(void *a1, const char *a2, ...)
{
  return [_objc_msgSend(a1, "_intentPredictorConfigFromDiscoveryToken:");
}

id objc_msgSend__intentPredictorConfigFromModelString_(void *a1, const char *a2, ...)
{
  return [_objc_msgSend(a1, "_intentPredictorConfigFromModelString:");
}

id objc_msgSend__internalBuildShouldDenyConnection(void *a1, const char *a2, ...)
{
  return _[a1 _internalBuildShouldDenyConnection];
}

id objc_msgSend__internalIsCameraAssistanceEnabled(void *a1, const char *a2, ...)
{
  return _[a1 _internalIsCameraAssistanceEnabled];
}

id objc_msgSend__internalIsCameraAssistanceInClientProcess(void *a1, const char *a2, ...)
{
  return _[a1 _internalIsCameraAssistanceInClientProcess];
}

id objc_msgSend__internalIsExtendedDistanceMeasurementEnabled(void *a1, const char *a2, ...)
{
  return _[a1 _internalIsExtendedDistanceMeasurementEnabled];
}

id objc_msgSend__internalOsTransactionRequired(void *a1, const char *a2, ...)
{
  return _[a1 _internalOsTransactionRequired];
}

id objc_msgSend__internalPrepareTokenCache(void *a1, const char *a2, ...)
{
  return _[a1 _internalPrepareTokenCache];
}

id objc_msgSend__internalPrintableState(void *a1, const char *a2, ...)
{
  return _[a1 _internalPrintableState];
}

id objc_msgSend__internalReadItemWithService_account_synchronizable_systemKeychain_(void *a1, const char *a2, ...)
{
  return [a1 _internalReadItemWithService:account:synchronizable:systemKeychain:];
}

id objc_msgSend__internalSetFindableDiscoveryTokens_tokenGroup_logInEventBuffer_(void *a1, const char *a2, ...)
{
  return [_objc_msgSend(a1, "_internalSetFindableDiscoveryTokens:tokenGroup:logInEventBuffer:");
}

id objc_msgSend__interruptSessionWithInternalReason_cachedInterruption_(void *a1, const char *a2, ...)
{
  return [_objc_msgSend(a1, "_interruptSessionWithInternalReason:cachedInterruption:");
}

id objc_msgSend__interruptionsMapAsString(void *a1, const char *a2, ...)
{
  return _[a1 _interruptionsMapAsString];
}

id objc_msgSend__invalidateInternal(void *a1, const char *a2, ...)
{
  return _[a1 _invalidateInternal];
}

id objc_msgSend__invalidateInternalARSessionIfNeeded(void *a1, const char *a2, ...)
{
  return _[a1 _invalidateInternalARSessionIfNeeded];
}

id objc_msgSend__invalidateSessionAndNotifyError_(void *a1, const char *a2, ...)
{
  return [_objc_msgSend(a1, "_invalidateSessionAndNotifyError:");
}

id objc_msgSend__isAnyClientRunning(void *a1, const char *a2, ...)
{
  return _[a1 _isAnyClientRunning];
}

id objc_msgSend__isClientInternalTool(void *a1, const char *a2, ...)
{
  return _[a1 _isClientInternalTool];
}

id objc_msgSend__isClientOnGeneralEntitlementAllowlist(void *a1, const char *a2, ...)
{
  return _[a1 _isClientOnGeneralEntitlementAllowlist];
}

id objc_msgSend__isClientOnSystemShutdownAllowlist(void *a1, const char *a2, ...)
{
  return _[a1 _isClientOnSystemShutdownAllowlist];
}

id objc_msgSend__isCryptoDisabled(void *a1, const char *a2, ...)
{
  return _[a1 _isCryptoDisabled];
}

id objc_msgSend__isInternalClient(void *a1, const char *a2, ...)
{
  return _[a1 _isInternalClient];
}

id objc_msgSend__isListener_backgroundAuthorizedForPeer_useCache_(void *a1, const char *a2, ...)
{
  return [_objc_msgSend(a1, "_isListener:backgroundAuthorizedForPeer:useCache:");
}

id objc_msgSend__isPDRAvailable_(void *a1, const char *a2, ...)
{
  return [a1 _isPDRAvailable:];
}

id objc_msgSend__isReciprocalFindingPossibleRoleIsFinder_rangingSession_(void *a1, const char *a2, ...)
{
  return [_objc_msgSend(a1, "_isReciprocalFindingPossibleRoleIsFinder:rangingSession:");
}

id objc_msgSend__isSemiStaticFromVIO_::(void *a1, const char *a2, ...)
{
  return [a1 _isSemiStaticFromVIO];
}

id objc_msgSend__isTokenFindable_(void *a1, const char *a2, ...)
{
  return [a1 _isTokenFindable:];
}

id objc_msgSend__isValidARSession_andConfiguration_(void *a1, const char *a2, ...)
{
  return [_objc_msgSend(a1, "_isValidARSession:andConfiguration:");
}

id objc_msgSend__isWifiRangingAllowed(void *a1, const char *a2, ...)
{
  return _[a1 _isWifiRangingAllowed];
}

id objc_msgSend__kickKeepAliveForPeer_(void *a1, const char *a2, ...)
{
  return [_kickKeepAliveForPeer:];
}

id objc_msgSend__localDeviceLogger(void *a1, const char *a2, ...)
{
  return _[a1 _localDeviceLogger];
}

id objc_msgSend__logDurationAndSubmit_(void *a1, const char *a2, ...)
{
  return [_objc_msgSend(a1, "_logDurationAndSubmit:");
}

id objc_msgSend__logSessionSummary(void *a1, const char *a2, ...)
{
  return _[a1 _logSessionSummary];
}

id objc_msgSend__logStatisticsIfNecessary(void *a1, const char *a2, ...)
{
  return _[a1 _logStatisticsIfNecessary];
}

id objc_msgSend__logSuccessfulRange_(void *a1, const char *a2, ...)
{
  return [_objc_msgSend(a1, "_logSuccessfulRange:");
}

id objc_msgSend__logTime(void *a1, const char *a2, ...)
{
  return _[a1 _logTime];
}

id objc_msgSend__logUnsuccessfulRange(void *a1, const char *a2, ...)
{
  return _[a1 _logUnsuccessfulRange];
}

id objc_msgSend__longRangeEnabled(void *a1, const char *a2, ...)
{
  return _[a1 _longRangeEnabled];
}

id objc_msgSend__macAddressForIRK_(void *a1, const char *a2, ...)
{
  return [a1 _macAddressForIRK:x0];
}

id objc_msgSend__magneticFieldStrengthCheckOptionFromDiscoveryToken_(void *a1, const char *a2, ...)
{
  return [_objc_msgSend(a1, "_magneticFieldStrengthCheckOptionFromDiscoveryToken:");
}

id objc_msgSend__magneticFieldStrengthCheckOptionFromModelString_(void *a1, const char *a2, ...)
{
  return [_objc_msgSend(a1, "_magneticFieldStrengthCheckOptionFromModelString:");
}

id objc_msgSend__nearbyActionNoWakeDisableScanDupesIfNecessary(void *a1, const char *a2, ...)
{
  return _[a1 _nearbyActionNoWakeDisableScanDupesIfNecessary];
}

id objc_msgSend__nearbyActionNoWakeOOBKeysFromEligibleDiscoveryPeers(void *a1, const char *a2, ...)
{
  return _[a1 _nearbyActionNoWakeOOBKeysFromEligibleDiscoveryPeers];
}

id objc_msgSend__nearbydLogRange_token_(void *a1, const char *a2, ...)
{
  return [_objc_msgSend(a1, "_nearbydLogRange:token:");
}

id objc_msgSend__niFrameworkBundle(void *a1, const char *a2, ...)
{
  return _[a1 _niFrameworkBundle];
}

id objc_msgSend__niLocalizedStringFromFrameworkBundleWithKey_(void *a1, const char *a2, ...)
{
  return [a1 _niLocalizedStringFromFrameworkBundleWithKey:];
}

id objc_msgSend__notifyDidInvalidateWithError_(void *a1, const char *a2, ...)
{
  return [_objc_msgSend(a1, "_notifyDidInvalidateWithError:");
}

id objc_msgSend__notifyPeerRemoval_withReason_(void *a1, const char *a2, ...)
{
  return [_objc_msgSend(a1, "_notifyPeerRemoval:withReason:");
}

id objc_msgSend__onVIOReset(void *a1, const char *a2, ...)
{
  return _[a1 _onVIOReset];
}

id objc_msgSend__osLogNearbyObjectUpdate_(void *a1, const char *a2, ...)
{
  return [_osLogNearbyObjectUpdate:];
}

id objc_msgSend__ownerDeviceServiceRequestDebugParams_(void *a1, const char *a2, ...)
{
  return [_objc_msgSend(a1, "_ownerDeviceServiceRequestDebugParams:");
}

id objc_msgSend__parseUWBData_presenceData_(void *a1, const char *a2, ...)
{
  return [_objc_msgSend(a1, "_parseUWBData:presenceData:");
}

id objc_msgSend__passthroughSessionServiceRequest_(void *a1, const char *a2, ...)
{
  return [a1 _passthroughSessionServiceRequest:];
}

id objc_msgSend__pauseInternalARSessionIfNeeded(void *a1, const char *a2, ...)
{
  return _[a1 _pauseInternalARSessionIfNeeded];
}

id objc_msgSend__pauseOwnerSession(void *a1, const char *a2, ...)
{
  return _[a1 _pauseOwnerSession];
}

id objc_msgSend__pausePassthroughOrLabTestModeSession(void *a1, const char *a2, ...)
{
  return _[a1 _pausePassthroughOrLabTestModeSession];
}

id objc_msgSend__pauseServiceDueToClientTimeout_(void *a1, const char *a2, ...)
{
  return [a1 _pauseServiceDueToClientTimeout:];
}

id objc_msgSend__pauseWifiRanging(void *a1, const char *a2, ...)
{
  return _[a1 _pauseWifiRanging];
}

id objc_msgSend__peer_didFailWithError_(void *a1, const char *a2, ...)
{
  return [_objc_msgSend(a1, "_peer:didFailWithError:");
}

id objc_msgSend__peerHungUp_(void *a1, const char *a2, ...)
{
  return [a1 _peerHungUp:];
}

id objc_msgSend__peerIndexReferenceForAdvertisementType_outPeers_outAdvertisements_(void *a1, const char *a2, ...)
{
  return [_objc_msgSend(a1, "_peerIndexReferenceForAdvertisementType:outPeers:outAdvertisements:");
}

id objc_msgSend__peerSupportsLongRange(void *a1, const char *a2, ...)
{
  return _[a1 _peerSupportsLongRange];
}

id objc_msgSend__performBlockOnDelegateQueue_ifRespondsToSelector_(void *a1, const char *a2, ...)
{
  return [_objc_msgSend(a1, "_performBlockOnDelegateQueue:ifRespondsToSelector:");
}

id objc_msgSend__populateClientEntitlements(void *a1, const char *a2, ...)
{
  return _[a1 _populateClientEntitlements];
}

id objc_msgSend__prepareNbammsServiceRequestForDiscoveryToken_technology_useCase_nbMask_nbUwbAcquisitionBandChannel_mmsSlotSizeMsec_(void *a1, const char *a2, ...)
{
  return [_objc_msgSend(a1, "_prepareNbammsServiceRequestForDiscoveryToken:technology:useCase:nbMask:nbUwbAcquisitionBandChannel:mmsSlotSizeMsec:");
}

id objc_msgSend__prepareServiceRequest(void *a1, const char *a2, ...)
{
  return _[a1 _prepareServiceRequest];
}

id objc_msgSend__prepareServiceRequestForDiscoveryToken_nbUwbAcquisitionBandChannel_(void *a1, const char *a2, ...)
{
  return [_objc_msgSend(a1, "_prepareServiceRequestForDiscoveryToken:nbUwbAcquisitionBandChannel:");
}

id objc_msgSend__prepareServiceRequestForDiscoveryToken_technology_useCase_nbMask_nbUwbAcquisitionBandChannel_mmsSlotSizeMsec_(void *a1, const char *a2, ...)
{
  return [_objc_msgSend(a1, "_prepareServiceRequestForDiscoveryToken:technology:useCase:nbMask:nbUwbAcquisitionBandChannel:mmsSlotSizeMsec:");
}

id objc_msgSend__prepareServiceRequestWithConfig_(void *a1, const char *a2, ...)
{
  return [_objc_msgSend(a1, "_prepareServiceRequestWithConfig:");
}

id objc_msgSend__prepareUwbSessionTrackingObjectsForClientTracking_outServiceRequest_outStartOptions_outShareableConfigData_(void *a1, const char *a2, ...)
{
  return [_objc_msgSend(a1, "_prepareUwbSessionTrackingObjectsForClientTracking:outServiceRequest:outStartOptions:outShareableConfigData:");
}

id objc_msgSend__prepareUwbSessionTrackingObjectsFromDebugParameters_outServiceRequest_outStartOptions_(void *a1, const char *a2, ...)
{
  return [_objc_msgSend(a1, "_prepareUwbSessionTrackingObjectsFromDebugParameters:outServiceRequest:outStartOptions:");
}

id objc_msgSend__printStats(void *a1, const char *a2, ...)
{
  return _[a1 _printStats];
}

id objc_msgSend__process_didTerminate_(void *a1, const char *a2, ...)
{
  return [_objc_msgSend(a1, "_process:didTerminate:")];
}

id objc_msgSend__process_didUpdateState_(void *a1, const char *a2, ...)
{
  return [_objc_msgSend(a1, "_process:didUpdateState:");
}

id objc_msgSend__processBluetoothSample_(void *a1, const char *a2, ...)
{
  return [a1 _processBluetoothSample:];
}

id objc_msgSend__processCarKeyEvent_(void *a1, const char *a2, ...)
{
  return [_objc_msgSend(a1, "_processCarKeyEvent:");
}

id objc_msgSend__processCarKeyEvent_reply_(void *a1, const char *a2, ...)
{
  return [_objc_msgSend(a1, "_processCarKeyEvent:reply:");
}

id objc_msgSend__processCommonConfiguration(void *a1, const char *a2, ...)
{
  return _[a1 _processCommonConfiguration];
}

id objc_msgSend__processFindingEvent_(void *a1, const char *a2, ...)
{
  return [_objc_msgSend(a1, "_processFindingEvent:");
}

id objc_msgSend__processFindingEvent_reply_(void *a1, const char *a2, ...)
{
  return [_objc_msgSend(a1, "_processFindingEvent:reply:");
}

id objc_msgSend__processNonMutualAuthMessageForFinder_(void *a1, const char *a2, ...)
{
  return [_objc_msgSend(a1, "_processNonMutualAuthMessageForFinder:");
}

id objc_msgSend__processPeerMessage_machAbsTimestamp_wasEncrypted_(void *a1, const char *a2, ...)
{
  return [_objc_msgSend(a1, "_processPeerMessage:machAbsTimestamp:wasEncrypted:");
}

id objc_msgSend__processPeerMutualAuthState_peerIsFinder_(void *a1, const char *a2, ...)
{
  return [_objc_msgSend(a1, "_processPeerMutualAuthState:peerIsFinder:");
}

id objc_msgSend__processReceivedAdvertisement_fromPeer_overBluetooth_cbDevice_(void *a1, const char *a2, ...)
{
  return [_objc_msgSend(a1, "_processReceivedAdvertisement:fromPeer:overBluetooth:cbDevice:");
}

id objc_msgSend__processSystemEvent_(void *a1, const char *a2, ...)
{
  return [a1 _processSystemEvent:];
}

id objc_msgSend__processSystemEvent_reply_(void *a1, const char *a2, ...)
{
  return [a1 _processSystemEvent:reply:];
}

id objc_msgSend__processUpdatedCommonConfigurationIfNecessary(void *a1, const char *a2, ...)
{
  return _[a1 _processUpdatedCommonConfigurationIfNecessary];
}

id objc_msgSend__processUpdatedLockState_(void *a1, const char *a2, ...)
{
  return [a1 _processUpdatedLockState:];
}

id objc_msgSend__provideTruthTag_(void *a1, const char *a2, ...)
{
  return [a1 _provideTruthTag:];
}

id objc_msgSend__queryAndCacheCapabilities(void *a1, const char *a2, ...)
{
  return _[a1 _queryAndCacheCapabilities];
}

id objc_msgSend__queryNumPairedFinderWatches_r121951698(void *a1, const char *a2, ...)
{
  return [a1 _queryNumPairedFinderWatches_r121951698];
}

id objc_msgSend__queue(void *a1, const char *a2, ...)
{
  return _[a1 _queue];
}

id objc_msgSend__radiusFromDevicePresencePreset_(void *a1, const char *a2, ...)
{
  return [_objc_msgSend(a1, "_radiusFromDevicePresencePreset:");
}

id objc_msgSend__receivedAidingAndSignallingMessage_machAbsTimestamp_(void *a1, const char *a2, ...)
{
  return [_objc_msgSend(a1, "_receivedAidingAndSignallingMessage:machAbsTimestamp:");
}

id objc_msgSend__receivedCryptoSessionConfigMessage_(void *a1, const char *a2, ...)
{
  return [_objc_msgSend(a1, "_receivedCryptoSessionConfigMessage:");
}

id objc_msgSend__receivedMutualAuthMessage_(void *a1, const char *a2, ...)
{
  return [a1 _receivedMutualAuthMessage:];
}

id objc_msgSend__regionCategoryFromDiscoveryToken_(void *a1, const char *a2, ...)
{
  return [a1 _regionCategoryFromDiscoveryToken:];
}

id objc_msgSend__regionCategoryFromModelString_(void *a1, const char *a2, ...)
{
  return [_objc_msgSend(a1, "_regionCategoryFromModelString:")];
}

id objc_msgSend__registerObserverSessionWithConnection_(void *a1, const char *a2, ...)
{
  return [a1 _registerObserverSessionWithConnection:];
}

id objc_msgSend__registerSessionWithConnection_(void *a1, const char *a2, ...)
{
  return [a1 _registerSessionWithConnection:];
}

id objc_msgSend__reinterruptSessionWithCachedInterruption(void *a1, const char *a2, ...)
{
  return _[a1 _reinterruptSessionWithCachedInterruption];
}

id objc_msgSend__relayBlockToClients_(void *a1, const char *a2, ...)
{
  return [_objc_msgSend(a1, "_relayBlockToClients:");
}

id objc_msgSend__relayDCKMessageInternal_(void *a1, const char *a2, ...)
{
  return [a1 _relayDCKMessageInternal:];
}

id objc_msgSend__relayToClientsOfUWBSessionId_blockToRelay_(void *a1, const char *a2, ...)
{
  return [_objc_msgSend(a1, "_relayToClientsOfUWBSessionId:blockToRelay:");
}

id objc_msgSend__remoteObject(void *a1, const char *a2, ...)
{
  return _[a1 _remoteObject];
}

id objc_msgSend__removeAlgorithmOutputFlagsFromPeerTrackingState_(void *a1, const char *a2, ...)
{
  return [_objc_msgSend(a1, "_removeAlgorithmOutputFlagsFromPeerTrackingState:");
}

id objc_msgSend__removeAllPeers(void *a1, const char *a2, ...)
{
  return _[a1 _removeAllPeers];
}

id objc_msgSend__removeObject_reply_(void *a1, const char *a2, ...)
{
  return [_objc_msgSend(a1, "_removeObject:reply:");
}

id objc_msgSend__removeObserver_(void *a1, const char *a2, ...)
{
  return [_objc_msgSend(a1, "_removeObserver:");
}

id objc_msgSend__removePeerObject_uwbIdentifier_withReason_(void *a1, const char *a2, ...)
{
  return [_objc_msgSend(a1, "_removePeerObject:uwbIdentifier:withReason:");
}

id objc_msgSend__removePeerObject_withReason_(void *a1, const char *a2, ...)
{
  return [a1 _removePeerObject:withReason:];
}

id objc_msgSend__reportMutualAuthStates(void *a1, const char *a2, ...)
{
  return _[a1 _reportMutualAuthStates];
}

id objc_msgSend__resetAdvertiserForType_(void *a1, const char *a2, ...)
{
  return [a1 _resetAdvertiserForType:];
}

id objc_msgSend__resetAdvertisingStateForAllPeers(void *a1, const char *a2, ...)
{
  return _[a1 _resetAdvertisingStateForAllPeers];
}

id objc_msgSend__resetCryptoStateIncludingFailures_(void *a1, const char *a2, ...)
{
  return [_objc_msgSend(a1, "_resetCryptoStateIncludingFailures:");
}

id objc_msgSend__resetDiscoveryStateForAllPeers(void *a1, const char *a2, ...)
{
  return _[a1 _resetDiscoveryStateForAllPeers];
}

id objc_msgSend__resetDiscoveryStateForPeer_(void *a1, const char *a2, ...)
{
  return [_objc_msgSend(a1, "_resetDiscoveryStateForPeer:");
}

id objc_msgSend__resetRangingStateForToken_(void *a1, const char *a2, ...)
{
  return [_objc_msgSend(a1, "_resetRangingStateForToken:");
}

id objc_msgSend__resetServiceStateForOperation_(void *a1, const char *a2, ...)
{
  return [_objc_msgSend(a1, "_resetServiceStateForOperation:");
}

id objc_msgSend__resetSessionStateForOperation_(void *a1, const char *a2, ...)
{
  return [_objc_msgSend(a1, "_resetSessionStateForOperation:");
}

id objc_msgSend__resetStatistics(void *a1, const char *a2, ...)
{
  return _[a1 _resetStatistics];
}

id objc_msgSend__resetUpdatesEngine(void *a1, const char *a2, ...)
{
  return _[a1 _resetUpdatesEngine];
}

id objc_msgSend__resumeWifiRanging(void *a1, const char *a2, ...)
{
  return _[a1 _resumeWifiRanging];
}

id objc_msgSend__reverse(void *a1, const char *a2, ...)
{
  return _[a1 _reverse];
}

id objc_msgSend__roseMotionStateToNIMotionActivityState_(void *a1, const char *a2, ...)
{
  return [_objc_msgSend(a1, "_roseMotionStateToNIMotionActivityState:");
}

id objc_msgSend__roseSession_didChangeRangingUpdateRate_newThrottleRate_prevThrottleRate_effectiveSinceCycleInde_(void *a1, const char *a2, ...)
{
  return [_objc_msgSend(a1, "_roseSession:didChangeRangingUpdateRate:newThrottleRate:prevThrottleRate:effectiveSinceCycleInde:");
}

id objc_msgSend__roseSession_invalidatedWithReason_(void *a1, const char *a2, ...)
{
  return [_objc_msgSend(a1, "_roseSession:invalidatedWithReason:")];
}

id objc_msgSend__roundRobinTimerHandler(void *a1, const char *a2, ...)
{
  return _[a1 _roundRobinTimerHandler];
}

id objc_msgSend__runLabTestModeSession(void *a1, const char *a2, ...)
{
  return _[a1 _runLabTestModeSession];
}

id objc_msgSend__runOwnerSession(void *a1, const char *a2, ...)
{
  return _[a1 _runOwnerSession];
}

id objc_msgSend__runPassthroughSession(void *a1, const char *a2, ...)
{
  return _[a1 _runPassthroughSession];
}

id objc_msgSend__selectedTechnology(void *a1, const char *a2, ...)
{
  return _[a1 _selectedTechnology];
}

id objc_msgSend__sendAnalyticsOnRangingComplete_suspendReason_(void *a1, const char *a2, ...)
{
  return [_objc_msgSend(a1, "_sendAnalyticsOnRangingComplete:suspendReason:")];
}

id objc_msgSend__sendHangup_finderGone_findeeGone_token_(void *a1, const char *a2, ...)
{
  return [_objc_msgSend(a1, "_sendHangup:finderGone:findeeGone:token:");
}

id objc_msgSend__sendHangupSignalForSession_(void *a1, const char *a2, ...)
{
  return [_objc_msgSend(a1, "_sendHangupSignalForSession:");
}

id objc_msgSend__sendTimeTupleToAlgorithms(void *a1, const char *a2, ...)
{
  return _[a1 _sendTimeTupleToAlgorithms];
}

id objc_msgSend__serverConnectionInterrupted(void *a1, const char *a2, ...)
{
  return _[a1 _serverConnectionInterrupted];
}

id objc_msgSend__serverConnectionInvalidated(void *a1, const char *a2, ...)
{
  return _[a1 _serverConnectionInvalidated];
}

id objc_msgSend__sessionConfiguredToRange(void *a1, const char *a2, ...)
{
  return _[a1 _sessionConfiguredToRange];
}

id objc_msgSend__sessionStoppedWithTimestamp_(void *a1, const char *a2, ...)
{
  return [a1 _sessionStoppedWithTimestamp:];
}

id objc_msgSend__setARSessionInternal_(void *a1, const char *a2, ...)
{
  return [a1 _setARSessionInternal:];
}

id objc_msgSend__setAdditionalXPCActivityProperties_(void *a1, const char *a2, ...)
{
  return [a1 _setAdditionalXPCActivityProperties:];
}

id objc_msgSend__setContainerState_(void *a1, const char *a2, ...)
{
  return [a1 _setContainerState:];
}

id objc_msgSend__setDebugURSK_transactionIdentifier_(void *a1, const char *a2, ...)
{
  return [_objc_msgSend(a1, "_setDebugURSK:transactionIdentifier:");
}

id objc_msgSend__setDebugURSK_transactionIdentifier_reply_(void *a1, const char *a2, ...)
{
  return [a1 _setDebugURSK:transactionIdentifier:reply:];
}

id objc_msgSend__setInitiator(void *a1, const char *a2, ...)
{
  return _[a1 _setInitiator];
}

id objc_msgSend__setQueue_(void *a1, const char *a2, ...)
{
  return [a1 _setQueue:];
}

id objc_msgSend__setReadValidateDefaultsWriteForTypeOfPredictor(void *a1, const char *a2, ...)
{
  return _[a1 _setReadValidateDefaultsWriteForTypeOfPredictor];
}

id objc_msgSend__setTokenCacheForGroup_(void *a1, const char *a2, ...)
{
  return [a1 _setTokenCacheForGroup:];
}

id objc_msgSend__setURSKTTL_(void *a1, const char *a2, ...)
{
  return [_objc_msgSend(a1, "_setURSKTTL:");
}

id objc_msgSend__setURSKTTL_reply_(void *a1, const char *a2, ...)
{
  return [a1 _setURSKTTL:reply:];
}

id objc_msgSend__setUpARSession(void *a1, const char *a2, ...)
{
  return _[a1 _setUpARSession];
}

id objc_msgSend__setUpAlgorithmsContainerForToken_(void *a1, const char *a2, ...)
{
  return [_objc_msgSend(a1, "_setUpAlgorithmsContainerForToken:");
}

id objc_msgSend__shouldApplyBTScanMitigation_r121951698(void *a1, const char *a2, ...)
{
  return [a1 _shouldApplyBTScanMitigation_r121951698];
}

id objc_msgSend__shouldBypassBluetoothDiscovery(void *a1, const char *a2, ...)
{
  return _[a1 _shouldBypassBluetoothDiscovery];
}

id objc_msgSend__shouldConsumeRoseSolution_(void *a1, const char *a2, ...)
{
  return [_objc_msgSend(a1, "_shouldConsumeRoseSolution:");
}

id objc_msgSend__shouldEncodeSignallingDataInMessageID(void *a1, const char *a2, ...)
{
  return _[a1 _shouldEncodeSignallingDataInMessageID];
}

id objc_msgSend__shouldHoldOSTransactionWhileFindable(void *a1, const char *a2, ...)
{
  return _[a1 _shouldHoldOSTransactionWhileFindable];
}

id objc_msgSend__shouldInteract(void *a1, const char *a2, ...)
{
  return _[a1 _shouldInteract];
}

id objc_msgSend__shouldLog(void *a1, const char *a2, ...)
{
  return _[a1 _shouldLog];
}

id objc_msgSend__shouldRespondToDevice_(void *a1, const char *a2, ...)
{
  return [a1 _shouldRespondToDevice:];
}

id objc_msgSend__shouldSendMutualAuthMessage(void *a1, const char *a2, ...)
{
  return _[a1 _shouldSendMutualAuthMessage];
}

id objc_msgSend__shouldUseFinderToken_findeeToken_(void *a1, const char *a2, ...)
{
  return [_objc_msgSend(a1, "_shouldUseFinderToken:findeeToken:");
}

id objc_msgSend__startAltitudeUpdates(void *a1, const char *a2, ...)
{
  return _[a1 _startAltitudeUpdates];
}

id objc_msgSend__startDeviceMotionUpdates(void *a1, const char *a2, ...)
{
  return _[a1 _startDeviceMotionUpdates];
}

id objc_msgSend__startDevicePDRUpdates(void *a1, const char *a2, ...)
{
  return _[a1 _startDevicePDRUpdates];
}

id objc_msgSend__startMonitoringPeersActivity_(void *a1, const char *a2, ...)
{
  return [a1 _startMonitoringPeersActivity:];
}

id objc_msgSend__startMotionActivityUpdates(void *a1, const char *a2, ...)
{
  return _[a1 _startMotionActivityUpdates];
}

id objc_msgSend__startObserving_(void *a1, const char *a2, ...)
{
  return [_objc_msgSend(a1, "_startObserving:");
}

id objc_msgSend__startOrUpdateAdvertising(void *a1, const char *a2, ...)
{
  return _[a1 _startOrUpdateAdvertising];
}

id objc_msgSend__startPedometerDataUpdates(void *a1, const char *a2, ...)
{
  return _[a1 _startPedometerDataUpdates];
}

id objc_msgSend__startPedometerEventUpdates(void *a1, const char *a2, ...)
{
  return _[a1 _startPedometerEventUpdates];
}

id objc_msgSend__startRoundRobinTimer(void *a1, const char *a2, ...)
{
  return _[a1 _startRoundRobinTimer];
}

id objc_msgSend__startRunawayFindingBackstopTimer(void *a1, const char *a2, ...)
{
  return _[a1 _startRunawayFindingBackstopTimer];
}

id objc_msgSend__startService(void *a1, const char *a2, ...)
{
  return _[a1 _startService];
}

id objc_msgSend__startStateTimer_(void *a1, const char *a2, ...)
{
  return [a1 _startStateTimer:];
}

id objc_msgSend__stateTimerExpired(void *a1, const char *a2, ...)
{
  return _[a1 _stateTimerExpired];
}

id objc_msgSend__stopObserving_(void *a1, const char *a2, ...)
{
  return [a1 _stopObserving:];
}

id objc_msgSend__stopRoundRobinTimer(void *a1, const char *a2, ...)
{
  return _[a1 _stopRoundRobinTimer];
}

id objc_msgSend__stopWiFiSessionsWithReason_(void *a1, const char *a2, ...)
{
  return [_objc_msgSend(a1, "_stopWiFiSessionsWithReason:");
}

id objc_msgSend__submitErrorMetric_(void *a1, const char *a2, ...)
{
  return [_objc_msgSend(a1, "_submitErrorMetric:");
}

id objc_msgSend__submitFindingSessionEndStats(void *a1, const char *a2, ...)
{
  return _[a1 _submitFindingSessionEndStats];
}

id objc_msgSend__supportedPlatform(void *a1, const char *a2, ...)
{
  return _[a1 _supportedPlatform];
}

id objc_msgSend__supportedPlatform_(void *a1, const char *a2, ...)
{
  return [a1 _supportedPlatform:];
}

id objc_msgSend__synchronousRemoteObject(void *a1, const char *a2, ...)
{
  return _[a1 _synchronousRemoteObject];
}

id objc_msgSend__tearDownARSession(void *a1, const char *a2, ...)
{
  return _[a1 _tearDownARSession];
}

id objc_msgSend__tearDownAlgorithmsContainerForToken_(void *a1, const char *a2, ...)
{
  return [_objc_msgSend(a1, "_tearDownAlgorithmsContainerForToken:");
}

id objc_msgSend__tokensFromAllGroups(void *a1, const char *a2, ...)
{
  return _[a1 _tokensFromAllGroups];
}

id objc_msgSend__totalPeers(void *a1, const char *a2, ...)
{
  return _[a1 _totalPeers];
}

id objc_msgSend__triggerInitiatorRanging(void *a1, const char *a2, ...)
{
  return _[a1 _triggerInitiatorRanging];
}

id objc_msgSend__triggerRanging_(void *a1, const char *a2, ...)
{
  return [_objc_msgSend(a1, "_triggerRanging:");
}

id objc_msgSend__triggerRanging_peerDiscoveryToken_technology_sharedProtocol_(void *a1, const char *a2, ...)
{
  return [_objc_msgSend(a1, "_triggerRanging:peerDiscoveryToken:technology:sharedProtocol:");
}

id objc_msgSend__triggerResponderRangingForSession_initiatorDevice_(void *a1, const char *a2, ...)
{
  return [_objc_msgSend(a1, "_triggerResponderRangingForSession:initiatorDevice:");
}

id objc_msgSend__triggerWiFiRanging_(void *a1, const char *a2, ...)
{
  return [_objc_msgSend(a1, "_triggerWiFiRanging:");
}

id objc_msgSend__tryToStartRangingWithPeerAdvertisement_(void *a1, const char *a2, ...)
{
  return [a1 _tryToStartRangingWithPeerAdvertisement:];
}

id objc_msgSend__unitTest1(void *a1, const char *a2, ...)
{
  return _[a1 _unitTest1];
}

id objc_msgSend__unitTest2(void *a1, const char *a2, ...)
{
  return _[a1 _unitTest2];
}

id objc_msgSend__updateAdvertisementAfterActivationForType_(void *a1, const char *a2, ...)
{
  return [_objc_msgSend(a1, "_updateAdvertisementAfterActivationForType:");
}

id objc_msgSend__updateAggregatedClientInfo(void *a1, const char *a2, ...)
{
  return _[a1 _updateAggregatedClientInfo];
}

id objc_msgSend__updateAlignedPDRMetrics_(void *a1, const char *a2, ...)
{
  return [_objc_msgSend(a1, "_updateAlignedPDRMetrics:");
}

id objc_msgSend__updateAnalyticsAboutRangingRateForDevice_responseSkipRatio_cycleRate_(void *a1, const char *a2, ...)
{
  return [_objc_msgSend(a1, "_updateAnalyticsAboutRangingRateForDevice:responseSkipRatio:cycleRate:");
}

id objc_msgSend__updateAnalyticsWithFailedRangingRequestToken_isFinder_(void *a1, const char *a2, ...)
{
  return [_objc_msgSend(a1, "_updateAnalyticsWithFailedRangingRequestToken:isFinder:");
}

id objc_msgSend__updateAnalyticsWithSuccessfulRangingRequest(void *a1, const char *a2, ...)
{
  return _[a1 _updateAnalyticsWithSuccessfulRangingRequest];
}

id objc_msgSend__updateClientAppVisibilityInterruption(void *a1, const char *a2, ...)
{
  return _[a1 _updateClientAppVisibilityInterruption];
}

id objc_msgSend__updateCryptoSessionConfigPayload(void *a1, const char *a2, ...)
{
  return _[a1 _updateCryptoSessionConfigPayload];
}

id objc_msgSend__updateInterruptionForUWBServiceState_cause_requiresNarrowBand_(void *a1, const char *a2, ...)
{
  return [_objc_msgSend(a1, "_updateInterruptionForUWBServiceState:cause:requiresNarrowBand:");
}

id objc_msgSend__updateInterruptionForUWBSystemError(void *a1, const char *a2, ...)
{
  return _[a1 _updateInterruptionForUWBSystemError];
}

id objc_msgSend__updateInterruptionForUWBSystemOffWithCause_(void *a1, const char *a2, ...)
{
  return [_objc_msgSend(a1, "_updateInterruptionForUWBSystemOffWithCause:");
}

id objc_msgSend__updateInterruptionForUWBSystemReady(void *a1, const char *a2, ...)
{
  return _[a1 _updateInterruptionForUWBSystemReady];
}

id objc_msgSend__updateLaunchOnDemandScannerAndRequestScan_(void *a1, const char *a2, ...)
{
  return [_objc_msgSend(a1, "_updateLaunchOnDemandScannerAndRequestScan:");
}

id objc_msgSend__updateMinMaxRangeAndRSSI_uwbRSSI_nbRSSI_(void *a1, const char *a2, ...)
{
  return [_objc_msgSend(a1, "_updateMinMaxRangeAndRSSI:uwbRSSI:nbRSSI:");
}

id objc_msgSend__updatePeerTrackingAdvertisingState_(void *a1, const char *a2, ...)
{
  return [_objc_msgSend(a1, "_updatePeerTrackingAdvertisingState:");
}

id objc_msgSend__updatePeerTrackingClientWantsUpdates_(void *a1, const char *a2, ...)
{
  return [_objc_msgSend(a1, "_updatePeerTrackingClientWantsUpdates:");
}

id objc_msgSend__updatePeerTrackingDiscoveryState_(void *a1, const char *a2, ...)
{
  return [_objc_msgSend(a1, "_updatePeerTrackingDiscoveryState:");
}

id objc_msgSend__updatePeerTrackingForToken_newAdvertisingState_(void *a1, const char *a2, ...)
{
  return [_objc_msgSend(a1, "_updatePeerTrackingForToken:newAdvertisingState:");
}

id objc_msgSend__updatePeerTrackingForToken_newDiscoveryState_(void *a1, const char *a2, ...)
{
  return [_objc_msgSend(a1, "_updatePeerTrackingForToken:newDiscoveryState:");
}

id objc_msgSend__updatePeerTrackingForToken_newNbUwbAcquisitionChannelIdx_(void *a1, const char *a2, ...)
{
  return [_objc_msgSend(a1, "_updatePeerTrackingForToken:newNbUwbAcquisitionChannelIdx:");
}

id objc_msgSend__updatePeerTrackingForToken_newRangingState_(void *a1, const char *a2, ...)
{
  return [_objc_msgSend(a1, "_updatePeerTrackingForToken:newRangingState:");
}

id objc_msgSend__updatePeerTrackingForToken_newTrackingState_(void *a1, const char *a2, ...)
{
  return [_objc_msgSend(a1, "_updatePeerTrackingForToken:newTrackingState:");
}

id objc_msgSend__updatePeerTrackingOverallState_(void *a1, const char *a2, ...)
{
  return [_objc_msgSend(a1, "_updatePeerTrackingOverallState:");
}

id objc_msgSend__updatePeerTrackingRangingState_(void *a1, const char *a2, ...)
{
  return [_objc_msgSend(a1, "_updatePeerTrackingRangingState:");
}

id objc_msgSend__updateReceivedSignalFlags_toPeerTrackingForToken_(void *a1, const char *a2, ...)
{
  return [a1 _updateReceivedSignalFlags:toPeerTrackingForToken:];
}

id objc_msgSend__updateRegionDescription(void *a1, const char *a2, ...)
{
  return _[a1 _updateRegionDescription];
}

id objc_msgSend__updateSessionPayload(void *a1, const char *a2, ...)
{
  return _[a1 _updateSessionPayload];
}

id objc_msgSend__updateUserMovedDistanceWithPose_lastPoseInfo_(void *a1, const char *a2, ...)
{
  return [_objc_msgSend(a1, "_updateUserMovedDistanceWithPose:lastPoseInfo:");
}

id objc_msgSend__updateUwbSessionState_(void *a1, const char *a2, ...)
{
  return [_objc_msgSend(a1, "_updateUwbSessionState:");
}

id objc_msgSend__useCase(void *a1, const char *a2, ...)
{
  return _[a1 _useCase];
}

id objc_msgSend__validateDiscoveryTokenDict_(void *a1, const char *a2, ...)
{
  return [_objc_msgSend(a1, "_validateDiscoveryTokenDict:");
}

id objc_msgSend__validateLockAttributes(void *a1, const char *a2, ...)
{
  return _[a1 _validateLockAttributes];
}

id objc_msgSend__validateRegionIsPreset_(void *a1, const char *a2, ...)
{
  return [a1 _validateRegionIsPreset:];
}

id objc_msgSend__validateRegionPredicates_outer_(void *a1, const char *a2, ...)
{
  return [_objc_msgSend(a1, "_validateRegionPredicates:outer:");
}

id objc_msgSend__validateTokensAndRangingParameters(void *a1, const char *a2, ...)
{
  return _[a1 _validateTokensAndRangingParameters];
}

id objc_msgSend__verifyError_(void *a1, const char *a2, ...)
{
  return [_objc_msgSend(a1, "_verifyError:");
}

id objc_msgSend_acceptAltimeterData_(void *a1, const char *a2, ...)
{
  return [a1 acceptAltimeterData:];
}

id objc_msgSend_acceptBluetoothSample_coarseEstimation_regionCategory_(void *a1, const char *a2, ...)
{
  return [a1 acceptBluetoothSample:coarseEstimation:regionCategory:];
}

id objc_msgSend_acceptDeviceMotion_(void *a1, const char *a2, ...)
{
  return [a1 acceptDeviceMotion:];
}

id objc_msgSend_acceptDeviceMotionInput_(void *a1, const char *a2, ...)
{
  return [a1 acceptDeviceMotionInput:];
}

id objc_msgSend_acceptDevicePDRInput_(void *a1, const char *a2, ...)
{
  return [a1 acceptDevicePDRInput:];
}

id objc_msgSend_acceptDiscoveryEventForPeer_(void *a1, const char *a2, ...)
{
  return [a1 acceptDiscoveryEventForPeer:];
}

id objc_msgSend_acceptGnssSatelliteData_(void *a1, const char *a2, ...)
{
  return [a1 acceptGnssSatelliteData:];
}

id objc_msgSend_acceptHeadingData_(void *a1, const char *a2, ...)
{
  return [a1 acceptHeadingData:];
}

id objc_msgSend_acceptMagneticFieldStrength_(void *a1, const char *a2, ...)
{
  return [a1 acceptMagneticFieldStrength:];
}

id objc_msgSend_acceptMotionActivity_(void *a1, const char *a2, ...)
{
  return [a1 acceptMotionActivity:];
}

id objc_msgSend_acceptPedometerData_(void *a1, const char *a2, ...)
{
  return [a1 acceptPedometerData:];
}

id objc_msgSend_acceptPedometerEvent_(void *a1, const char *a2, ...)
{
  return [a1 acceptPedometerEvent:];
}

id objc_msgSend_acceptPeerData_fromPeer_(void *a1, const char *a2, ...)
{
  return [a1 acceptPeerData:fromPeer:];
}

id objc_msgSend_acceptPeerDeviceType_(void *a1, const char *a2, ...)
{
  return [a1 acceptPeerDeviceType:];
}

id objc_msgSend_acceptPeerLocationData_forPeer_(void *a1, const char *a2, ...)
{
  return [a1 acceptPeerLocationData:forPeer:];
}

id objc_msgSend_acceptRoseSolution_(void *a1, const char *a2, ...)
{
  return [a1 acceptRoseSolution:];
}

id objc_msgSend_acceptRoseSolution_withProcessingOptions_(void *a1, const char *a2, ...)
{
  return [a1 acceptRoseSolution:withProcessingOptions:];
}

id objc_msgSend_acceptSelfLocationData_(void *a1, const char *a2, ...)
{
  return [a1 acceptSelfLocationData:];
}

id objc_msgSend_acceptUnsuccessfulRoseSolution_(void *a1, const char *a2, ...)
{
  return [a1 acceptUnsuccessfulRoseSolution:];
}

id objc_msgSend_acceptVisionInput_(void *a1, const char *a2, ...)
{
  return [a1 acceptVisionInput:];
}

id objc_msgSend_acceptWiFiRangeResults_(void *a1, const char *a2, ...)
{
  return [a1 acceptWiFiRangeResults:];
}

id objc_msgSend_accessWithAccessor_forService_(void *a1, const char *a2, ...)
{
  return [_objc_msgSend(a1, "accessWithAccessor:forService:");
}

id objc_msgSend_accessoryConfigData(void *a1, const char *a2, ...)
{
  return _[a1 accessoryConfigData];
}

id objc_msgSend_accessoryDiscoveryToken(void *a1, const char *a2, ...)
{
  return _[a1 accessoryDiscoveryToken];
}

id objc_msgSend_accessoryGATTServiceFailedWithError_(void *a1, const char *a2, ...)
{
  return [a1 accessoryGATTServiceFailedWithError:];
}

id objc_msgSend_accessoryNotify_isAttached_(void *a1, const char *a2, ...)
{
  return [a1 accessoryNotify:x0 isAttached:x1];
}

id objc_msgSend_account(void *a1, const char *a2, ...)
{
  return _[a1 account];
}

id objc_msgSend_acquireWithError_(void *a1, const char *a2, ...)
{
  return [a1 acquireWithError:];
}

id objc_msgSend_actOnRemoteObjectAndScheduleBarrierBlock_(void *a1, const char *a2, ...)
{
  return [a1 actOnRemoteObjectAndScheduleBarrierBlock:];
}

id objc_msgSend_activate(void *a1, const char *a2, ...)
{
  return _[a1 activate];
}

id objc_msgSend_activate_(void *a1, const char *a2, ...)
{
  return [a1 activate:];
}

id objc_msgSend_activateCBDiscovery(void *a1, const char *a2, ...)
{
  return _[a1 activateCBDiscovery];
}

id objc_msgSend_activateWithCompletion_(void *a1, const char *a2, ...)
{
  return [a1 activateWithCompletion:];
}

id objc_msgSend_activateWithDelegate_delegateQueue_sessionIRK_sessionIdentifier_controlFlags_tokenFlags_(void *a1, const char *a2, ...)
{
  return [_objc_msgSend(a1, "activateWithDelegate:delegateQueue:sessionIRK:sessionIdentifier:controlFlags:tokenFlags:");
}

id objc_msgSend_activationGuard(void *a1, const char *a2, ...)
{
  return _[a1 activationGuard];
}

id objc_msgSend_activationResponse(void *a1, const char *a2, ...)
{
  return _[a1 activationResponse];
}

id objc_msgSend_acwgRangingLimitExceeded(void *a1, const char *a2, ...)
{
  return _[a1 acwgRangingLimitExceeded];
}

id objc_msgSend_addBundleNameToModelResourcePackage_andBundleDirectory_(void *a1, const char *a2, ...)
{
  return [a1 addBundleNameToModelResourcePackage:andBundleDirectory:];
}

id objc_msgSend_addClient_identifier_(void *a1, const char *a2, ...)
{
  return [a1 addClient:identifier:];
}

id objc_msgSend_addClient_identifier_configuration_(void *a1, const char *a2, ...)
{
  return [a1 addClient:identifier:configuration:];
}

id objc_msgSend_addDiscoveryType_(void *a1, const char *a2, ...)
{
  return [a1 addDiscoveryType:];
}

id objc_msgSend_addEntriesFromDictionary_(void *a1, const char *a2, ...)
{
  return [a1 addEntriesFromDictionary:];
}

id objc_msgSend_addObject_(void *a1, const char *a2, ...)
{
  return [a1 addObject:];
}

id objc_msgSend_addObjectsFromArray_(void *a1, const char *a2, ...)
{
  return [a1 addObjectsFromArray:];
}

id objc_msgSend_addObserver_(void *a1, const char *a2, ...)
{
  return [a1 addObserver:];
}

id objc_msgSend_addObserver_forKeyPath_options_context_(void *a1, const char *a2, ...)
{
  return [a1 addObserver:forKeyPath:options:context:];
}

id objc_msgSend_addObserver_identifier_token_(void *a1, const char *a2, ...)
{
  return [a1 addObserver:identifier:token:];
}

id objc_msgSend_addObserver_selector_name_object_(void *a1, const char *a2, ...)
{
  return [a1 addObserver:x0 selector:x1 name:x2 object:x3];
}

id objc_msgSend_addObservers_(void *a1, const char *a2, ...)
{
  return [a1 addObservers:];
}

id objc_msgSend_addPayloadChangeObserver_(void *a1, const char *a2, ...)
{
  return [a1 addPayloadChangeObserver:];
}

id objc_msgSend_addPeerDiscoveryToken_(void *a1, const char *a2, ...)
{
  return [a1 addPeerDiscoveryToken:];
}

id objc_msgSend_addPeerToken_completion_(void *a1, const char *a2, ...)
{
  return [a1 addPeerToken:x0 completion:x1];
}

id objc_msgSend_addSample_(void *a1, const char *a2, ...)
{
  return [a1 addSample:];
}

id objc_msgSend_addServiceClient_identifier_configuration_(void *a1, const char *a2, ...)
{
  return [a1 addServiceClient:identifier:configuration:];
}

id objc_msgSend_addServiceClient_identifier_processName_configuration_(void *a1, const char *a2, ...)
{
  return [a1 addServiceClient:identifier:processName:configuration:];
}

id objc_msgSend_addServiceListener_withIdentifier_forBluetoothPeer_withConfiguration_(void *a1, const char *a2, ...)
{
  return [a1 addServiceListener:withIdentifier:forBluetoothPeer:withConfiguration:];
}

id objc_msgSend_address(void *a1, const char *a2, ...)
{
  return _[a1 address];
}

id objc_msgSend_adjustResponderThrottleRateIfNeeded_object_(void *a1, const char *a2, ...)
{
  return [a1 adjustResponderThrottleRateIfNeeded:object];
}

id objc_msgSend_advertiseRate(void *a1, const char *a2, ...)
{
  return _[a1 advertiseRate];
}

id objc_msgSend_advertisement(void *a1, const char *a2, ...)
{
  return _[a1 advertisement];
}

id objc_msgSend_advertisementForFinder_address_statusFlags_payload_uniqueIdentifier_(void *a1, const char *a2, ...)
{
  return [_objc_msgSend(a1, "advertisementForFinder:address:statusFlags:payload:uniqueIdentifier:");
}

id objc_msgSend_advertisementFromByteRepresentation_(void *a1, const char *a2, ...)
{
  return [a1 advertisementFromByteRepresentation:];
}

id objc_msgSend_advertisingAddress(void *a1, const char *a2, ...)
{
  return _[a1 advertisingAddress];
}

id objc_msgSend_advertisingAddressData(void *a1, const char *a2, ...)
{
  return _[a1 advertisingAddressData];
}

id objc_msgSend_advertisingAddressDataConnectable(void *a1, const char *a2, ...)
{
  return _[a1 advertisingAddressDataConnectable];
}

id objc_msgSend_advertisingAddressDataNonConnectable(void *a1, const char *a2, ...)
{
  return _[a1 advertisingAddressDataNonConnectable];
}

id objc_msgSend_advertisingPeers(void *a1, const char *a2, ...)
{
  return _[a1 advertisingPeers];
}

id objc_msgSend_advertisingState(void *a1, const char *a2, ...)
{
  return _[a1 advertisingState];
}

id objc_msgSend_aggregatedUWBData(void *a1, const char *a2, ...)
{
  return _[a1 aggregatedUWBData];
}

id objc_msgSend_airPodsProxCardSampleTooOld_(void *a1, const char *a2, ...)
{
  return [a1 airPodsProxCardSampleTooOld:];
}

id objc_msgSend_airplaneModeStatus(void *a1, const char *a2, ...)
{
  return _[a1 airplaneModeStatus];
}

id objc_msgSend_algorithmOutputFlags(void *a1, const char *a2, ...)
{
  return _[a1 algorithmOutputFlags];
}

id objc_msgSend_algorithmSource(void *a1, const char *a2, ...)
{
  return _[a1 algorithmSource];
}

id objc_msgSend_allKeys(void *a1, const char *a2, ...)
{
  return _[a1 allKeys];
}

id objc_msgSend_allObjects(void *a1, const char *a2, ...)
{
  return _[a1 allObjects];
}

id objc_msgSend_allSamples(void *a1, const char *a2, ...)
{
  return _[a1 allSamples];
}

id objc_msgSend_allSessionsPrintableState(void *a1, const char *a2, ...)
{
  return _[a1 allSessionsPrintableState];
}

id objc_msgSend_allValues(void *a1, const char *a2, ...)
{
  return _[a1 allValues];
}

id objc_msgSend_allocWithZone_(void *a1, const char *a2, ...)
{
  return [a1 allocWithZone:];
}

id objc_msgSend_allowScreenOffOperation_(void *a1, const char *a2, ...)
{
  return [a1 allowScreenOffOperation:];
}

id objc_msgSend_allowedDevices(void *a1, const char *a2, ...)
{
  return _[a1 allowedDevices];
}

id objc_msgSend_altitude(void *a1, const char *a2, ...)
{
  return _[a1 altitude];
}

id objc_msgSend_ambientIntensity(void *a1, const char *a2, ...)
{
  return _[a1 ambientIntensity];
}

id objc_msgSend_analytics(void *a1, const char *a2, ...)
{
  return _[a1 analytics];
}

id objc_msgSend_analyticsManager(void *a1, const char *a2, ...)
{
  return _[a1 analyticsManager];
}

id objc_msgSend_antennaDiversityOverride(void *a1, const char *a2, ...)
{
  return _[a1 antennaDiversityOverride];
}

id objc_msgSend_antennaMask(void *a1, const char *a2, ...)
{
  return _[a1 antennaMask];
}

id objc_msgSend_appBecameNotVisibleWithTimestamp_(void *a1, const char *a2, ...)
{
  return [a1 appBecameNotVisibleWithTimestamp:];
}

id objc_msgSend_appBecameVisibleWithTimestamp_(void *a1, const char *a2, ...)
{
  return [a1 appBecameVisibleWithTimestamp:];
}

id objc_msgSend_appStateMonitor(void *a1, const char *a2, ...)
{
  return _[a1 appStateMonitor];
}

id objc_msgSend_appendBytes_length_(void *a1, const char *a2, ...)
{
  return [a1 appendBytes:x0 length:x1];
}

id objc_msgSend_appendData_(void *a1, const char *a2, ...)
{
  return [a1 appendData:];
}

id objc_msgSend_appendFormat_(void *a1, const char *a2, ...)
{
  return [a1 appendFormat:];
}

id objc_msgSend_appendString_(void *a1, const char *a2, ...)
{
  return [a1 appendString:];
}

id objc_msgSend_applyTransformation_(void *a1, const char *a2, ...)
{
  return [a1 applyTransformation:];
}

id objc_msgSend_arSession(void *a1, const char *a2, ...)
{
  return _[a1 arSession];
}

id objc_msgSend_arSessionDidFailWithError_(void *a1, const char *a2, ...)
{
  return [_objc_msgSend(a1, "arSessionDidFailWithError:");
}

id objc_msgSend_arSessionInterruptionEnded(void *a1, const char *a2, ...)
{
  return _[a1 arSessionInterruptionEnded];
}

id objc_msgSend_arSessionState(void *a1, const char *a2, ...)
{
  return _[a1 arSessionState];
}

id objc_msgSend_arSessionWasInterrupted(void *a1, const char *a2, ...)
{
  return _[a1 arSessionWasInterrupted];
}

id objc_msgSend_arSessionWillRunWithInvalidConfiguration(void *a1, const char *a2, ...)
{
  return _[a1 arSessionWillRunWithInvalidConfiguration];
}

id objc_msgSend_array(void *a1, const char *a2, ...)
{
  return _[a1 array];
}

id objc_msgSend_arrayWithContentsOfFile_(void *a1, const char *a2, ...)
{
  return [a1 arrayWithContentsOfFile:];
}

id objc_msgSend_arrayWithObject_(void *a1, const char *a2, ...)
{
  return [a1 arrayWithObject:];
}

id objc_msgSend_arrayWithObjects_count_(void *a1, const char *a2, ...)
{
  return [a1 arrayWithObjects:];
}

id objc_msgSend_attachedRoles(void *a1, const char *a2, ...)
{
  return _[a1 attachedRoles];
}

id objc_msgSend_attitude(void *a1, const char *a2, ...)
{
  return _[a1 attitude];
}

id objc_msgSend_attributeWithDomain_name_(void *a1, const char *a2, ...)
{
  return [a1 attributeWithDomain:name:];
}

id objc_msgSend_audioRouteToSARState_(void *a1, const char *a2, ...)
{
  return [a1 audioRouteToSARState:];
}

id objc_msgSend_auditToken(void *a1, const char *a2, ...)
{
  return _[a1 auditToken];
}

id objc_msgSend_authorizationStatusForSession_promptUserIfUndetermined_(void *a1, const char *a2, ...)
{
  return [a1 authorizationStatusForSession:promptUserIfUndetermined:];
}

id objc_msgSend_automotive(void *a1, const char *a2, ...)
{
  return _[a1 automotive];
}

id objc_msgSend_azimuth(void *a1, const char *a2, ...)
{
  return _[a1 azimuth];
}

id objc_msgSend_backgroundContinuationDiscoveryTimeout(void *a1, const char *a2, ...)
{
  return _[a1 backgroundContinuationDiscoveryTimeout];
}

id objc_msgSend_backgroundContinuationInteractionTimeout(void *a1, const char *a2, ...)
{
  return _[a1 backgroundContinuationInteractionTimeout];
}

id objc_msgSend_backgroundMode(void *a1, const char *a2, ...)
{
  return _[a1 backgroundMode];
}

id objc_msgSend_beginIntervalForAccess_(void *a1, const char *a2, ...)
{
  return [a1 beginIntervalForAccess:];
}

id objc_msgSend_biasCorrectionEstimate(void *a1, const char *a2, ...)
{
  return _[a1 biasCorrectionEstimate];
}

id objc_msgSend_bleAdvertisementTimestampMachContinuous(void *a1, const char *a2, ...)
{
  return _[a1 bleAdvertisementTimestampMachContinuous];
}

id objc_msgSend_bleChannel(void *a1, const char *a2, ...)
{
  return _[a1 bleChannel];
}

id objc_msgSend_bleRSSIThresholdHint(void *a1, const char *a2, ...)
{
  return _[a1 bleRSSIThresholdHint];
}

id objc_msgSend_bleScanRate(void *a1, const char *a2, ...)
{
  return _[a1 bleScanRate];
}

id objc_msgSend_bluetoothAdvertisingAddress(void *a1, const char *a2, ...)
{
  return _[a1 bluetoothAdvertisingAddress];
}

id objc_msgSend_bluetoothAdvertisingAddressChanged(void *a1, const char *a2, ...)
{
  return _[a1 bluetoothAdvertisingAddressChanged];
}

id objc_msgSend_bluetoothAdvertisingAddressChanged_(void *a1, const char *a2, ...)
{
  return [a1 bluetoothAdvertisingAddressChanged:];
}

id objc_msgSend_bluetoothConnectionEventCounterValue(void *a1, const char *a2, ...)
{
  return _[a1 bluetoothConnectionEventCounterValue];
}

id objc_msgSend_bluetoothDeviceIdentifier(void *a1, const char *a2, ...)
{
  return _[a1 bluetoothDeviceIdentifier];
}

id objc_msgSend_bluetoothDidChangeState_(void *a1, const char *a2, ...)
{
  return [_objc_msgSend(a1, "bluetoothDidChangeState:");
}

id objc_msgSend_bluetoothDiscoveryBecameAvailable(void *a1, const char *a2, ...)
{
  return _[a1 bluetoothDiscoveryBecameAvailable];
}

id objc_msgSend_bluetoothDiscoveryBecameUnavailable(void *a1, const char *a2, ...)
{
  return _[a1 bluetoothDiscoveryBecameUnavailable];
}

id objc_msgSend_bluetoothDiscoveryFinishedActivating(void *a1, const char *a2, ...)
{
  return _[a1 bluetoothDiscoveryFinishedActivating];
}

id objc_msgSend_bluetoothPeerIdentifier(void *a1, const char *a2, ...)
{
  return _[a1 bluetoothPeerIdentifier];
}

id objc_msgSend_bluetoothServiceInterrupted(void *a1, const char *a2, ...)
{
  return _[a1 bluetoothServiceInterrupted];
}

id objc_msgSend_bluetoothState(void *a1, const char *a2, ...)
{
  return _[a1 bluetoothState];
}

id objc_msgSend_bluetoothStateChanged(void *a1, const char *a2, ...)
{
  return _[a1 bluetoothStateChanged];
}

id objc_msgSend_BOOLForKey_(void *a1, const char *a2, ...)
{
  return [a1 BOOLForKey:];
}

id objc_msgSend_BOOLValue(void *a1, const char *a2, ...)
{
  return _[a1 BOOLValue];
}

id objc_msgSend_boundedRegionRange(void *a1, const char *a2, ...)
{
  return _[a1 boundedRegionRange];
}

id objc_msgSend_btAddressData(void *a1, const char *a2, ...)
{
  return _[a1 btAddressData];
}

id objc_msgSend_btAdvAddress(void *a1, const char *a2, ...)
{
  return _[a1 btAdvAddress];
}

id objc_msgSend_btAdvertisingAddress(void *a1, const char *a2, ...)
{
  return _[a1 btAdvertisingAddress];
}

id objc_msgSend_btResource(void *a1, const char *a2, ...)
{
  return _[a1 btResource];
}

id objc_msgSend_bundle(void *a1, const char *a2, ...)
{
  return _[a1 bundle];
}

id objc_msgSend_bundleIdentifier(void *a1, const char *a2, ...)
{
  return _[a1 bundleIdentifier];
}

id objc_msgSend_bundleInfoValueForKey_(void *a1, const char *a2, ...)
{
  return [a1 bundleInfoValueForKey:];
}

id objc_msgSend_bundleName(void *a1, const char *a2, ...)
{
  return _[a1 bundleName];
}

id objc_msgSend_bundleRecordForAuditToken_error_(void *a1, const char *a2, ...)
{
  return [_objc_msgSend(a1, "bundleRecordForAuditToken:error:");
}

id objc_msgSend_bundleWithIdentifier_(void *a1, const char *a2, ...)
{
  return [a1 bundleWithIdentifier:];
}

id objc_msgSend_bundleWithPath_(void *a1, const char *a2, ...)
{
  return [a1 bundleWithPath:];
}

id objc_msgSend_bundleWithURL_(void *a1, const char *a2, ...)
{
  return [a1 bundleWithURL:];
}

id objc_msgSend_byteRepresentation(void *a1, const char *a2, ...)
{
  return _[a1 byteRepresentation];
}

id objc_msgSend_bytes(void *a1, const char *a2, ...)
{
  return _[a1 bytes];
}

id objc_msgSend_cStringUsingEncoding_(void *a1, const char *a2, ...)
{
  return [a1 cStringUsingEncoding:];
}

id objc_msgSend_cacheCharacteristics(void *a1, const char *a2, ...)
{
  return _[a1 cacheCharacteristics];
}

id objc_msgSend_cacheDevice_(void *a1, const char *a2, ...)
{
  return [a1 cacheDevice:];
}

id objc_msgSend_cachedConfigCharacteristics(void *a1, const char *a2, ...)
{
  return _[a1 cachedConfigCharacteristics];
}

id objc_msgSend_cachedPlatformCapabilities(void *a1, const char *a2, ...)
{
  return _[a1 cachedPlatformCapabilities];
}

id objc_msgSend_camera(void *a1, const char *a2, ...)
{
  return _[a1 camera];
}

id objc_msgSend_canHandleAcwgMsg_(void *a1, const char *a2, ...)
{
  return [a1 canHandleAcwgMsg:];
}

id objc_msgSend_canInteract(void *a1, const char *a2, ...)
{
  return _[a1 canInteract];
}

id objc_msgSend_canRange(void *a1, const char *a2, ...)
{
  return _[a1 canRange];
}

id objc_msgSend_canRangeWithPeer_technology_(void *a1, const char *a2, ...)
{
  return [a1 canRangeWithPeer:technology:];
}

id objc_msgSend_canUpdateToConfiguration_(void *a1, const char *a2, ...)
{
  return [a1 canUpdateToConfiguration:];
}

id objc_msgSend_cancelAllOperations(void *a1, const char *a2, ...)
{
  return _[a1 cancelAllOperations];
}

id objc_msgSend_cancelPeripheralConnection_(void *a1, const char *a2, ...)
{
  return [a1 cancelPeripheralConnection:];
}

id objc_msgSend_carKeyRangingLimitExceeded(void *a1, const char *a2, ...)
{
  return _[a1 carKeyRangingLimitExceeded];
}

id objc_msgSend_cbDevice(void *a1, const char *a2, ...)
{
  return _[a1 cbDevice];
}

id objc_msgSend_changeConnectionState_(void *a1, const char *a2, ...)
{
  return [a1 changeConnectionState:];
}

id objc_msgSend_channel(void *a1, const char *a2, ...)
{
  return _[a1 channel];
}

id objc_msgSend_characteristics(void *a1, const char *a2, ...)
{
  return _[a1 characteristics];
}

id objc_msgSend_checkCirsValid_(void *a1, const char *a2, ...)
{
  return [a1 checkCirsValid:];
}

id objc_msgSend_checkCurrentAudioRoute(void *a1, const char *a2, ...)
{
  return _[a1 checkCurrentAudioRoute];
}

id objc_msgSend_checkForUnlockSinceBoot(void *a1, const char *a2, ...)
{
  return _[a1 checkForUnlockSinceBoot];
}

id objc_msgSend_checkInForActivityWithCriteria_identifier_(void *a1, const char *a2, ...)
{
  return [a1 checkInForActivityWithCriteria:identifier];
}

id objc_msgSend_cirPacket1(void *a1, const char *a2, ...)
{
  return _[a1 cirPacket1];
}

id objc_msgSend_cirPacket2(void *a1, const char *a2, ...)
{
  return _[a1 cirPacket2];
}

id objc_msgSend_cleanupPowerState(void *a1, const char *a2, ...)
{
  return _[a1 cleanupPowerState];
}

id objc_msgSend_cleanupRangingManagerAndCompanionAfterError_(void *a1, const char *a2, ...)
{
  return [_objc_msgSend(a1, "cleanupRangingManagerAndCompanionAfterError:");
}

id objc_msgSend_clearLogs_forSEID_(void *a1, const char *a2, ...)
{
  return [_objc_msgSend(a1, "clearLogs:forSEID:");
}

id objc_msgSend_clearStateForPid_(void *a1, const char *a2, ...)
{
  return [a1 clearStateForPid:];
}

id objc_msgSend_clearStateForToken_(void *a1, const char *a2, ...)
{
  return [a1 clearStateForToken:];
}

id objc_msgSend_clearWifiRangingActiveAdvertisement(void *a1, const char *a2, ...)
{
  return _[a1 clearWifiRangingActiveAdvertisement];
}

id objc_msgSend_clientAuditToken(void *a1, const char *a2, ...)
{
  return _[a1 clientAuditToken];
}

id objc_msgSend_clientConnectionQueue(void *a1, const char *a2, ...)
{
  return _[a1 clientConnectionQueue];
}

id objc_msgSend_clientIdentifierData(void *a1, const char *a2, ...)
{
  return _[a1 clientIdentifierData];
}

id objc_msgSend_clientInfo(void *a1, const char *a2, ...)
{
  return _[a1 clientInfo];
}

id objc_msgSend_clientIrkData(void *a1, const char *a2, ...)
{
  return _[a1 clientIrkData];
}

id objc_msgSend_clientPid(void *a1, const char *a2, ...)
{
  return _[a1 clientPid];
}

id objc_msgSend_clientProcessNameBestGuess(void *a1, const char *a2, ...)
{
  return _[a1 clientProcessNameBestGuess];
}

id objc_msgSend_clientProcessSigningIdentity(void *a1, const char *a2, ...)
{
  return _[a1 clientProcessSigningIdentity];
}

id objc_msgSend_clientQueue(void *a1, const char *a2, ...)
{
  return _[a1 clientQueue];
}

id objc_msgSend_clientWantsUpdates(void *a1, const char *a2, ...)
{
  return _[a1 clientWantsUpdates];
}

id objc_msgSend_clientWithIdentifier_notifiedPassiveAccessIntent_(void *a1, const char *a2, ...)
{
  return [a1 clientWithIdentifier:x0 notifiedPassiveAccessIntent:x1];
}

id objc_msgSend_clientWithIdentifier_notifiedResourceUsageLimitExceeded_forSessionConfigurationType_(void *a1, const char *a2, ...)
{
  return [a1 clientWithIdentifier:x0 notifiedResourceUsageLimitExceeded:x1 forSessionConfigurationType:x2];
}

id objc_msgSend_clientWithIdentifier_requestedPrewarmUWB_prewarmSecureElementChannel_(void *a1, const char *a2, ...)
{
  return [a1 clientWithIdentifier:requestedPrewarmUWB:prewarmSecureElementChannel:];
}

id objc_msgSend_clientWithIdentifier_updatedStateToRunning_dueToTimeout_(void *a1, const char *a2, ...)
{
  return [a1 clientWithIdentifier:x0 updatedStateToRunning:x1 dueToTimeout:x2];
}

id objc_msgSend_coarseEstimation(void *a1, const char *a2, ...)
{
  return _[a1 coarseEstimation];
}

id objc_msgSend_code(void *a1, const char *a2, ...)
{
  return _[a1 code];
}

id objc_msgSend_combineAndReportLocalAndCompanionRangingRequestStatus(void *a1, const char *a2, ...)
{
  return _[a1 combineAndReportLocalAndCompanionRangingRequestStatus];
}

id objc_msgSend_commitChange(void *a1, const char *a2, ...)
{
  return _[a1 commitChange];
}

id objc_msgSend_components_fromDate_(void *a1, const char *a2, ...)
{
  return [a1 components:fromDate:];
}

id objc_msgSend_componentsSeparatedByString_(void *a1, const char *a2, ...)
{
  return [a1 componentsSeparatedByString:];
}

id objc_msgSend_componentsWithString_(void *a1, const char *a2, ...)
{
  return [a1 componentsWithString:];
}

id objc_msgSend_confidence(void *a1, const char *a2, ...)
{
  return _[a1 confidence];
}

id objc_msgSend_configType(void *a1, const char *a2, ...)
{
  return _[a1 configType];
}

id objc_msgSend_configuration(void *a1, const char *a2, ...)
{
  return _[a1 configuration];
}

id objc_msgSend_configurationForContainerObjects(void *a1, const char *a2, ...)
{
  return _[a1 configurationForContainerObjects];
}

id objc_msgSend_configurationForDefaultMainDisplayMonitor(void *a1, const char *a2, ...)
{
  return _[a1 configurationForDefaultMainDisplayMonitor];
}

id objc_msgSend_configurationType(void *a1, const char *a2, ...)
{
  return _[a1 configurationType];
}

id objc_msgSend_configure(void *a1, const char *a2, ...)
{
  return _[a1 configure];
}

id objc_msgSend_configure_(void *a1, const char *a2, ...)
{
  return [a1 configure:];
}

id objc_msgSend_configureBTMaxRateScanningForPrototypeHomeSession(void *a1, const char *a2, ...)
{
  return _[a1 configureBTMaxRateScanningForPrototypeHomeSession];
}

id objc_msgSend_configureCBDiscovery(void *a1, const char *a2, ...)
{
  return _[a1 configureCBDiscovery];
}

id objc_msgSend_configureCBDiscoveryAirPodsLeech(void *a1, const char *a2, ...)
{
  return _[a1 configureCBDiscoveryAirPodsLeech];
}

id objc_msgSend_configureCBDiscoveryScreenOff(void *a1, const char *a2, ...)
{
  return _[a1 configureCBDiscoveryScreenOff];
}

id objc_msgSend_configureCompanionForRanging(void *a1, const char *a2, ...)
{
  return _[a1 configureCompanionForRanging];
}

id objc_msgSend_configureRangingOnDevice_macAddress_countryCode_uwbChannel_acqPreamble_trackingPreamble_interval_(void *a1, const char *a2, ...)
{
  return [_objc_msgSend(a1, "configureRangingOnDevice:macAddress:countryCode:uwbChannel:acqPreamble:trackingPreamble:interval:");
}

id objc_msgSend_configureWithResourceFileHandler_(void *a1, const char *a2, ...)
{
  return [a1 configureWithResourceFileHandler:];
}

id objc_msgSend_connect(void *a1, const char *a2, ...)
{
  return _[a1 connect];
}

id objc_msgSend_connectDevice_(void *a1, const char *a2, ...)
{
  return [a1 connectDevice:];
}

id objc_msgSend_connectPeripheral_options_(void *a1, const char *a2, ...)
{
  return [a1 connectPeripheral:options:];
}

id objc_msgSend_connectedAccessories(void *a1, const char *a2, ...)
{
  return _[a1 connectedAccessories];
}

id objc_msgSend_connection(void *a1, const char *a2, ...)
{
  return _[a1 connection];
}

id objc_msgSend_connectionQueue(void *a1, const char *a2, ...)
{
  return _[a1 connectionQueue];
}

id objc_msgSend_connectionState(void *a1, const char *a2, ...)
{
  return _[a1 connectionState];
}

id objc_msgSend_consumeBluetoothSample_(void *a1, const char *a2, ...)
{
  return [a1 consumeBluetoothSample:];
}

id objc_msgSend_consumeInputFeatures_(void *a1, const char *a2, ...)
{
  return [a1 consumeInputFeatures:];
}

id objc_msgSend_consumeProtobufBytes_(void *a1, const char *a2, ...)
{
  return [a1 consumeProtobufBytes:];
}

id objc_msgSend_containsObject_(void *a1, const char *a2, ...)
{
  return [a1 containsObject:];
}

id objc_msgSend_containsString_(void *a1, const char *a2, ...)
{
  return [a1 containsString:];
}

id objc_msgSend_containsValueForKey_(void *a1, const char *a2, ...)
{
  return [a1 containsValueForKey:];
}

id objc_msgSend_contentsOfDirectoryAtPath_error_(void *a1, const char *a2, ...)
{
  return [a1 contentsOfDirectoryAtPath:error:];
}

id objc_msgSend_controlFlags(void *a1, const char *a2, ...)
{
  return _[a1 controlFlags];
}

id objc_msgSend_convergence(void *a1, const char *a2, ...)
{
  return _[a1 convergence];
}

id objc_msgSend_convergenceStatus(void *a1, const char *a2, ...)
{
  return _[a1 convergenceStatus];
}

id objc_msgSend_convertCBAddressToRoseAddress_(void *a1, const char *a2, ...)
{
  return [a1 convertCBAddressToRoseAddress:];
}

id objc_msgSend_convertToString_(void *a1, const char *a2, ...)
{
  return [a1 convertToString:];
}

id objc_msgSend_coordinate(void *a1, const char *a2, ...)
{
  return _[a1 coordinate];
}

id objc_msgSend_copy(void *a1, const char *a2, ...)
{
  return _[a1 copy];
}

id objc_msgSend_copyCellInfo_completion_(void *a1, const char *a2, ...)
{
  return [a1 copyCellInfo:x0, x1];
}

id objc_msgSend_copyLastKnownMobileCountryCode_error_(void *a1, const char *a2, ...)
{
  return [a1 copyLastKnownMobileCountryCode:error];
}

id objc_msgSend_copyMobileCountryCode_error_(void *a1, const char *a2, ...)
{
  return [a1 copyMobileCountryCode:error];
}

id objc_msgSend_copyWithZone_(void *a1, const char *a2, ...)
{
  return [a1 copyWithZone:];
}

id objc_msgSend_correctedRange(void *a1, const char *a2, ...)
{
  return _[a1 correctedRange];
}

id objc_msgSend_count(void *a1, const char *a2, ...)
{
  return _[a1 count];
}

id objc_msgSend_countByEnumeratingWithState_objects_count_(void *a1, const char *a2, ...)
{
  return [_objc_msgSend(a1, "countByEnumeratingWithState:objects:count:")
}

id objc_msgSend_course(void *a1, const char *a2, ...)
{
  return _[a1 course];
}

id objc_msgSend_courseAccuracy(void *a1, const char *a2, ...)
{
  return _[a1 courseAccuracy];
}

id objc_msgSend_createAndPopulateBiasEstimatorInput_ofDimension_(void *a1, const char *a2, ...)
{
  return [_objc_msgSend(a1, "createAndPopulateBiasEstimatorInput:ofDimension:");
}

id objc_msgSend_createBeaconListenerJob_(void *a1, const char *a2, ...)
{
  return [a1 createBeaconListenerJob:];
}

id objc_msgSend_createFileAtPath_contents_attributes_(void *a1, const char *a2, ...)
{
  return [a1 createFileAtPath:x0 contents:x1 attributes:x2];
}

id objc_msgSend_createOneShotConnectionAndResume_(void *a1, const char *a2, ...)
{
  return [a1 createOneShotConnectionAndResume:];
}

id objc_msgSend_createServices(void *a1, const char *a2, ...)
{
  return _[a1 createServices];
}

id objc_msgSend_createWithBluetoothConnectionEventCounterValue_(void *a1, const char *a2, ...)
{
  return [a1 createWithBluetoothConnectionEventCounterValue:];
}

id objc_msgSend_currentAppState(void *a1, const char *a2, ...)
{
  return _[a1 currentAppState];
}

id objc_msgSend_currentCadence(void *a1, const char *a2, ...)
{
  return _[a1 currentCadence];
}

id objc_msgSend_currentCalendar(void *a1, const char *a2, ...)
{
  return _[a1 currentCalendar];
}

id objc_msgSend_currentConnection(void *a1, const char *a2, ...)
{
  return _[a1 currentConnection];
}

id objc_msgSend_currentHandler(void *a1, const char *a2, ...)
{
  return _[a1 currentHandler];
}

id objc_msgSend_currentPace(void *a1, const char *a2, ...)
{
  return _[a1 currentPace];
}

id objc_msgSend_currentPeerCount(void *a1, const char *a2, ...)
{
  return _[a1 currentPeerCount];
}

id objc_msgSend_currentPeers(void *a1, const char *a2, ...)
{
  return _[a1 currentPeers];
}

id objc_msgSend_currentRoute(void *a1, const char *a2, ...)
{
  return _[a1 currentRoute];
}

id objc_msgSend_currentRunLoop(void *a1, const char *a2, ...)
{
  return _[a1 currentRunLoop];
}

id objc_msgSend_currentServiceState(void *a1, const char *a2, ...)
{
  return _[a1 currentServiceState];
}

id objc_msgSend_cycling(void *a1, const char *a2, ...)
{
  return _[a1 cycling];
}

id objc_msgSend_daemonJobLabel(void *a1, const char *a2, ...)
{
  return _[a1 daemonJobLabel];
}

id objc_msgSend_data(void *a1, const char *a2, ...)
{
  return _[a1 data];
}

id objc_msgSend_dataExchangeDisabledAndUsingParameterOverrides(void *a1, const char *a2, ...)
{
  return _[a1 dataExchangeDisabledAndUsingParameterOverrides];
}

id objc_msgSend_dataUsingEncoding_(void *a1, const char *a2, ...)
{
  return [a1 dataUsingEncoding:];
}

id objc_msgSend_dataWithBytes_length_(void *a1, const char *a2, ...)
{
  return [a1 dataWithBytes:];
}

id objc_msgSend_dataWithBytesNoCopy_length_freeWhenDone_(void *a1, const char *a2, ...)
{
  return [a1 dataWithBytesNoCopy:x0 length:x1 freeWhenDone:x2];
}

id objc_msgSend_dataWithCapacity_(void *a1, const char *a2, ...)
{
  return [a1 dataWithCapacity:];
}

id objc_msgSend_dataWithContentsOfFile_options_error_(void *a1, const char *a2, ...)
{
  return [a1 dataWithContentsOfFile:x0 options:x1 error:x2];
}

id objc_msgSend_dataWithJSONObject_options_error_(void *a1, const char *a2, ...)
{
  return [a1 dataWithJSONObject:x0 options:x1 error:x2];
}

id objc_msgSend_dataWithPropertyList_format_options_error_(void *a1, const char *a2, ...)
{
  return [a1 dataWithPropertyList:x0 format:x1 options:x2 error:x3];
}

id objc_msgSend_date(void *a1, const char *a2, ...)
{
  return _[a1 date];
}

id objc_msgSend_debugDisplayInfo(void *a1, const char *a2, ...)
{
  return _[a1 debugDisplayInfo];
}

id objc_msgSend_debugOptions(void *a1, const char *a2, ...)
{
  return _[a1 debugOptions];
}

id objc_msgSend_debugParameters(void *a1, const char *a2, ...)
{
  return _[a1 debugParameters];
}

id objc_msgSend_decodeArrayOfObjectsOfClass_forKey_(void *a1, const char *a2, ...)
{
  return [_objc_msgSend(a1, "decodeArrayOfObjectsOfClass:forKey:");
}

id objc_msgSend_decodeBoolForKey_(void *a1, const char *a2, ...)
{
  return [a1 decodeBoolForKey:];
}

id objc_msgSend_decodeDictionaryWithKeysOfClasses_objectsOfClasses_forKey_(void *a1, const char *a2, ...)
{
  return [_objc_msgSend(a1, "decodeDictionaryWithKeysOfClasses:objectsOfClasses:forKey:");
}

id objc_msgSend_decodeDoubleForKey_(void *a1, const char *a2, ...)
{
  return [a1 decodeDoubleForKey:];
}

id objc_msgSend_decodeFloatForKey_(void *a1, const char *a2, ...)
{
  return [a1 decodeFloatForKey:];
}

id objc_msgSend_decodeInt64ForKey_(void *a1, const char *a2, ...)
{
  return [a1 decodeInt64ForKey:];
}

id objc_msgSend_decodeIntForKey_(void *a1, const char *a2, ...)
{
  return [a1 decodeIntForKey:];
}

id objc_msgSend_decodeIntegerForKey_(void *a1, const char *a2, ...)
{
  return [a1 decodeIntegerForKey:];
}

id objc_msgSend_decodeMatrix4x4ForKey_(void *a1, const char *a2, ...)
{
  return [a1 decodeMatrix4x4ForKey:];
}

id objc_msgSend_decodeObjectOfClass_forKey_(void *a1, const char *a2, ...)
{
  return [_objc_msgSend(a1, "decodeObjectOfClass:forKey:");
}

id objc_msgSend_decodeObjectOfClasses_forKey_(void *a1, const char *a2, ...)
{
  return [a1 decodeObjectOfClasses:forKey:];
}

id objc_msgSend_decodeQuatForKey_(void *a1, const char *a2, ...)
{
  return [a1 decodeQuatForKey:];
}

id objc_msgSend_decodeVector3ForKey_(void *a1, const char *a2, ...)
{
  return [a1 decodeVector3ForKey:];
}

id objc_msgSend_decrypt_(void *a1, const char *a2, ...)
{
  return [a1 decrypt:];
}

id objc_msgSend_defaultCStringEncoding(void *a1, const char *a2, ...)
{
  return _[a1 defaultCStringEncoding];
}

id objc_msgSend_defaultCenter(void *a1, const char *a2, ...)
{
  return _[a1 defaultCenter];
}

id objc_msgSend_defaultManager(void *a1, const char *a2, ...)
{
  return _[a1 defaultManager];
}

id objc_msgSend_defaultWorkspace(void *a1, const char *a2, ...)
{
  return _[a1 defaultWorkspace];
}

id objc_msgSend_deinitCompanion(void *a1, const char *a2, ...)
{
  return _[a1 deinitCompanion];
}

id objc_msgSend_deinitRangingOnDevice_(void *a1, const char *a2, ...)
{
  return [a1 deinitRangingOnDevice:];
}

id objc_msgSend_delegate(void *a1, const char *a2, ...)
{
  return _[a1 delegate];
}

id objc_msgSend_delegateProxyWithConnection_(void *a1, const char *a2, ...)
{
  return [_objc_msgSend(a1, "delegateProxyWithConnection:");
}

id objc_msgSend_deleteAllItemsWithService_synchronizable_systemKeychain_(void *a1, const char *a2, ...)
{
  return [a1 deleteAllItemsWithService:synchronizable:systemKeychain:];
}

id objc_msgSend_deleteItemWithService_account_synchronizable_systemKeychain_(void *a1, const char *a2, ...)
{
  return [a1 deleteItemWithService:x0 account:x1 synchronizable:x2 systemKeychain:x3];
}

id objc_msgSend_deleteURSKs(void *a1, const char *a2, ...)
{
  return _[a1 deleteURSKs];
}

id objc_msgSend_deleteURSKs_(void *a1, const char *a2, ...)
{
  return [a1 deleteURSKs:];
}

id objc_msgSend_deltaPositionX(void *a1, const char *a2, ...)
{
  return _[a1 deltaPositionX];
}

id objc_msgSend_deltaPositionY(void *a1, const char *a2, ...)
{
  return _[a1 deltaPositionY];
}

id objc_msgSend_deltaPositionZ(void *a1, const char *a2, ...)
{
  return _[a1 deltaPositionZ];
}

id objc_msgSend_deltaVelocityX(void *a1, const char *a2, ...)
{
  return _[a1 deltaVelocityX];
}

id objc_msgSend_deltaVelocityY(void *a1, const char *a2, ...)
{
  return _[a1 deltaVelocityY];
}

id objc_msgSend_deltaVelocityZ(void *a1, const char *a2, ...)
{
  return _[a1 deltaVelocityZ];
}

id objc_msgSend_deregisterTaskWithIdentifier_(void *a1, const char *a2, ...)
{
  return [a1 deregisterTaskWithIdentifier:];
}

id objc_msgSend_description(void *a1, const char *a2, ...)
{
  return _[a1 description];
}

id objc_msgSend_descriptionInternal(void *a1, const char *a2, ...)
{
  return _[a1 descriptionInternal];
}

id objc_msgSend_descriptions(void *a1, const char *a2, ...)
{
  return _[a1 descriptions];
}

id objc_msgSend_descriptor(void *a1, const char *a2, ...)
{
  return _[a1 descriptor];
}

id objc_msgSend_deserialize_(void *a1, const char *a2, ...)
{
  return [a1 deserialize:];
}

id objc_msgSend_destinationDevice(void *a1, const char *a2, ...)
{
  return _[a1 destinationDevice];
}

id objc_msgSend_device_rediscovered_(void *a1, const char *a2, ...)
{
  return [a1 device:rediscovered:];
}

id objc_msgSend_deviceCache(void *a1, const char *a2, ...)
{
  return _[a1 deviceCache];
}

id objc_msgSend_deviceCapabilities(void *a1, const char *a2, ...)
{
  return _[a1 deviceCapabilities];
}

id objc_msgSend_deviceDiscovered_(void *a1, const char *a2, ...)
{
  return [a1 deviceDiscovered:];
}

id objc_msgSend_deviceFlags(void *a1, const char *a2, ...)
{
  return _[a1 deviceFlags];
}

id objc_msgSend_deviceForIdentifier_(void *a1, const char *a2, ...)
{
  return [a1 deviceForIdentifier:];
}

id objc_msgSend_deviceForTokenData_(void *a1, const char *a2, ...)
{
  return [a1 deviceForTokenData:];
}

id objc_msgSend_deviceHasUnlockedSinceBoot(void *a1, const char *a2, ...)
{
  return _[a1 deviceHasUnlockedSinceBoot];
}

id objc_msgSend_deviceIdentifer(void *a1, const char *a2, ...)
{
  return _[a1 deviceIdentifer];
}

id objc_msgSend_deviceIdentifier(void *a1, const char *a2, ...)
{
  return _[a1 deviceIdentifier];
}

id objc_msgSend_deviceLost_(void *a1, const char *a2, ...)
{
  return [a1 deviceLost:];
}

id objc_msgSend_devicePose(void *a1, const char *a2, ...)
{
  return _[a1 devicePose];
}

id objc_msgSend_devicePresencePreset(void *a1, const char *a2, ...)
{
  return _[a1 devicePresencePreset];
}

id objc_msgSend_devicePresenceResource(void *a1, const char *a2, ...)
{
  return _[a1 devicePresenceResource];
}

id objc_msgSend_deviceType(void *a1, const char *a2, ...)
{
  return _[a1 deviceType];
}

id objc_msgSend_dictionary(void *a1, const char *a2, ...)
{
  return _[a1 dictionary];
}

id objc_msgSend_dictionaryForKey_(void *a1, const char *a2, ...)
{
  return [a1 dictionaryForKey:];
}

id objc_msgSend_dictionaryRepresentation(void *a1, const char *a2, ...)
{
  return _[a1 dictionaryRepresentation];
}

id objc_msgSend_dictionaryWithContentsOfURL_(void *a1, const char *a2, ...)
{
  return [a1 dictionaryWithContentsOfURL:];
}

id objc_msgSend_dictionaryWithDictionary_(void *a1, const char *a2, ...)
{
  return [a1 dictionaryWithDictionary:];
}

id objc_msgSend_dictionaryWithObjects_forKeys_count_(void *a1, const char *a2, ...)
{
  return [a1 dictionaryWithObjects:forKeys:count:];
}

id objc_msgSend_didAttemptRangingWithPeer_unsuccessfulSolution_(void *a1, const char *a2, ...)
{
  return [_objc_msgSend(a1, "didAttemptRangingWithPeer:unsuccessfulSolution:")];
}

id objc_msgSend_didChangeValueForKey_(void *a1, const char *a2, ...)
{
  return [a1 didChangeValueForKey:];
}

id objc_msgSend_didConnectDevice_error_(void *a1, const char *a2, ...)
{
  return [a1 didConnectDevice:error];
}

id objc_msgSend_didDiscoverDevice_(void *a1, const char *a2, ...)
{
  return [a1 didDiscoverDevice:];
}

id objc_msgSend_didDiscoverNearbyObject_(void *a1, const char *a2, ...)
{
  return [a1 didDiscoverNearbyObject:];
}

id objc_msgSend_didDiscoverPeer_advertisement_overBluetooth_(void *a1, const char *a2, ...)
{
  return [a1 didDiscoverPeer:advertisement:overBluetooth:];
}

id objc_msgSend_didDiscoverSample_(void *a1, const char *a2, ...)
{
  return [a1 didDiscoverSample:];
}

id objc_msgSend_didFailWithError_(void *a1, const char *a2, ...)
{
  return [a1 didFailWithError:];
}

id objc_msgSend_didFailWithErrorCode_errorString_(void *a1, const char *a2, ...)
{
  return [a1 didFailWithErrorCode:errorCode errorString:errorString];
}

id objc_msgSend_didFetchTxPower_fromDevice_withError_(void *a1, const char *a2, ...)
{
  return [_objc_msgSend(a1, "didFetchTxPower:fromDevice:withError:")];
}

id objc_msgSend_didFinishActivatingWithDiscoveryTokenData_error_(void *a1, const char *a2, ...)
{
  return [_objc_msgSend(a1, "didFinishActivatingWithDiscoveryTokenData:error:");
}

id objc_msgSend_didGenerateAdvertisement_toSendOOBToPeer_(void *a1, const char *a2, ...)
{
  return [_objc_msgSend(a1, "didGenerateAdvertisement:toSendOOBToPeer:");
}

id objc_msgSend_didGenerateShareableConfigurationData_forObject_(void *a1, const char *a2, ...)
{
  return [_objc_msgSend(a1, "didGenerateShareableConfigurationData:forObject:");
}

id objc_msgSend_didGenerateShareableConfigurationData_forToken_(void *a1, const char *a2, ...)
{
  return [a1 didGenerateShareableConfigurationData:forToken:];
}

id objc_msgSend_didInvalidateUWBSession(void *a1, const char *a2, ...)
{
  return _[a1 didInvalidateUWBSession];
}

id objc_msgSend_didLoseDevice_(void *a1, const char *a2, ...)
{
  return [a1 didLoseDevice:];
}

id objc_msgSend_didLosePeer_(void *a1, const char *a2, ...)
{
  return [a1 didLosePeer:];
}

id objc_msgSend_didPrefetchAcwgUrsk_error_(void *a1, const char *a2, ...)
{
  return [_objc_msgSend(a1, "didPrefetchAcwgUrsk:error:");
}

id objc_msgSend_didProcessAcwgM1MsgWithResponse_error_(void *a1, const char *a2, ...)
{
  return [_objc_msgSend(a1, "didProcessAcwgM1MsgWithResponse:error:")
}

id objc_msgSend_didProcessAcwgM3MsgWithResponse_error_(void *a1, const char *a2, ...)
{
  return [_objc_msgSend(a1, "didProcessAcwgM3MsgWithResponse:error:");
}

id objc_msgSend_didProcessAcwgRangingSessionResumeRequestMsgWithResponse_error_(void *a1, const char *a2, ...)
{
  return [_objc_msgSend(a1, "didProcessAcwgRangingSessionResumeRequestMsgWithResponse:error:");
}

id objc_msgSend_didRangeWithPeer_newSolution_(void *a1, const char *a2, ...)
{
  return [a1 didRangeWithPeer:newSolution:];
}

id objc_msgSend_didRangingAuthorizationFailForPeer_(void *a1, const char *a2, ...)
{
  return [a1 didRangingAuthorizationFailForPeer:];
}

id objc_msgSend_didReceiveAopSensorFusionUpdate_withBtConnHandle_(void *a1, const char *a2, ...)
{
  return [a1 didReceiveAopSensorFusionUpdate:withBtConnHandle:];
}

id objc_msgSend_didReceiveMagnetometerData_at_(void *a1, const char *a2, ...)
{
  return [_objc_msgSend(a1, "didReceiveMagnetometerData:at:");
}

id objc_msgSend_didReceiveNewBTRSSI_(void *a1, const char *a2, ...)
{
  return [a1 didReceiveNewBTRSSI:];
}

id objc_msgSend_didReceiveNewSolution_(void *a1, const char *a2, ...)
{
  return [a1 didReceiveNewSolution:];
}

id objc_msgSend_didReceiveNewSolutions_(void *a1, const char *a2, ...)
{
  return [a1 didReceiveNewSolutions:];
}

id objc_msgSend_didReceiveRangingAuthRecommendation_forObject_(void *a1, const char *a2, ...)
{
  return [_objc_msgSend(a1, "didReceiveRangingAuthRecommendation:forObject:");
}

id objc_msgSend_didReceiveRangingDataForPeer_algorithmAidingData_signallingData_(void *a1, const char *a2, ...)
{
  return [_objc_msgSend(a1, "didReceiveRangingDataForPeer:algorithmAidingData:signallingData:");
}

id objc_msgSend_didReceiveRemoteData_(void *a1, const char *a2, ...)
{
  return [a1 didReceiveRemoteData:];
}

id objc_msgSend_didReceiveSessionStartNotification_(void *a1, const char *a2, ...)
{
  return [a1 didReceiveSessionStartNotification:];
}

id objc_msgSend_didReceiveUnsuccessfulSolution_(void *a1, const char *a2, ...)
{
  return [a1 didReceiveUnsuccessfulSolution:];
}

id objc_msgSend_didRemoveNearbyObjects_withReason_(void *a1, const char *a2, ...)
{
  return [a1 didRemoveNearbyObjects:withReason:];
}

id objc_msgSend_didServiceRequestUpdateStatus_(void *a1, const char *a2, ...)
{
  return [a1 didServiceRequestUpdateStatus:];
}

id objc_msgSend_didStartAcwgRanging_(void *a1, const char *a2, ...)
{
  return [a1 didStartAcwgRanging:];
}

id objc_msgSend_didStartRangingOnDevice_withError_(void *a1, const char *a2, ...)
{
  return [a1 didStartRangingOnDevice:withError:];
}

id objc_msgSend_didStopAdvertisingToPeer_(void *a1, const char *a2, ...)
{
  return [a1 didStopAdvertisingToPeer:];
}

id objc_msgSend_didStopOwnerRangingOnDevice_withError_(void *a1, const char *a2, ...)
{
  return [a1 didStopOwnerRangingOnDevice:withError:];
}

id objc_msgSend_didStopRangingWithPeer_(void *a1, const char *a2, ...)
{
  return [a1 didStopRangingWithPeer:];
}

id objc_msgSend_didSuspendAcwgRanging_(void *a1, const char *a2, ...)
{
  return [a1 didSuspendAcwgRanging:];
}

id objc_msgSend_didUpdateAlgorithmState_forObject_(void *a1, const char *a2, ...)
{
  return [_objc_msgSend(a1, "didUpdateAlgorithmState:forObject:")];
}

id objc_msgSend_didUpdateHealthStatus_(void *a1, const char *a2, ...)
{
  return [a1 didUpdateHealthStatus:];
}

id objc_msgSend_didUpdateHomeDeviceUWBRangingAvailability_(void *a1, const char *a2, ...)
{
  return [a1 didUpdateHomeDeviceUWBRangingAvailability:];
}

id objc_msgSend_didUpdateLocalDiscoveryToken_(void *a1, const char *a2, ...)
{
  return [a1 didUpdateLocalDiscoveryToken:];
}

id objc_msgSend_didUpdateMinimumPreferredUpdateRate_(void *a1, const char *a2, ...)
{
  return [_objc_msgSend(a1, "didUpdateMinimumPreferredUpdateRate:");
}

id objc_msgSend_didUpdateMotionState_(void *a1, const char *a2, ...)
{
  return [a1 didUpdateMotionState:];
}

id objc_msgSend_didUpdateNearbyObjects_(void *a1, const char *a2, ...)
{
  return [a1 didUpdateNearbyObjects:];
}

id objc_msgSend_didUpdatePassiveAccessIntent_(void *a1, const char *a2, ...)
{
  return [a1 didUpdatePassiveAccessIntent:];
}

id objc_msgSend_didUpdateResourceUsageLimitExceeded_forSessionConfigurationType_(void *a1, const char *a2, ...)
{
  return [a1 didUpdateResourceUsageLimitExceeded:forSessionConfigurationType:];
}

id objc_msgSend_didUpdateSystemState_(void *a1, const char *a2, ...)
{
  return [a1 didUpdateSystemState:];
}

id objc_msgSend_direction(void *a1, const char *a2, ...)
{
  return _[a1 direction];
}

id objc_msgSend_disableAllServices(void *a1, const char *a2, ...)
{
  return _[a1 disableAllServices];
}

id objc_msgSend_disablePTSInitiating_(void *a1, const char *a2, ...)
{
  return [a1 disablePTSInitiating:];
}

id objc_msgSend_disconnect(void *a1, const char *a2, ...)
{
  return _[a1 disconnect];
}

id objc_msgSend_disconnectDevice_(void *a1, const char *a2, ...)
{
  return [a1 disconnectDevice:];
}

id objc_msgSend_discoverCharacteristics_forService_(void *a1, const char *a2, ...)
{
  return [a1 discoverCharacteristics:forService:];
}

id objc_msgSend_discoverServices_(void *a1, const char *a2, ...)
{
  return [a1 discoverServices:];
}

id objc_msgSend_discoveredDevice_didUpdate_(void *a1, const char *a2, ...)
{
  return [a1 discoveredDevice:didUpdate:];
}

id objc_msgSend_discoveredDevices(void *a1, const char *a2, ...)
{
  return _[a1 discoveredDevices];
}

id objc_msgSend_discoveredPeers(void *a1, const char *a2, ...)
{
  return _[a1 discoveredPeers];
}

id objc_msgSend_discoveryFlags(void *a1, const char *a2, ...)
{
  return _[a1 discoveryFlags];
}

id objc_msgSend_discoveryState(void *a1, const char *a2, ...)
{
  return _[a1 discoveryState];
}

id objc_msgSend_discoveryToken(void *a1, const char *a2, ...)
{
  return _[a1 discoveryToken];
}

id objc_msgSend_discoveryTokenData(void *a1, const char *a2, ...)
{
  return _[a1 discoveryTokenData];
}

id objc_msgSend_discoveryTokenFromIdentifier_(void *a1, const char *a2, ...)
{
  return [a1 discoveryTokenFromIdentifier:];
}

id objc_msgSend_displayBacklightLevel(void *a1, const char *a2, ...)
{
  return _[a1 displayBacklightLevel];
}

id objc_msgSend_displayName(void *a1, const char *a2, ...)
{
  return _[a1 displayName];
}

id objc_msgSend_distance(void *a1, const char *a2, ...)
{
  return _[a1 distance];
}

id objc_msgSend_distanceFromLocation_(void *a1, const char *a2, ...)
{
  return [a1 distanceFromLocation:];
}

id objc_msgSend_distanceMeasurementQuality(void *a1, const char *a2, ...)
{
  return _[a1 distanceMeasurementQuality];
}

id objc_msgSend_distantFuture(void *a1, const char *a2, ...)
{
  return _[a1 distantFuture];
}

id objc_msgSend_doesClientWantSessionToRun(void *a1, const char *a2, ...)
{
  return _[a1 doesClientWantSessionToRun];
}

id objc_msgSend_doesNotRecognizeSelector_(void *a1, const char *a2, ...)
{
  return [a1 doesNotRecognizeSelector:];
}

id objc_msgSend_domain(void *a1, const char *a2, ...)
{
  return _[a1 domain];
}

id objc_msgSend_doubleForKey_(void *a1, const char *a2, ...)
{
  return [a1 doubleForKey:];
}

id objc_msgSend_doubleValue(void *a1, const char *a2, ...)
{
  return _[a1 doubleValue];
}

id objc_msgSend_effectiveIdentifier(void *a1, const char *a2, ...)
{
  return _[a1 effectiveIdentifier];
}

id objc_msgSend_elements(void *a1, const char *a2, ...)
{
  return _[a1 elements];
}

id objc_msgSend_elevation(void *a1, const char *a2, ...)
{
  return _[a1 elevation];
}

id objc_msgSend_ellipsoidalAltitude(void *a1, const char *a2, ...)
{
  return _[a1 ellipsoidalAltitude];
}

id objc_msgSend_embeddedSecureElementWithError_(void *a1, const char *a2, ...)
{
  return [a1 embeddedSecureElementWithError:];
}

id objc_msgSend_enableInternalObserverSession(void *a1, const char *a2, ...)
{
  return _[a1 enableInternalObserverSession];
}

id objc_msgSend_enablePTSInitiating_reply_(void *a1, const char *a2, ...)
{
  return [a1 enablePTSInitiating:reply:];
}

id objc_msgSend_enableRanging_reply_(void *a1, const char *a2, ...)
{
  return [a1 enableRanging:reply:];
}

id objc_msgSend_enableSPMIMessagingWithHandler_(void *a1, const char *a2, ...)
{
  return [a1 enableSPMIMessagingWithHandler:];
}

id objc_msgSend_enabledGestures(void *a1, const char *a2, ...)
{
  return _[a1 enabledGestures];
}

id objc_msgSend_encodeBool_forKey_(void *a1, const char *a2, ...)
{
  return [a1 encodeBool:x0 forKey:x1];
}

id objc_msgSend_encodeDouble_forKey_(void *a1, const char *a2, ...)
{
  return [a1 encodeDouble:x0 forKey:x1];
}

id objc_msgSend_encodeFloat_forKey_(void *a1, const char *a2, ...)
{
  return [a1 encodeFloat:forKey:];
}

id objc_msgSend_encodeInt64_forKey_(void *a1, const char *a2, ...)
{
  return [a1 encodeInt64:forKey:];
}

id objc_msgSend_encodeInt_forKey_(void *a1, const char *a2, ...)
{
  return [a1 encodeInt:forKey:];
}

id objc_msgSend_encodeInteger_forKey_(void *a1, const char *a2, ...)
{
  return [a1 encodeInteger:forKey:];
}

id objc_msgSend_encodeMatrix4x4_forKey_(void *a1, const char *a2, ...)
{
  return [a1 encodeMatrix4x4:forKey:];
}

id objc_msgSend_encodeObject_forKey_(void *a1, const char *a2, ...)
{
  return [_objc_msgSend(a1, "encodeObject:forKey:");
}

id objc_msgSend_encodeQuat_forKey_(void *a1, const char *a2, ...)
{
  return [a1 encodeQuat:forKey:];
}

id objc_msgSend_encodeVector3_forKey_(void *a1, const char *a2, ...)
{
  return [a1 encodeVector3:forKey:];
}

id objc_msgSend_encrypt_(void *a1, const char *a2, ...)
{
  return [a1 encrypt:];
}

id objc_msgSend_end(void *a1, const char *a2, ...)
{
  return _[a1 end];
}

id objc_msgSend_endDate(void *a1, const char *a2, ...)
{
  return _[a1 endDate];
}

id objc_msgSend_endSession(void *a1, const char *a2, ...)
{
  return _[a1 endSession];
}

id objc_msgSend_endowmentNamespaces(void *a1, const char *a2, ...)
{
  return _[a1 endowmentNamespaces];
}

id objc_msgSend_entitlementGranted_(void *a1, const char *a2, ...)
{
  return [a1 entitlementGranted:];
}

id objc_msgSend_entryWithActivityType_(void *a1, const char *a2, ...)
{
  return [a1 entryWithActivityType:];
}

id objc_msgSend_enumerateKeysAndObjectsUsingBlock_(void *a1, const char *a2, ...)
{
  return [a1 enumerateKeysAndObjectsUsingBlock:];
}

id objc_msgSend_enumerateObjectsUsingBlock_(void *a1, const char *a2, ...)
{
  return [a1 enumerateObjectsUsingBlock:];
}

id objc_msgSend_errorWithDomain_code_userInfo_(void *a1, const char *a2, ...)
{
  return [a1 errorWithDomain:code:userInfo:];
}

id objc_msgSend_exportedObjectClass(void *a1, const char *a2, ...)
{
  return _[a1 exportedObjectClass];
}

id objc_msgSend_fOnCellMonitorUpdateCb(void *a1, const char *a2, ...)
{
  return _[a1 fOnCellMonitorUpdateCb];
}

id objc_msgSend_failedToAddPeer(void *a1, const char *a2, ...)
{
  return _[a1 failedToAddPeer];
}

id objc_msgSend_failedToRemovePeer(void *a1, const char *a2, ...)
{
  return _[a1 failedToRemovePeer];
}

id objc_msgSend_fallbackBundle(void *a1, const char *a2, ...)
{
  return _[a1 fallbackBundle];
}

id objc_msgSend_fallbackBundleWithBundle_(void *a1, const char *a2, ...)
{
  return [a1 fallbackBundleWithBundle:];
}

id objc_msgSend_featureValueForName_(void *a1, const char *a2, ...)
{
  return [a1 featureValueForName:];
}

id objc_msgSend_featureValueWithMultiArray_(void *a1, const char *a2, ...)
{
  return [a1 featureValueWithMultiArray:];
}

id objc_msgSend_fetchAndUpdateAirplaneModeStatus(void *a1, const char *a2, ...)
{
  return _[a1 fetchAndUpdateAirplaneModeStatus];
}

id objc_msgSend_fetchPossibleTerritoriesForLocation_responseQueue_responseBlock_(void *a1, const char *a2, ...)
{
  return [a1 fetchPossibleTerritoriesForLocation:x0 responseQueue:x1 responseBlock:x2];
}

id objc_msgSend_fetchTxPowerFromDevice_asOwner_(void *a1, const char *a2, ...)
{
  return [a1 fetchTxPowerFromDevice:asOwner:];
}

id objc_msgSend_fileExistsAtPath_(void *a1, const char *a2, ...)
{
  return [a1 fileExistsAtPath:];
}

id objc_msgSend_fileURLWithPath_(void *a1, const char *a2, ...)
{
  return [a1 fileURLWithPath:];
}

id objc_msgSend_fileURLWithPath_isDirectory_(void *a1, const char *a2, ...)
{
  return [a1 fileURLWithPath:x0 isDirectory:x1];
}

id objc_msgSend_fillNearbyObject_fromRangeResult_(void *a1, const char *a2, ...)
{
  return [_objc_msgSend(a1, "fillNearbyObject:fromRangeResult:");
}

id objc_msgSend_fillNearbyObject_fromSolution_(void *a1, const char *a2, ...)
{
  return [_objc_msgSend(a1, "fillNearbyObject:fromSolution:");
}

id objc_msgSend_filterUsingPredicate_(void *a1, const char *a2, ...)
{
  return [a1 filterUsingPredicate:];
}

id objc_msgSend_findableDiscoveryTokensForGroup_(void *a1, const char *a2, ...)
{
  return [_objc_msgSend(a1, "findableDiscoveryTokensForGroup:");
}

id objc_msgSend_findingConfig(void *a1, const char *a2, ...)
{
  return _[a1 findingConfig];
}

id objc_msgSend_findingConfig2(void *a1, const char *a2, ...)
{
  return _[a1 findingConfig2];
}

id objc_msgSend_findingEnabled(void *a1, const char *a2, ...)
{
  return _[a1 findingEnabled];
}

id objc_msgSend_findingStatus(void *a1, const char *a2, ...)
{
  return _[a1 findingStatus];
}

id objc_msgSend_firstObject(void *a1, const char *a2, ...)
{
  return _[a1 firstObject];
}

id objc_msgSend_firstPathIndexPacket1(void *a1, const char *a2, ...)
{
  return _[a1 firstPathIndexPacket1];
}

id objc_msgSend_firstPathIndexPacket2(void *a1, const char *a2, ...)
{
  return _[a1 firstPathIndexPacket2];
}

id objc_msgSend_flags(void *a1, const char *a2, ...)
{
  return _[a1 flags];
}

id objc_msgSend_floatForKey_(void *a1, const char *a2, ...)
{
  return [a1 floatForKey:];
}

id objc_msgSend_floatValue(void *a1, const char *a2, ...)
{
  return _[a1 floatValue];
}

id objc_msgSend_floor(void *a1, const char *a2, ...)
{
  return _[a1 floor];
}

id objc_msgSend_floorsAscended(void *a1, const char *a2, ...)
{
  return _[a1 floorsAscended];
}

id objc_msgSend_floorsDescended(void *a1, const char *a2, ...)
{
  return _[a1 floorsDescended];
}

id objc_msgSend_fromStruct_(void *a1, const char *a2, ...)
{
  return [a1 fromStruct:];
}

id objc_msgSend_generateDiscoveryToken(void *a1, const char *a2, ...)
{
  return _[a1 generateDiscoveryToken];
}

id objc_msgSend_generateFindingDiscoveryTokenWithSharedSecret_(void *a1, const char *a2, ...)
{
  return [a1 generateFindingDiscoveryTokenWithSharedSecret:];
}

id objc_msgSend_generateFindingTokenWithIRK_(void *a1, const char *a2, ...)
{
  return [a1 generateFindingTokenWithIRK:];
}

id objc_msgSend_getActivelyInteractingDiscoveryTokens_(void *a1, const char *a2, ...)
{
  return [a1 getActivelyInteractingDiscoveryTokens:];
}

id objc_msgSend_getAlgorithmAidingData(void *a1, const char *a2, ...)
{
  return _[a1 getAlgorithmAidingData];
}

id objc_msgSend_getAllDevicesWithArchivedAltAccountDevicesMatching_(void *a1, const char *a2, ...)
{
  return [a1 getAllDevicesWithArchivedAltAccountDevicesMatching:];
}

id objc_msgSend_getBytes_length_(void *a1, const char *a2, ...)
{
  return [a1 getBytes:x0 length:x1];
}

id objc_msgSend_getBytes_range_(void *a1, const char *a2, ...)
{
  return [a1 getBytes:x0 range:x1];
}

id objc_msgSend_getContainerUniqueIdentifier(void *a1, const char *a2, ...)
{
  return _[a1 getContainerUniqueIdentifier];
}

id objc_msgSend_getGnssSatelliteDataVecFromDict_(void *a1, const char *a2, ...)
{
  return [a1 getGnssSatelliteDataVecFromDict:];
}

id objc_msgSend_getIRK(void *a1, const char *a2, ...)
{
  return _[a1 getIRK];
}

id objc_msgSend_getInteractableDiscoveryTokens_(void *a1, const char *a2, ...)
{
  return [a1 getInteractableDiscoveryTokens:];
}

id objc_msgSend_getInternalConnectionQueue(void *a1, const char *a2, ...)
{
  return _[a1 getInternalConnectionQueue];
}

id objc_msgSend_getInternalIdentifier(void *a1, const char *a2, ...)
{
  return _[a1 getInternalIdentifier];
}

id objc_msgSend_getInternalLogObject(void *a1, const char *a2, ...)
{
  return _[a1 getInternalLogObject];
}

id objc_msgSend_getLocalDevicePrintableState_(void *a1, const char *a2, ...)
{
  return [a1 getLocalDevicePrintableState:];
}

id objc_msgSend_getLogs_forSEID_error_(void *a1, const char *a2, ...)
{
  return [a1 getLogs:forSEID:error:];
}

id objc_msgSend_getMostRecentObjectsWithMaxAge_(void *a1, const char *a2, ...)
{
  return [a1 getMostRecentObjectsWithMaxAge:];
}

id objc_msgSend_getNIConfiguration(void *a1, const char *a2, ...)
{
  return _[a1 getNIConfiguration];
}

id objc_msgSend_getNormalizedCirAndPeakMagnitude_(void *a1, const char *a2, ...)
{
  return [a1 getNormalizedCirAndPeakMagnitude:];
}

id objc_msgSend_getNormalizedFftCir_(void *a1, const char *a2, ...)
{
  return [a1 getNormalizedFftCir:];
}

id objc_msgSend_getPeerDataFromFindingContainerWithToken_(void *a1, const char *a2, ...)
{
  return [a1 getPeerDataFromFindingContainerWithToken:];
}

id objc_msgSend_getQueue(void *a1, const char *a2, ...)
{
  return _[a1 getQueue];
}

id objc_msgSend_getQueueForInputingData(void *a1, const char *a2, ...)
{
  return _[a1 getQueueForInputingData];
}

id objc_msgSend_getRangingActive(void *a1, const char *a2, ...)
{
  return _[a1 getRangingActive];
}

id objc_msgSend_getResourcePathWithBundleName_bundleDir_resourceName_resourceExtension_(void *a1, const char *a2, ...)
{
  return [_objc_msgSend(a1, "getResourcePathWithBundleName:bundleDir:resourceName:resourceExtension:");
}

id objc_msgSend_getResourcesManager(void *a1, const char *a2, ...)
{
  return _[a1 getResourcesManager];
}

id objc_msgSend_getSessionIdentifier(void *a1, const char *a2, ...)
{
  return _[a1 getSessionIdentifier];
}

id objc_msgSend_getSignallingData(void *a1, const char *a2, ...)
{
  return _[a1 getSignallingData];
}

id objc_msgSend_getUUIDBytes_(void *a1, const char *a2, ...)
{
  return [a1 getUUIDBytes:];
}

id objc_msgSend_gravity(void *a1, const char *a2, ...)
{
  return _[a1 gravity];
}

id objc_msgSend_handleCBDiscoveryInterrupted(void *a1, const char *a2, ...)
{
  return _[a1 handleCBDiscoveryInterrupted];
}

id objc_msgSend_handleCBDiscoveryStateChanged(void *a1, const char *a2, ...)
{
  return _[a1 handleCBDiscoveryStateChanged];
}

id objc_msgSend_handleCBDiscoverySystemOverride(void *a1, const char *a2, ...)
{
  return _[a1 handleCBDiscoverySystemOverride];
}

id objc_msgSend_handleError_(void *a1, const char *a2, ...)
{
  return [a1 handleError:];
}

id objc_msgSend_handleFailureInFunction_file_lineNumber_description_(void *a1, const char *a2, ...)
{
  return [_objc_msgSend(a1, "handleFailureInFunction:file:lineNumber:description:");
}

id objc_msgSend_handleFailureInMethod_object_file_lineNumber_description_(void *a1, const char *a2, ...)
{
  return [_objc_msgSend(a1, "handleFailureInMethod:object:file:lineNumber:description:")];
}

id objc_msgSend_handleForIdentifier_error_(void *a1, const char *a2, ...)
{
  return [_objc_msgSend(a1, "handleForIdentifier:error:");
}

id objc_msgSend_handleXPCDisconnection(void *a1, const char *a2, ...)
{
  return _[a1 handleXPCDisconnection];
}

id objc_msgSend_handleXPCDisconnection_(void *a1, const char *a2, ...)
{
  return [a1 handleXPCDisconnection:];
}

id objc_msgSend_hasPrefix_(void *a1, const char *a2, ...)
{
  return [a1 hasPrefix:];
}

id objc_msgSend_hasReceivedRangingData(void *a1, const char *a2, ...)
{
  return _[a1 hasReceivedRangingData];
}

id objc_msgSend_hash(void *a1, const char *a2, ...)
{
  return _[a1 hash];
}

id objc_msgSend_headingAccuracy(void *a1, const char *a2, ...)
{
  return _[a1 headingAccuracy];
}

id objc_msgSend_horizontalAccuracy(void *a1, const char *a2, ...)
{
  return _[a1 horizontalAccuracy];
}

id objc_msgSend_horizontalAngle(void *a1, const char *a2, ...)
{
  return _[a1 horizontalAngle];
}

id objc_msgSend_horizontalAngleAccuracy(void *a1, const char *a2, ...)
{
  return _[a1 horizontalAngleAccuracy];
}

id objc_msgSend_horizontalAngleAccuracyNumber(void *a1, const char *a2, ...)
{
  return _[a1 horizontalAngleAccuracyNumber];
}

id objc_msgSend_horizontalAngleNumber(void *a1, const char *a2, ...)
{
  return _[a1 horizontalAngleNumber];
}

id objc_msgSend_horizontalDistanceNumber(void *a1, const char *a2, ...)
{
  return _[a1 horizontalDistanceNumber];
}

id objc_msgSend_hour(void *a1, const char *a2, ...)
{
  return _[a1 hour];
}

id objc_msgSend_identifier(void *a1, const char *a2, ...)
{
  return _[a1 identifier];
}

id objc_msgSend_identifierFromDiscoveryToken_(void *a1, const char *a2, ...)
{
  return [a1 identifierFromDiscoveryToken:];
}

id objc_msgSend_identifierWithPid_(void *a1, const char *a2, ...)
{
  return [a1 identifierWithPid:];
}

id objc_msgSend_identityString(void *a1, const char *a2, ...)
{
  return _[a1 identityString];
}

id objc_msgSend_idsDeviceID(void *a1, const char *a2, ...)
{
  return _[a1 idsDeviceID];
}

id objc_msgSend_imag(void *a1, const char *a2, ...)
{
  return _[a1 imag];
}

id objc_msgSend_indexOfObject_(void *a1, const char *a2, ...)
{
  return [a1 indexOfObject:];
}

id objc_msgSend_indexOfObjectPassingTest_(void *a1, const char *a2, ...)
{
  return [_objc_msgSend(a1, "indexOfObjectPassingTest:");
}

id objc_msgSend_informDelegateOwnerRangeStoppedonDevice_(void *a1, const char *a2, ...)
{
  return [a1 informDelegateOwnerRangeStoppedonDevice:];
}

id objc_msgSend_informMutualAuthFailuresToClients(void *a1, const char *a2, ...)
{
  return _[a1 informMutualAuthFailuresToClients];
}

id objc_msgSend_init(void *a1, const char *a2, ...)
{
  return _[a1 init];
}

id objc_msgSend_initCompanion_(void *a1, const char *a2, ...)
{
  return [a1 initCompanion:];
}

id objc_msgSend_initForFinder_address_(void *a1, const char *a2, ...)
{
  return [a1 initForFinder:address:];
}

id objc_msgSend_initInternal(void *a1, const char *a2, ...)
{
  return _[a1 initInternal];
}

id objc_msgSend_initLabTestModeConfiguration_(void *a1, const char *a2, ...)
{
  return [a1 initLabTestModeConfiguration:];
}

id objc_msgSend_initNarrowbandSARListner(void *a1, const char *a2, ...)
{
  return _[a1 initNarrowbandSARListner];
}

id objc_msgSend_initPrivate(void *a1, const char *a2, ...)
{
  return _[a1 initPrivate];
}

id objc_msgSend_initRadioSCPreferencesRef(void *a1, const char *a2, ...)
{
  return _[a1 initRadioSCPreferencesRef];
}

id objc_msgSend_initRangingOnDevice_macAddress_(void *a1, const char *a2, ...)
{
  return [a1 initRangingOnDevice:macAddress];
}

id objc_msgSend_initTime(void *a1, const char *a2, ...)
{
  return _[a1 initTime];
}

id objc_msgSend_initVehicleSimConfiguration_(void *a1, const char *a2, ...)
{
  return [a1 initVehicleSimConfiguration:];
}

id objc_msgSend_initWithAdvertisement_(void *a1, const char *a2, ...)
{
  return [a1 initWithAdvertisement:];
}

id objc_msgSend_initWithArray_copyItems_(void *a1, const char *a2, ...)
{
  return [a1 initWithArray:x0 copyItems:x1];
}

id objc_msgSend_initWithBeaconUUID_(void *a1, const char *a2, ...)
{
  return [a1 initWithBeaconUUID:];
}

id objc_msgSend_initWithBiasEstimatorFeatures_(void *a1, const char *a2, ...)
{
  return [a1 initWithBiasEstimatorFeatures:];
}

id objc_msgSend_initWithBiasEstimatorOutputs_(void *a1, const char *a2, ...)
{
  return [a1 initWithBiasEstimatorOutputs:];
}

id objc_msgSend_initWithBitmap_(void *a1, const char *a2, ...)
{
  return [a1 initWithBitmap:];
}

id objc_msgSend_initWithBundleIdentifier_(void *a1, const char *a2, ...)
{
  return [a1 initWithBundleIdentifier:];
}

id objc_msgSend_initWithBytes_(void *a1, const char *a2, ...)
{
  return [a1 initWithBytes:];
}

id objc_msgSend_initWithBytes_length_(void *a1, const char *a2, ...)
{
  return [a1 initWithBytes:length:];
}

id objc_msgSend_initWithCBDevice_(void *a1, const char *a2, ...)
{
  return [a1 initWithCBDevice:];
}

id objc_msgSend_initWithCString_encoding_(void *a1, const char *a2, ...)
{
  return [a1 initWithCString:x0 encoding:x1];
}

id objc_msgSend_initWithCapacity_(void *a1, const char *a2, ...)
{
  return [a1 initWithCapacity:];
}

id objc_msgSend_initWithClient_(void *a1, const char *a2, ...)
{
  return [a1 initWithClient:];
}

id objc_msgSend_initWithClient_clientInfo_connection_authorizationManager_(void *a1, const char *a2, ...)
{
  return [a1 initWithClient:a2 clientInfo:a3 connection:a4 authorizationManager:a5];
}

id objc_msgSend_initWithClientInfo_connection_(void *a1, const char *a2, ...)
{
  return [a1 initWithClientInfo:x0 connection:x1];
}

id objc_msgSend_initWithClientPid_signingIdentity_sessionIdentifier_(void *a1, const char *a2, ...)
{
  return [a1 initWithClientPid:x0 signingIdentity:x1 sessionIdentifier:x2];
}

id objc_msgSend_initWithClientReference_(void *a1, const char *a2, ...)
{
  return [a1 initWithClientReference:];
}

id objc_msgSend_initWithConfiguration_queue_delegate_dataSource_analyticsManager_protobufLogger_error_(void *a1, const char *a2, ...)
{
  return [a1 initWithConfiguration:x0 queue:x1 delegate:x2 dataSource:x3 analyticsManager:x4 protobufLogger:x5 error:&x6];
}

id objc_msgSend_initWithConnection_(void *a1, const char *a2, ...)
{
  return [a1 initWithConnection:];
}

id objc_msgSend_initWithConnection_queue_(void *a1, const char *a2, ...)
{
  return [a1 initWithConnection:queue:];
}

id objc_msgSend_initWithConsumerBlock_(void *a1, const char *a2, ...)
{
  return [a1 initWithConsumerBlock:];
}

id objc_msgSend_initWithContentsOfURL_(void *a1, const char *a2, ...)
{
  return [a1 initWithContentsOfURL:];
}

id objc_msgSend_initWithConvergenceStatus_(void *a1, const char *a2, ...)
{
  return [a1 initWithConvergenceStatus:];
}

id objc_msgSend_initWithCurrentTime_(void *a1, const char *a2, ...)
{
  return [a1 initWithCurrentTime:];
}

id objc_msgSend_initWithData_(void *a1, const char *a2, ...)
{
  return [a1 initWithData:];
}

id objc_msgSend_initWithData_encoding_(void *a1, const char *a2, ...)
{
  return [a1 initWithData:x0 encoding:x1];
}

id objc_msgSend_initWithData_error_(void *a1, const char *a2, ...)
{
  return [a1 initWithData:x0 error:x1];
}

id objc_msgSend_initWithDataSource_delegate_clientQueue_(void *a1, const char *a2, ...)
{
  return [a1 initWithDataSource:a2 delegate:a3 clientQueue:a4];
}

id objc_msgSend_initWithDelegate_delegateQueue_(void *a1, const char *a2, ...)
{
  return [a1 initWithDelegate:delegateQueue:];
}

id objc_msgSend_initWithDelegate_dispatchQueue_(void *a1, const char *a2, ...)
{
  return [a1 initWithDelegate:v1 dispatchQueue:v2];
}

id objc_msgSend_initWithDelegate_queue_(void *a1, const char *a2, ...)
{
  return [a1 initWithDelegate:queue:];
}

id objc_msgSend_initWithDelegate_queue_options_(void *a1, const char *a2, ...)
{
  return [a1 initWithDelegate:x0 queue:x1 options:x2];
}

id objc_msgSend_initWithDeviceAddress_(void *a1, const char *a2, ...)
{
  return [a1 initWithDeviceAddress:];
}

id objc_msgSend_initWithDeviceEventCount_uwbDeviceTimeUs_uwbDeviceTimeUncertainty_uwbClockSkewMeasurementAvailable_deviceMaxPpm_success_retryDelay_(void *a1, const char *a2, ...)
{
  return [a1 initWithDeviceEventCount:x0 uwbDeviceTimeUs:x1 uwbDeviceTimeUncertainty:x2 uwbClockSkewMeasurementAvailable:x3 deviceMaxPpm:x4 success:x5 retryDelay:x6];
}

id objc_msgSend_initWithDictionary_copyItems_(void *a1, const char *a2, ...)
{
  return [a1 initWithDictionary:x0 copyItems:x1];
}

id objc_msgSend_initWithECID_chipID_boardID_bootMode_prodMode_secureMode_securityDomain_chipRevision_(void *a1, const char *a2, ...)
{
  return [a1 initWithECID:x0 chipID:x1 boardID:x2 bootMode:x3 prodMode:x4 secureMode:x5 securityDomain:x6 chipRevision:x7];
}

id objc_msgSend_initWithEffectiveBundleIdentifier_delegate_onQueue_(void *a1, const char *a2, ...)
{
  return [a1 initWithEffectiveBundleIdentifier:delegate:onQueue:];
}

id objc_msgSend_initWithEffectiveBundlePath_delegate_onQueue_(void *a1, const char *a2, ...)
{
  return [a1 initWithEffectiveBundlePath:x0 delegate:x1 onQueue:x2];
}

id objc_msgSend_initWithExplanation_target_attributes_(void *a1, const char *a2, ...)
{
  return [a1 initWithExplanation:x0 target:x1 attributes:x2];
}

id objc_msgSend_initWithExportedObject_(void *a1, const char *a2, ...)
{
  return [a1 initWithExportedObject:];
}

id objc_msgSend_initWithFindingManager_(void *a1, const char *a2, ...)
{
  return [a1 initWithFindingManager:];
}

id objc_msgSend_initWithFineRangingSupport_aoaSupport_extendedDistanceMeasurementSupport_syntheticApertureSupport_(void *a1, const char *a2, ...)
{
  return [a1 initWithFineRangingSupport:aoaSupport:extendedDistanceMeasurementSupport:syntheticApertureSupport:];
}

id objc_msgSend_initWithFineRangingSupport_coarseRangingSupport_aoaSupport_extendedDistanceMeasurementSupport_syntheticApertureSupport_(void *a1, const char *a2, ...)
{
  return [a1 initWithFineRangingSupport:x0 coarseRangingSupport:x1 aoaSupport:x2 extendedDistanceMeasurementSupport:x3 syntheticApertureSupport:x4];
}

id objc_msgSend_initWithFloat_(void *a1, const char *a2, ...)
{
  return [a1 initWithFloat:x0];
}

id objc_msgSend_initWithFormat_(void *a1, const char *a2, ...)
{
  return [a1 initWithFormat:];
}

id objc_msgSend_initWithGEOCoordinate_(void *a1, const char *a2, ...)
{
  return [a1 initWithGEOCoordinate:];
}

id objc_msgSend_initWithGetPowerStatsResponse_(void *a1, const char *a2, ...)
{
  return [a1 initWithGetPowerStatsResponse:];
}

id objc_msgSend_initWithHelloResponse_(void *a1, const char *a2, ...)
{
  return [a1 initWithHelloResponse:];
}

id objc_msgSend_initWithIdentifier_(void *a1, const char *a2, ...)
{
  return [a1 initWithIdentifier:];
}

id objc_msgSend_initWithIdentifier_isFinder_consumer_queue_pbLogger_(void *a1, const char *a2, ...)
{
  return [a1 initWithIdentifier:x0 isFinder:x1 consumer:x2 queue:x3 pbLogger:x4];
}

id objc_msgSend_initWithIdentifier_isFinder_enableBluetooth_launchOnDemand_scanRate_discoveryTimeout_oobRefreshPeriod_consumer_queue_(void *a1, const char *a2, ...)
{
  return [a1 initWithIdentifier:x0 isFinder:x1 enableBluetooth:x2 launchOnDemand:x3 scanRate:x4 discoveryTimeout:x5 oobRefreshPeriod:x6 consumer:x7 queue:x8];
}

id objc_msgSend_initWithIdentifier_observer_(void *a1, const char *a2, ...)
{
  return [a1 initWithIdentifier:v0 observer:v1];
}

id objc_msgSend_initWithInnerBoundary_outerBoundary_error_(void *a1, const char *a2, ...)
{
  return [a1 initWithInnerBoundary:x0 outerBoundary:x1 error:x2];
}

id objc_msgSend_initWithInt_(void *a1, const char *a2, ...)
{
  return [a1 initWithInt:];
}

id objc_msgSend_initWithKeyDerivationKey_sessionIdentifier_encrypt_(void *a1, const char *a2, ...)
{
  return [a1 initWithKeyDerivationKey:x0 sessionIdentifier:x1 encrypt:x2];
}

id objc_msgSend_initWithLabel_(void *a1, const char *a2, ...)
{
  return [a1 initWithLabel:];
}

id objc_msgSend_initWithLatitude_longitude_(void *a1, const char *a2, ...)
{
  return [a1 initWithLatitude:x0 longitude:x1];
}

id objc_msgSend_initWithLockIdentifier_(void *a1, const char *a2, ...)
{
  return [a1 initWithLockIdentifier:];
}

id objc_msgSend_initWithMachServiceName_(void *a1, const char *a2, ...)
{
  return [a1 initWithMachServiceName:];
}

id objc_msgSend_initWithMachServiceName_options_(void *a1, const char *a2, ...)
{
  return [a1 initWithMachServiceName:x0 options:x1];
}

id objc_msgSend_initWithNIConfiguration_parsedAccessoryConfigData_processName_uwbSessionId_(void *a1, const char *a2, ...)
{
  return [a1 initWithNIConfiguration:parsedAccessoryConfigData:processName:uwbSessionId:];
}

id objc_msgSend_initWithName_devicePresencePreset_(void *a1, const char *a2, ...)
{
  return [a1 initWithName:devicePresencePreset:];
}

id objc_msgSend_initWithName_radius_(void *a1, const char *a2, ...)
{
  return [a1 initWithName:radius:];
}

id objc_msgSend_initWithName_radius_preferredUpdateRate_(void *a1, const char *a2, ...)
{
  return [a1 initWithName:x0 radius:x1 preferredUpdateRate:x2];
}

id objc_msgSend_initWithName_radius_preferredUpdateRate_requiresUserIntent_(void *a1, const char *a2, ...)
{
  return [a1 initWithName:x0 radius:x1 preferredUpdateRate:x2 requiresUserIntent:x3];
}

id objc_msgSend_initWithName_radius_preferredUpdateRate_requiresUserIntent_devicePresencePreset_(void *a1, const char *a2, ...)
{
  return [a1 initWithName:x0 radius:x1 preferredUpdateRate:x2 requiresUserIntent:x3 devicePresencePreset:x4];
}

id objc_msgSend_initWithName_regionSizeCategory_(void *a1, const char *a2, ...)
{
  return [a1 initWithName:x0 regionSizeCategory:x1];
}

id objc_msgSend_initWithName_regionSizeCategory_radius_preferredUpdateRate_requiresUserIntent_coarseEstimation_devicePresencePreset_(void *a1, const char *a2, ...)
{
  return [a1 initWithName:x0 regionSizeCategory:x1 radius:x2 preferredUpdateRate:x3 requiresUserIntent:x4 coarseEstimation:x5 devicePresencePreset:x6];
}

id objc_msgSend_initWithNeuralNetworkModel_andDataTransformer_(void *a1, const char *a2, ...)
{
  return [a1 initWithNeuralNetworkModel:andDataTransformer:];
}

id objc_msgSend_initWithObjects_(void *a1, const char *a2, ...)
{
  return [a1 initWithObjects:];
}

id objc_msgSend_initWithPID_(void *a1, const char *a2, ...)
{
  return [a1 initWithPID:];
}

id objc_msgSend_initWithParentSession_(void *a1, const char *a2, ...)
{
  return [a1 initWithParentSession:];
}

id objc_msgSend_initWithPath_(void *a1, const char *a2, ...)
{
  return [a1 initWithPath:];
}

id objc_msgSend_initWithQueue_(void *a1, const char *a2, ...)
{
  return [a1 initWithQueue:];
}

id objc_msgSend_initWithQueue_bundle_reason_(void *a1, const char *a2, ...)
{
  return [a1 initWithQueue:x0 bundle:x1 reason:x2];
}

id objc_msgSend_initWithQueue_bundleId_reason_(void *a1, const char *a2, ...)
{
  return [a1 initWithQueue:x0 bundleId:x1 reason:x2];
}

id objc_msgSend_initWithQueue_identityString_stateUpdateHandler_mutualAuthHandler_(void *a1, const char *a2, ...)
{
  return [a1 initWithQueue:x0 identityString:x1 stateUpdateHandler:x2 mutualAuthHandler:x3];
}

id objc_msgSend_initWithQueue_stateChangeHandler_(void *a1, const char *a2, ...)
{
  return [a1 initWithQueue:x0 stateChangeHandler:x1];
}

id objc_msgSend_initWithRSSI_identifier_model_channel_machContinuousTimeSeconds_(void *a1, const char *a2, ...)
{
  return [a1 initWithRSSI:x0 identifier:x1 model:x2 channel:x3 machContinuousTimeSeconds:x4];
}

id objc_msgSend_initWithRSSI_identifier_model_channel_machContinuousTimeSeconds_partIdentifier_name_presenceConfigData_(void *a1, const char *a2, ...)
{
  return [a1 initWithRSSI:x0 identifier:x1 model:x2 channel:x3 machContinuousTimeSeconds:x4 partIdentifier:x5 name:x6 presenceConfigData:x7];
}

id objc_msgSend_initWithRealPart_imagPart_(void *a1, const char *a2, ...)
{
  return [a1 initWithRealPart:x0 imagPart:x1];
}

id objc_msgSend_initWithResourceBundleDirectory_bundleName_(void *a1, const char *a2, ...)
{
  return [a1 initWithResourceBundleDirectory:bundleName:];
}

id objc_msgSend_initWithResourcesManager_configuration_error_(void *a1, const char *a2, ...)
{
  return [a1 initWithResourcesManager:a2 configuration:a3 error:a4];
}

id objc_msgSend_initWithRole_discoveryToken_preferredUpdateRate_(void *a1, const char *a2, ...)
{
  return [a1 initWithRole:discoveryToken:preferredUpdateRate:];
}

id objc_msgSend_initWithSelectedRanMultiplier_selectedNumChapsPerSlot_numResponders_numSlotsPerRound_supportedSyncCodeIndexBitmask_selectedHoppingConfigBitmask_macMode_(void *a1, const char *a2, ...)
{
  return [a1 initWithSelectedRanMultiplier:x0 selectedNumChapsPerSlot:x1 numResponders:x2 numSlotsPerRound:x3 supportedSyncCodeIndexBitmask:x4 selectedHoppingConfigBitmask:x5 macMode:x6];
}

id objc_msgSend_initWithSelectedUwbConfigId_selectedPulseShapeCombo_selectedChannelBitmask_supportedSyncCodeIndexBitmask_minRanMultiplier_supportedSlotBitmask_supportedHoppingConfigBitmask_(void *a1, const char *a2, ...)
{
  return [a1 initWithSelectedUwbConfigId:selectedUwbConfigId selectedPulseShapeCombo:selectedPulseShapeCombo selectedChannelBitmask:selectedChannelBitmask supportedSyncCodeIndexBitmask:supportedSyncCodeIndexBitmask minRanMultiplier:minRanMultiplier supportedSlotBitmask:supportedSlotBitmask supportedHoppingConfigBitmask:supportedHoppingConfigBitmask];
}

id objc_msgSend_initWithSelectedUwbConfigId_selectedPulseShapeCombo_selectedChannelBitmask_supportedSyncCodeIndexBitmask_minRanMultiplier_supportedSlotBitmask_supportedHoppingConfigBitmask_selectedFinalData2Bitmask_(void *a1, const char *a2, ...)
{
  return [a1 initWithSelectedUwbConfigId:selectedUwbConfigId selectedPulseShapeCombo:selectedPulseShapeCombo selectedChannelBitmask:selectedChannelBitmask supportedSyncCodeIndexBitmask:supportedSyncCodeIndexBitmask minRanMultiplier:minRanMultiplier supportedSlotBitmask:supportedSlotBitmask supportedHoppingConfigBitmask:supportedHoppingConfigBitmask selectedFinalData2Bitmask:selectedFinalData2Bitmask];
}

id objc_msgSend_initWithService_account_data_(void *a1, const char *a2, ...)
{
  return [a1 initWithService:a2 account:a3 data:a4];
}

id objc_msgSend_initWithServiceRequest_startOptions_shareableConfigData_processName_accessoryConfigData_persistWhileDetached_(void *a1, const char *a2, ...)
{
  return [a1 initWithServiceRequest:x0 startOptions:x1 shareableConfigData:x2 processName:x3 accessoryConfigData:x4 persistWhileDetached:x5];
}

id objc_msgSend_initWithSessionID_queue_exportedObject_options_(void *a1, const char *a2, ...)
{
  return [a1 initWithSessionID:x0 queue:x1 exportedObject:x2 options:x3];
}

id objc_msgSend_initWithSessionIdentifier_appStateMonitor_queue_analyticsManager_backgroundAuthHandler_(void *a1, const char *a2, ...)
{
  return [a1 initWithSessionIdentifier:a2 appStateMonitor:a3 queue:a4 analyticsManager:a5 backgroundAuthHandler:a6];
}

id objc_msgSend_initWithSessionIdentifier_cycleRate_updatesQueue_analyticsManager_(void *a1, const char *a2, ...)
{
  return [a1 initWithSessionIdentifier:x0 cycleRate:x1 updatesQueue:x2 analyticsManager:x3];
}

id objc_msgSend_initWithSettings_queue_(void *a1, const char *a2, ...)
{
  return [a1 initWithSettings:x0 queue:x1];
}

id objc_msgSend_initWithShape_dataType_error_(void *a1, const char *a2, ...)
{
  return [a1 initWithShape:[a1 shape] dataType:[a1 dataType] error:nil];
}

id objc_msgSend_initWithSlot_(void *a1, const char *a2, ...)
{
  return [a1 initWithSlot:];
}

id objc_msgSend_initWithStatus_andReasons_(void *a1, const char *a2, ...)
{
  return [a1 initWithStatus:andReasons:];
}

id objc_msgSend_initWithString_(void *a1, const char *a2, ...)
{
  return [a1 initWithString:];
}

id objc_msgSend_initWithStsIndex0_uwbTime0_(void *a1, const char *a2, ...)
{
  return [a1 initWithStsIndex0:x0 uwbTime0:x1];
}

id objc_msgSend_initWithStsIndex0_uwbTime0_hopKey_selectedSyncCodeIndex_(void *a1, const char *a2, ...)
{
  return [a1 initWithStsIndex0:x0 uwbTime0:x1 hopKey:x2 selectedSyncCodeIndex:x3];
}

id objc_msgSend_initWithSuiteName_(void *a1, const char *a2, ...)
{
  return [a1 initWithSuiteName:];
}

id objc_msgSend_initWithSupportedUwbConfigIds_supportedPulseShapeCombos_channelBitmask_uwbSessionId_(void *a1, const char *a2, ...)
{
  return [_objc_msgSend(a1, "initWithSupportedUwbConfigIds:supportedPulseShapeCombos:channelBitmask:uwbSessionId:");
}

id objc_msgSend_initWithSystemStatus_(void *a1, const char *a2, ...)
{
  return [a1 initWithSystemStatus:];
}

id objc_msgSend_initWithTCCIdentity_(void *a1, const char *a2, ...)
{
  return [a1 initWithTCCIdentity:];
}

id objc_msgSend_initWithTimeStamp_rssi_dbm_channel_(void *a1, const char *a2, ...)
{
  return [a1 initWithTimeStamp:x0 rssi_dbm:x1 channel:x2];
}

id objc_msgSend_initWithTimestamp_devicePose_trackingState_lightEstimate_majorRelocalization_minorRelocalization_(void *a1, const char *a2, ...)
{
  return [a1 initWithTimestamp:x0 devicePose:x1 trackingState:x2 lightEstimate:x3 majorRelocalization:x4 minorRelocalization:x5];
}

id objc_msgSend_initWithTimestamp_latitude_longitude_altitude_ellipsoidalAltitude_horizontalAccuracy_verticalAccuracy_speed_speedAccuracy_course_courseAccuracy_floor_locationType_signalEnvironment_(void *a1, const char *a2, ...)
{
  return [a1 initWithTimestamp:x0 latitude:x1 longitude:x2 altitude:x3 ellipsoidalAltitude:x4 horizontalAccuracy:x5 verticalAccuracy:x6 speed:x7 speedAccuracy:x8 course:x9 courseAccuracy:x10 floor:x11 locationType:x12 signalEnvironment:x13];
}

id objc_msgSend_initWithTimestamp_trueHeading_magneticHeading_headingAccuracy_(void *a1, const char *a2, ...)
{
  return [a1 initWithTimestamp:x0 trueHeading:x1 magneticHeading:x2 headingAccuracy:x3];
}

id objc_msgSend_initWithToken_(void *a1, const char *a2, ...)
{
  return [a1 initWithToken:];
}

id objc_msgSend_initWithToken_queue_delegate_(void *a1, const char *a2, ...)
{
  return [a1 initWithToken:x0 queue:x1 delegate:x2];
}

id objc_msgSend_initWithType_(void *a1, const char *a2, ...)
{
  return [a1 initWithType:];
}

id objc_msgSend_initWithUUIDString_(void *a1, const char *a2, ...)
{
  return [a1 initWithUUIDString:];
}

id objc_msgSend_initWithUWBConfigData_(void *a1, const char *a2, ...)
{
  return [a1 initWithUWBConfigData:];
}

id objc_msgSend_initWithUWBPreciseDistanceAvailability_uwbExtendedDistanceAvailability_(void *a1, const char *a2, ...)
{
  return [a1 initWithUWBPreciseDistanceAvailability:uwbExtendedDistanceAvailability:];
}

id objc_msgSend_initWithVariant_macAddr_machAbsTime_sec_machContTimeValid_machContTime_sec_range_m_rangeUnc_m_azValid_elValid_az_deg_el_deg_azUnc_deg_elUnc_deg_fovConfidence_soiRssiValid_soiRssi_dBm_antennaType_prevSolutionIsBad_trackScoreValid_trackScore_sweepAngleValid_sweepAngle_deg_multipathProbabilityValid_multipathProbability_(void *a1, const char *a2, ...)
{
  return [_objc_msgSend(a1, "initWithVariant:macAddr:machAbsTime_sec:machContTimeValid:machContTime_sec:range_m:rangeUnc_m:azValid:elValid:az_deg:el_deg:azUnc_deg:elUnc_deg:fovConfidence:soiRssiValid:soiRssi_dBm:antennaType:prevSolutionIsBad:trackScoreValid:trackScore:sweepAngleValid:sweepAngle_deg:multipathProbabilityValid:multipathProbability:");
}

id objc_msgSend_initWithVehicleIdentifier_(void *a1, const char *a2, ...)
{
  return [a1 initWithVehicleIdentifier:];
}

id objc_msgSend_initialWorldMap(void *a1, const char *a2, ...)
{
  return _[a1 initialWorldMap];
}

id objc_msgSend_injectNarrowbandSARState_(void *a1, const char *a2, ...)
{
  return [a1 injectNarrowbandSARState:];
}

id objc_msgSend_innerBoundary(void *a1, const char *a2, ...)
{
  return _[a1 innerBoundary];
}

id objc_msgSend_inputFeatures(void *a1, const char *a2, ...)
{
  return _[a1 inputFeatures];
}

id objc_msgSend_insufficientHorizontalSweep(void *a1, const char *a2, ...)
{
  return _[a1 insufficientHorizontalSweep];
}

id objc_msgSend_insufficientLighting(void *a1, const char *a2, ...)
{
  return _[a1 insufficientLighting];
}

id objc_msgSend_insufficientMovement(void *a1, const char *a2, ...)
{
  return _[a1 insufficientMovement];
}

id objc_msgSend_insufficientSignalStrength(void *a1, const char *a2, ...)
{
  return _[a1 insufficientSignalStrength];
}

id objc_msgSend_insufficientVerticalSweep(void *a1, const char *a2, ...)
{
  return _[a1 insufficientVerticalSweep];
}

id objc_msgSend_intValue(void *a1, const char *a2, ...)
{
  return _[a1 intValue];
}

id objc_msgSend_integerForKey_(void *a1, const char *a2, ...)
{
  return [a1 integerForKey:];
}

id objc_msgSend_integerValue(void *a1, const char *a2, ...)
{
  return _[a1 integerValue];
}

id objc_msgSend_integerValueForField_(void *a1, const char *a2, ...)
{
  return [a1 integerValueForField:];
}

id objc_msgSend_interactingFinderDiscoveryTokensForGroup_(void *a1, const char *a2, ...)
{
  return [a1 interactingFinderDiscoveryTokensForGroup:];
}

id objc_msgSend_interestedClients(void *a1, const char *a2, ...)
{
  return _[a1 interestedClients];
}

id objc_msgSend_interfaceWithProtocol_(void *a1, const char *a2, ...)
{
  return [a1 interfaceWithProtocol:];
}

id objc_msgSend_internalObserver(void *a1, const char *a2, ...)
{
  return _[a1 internalObserver];
}

id objc_msgSend_internalState(void *a1, const char *a2, ...)
{
  return _[a1 internalState];
}

id objc_msgSend_interruptSessionWithReason_monotonicTimeSeconds_(void *a1, const char *a2, ...)
{
  return [a1 interruptSessionWithReason:x0 monotonicTimeSeconds:x1];
}

id objc_msgSend_interruptionReasonEnded_monotonicTimeSeconds_(void *a1, const char *a2, ...)
{
  return [_objc_msgSend(a1, "interruptionReasonEnded:monotonicTimeSeconds:");
}

id objc_msgSend_invalidate(void *a1, const char *a2, ...)
{
  return _[a1 invalidate];
}

id objc_msgSend_invalidateCalled(void *a1, const char *a2, ...)
{
  return _[a1 invalidateCalled];
}

id objc_msgSend_invalidationError(void *a1, const char *a2, ...)
{
  return _[a1 invalidationError];
}

id objc_msgSend_isARSessionInClientProcess(void *a1, const char *a2, ...)
{
  return _[a1 isARSessionInClientProcess];
}

id objc_msgSend_isARSessionInternal(void *a1, const char *a2, ...)
{
  return _[a1 isARSessionInternal];
}

id objc_msgSend_isActivityAvailable(void *a1, const char *a2, ...)
{
  return _[a1 isActivityAvailable];
}

id objc_msgSend_isAirPods_(void *a1, const char *a2, ...)
{
  return [a1 isAirPods:];
}

id objc_msgSend_isAnchor(void *a1, const char *a2, ...)
{
  return _[a1 isAnchor];
}

id objc_msgSend_isApplication(void *a1, const char *a2, ...)
{
  return _[a1 isApplication];
}

id objc_msgSend_isAttemptingToRange(void *a1, const char *a2, ...)
{
  return _[a1 isAttemptingToRange];
}

id objc_msgSend_isBackgroundOperationAllowed(void *a1, const char *a2, ...)
{
  return _[a1 isBackgroundOperationAllowed];
}

id objc_msgSend_isCachedByTokenData_(void *a1, const char *a2, ...)
{
  return [a1 isCachedByTokenData:];
}

id objc_msgSend_isCameraAssistanceEnabled(void *a1, const char *a2, ...)
{
  return _[a1 isCameraAssistanceEnabled];
}

id objc_msgSend_isCameraAssistanceInClientProcess(void *a1, const char *a2, ...)
{
  return _[a1 isCameraAssistanceInClientProcess];
}

id objc_msgSend_isCoastalWaters(void *a1, const char *a2, ...)
{
  return _[a1 isCoastalWaters];
}

id objc_msgSend_isCollaborationEnabled(void *a1, const char *a2, ...)
{
  return _[a1 isCollaborationEnabled];
}

id objc_msgSend_isDaemon(void *a1, const char *a2, ...)
{
  return _[a1 isDaemon];
}

id objc_msgSend_isDoingAnything(void *a1, const char *a2, ...)
{
  return _[a1 isDoingAnything];
}

id objc_msgSend_isEqual_(void *a1, const char *a2, ...)
{
  return [a1 isEqual:];
}

id objc_msgSend_isEqualToArray_(void *a1, const char *a2, ...)
{
  return [a1 isEqualToArray:];
}

id objc_msgSend_isEqualToData_(void *a1, const char *a2, ...)
{
  return [a1 isEqualToData:];
}

id objc_msgSend_isEqualToDictionary_(void *a1, const char *a2, ...)
{
  return [a1 isEqualToDictionary:];
}

id objc_msgSend_isEqualToNumber_(void *a1, const char *a2, ...)
{
  return [a1 isEqualToNumber:];
}

id objc_msgSend_isEqualToString_(void *a1, const char *a2, ...)
{
  return [a1 isEqualToString:];
}

id objc_msgSend_isExtendedDistanceMeasurementAllowed_(void *a1, const char *a2, ...)
{
  return [a1 isExtendedDistanceMeasurementAllowed:];
}

id objc_msgSend_isExtendedDistanceMeasurementEnabled(void *a1, const char *a2, ...)
{
  return _[a1 isExtendedDistanceMeasurementEnabled];
}

id objc_msgSend_isFinder(void *a1, const char *a2, ...)
{
  return _[a1 isFinder];
}

id objc_msgSend_isIntValidAntennaDiversityOverride_(void *a1, const char *a2, ...)
{
  return [a1 isIntValidAntennaDiversityOverride:];
}

id objc_msgSend_isIntValidNearbyObjectUpdateRate_(void *a1, const char *a2, ...)
{
  return [a1 isIntValidNearbyObjectUpdateRate:];
}

id objc_msgSend_isIntValidRelationshipSpecifier_(void *a1, const char *a2, ...)
{
  return [a1 isIntValidRelationshipSpecifier:];
}

id objc_msgSend_isInteresetedInSample_(void *a1, const char *a2, ...)
{
  return [a1 isInteresetedInSample:];
}

id objc_msgSend_isInterestedInSamplesForDevice_(void *a1, const char *a2, ...)
{
  return [a1 isInterestedInSamplesForDevice:];
}

id objc_msgSend_isInternalBuild(void *a1, const char *a2, ...)
{
  return _[a1 isInternalBuild];
}

id objc_msgSend_isLegacyDiscoveryToken_(void *a1, const char *a2, ...)
{
  return [a1 isLegacyDiscoveryToken:];
}

id objc_msgSend_isLongRangeEnabled(void *a1, const char *a2, ...)
{
  return _[a1 isLongRangeEnabled];
}

id objc_msgSend_isLowPowerModeEnabled(void *a1, const char *a2, ...)
{
  return _[a1 isLowPowerModeEnabled];
}

id objc_msgSend_isMobilePhoneModel(void *a1, const char *a2, ...)
{
  return _[a1 isMobilePhoneModel];
}

id objc_msgSend_isObserver(void *a1, const char *a2, ...)
{
  return _[a1 isObserver];
}

id objc_msgSend_isPreciseRangingAllowed_(void *a1, const char *a2, ...)
{
  return [a1 isPreciseRangingAllowed:];
}

id objc_msgSend_isRangingEnabledReply_(void *a1, const char *a2, ...)
{
  return [a1 isRangingEnabledReply:];
}

id objc_msgSend_isRangingLimitExceeded(void *a1, const char *a2, ...)
{
  return _[a1 isRangingLimitExceeded];
}

id objc_msgSend_isRangingLimitExceeded_(void *a1, const char *a2, ...)
{
  return [a1 isRangingLimitExceeded:];
}

id objc_msgSend_isResponder(void *a1, const char *a2, ...)
{
  return _[a1 isResponder];
}

id objc_msgSend_isRunning(void *a1, const char *a2, ...)
{
  return _[a1 isRunning];
}

id objc_msgSend_isRunningBoardApp(void *a1, const char *a2, ...)
{
  return _[a1 isRunningBoardApp];
}

id objc_msgSend_isSampleInCache_(void *a1, const char *a2, ...)
{
  return [a1 isSampleInCache:];
}

id objc_msgSend_isSessionAllowedToActivate_(void *a1, const char *a2, ...)
{
  return [a1 isSessionAllowedToActivate:];
}

id objc_msgSend_isSubclassOfClass_(void *a1, const char *a2, ...)
{
  return [a1 isSubclassOfClass:];
}

id objc_msgSend_isTracking(void *a1, const char *a2, ...)
{
  return _[a1 isTracking];
}

id objc_msgSend_isTrackingPeer_(void *a1, const char *a2, ...)
{
  return [a1 isTrackingPeer:];
}

id objc_msgSend_isUIBackgroundModeEnabled(void *a1, const char *a2, ...)
{
  return _[a1 isUIBackgroundModeEnabled];
}

id objc_msgSend_isUwbCapable(void *a1, const char *a2, ...)
{
  return _[a1 isUwbCapable];
}

id objc_msgSend_isWifiRangingCapable(void *a1, const char *a2, ...)
{
  return _[a1 isWifiRangingCapable];
}

id objc_msgSend_isXPCService(void *a1, const char *a2, ...)
{
  return _[a1 isXPCService];
}

id objc_msgSend_iso3166CountryCode2(void *a1, const char *a2, ...)
{
  return _[a1 iso3166CountryCode2];
}

id objc_msgSend_keyEnumerator(void *a1, const char *a2, ...)
{
  return _[a1 keyEnumerator];
}

id objc_msgSend_keysOfEntriesPassingTest_(void *a1, const char *a2, ...)
{
  return [a1 keysOfEntriesPassingTest:];
}

id objc_msgSend_lastConfiguration(void *a1, const char *a2, ...)
{
  return _[a1 lastConfiguration];
}

id objc_msgSend_lastObject(void *a1, const char *a2, ...)
{
  return _[a1 lastObject];
}

id objc_msgSend_latestARFrame(void *a1, const char *a2, ...)
{
  return _[a1 latestARFrame];
}

id objc_msgSend_latestActivityTimestamp(void *a1, const char *a2, ...)
{
  return _[a1 latestActivityTimestamp];
}

id objc_msgSend_latestActivityType(void *a1, const char *a2, ...)
{
  return _[a1 latestActivityType];
}

id objc_msgSend_latitude(void *a1, const char *a2, ...)
{
  return _[a1 latitude];
}

id objc_msgSend_launchdJobLabel(void *a1, const char *a2, ...)
{
  return _[a1 launchdJobLabel];
}

id objc_msgSend_leadingEdgePacket1(void *a1, const char *a2, ...)
{
  return _[a1 leadingEdgePacket1];
}

id objc_msgSend_leadingEdgePacket2(void *a1, const char *a2, ...)
{
  return _[a1 leadingEdgePacket2];
}

id objc_msgSend_legacyInfo(void *a1, const char *a2, ...)
{
  return _[a1 legacyInfo];
}

id objc_msgSend_length(void *a1, const char *a2, ...)
{
  return _[a1 length];
}

id objc_msgSend_level(void *a1, const char *a2, ...)
{
  return _[a1 level];
}

id objc_msgSend_lifecycleSupervisor(void *a1, const char *a2, ...)
{
  return _[a1 lifecycleSupervisor];
}

id objc_msgSend_lifecycleTimeoutAfterTrackingForDiscoveryToken_(void *a1, const char *a2, ...)
{
  return [a1 lifecycleTimeoutAfterTrackingForDiscoveryToken:];
}

id objc_msgSend_lifecycleTimeoutBeforeTrackingForDiscoveryToken_(void *a1, const char *a2, ...)
{
  return [a1 lifecycleTimeoutBeforeTrackingForDiscoveryToken:];
}

id objc_msgSend_lightEstimate(void *a1, const char *a2, ...)
{
  return _[a1 lightEstimate];
}

id objc_msgSend_lightEstimateFromARLightEstimate_(void *a1, const char *a2, ...)
{
  return [a1 lightEstimateFromARLightEstimate:];
}

id objc_msgSend_listener(void *a1, const char *a2, ...)
{
  return _[a1 listener];
}

id objc_msgSend_listeners(void *a1, const char *a2, ...)
{
  return _[a1 listeners];
}

id objc_msgSend_loadResourcesWithResourceIndex_(void *a1, const char *a2, ...)
{
  return [a1 loadResourcesWithResourceIndex:];
}

id objc_msgSend_localDeviceConfiguration(void *a1, const char *a2, ...)
{
  return _[a1 localDeviceConfiguration];
}

id objc_msgSend_localeWithLocaleIdentifier_(void *a1, const char *a2, ...)
{
  return [a1 localeWithLocaleIdentifier:];
}

id objc_msgSend_localizations(void *a1, const char *a2, ...)
{
  return _[a1 localizations];
}

id objc_msgSend_localizedBundle(void *a1, const char *a2, ...)
{
  return _[a1 localizedBundle];
}

id objc_msgSend_localizedBundleWithBundle_(void *a1, const char *a2, ...)
{
  return [a1 localizedBundleWithBundle:];
}

id objc_msgSend_localizedDescription(void *a1, const char *a2, ...)
{
  return _[a1 localizedDescription];
}

id objc_msgSend_localizedStringForKey_value_table_(void *a1, const char *a2, ...)
{
  return [a1 localizedStringForKey:x0 value:x1 table:x2];
}

id objc_msgSend_location(void *a1, const char *a2, ...)
{
  return _[a1 location];
}

id objc_msgSend_locationType(void *a1, const char *a2, ...)
{
  return _[a1 locationType];
}

id objc_msgSend_lockBtConnHandle(void *a1, const char *a2, ...)
{
  return _[a1 lockBtConnHandle];
}

id objc_msgSend_lockIdentifier(void *a1, const char *a2, ...)
{
  return _[a1 lockIdentifier];
}

id objc_msgSend_logSessionEvent_(void *a1, const char *a2, ...)
{
  return [a1 logSessionEvent:];
}

id objc_msgSend_logSessionSummary_(void *a1, const char *a2, ...)
{
  return [a1 logSessionSummary:];
}

id objc_msgSend_logSolution_(void *a1, const char *a2, ...)
{
  return [a1 logSolution:];
}

id objc_msgSend_logUnservableRangingRequestWithToken_isFinder_(void *a1, const char *a2, ...)
{
  return [_objc_msgSend(a1, "logUnservableRangingRequestWithToken:isFinder:");
}

id objc_msgSend_longLongValue(void *a1, const char *a2, ...)
{
  return _[a1 longLongValue];
}

id objc_msgSend_longRangeEnabled(void *a1, const char *a2, ...)
{
  return _[a1 longRangeEnabled];
}

id objc_msgSend_longitude(void *a1, const char *a2, ...)
{
  return _[a1 longitude];
}

id objc_msgSend_macAddress(void *a1, const char *a2, ...)
{
  return _[a1 macAddress];
}

id objc_msgSend_mac_addr(void *a1, const char *a2, ...)
{
  return [a1 mac_addr];
}

id objc_msgSend_machContinuousTimeSeconds(void *a1, const char *a2, ...)
{
  return _[a1 machContinuousTimeSeconds];
}

id objc_msgSend_machServicesNames(void *a1, const char *a2, ...)
{
  return _[a1 machServicesNames];
}

id objc_msgSend_magneticField(void *a1, const char *a2, ...)
{
  return _[a1 magneticField];
}

id objc_msgSend_magneticHeading(void *a1, const char *a2, ...)
{
  return _[a1 magneticHeading];
}

id objc_msgSend_majorRelocalization(void *a1, const char *a2, ...)
{
  return _[a1 majorRelocalization];
}

id objc_msgSend_maxAllowedOutgoingMessages(void *a1, const char *a2, ...)
{
  return _[a1 maxAllowedOutgoingMessages];
}

id objc_msgSend_maxInactivityAfterTrackingBeganSeconds(void *a1, const char *a2, ...)
{
  return _[a1 maxInactivityAfterTrackingBeganSeconds];
}

id objc_msgSend_maxInactivityBeforeTrackingBeganSeconds(void *a1, const char *a2, ...)
{
  return _[a1 maxInactivityBeforeTrackingBeganSeconds];
}

id objc_msgSend_maxNearbyObjectAge(void *a1, const char *a2, ...)
{
  return _[a1 maxNearbyObjectAge];
}

id objc_msgSend_measurementReceived(void *a1, const char *a2, ...)
{
  return _[a1 measurementReceived];
}

id objc_msgSend_measurementReceivedForToken_contTimestamp_(void *a1, const char *a2, ...)
{
  return [_objc_msgSend(a1, "measurementReceivedForToken:contTimestamp:");
}

id objc_msgSend_member_(void *a1, const char *a2, ...)
{
  return [a1 member:];
}

id objc_msgSend_minimumPreferredUpdatedRate(void *a1, const char *a2, ...)
{
  return _[a1 minimumPreferredUpdatedRate];
}

id objc_msgSend_minorRelocalization(void *a1, const char *a2, ...)
{
  return _[a1 minorRelocalization];
}

id objc_msgSend_mmsRxStatus(void *a1, const char *a2, ...)
{
  return _[a1 mmsRxStatus];
}

id objc_msgSend_model(void *a1, const char *a2, ...)
{
  return _[a1 model];
}

id objc_msgSend_modelNumber(void *a1, const char *a2, ...)
{
  return _[a1 modelNumber];
}

id objc_msgSend_modelWithContentsOfURL_error_(void *a1, const char *a2, ...)
{
  return [a1 modelWithContentsOfURL:error:];
}

id objc_msgSend_monitorForDeath_(void *a1, const char *a2, ...)
{
  return [a1 monitorForDeath:];
}

id objc_msgSend_monitorWithConfiguration_(void *a1, const char *a2, ...)
{
  return [a1 monitorWithConfiguration:];
}

id objc_msgSend_monitoredProcessName(void *a1, const char *a2, ...)
{
  return _[a1 monitoredProcessName];
}

id objc_msgSend_monitoredRegions(void *a1, const char *a2, ...)
{
  return _[a1 monitoredRegions];
}

id objc_msgSend_monitoringOption(void *a1, const char *a2, ...)
{
  return _[a1 monitoringOption];
}

id objc_msgSend_motionState(void *a1, const char *a2, ...)
{
  return _[a1 motionState];
}

id objc_msgSend_multiArrayValue(void *a1, const char *a2, ...)
{
  return _[a1 multiArrayValue];
}

id objc_msgSend_mutableBytes(void *a1, const char *a2, ...)
{
  return _[a1 mutableBytes];
}

id objc_msgSend_mutableCopy(void *a1, const char *a2, ...)
{
  return _[a1 mutableCopy];
}

id objc_msgSend_name(void *a1, const char *a2, ...)
{
  return _[a1 name];
}

id objc_msgSend_narrowBandMask(void *a1, const char *a2, ...)
{
  return _[a1 narrowBandMask];
}

id objc_msgSend_nbRssi(void *a1, const char *a2, ...)
{
  return _[a1 nbRssi];
}

id objc_msgSend_nbRxStatus(void *a1, const char *a2, ...)
{
  return _[a1 nbRxStatus];
}

id objc_msgSend_nbSARStateToSARIndex_(void *a1, const char *a2, ...)
{
  return [a1 nbSARStateToSARIndex:];
}

id objc_msgSend_nbUwbAcquisitionChannelIdx(void *a1, const char *a2, ...)
{
  return _[a1 nbUwbAcquisitionChannelIdx];
}

id objc_msgSend_nearbyActionNWPrecisionFindingStatus(void *a1, const char *a2, ...)
{
  return _[a1 nearbyActionNWPrecisionFindingStatus];
}

id objc_msgSend_nearbyActionNoWakeAuthTagData(void *a1, const char *a2, ...)
{
  return _[a1 nearbyActionNoWakeAuthTagData];
}

id objc_msgSend_nearbyActionNoWakeConfigData(void *a1, const char *a2, ...)
{
  return _[a1 nearbyActionNoWakeConfigData];
}

id objc_msgSend_nearbyActionNoWakeType(void *a1, const char *a2, ...)
{
  return _[a1 nearbyActionNoWakeType];
}

id objc_msgSend_nearbyObjectFromDeviceIdentifier_(void *a1, const char *a2, ...)
{
  return [a1 nearbyObjectFromDeviceIdentifier:];
}

id objc_msgSend_nearbyObjectFromRangeResult_(void *a1, const char *a2, ...)
{
  return [_objc_msgSend(a1, "nearbyObjectFromRangeResult:");
}

id objc_msgSend_nearbyObjectFromSolution_(void *a1, const char *a2, ...)
{
  return [a1 nearbyObjectFromSolution:];
}

id objc_msgSend_nearbyObjectFromSolution_forPeer_(void *a1, const char *a2, ...)
{
  return [_objc_msgSend(a1, "nearbyObjectFromSolution:forPeer:");
}

id objc_msgSend_nearbyObjectFromToken_(void *a1, const char *a2, ...)
{
  return [a1 nearbyObjectFromToken:];
}

id objc_msgSend_nearbyObjectUpdateRate_isGreaterThan_(void *a1, const char *a2, ...)
{
  return [_objc_msgSend(a1, "nearbyObjectUpdateRate:isGreaterThan:");
}

id objc_msgSend_nearbyObjectUpdated_(void *a1, const char *a2, ...)
{
  return [_objc_msgSend(a1, "nearbyObjectUpdated:");
}

id objc_msgSend_neuralNetworkModel(void *a1, const char *a2, ...)
{
  return _[a1 neuralNetworkModel];
}

id objc_msgSend_newAssertionForBundle_withReason_withCallbackQueue_andBlock_(void *a1, const char *a2, ...)
{
  return [a1 newAssertionForBundle:withReason:withCallbackQueue:andBlock:];
}

id objc_msgSend_newAssertionForBundleIdentifier_withReason_withCallbackQueue_andBlock_(void *a1, const char *a2, ...)
{
  return [_objc_msgSend(a1, "newAssertionForBundleIdentifier:withReason:withCallbackQueue:andBlock:");
}

id objc_msgSend_nextObject(void *a1, const char *a2, ...)
{
  return _[a1 nextObject];
}

id objc_msgSend_niConfiguration(void *a1, const char *a2, ...)
{
  return _[a1 niConfiguration];
}

id objc_msgSend_niConvergenceStateFromSolution_(void *a1, const char *a2, ...)
{
  return [a1 niConvergenceStateFromSolution:];
}

id objc_msgSend_niVisionInputTrackingStateFromARTRackingState_(void *a1, const char *a2, ...)
{
  return [_objc_msgSend(a1, "niVisionInputTrackingStateFromARTRackingState:");
}

id objc_msgSend_nominalCycleRate(void *a1, const char *a2, ...)
{
  return _[a1 nominalCycleRate];
}

id objc_msgSend_nonConnectableAdvertisingAddress(void *a1, const char *a2, ...)
{
  return _[a1 nonConnectableAdvertisingAddress];
}

id objc_msgSend_notificationType(void *a1, const char *a2, ...)
{
  return _[a1 notificationType];
}

id objc_msgSend_notifyDeviceUnlockedSinceBoot(void *a1, const char *a2, ...)
{
  return _[a1 notifyDeviceUnlockedSinceBoot];
}

id objc_msgSend_notifyServiceClientWithIdentifier_isRunning_(void *a1, const char *a2, ...)
{
  return [a1 notifyServiceClientWithIdentifier:isRunning:];
}

id objc_msgSend_now(void *a1, const char *a2, ...)
{
  return _[a1 now];
}

id objc_msgSend_null(void *a1, const char *a2, ...)
{
  return _[a1 null];
}

id objc_msgSend_numCharacteristicsLeftToRead(void *a1, const char *a2, ...)
{
  return _[a1 numCharacteristicsLeftToRead];
}

id objc_msgSend_numberOfSteps(void *a1, const char *a2, ...)
{
  return _[a1 numberOfSteps];
}

id objc_msgSend_numberWithBool_(void *a1, const char *a2, ...)
{
  return [a1 numberWithBool:x0];
}

id objc_msgSend_numberWithDouble_(void *a1, const char *a2, ...)
{
  return [a1 numberWithDouble:];
}

id objc_msgSend_numberWithFloat_(void *a1, const char *a2, ...)
{
  return [a1 numberWithFloat:];
}

id objc_msgSend_numberWithInt_(void *a1, const char *a2, ...)
{
  return [a1 numberWithInt:];
}

id objc_msgSend_numberWithInteger_(void *a1, const char *a2, ...)
{
  return [a1 numberWithInteger:];
}

id objc_msgSend_numberWithUnsignedChar_(void *a1, const char *a2, ...)
{
  return [a1 numberWithUnsignedChar:];
}

id objc_msgSend_numberWithUnsignedInt_(void *a1, const char *a2, ...)
{
  return [a1 numberWithUnsignedInt:];
}

id objc_msgSend_numberWithUnsignedInteger_(void *a1, const char *a2, ...)
{
  return [a1 numberWithUnsignedInteger:];
}

id objc_msgSend_numberWithUnsignedLong_(void *a1, const char *a2, ...)
{
  return [a1 numberWithUnsignedLong:];
}

id objc_msgSend_numberWithUnsignedLongLong_(void *a1, const char *a2, ...)
{
  return [a1 numberWithUnsignedLongLong:];
}

id objc_msgSend_numberWithUnsignedShort_(void *a1, const char *a2, ...)
{
  return [a1 numberWithUnsignedShort:];
}

id objc_msgSend_object_didUpdateRegion_previousRegion_(void *a1, const char *a2, ...)
{
  return [a1 object:didUpdateRegion:previousRegion:];
}

id objc_msgSend_objectAtIndex_(void *a1, const char *a2, ...)
{
  return [a1 objectAtIndex:];
}

id objc_msgSend_objectAtIndexedSubscript_(void *a1, const char *a2, ...)
{
  return [a1 objectAtIndexedSubscript:];
}

id objc_msgSend_objectEnumerator(void *a1, const char *a2, ...)
{
  return _[a1 objectEnumerator];
}

id objc_msgSend_objectForKey_(void *a1, const char *a2, ...)
{
  return [a1 objectForKey:];
}

id objc_msgSend_objectForKey_ofClass_(void *a1, const char *a2, ...)
{
  return [a1 objectForKey:ofClass:];
}

id objc_msgSend_objectForKeyedSubscript_(void *a1, const char *a2, ...)
{
  return [a1 objectForKeyedSubscript:];
}

id objc_msgSend_objectFromBluetoothDevice_(void *a1, const char *a2, ...)
{
  return [a1 objectFromBluetoothDevice:];
}

id objc_msgSend_objectFromIdentifier_(void *a1, const char *a2, ...)
{
  return [a1 objectFromIdentifier:];
}

id objc_msgSend_objectInRawTokenOPACKDictForKey_(void *a1, const char *a2, ...)
{
  return [a1 objectInRawTokenOPACKDictForKey:];
}

id objc_msgSend_observationRegistrar(void *a1, const char *a2, ...)
{
  return _[a1 observationRegistrar];
}

id objc_msgSend_observerTokens(void *a1, const char *a2, ...)
{
  return _[a1 observerTokens];
}

id objc_msgSend_oobKeys(void *a1, const char *a2, ...)
{
  return _[a1 oobKeys];
}

id objc_msgSend_openURL_configuration_completionHandler_(void *a1, const char *a2, ...)
{
  return [a1 openURL:x0 configuration:x1 completionHandler:x2];
}

id objc_msgSend_outProbabilities(void *a1, const char *a2, ...)
{
  return _[a1 outProbabilities];
}

id objc_msgSend_outerBoundary(void *a1, const char *a2, ...)
{
  return _[a1 outerBoundary];
}

id objc_msgSend_outputs(void *a1, const char *a2, ...)
{
  return _[a1 outputs];
}

id objc_msgSend_overrideSpatialScore_(void *a1, const char *a2, ...)
{
  return [a1 overrideSpatialScore:];
}

id objc_msgSend_overrideTimestamp_(void *a1, const char *a2, ...)
{
  return [a1 overrideTimestamp:];
}

id objc_msgSend_parameters(void *a1, const char *a2, ...)
{
  return _[a1 parameters];
}

id objc_msgSend_parsedAccessoryConfigData(void *a1, const char *a2, ...)
{
  return _[a1 parsedAccessoryConfigData];
}

id objc_msgSend_partIdentifier(void *a1, const char *a2, ...)
{
  return _[a1 partIdentifier];
}

id objc_msgSend_passiveAccessIntent(void *a1, const char *a2, ...)
{
  return _[a1 passiveAccessIntent];
}

id objc_msgSend_pathForResource_ofType_(void *a1, const char *a2, ...)
{
  return [a1 pathForResource:x0 ofType:x1];
}

id objc_msgSend_pathForResource_ofType_inDirectory_forLocalization_(void *a1, const char *a2, ...)
{
  return [a1 pathForResource:x0 ofType:x1 inDirectory:x2 forLocalization:x3];
}

id objc_msgSend_pause(void *a1, const char *a2, ...)
{
  return _[a1 pause];
}

id objc_msgSend_pause_(void *a1, const char *a2, ...)
{
  return [a1 pause:];
}

id objc_msgSend_pauseCalled(void *a1, const char *a2, ...)
{
  return _[a1 pauseCalled];
}

id objc_msgSend_pauseWithSource_(void *a1, const char *a2, ...)
{
  return [a1 pauseWithSource:];
}

id objc_msgSend_payload(void *a1, const char *a2, ...)
{
  return _[a1 payload];
}

id objc_msgSend_payloadChangeObserverQueue(void *a1, const char *a2, ...)
{
  return _[a1 payloadChangeObserverQueue];
}

id objc_msgSend_peerDiscoveryToken(void *a1, const char *a2, ...)
{
  return _[a1 peerDiscoveryToken];
}

id objc_msgSend_peerHangupReceived_(void *a1, const char *a2, ...)
{
  return [a1 peerHangupReceived:];
}

id objc_msgSend_peerIdentifier(void *a1, const char *a2, ...)
{
  return _[a1 peerIdentifier];
}

id objc_msgSend_peerInactivityPeriodExceeded_(void *a1, const char *a2, ...)
{
  return [a1 peerInactivityPeriodExceeded:];
}

id objc_msgSend_peerToken(void *a1, const char *a2, ...)
{
  return _[a1 peerToken];
}

id objc_msgSend_peerTrackingInitialState(void *a1, const char *a2, ...)
{
  return _[a1 peerTrackingInitialState];
}

id objc_msgSend_peerTrackingTerminalState(void *a1, const char *a2, ...)
{
  return _[a1 peerTrackingTerminalState];
}

id objc_msgSend_peerTrackingWithDiscoveryState_advertisingState_rangingState_algorithmOutputFlags_receivedSignalFlags_tellClientAboutPeer_clientWantsUpdates_nbUwbAcquisitionChannelIdx_(void *a1, const char *a2, ...)
{
  return [_objc_msgSend(a1, "peerTrackingWithDiscoveryState:advertisingState:rangingState:algorithmOutputFlags:receivedSignalFlags:tellClientAboutPeer:clientWantsUpdates:nbUwbAcquisitionChannelIdx:)];
}

id objc_msgSend_peripheral(void *a1, const char *a2, ...)
{
  return _[a1 peripheral];
}

id objc_msgSend_persistWhileDetached(void *a1, const char *a2, ...)
{
  return _[a1 persistWhileDetached];
}

id objc_msgSend_pid(void *a1, const char *a2, ...)
{
  return _[a1 pid];
}

id objc_msgSend_pitch(void *a1, const char *a2, ...)
{
  return _[a1 pitch];
}

id objc_msgSend_populateOrderedBiasEstimatorOutputs(void *a1, const char *a2, ...)
{
  return _[a1 populateOrderedBiasEstimatorOutputs];
}

id objc_msgSend_populateOrderedInputFeature(void *a1, const char *a2, ...)
{
  return _[a1 populateOrderedInputFeature];
}

id objc_msgSend_portType(void *a1, const char *a2, ...)
{
  return _[a1 portType];
}

id objc_msgSend_positioningSensorSessionStarted(void *a1, const char *a2, ...)
{
  return _[a1 positioningSensorSessionStarted];
}

id objc_msgSend_positioningSensorSessionStopped(void *a1, const char *a2, ...)
{
  return _[a1 positioningSensorSessionStopped];
}

id objc_msgSend_postComponentStatusEventFor_status_withReply_(void *a1, const char *a2, ...)
{
  return [a1 postComponentStatusEventFor:status:withReply:];
}

id objc_msgSend_powerBudgetProvider(void *a1, const char *a2, ...)
{
  return _[a1 powerBudgetProvider];
}

id objc_msgSend_predicateMatchingIdentifier_(void *a1, const char *a2, ...)
{
  return [a1 predicateMatchingIdentifier:];
}

id objc_msgSend_predicateWithBlock_(void *a1, const char *a2, ...)
{
  return [a1 predicateWithBlock:];
}

id objc_msgSend_predictBiasEstimate_scaledInputFeatures_output_(void *a1, const char *a2, ...)
{
  return [_objc_msgSend(a1, "predictBiasEstimate:scaledInputFeatures:output:");
}

id objc_msgSend_predictOutput_(void *a1, const char *a2, ...)
{
  return [a1 predictOutput:];
}

id objc_msgSend_predictionFromFeatures_error_(void *a1, const char *a2, ...)
{
  return [_objc_msgSend(a1, "predictionFromFeatures:error:");
}

id objc_msgSend_preferredLanguages(void *a1, const char *a2, ...)
{
  return _[a1 preferredLanguages];
}

id objc_msgSend_preferredLocalizationsFromArray_forPreferences_(void *a1, const char *a2, ...)
{
  return [a1 preferredLocalizationsFromArray:x0 forPreferences:x1];
}

id objc_msgSend_preferredUpdateRate(void *a1, const char *a2, ...)
{
  return _[a1 preferredUpdateRate];
}

id objc_msgSend_prefetchAcwgUrsk_(void *a1, const char *a2, ...)
{
  return [a1 prefetchAcwgUrsk:];
}

id objc_msgSend_prepareRangingOnDevice_(void *a1, const char *a2, ...)
{
  return [a1 prepareRangingOnDevice:];
}

id objc_msgSend_preprocessInputFeatures_(void *a1, const char *a2, ...)
{
  return [a1 preprocessInputFeatures:];
}

id objc_msgSend_presenceConfigData(void *a1, const char *a2, ...)
{
  return _[a1 presenceConfigData];
}

id objc_msgSend_presentUserAuthorizationPrompt_forAuditToken_withBundleRecord_(void *a1, const char *a2, ...)
{
  return [_objc_msgSend(a1, "presentUserAuthorizationPrompt:forAuditToken:withBundleRecord:");
}

id objc_msgSend_pressure(void *a1, const char *a2, ...)
{
  return _[a1 pressure];
}

id objc_msgSend_previousState(void *a1, const char *a2, ...)
{
  return _[a1 previousState];
}

id objc_msgSend_prewarmSecureElementChannel(void *a1, const char *a2, ...)
{
  return _[a1 prewarmSecureElementChannel];
}

id objc_msgSend_prewarmUWB(void *a1, const char *a2, ...)
{
  return _[a1 prewarmUWB];
}

id objc_msgSend_printableState(void *a1, const char *a2, ...)
{
  return _[a1 printableState];
}

id objc_msgSend_printableStateOnQueue(void *a1, const char *a2, ...)
{
  return _[a1 printableStateOnQueue];
}

id objc_msgSend_probeAuthorizationForServiceListenerWithIdentifier_(void *a1, const char *a2, ...)
{
  return [a1 probeAuthorizationForServiceListenerWithIdentifier:];
}

id objc_msgSend_probeRegions(void *a1, const char *a2, ...)
{
  return _[a1 probeRegions];
}

id objc_msgSend_proceedWithPowerStatsQuery(void *a1, const char *a2, ...)
{
  return _[a1 proceedWithPowerStatsQuery];
}

id objc_msgSend_processAcwgM1Msg_withSessionTriggerReason_(void *a1, const char *a2, ...)
{
  return [a1 processAcwgM1Msg:withSessionTriggerReason:];
}

id objc_msgSend_processAcwgM3Msg_(void *a1, const char *a2, ...)
{
  return [a1 processAcwgM3Msg:];
}

id objc_msgSend_processAcwgRangingSessionResumeRequestMsg_withResumeTriggerReason_(void *a1, const char *a2, ...)
{
  return [a1 processAcwgRangingSessionResumeRequestMsg:withResumeTriggerReason:];
}

id objc_msgSend_processAdvertisement_receivedOOBFromPeer_(void *a1, const char *a2, ...)
{
  return [a1 processAdvertisement:receivedOOBFromPeer:];
}

id objc_msgSend_processBluetoothHostTimeSyncWithType_btcClockTicks_eventCounter_monotonicTimeSec_response_(void *a1, const char *a2, ...)
{
  return [_objc_msgSend(a1, "processBluetoothHostTimeSyncWithType:btcClockTicks:eventCounter:monotonicTimeSec:response:");
}

id objc_msgSend_processBluetoothHostTimeSyncWithType_btcClockTicks_eventCounter_reply_(void *a1, const char *a2, ...)
{
  return [_objc_msgSend(a1, "processBluetoothHostTimeSyncWithType:btcClockTicks:eventCounter:reply:");
}

id objc_msgSend_processClientDiscoveryEventForToken_sharedConfigurationData_(void *a1, const char *a2, ...)
{
  return [a1 processClientDiscoveryEventForToken:sharedConfigurationData:];
}

id objc_msgSend_processClientDiscoveryEventWithSharedConfigurationData_(void *a1, const char *a2, ...)
{
  return [a1 processClientDiscoveryEventWithSharedConfigurationData:];
}

id objc_msgSend_processClientRemovePeerEvent(void *a1, const char *a2, ...)
{
  return _[a1 processClientRemovePeerEvent];
}

id objc_msgSend_processClientRemovePeerEventForToken_(void *a1, const char *a2, ...)
{
  return [a1 processClientRemovePeerEventForToken:];
}

id objc_msgSend_processDCKMessage_(void *a1, const char *a2, ...)
{
  return [a1 processDCKMessage:];
}

id objc_msgSend_processDCKMessage_reply_(void *a1, const char *a2, ...)
{
  return [a1 processDCKMessage:reply:];
}

id objc_msgSend_processIdentifier(void *a1, const char *a2, ...)
{
  return _[a1 processIdentifier];
}

id objc_msgSend_processInfo(void *a1, const char *a2, ...)
{
  return _[a1 processInfo];
}

id objc_msgSend_processLostEventReceivedOOBFromPeer_(void *a1, const char *a2, ...)
{
  return [a1 processLostEventReceivedOOBFromPeer:];
}

id objc_msgSend_processName(void *a1, const char *a2, ...)
{
  return _[a1 processName];
}

id objc_msgSend_processNameBestGuess(void *a1, const char *a2, ...)
{
  return _[a1 processNameBestGuess];
}

id objc_msgSend_processPeerLocation_forPeer_(void *a1, const char *a2, ...)
{
  return [a1 processPeerLocation:forPeer:];
}

id objc_msgSend_processSelfHeading_(void *a1, const char *a2, ...)
{
  return [a1 processSelfHeading:];
}

id objc_msgSend_processSelfLocation_(void *a1, const char *a2, ...)
{
  return [a1 processSelfLocation:];
}

id objc_msgSend_processUWBResultForRegionMonitoring_roseSolution_processingOptions_(void *a1, const char *a2, ...)
{
  return [a1 processUWBResultForRegionMonitoring:roseSolution:processingOptions:];
}

id objc_msgSend_processUWBResultForSyntheticAperture_roseSolution_(void *a1, const char *a2, ...)
{
  return [_objc_msgSend(a1, "processUWBResultForSyntheticAperture:roseSolution:");
}

id objc_msgSend_processUpdatedConfiguration_forClientIdentifier_(void *a1, const char *a2, ...)
{
  return [a1 processUpdatedConfiguration:forClientIdentifier:];
}

id objc_msgSend_processUpdatedLockState_(void *a1, const char *a2, ...)
{
  return [a1 processUpdatedLockState:];
}

id objc_msgSend_processVisionInput_(void *a1, const char *a2, ...)
{
  return [a1 processVisionInput:];
}

id objc_msgSend_productID(void *a1, const char *a2, ...)
{
  return _[a1 productID];
}

id objc_msgSend_productInfoWithProductID_(void *a1, const char *a2, ...)
{
  return [a1 productInfoWithProductID:];
}

id objc_msgSend_productName(void *a1, const char *a2, ...)
{
  return _[a1 productName];
}

id objc_msgSend_propertyListWithData_options_format_error_(void *a1, const char *a2, ...)
{
  return [_objc_msgSend(a1, "propertyListWithData:options:format:error:");
}

id objc_msgSend_protobufLogger(void *a1, const char *a2, ...)
{
  return _[a1 protobufLogger];
}

id objc_msgSend_protocolVersion(void *a1, const char *a2, ...)
{
  return _[a1 protocolVersion];
}

id objc_msgSend_provideFindingSolution_(void *a1, const char *a2, ...)
{
  return [_objc_msgSend(a1, "provideFindingSolution:");
}

id objc_msgSend_proximityPairingProductID(void *a1, const char *a2, ...)
{
  return _[a1 proximityPairingProductID];
}

id objc_msgSend_publishBytes_amount_(void *a1, const char *a2, ...)
{
  return [a1 publishBytes:amount:];
}

id objc_msgSend_publishWithAuditToken_(void *a1, const char *a2, ...)
{
  return [a1 publishWithAuditToken:];
}

id objc_msgSend_publisherForClient_(void *a1, const char *a2, ...)
{
  return [a1 publisherForClient:];
}

id objc_msgSend_quaternion(void *a1, const char *a2, ...)
{
  return _[a1 quaternion];
}

id objc_msgSend_quaternionW(void *a1, const char *a2, ...)
{
  return _[a1 quaternionW];
}

id objc_msgSend_quaternionX(void *a1, const char *a2, ...)
{
  return _[a1 quaternionX];
}

id objc_msgSend_quaternionY(void *a1, const char *a2, ...)
{
  return _[a1 quaternionY];
}

id objc_msgSend_quaternionZ(void *a1, const char *a2, ...)
{
  return _[a1 quaternionZ];
}

id objc_msgSend_queryDeviceCapabilities_(void *a1, const char *a2, ...)
{
  return [a1 queryDeviceCapabilities:];
}

id objc_msgSend_queryItemWithName_value_(void *a1, const char *a2, ...)
{
  return [a1 queryItemWithName:value:];
}

id objc_msgSend_radius(void *a1, const char *a2, ...)
{
  return _[a1 radius];
}

id objc_msgSend_raise_format_(void *a1, const char *a2, ...)
{
  return [a1 raise:];
}

id objc_msgSend_rangeBiasEstimate(void *a1, const char *a2, ...)
{
  return _[a1 rangeBiasEstimate];
}

id objc_msgSend_rangeBiasEstimatorModelDataTransformer(void *a1, const char *a2, ...)
{
  return _[a1 rangeBiasEstimatorModelDataTransformer];
}

id objc_msgSend_rangeUncertainty(void *a1, const char *a2, ...)
{
  return _[a1 rangeUncertainty];
}

id objc_msgSend_rangingAcquisitionType(void *a1, const char *a2, ...)
{
  return _[a1 rangingAcquisitionType];
}

id objc_msgSend_rangingBecameUnavailable(void *a1, const char *a2, ...)
{
  return _[a1 rangingBecameUnavailable];
}

id objc_msgSend_rangingRequestDidUpdateStatus_(void *a1, const char *a2, ...)
{
  return [a1 rangingRequestDidUpdateStatus:];
}

id objc_msgSend_rangingRetryCount(void *a1, const char *a2, ...)
{
  return _[a1 rangingRetryCount];
}

id objc_msgSend_rangingRetryTimer(void *a1, const char *a2, ...)
{
  return _[a1 rangingRetryTimer];
}

id objc_msgSend_rangingServiceDidUpdateState_cause_(void *a1, const char *a2, ...)
{
  return [_objc_msgSend(a1, "rangingServiceDidUpdateState:cause:");
}

id objc_msgSend_rangingSession(void *a1, const char *a2, ...)
{
  return _[a1 rangingSession];
}

id objc_msgSend_rangingState(void *a1, const char *a2, ...)
{
  return _[a1 rangingState];
}

id objc_msgSend_rangingTriggerType(void *a1, const char *a2, ...)
{
  return _[a1 rangingTriggerType];
}

id objc_msgSend_rawRange(void *a1, const char *a2, ...)
{
  return _[a1 rawRange];
}

id objc_msgSend_rawToken(void *a1, const char *a2, ...)
{
  return _[a1 rawToken];
}

id objc_msgSend_readAllItemsWithService_synchronizable_systemKeychain_(void *a1, const char *a2, ...)
{
  return [a1 readAllItemsWithService:synchronizable:systemKeychain:];
}

id objc_msgSend_readItemWithService_account_synchronizable_systemKeychain_(void *a1, const char *a2, ...)
{
  return [a1 readItemWithService:x0 account:x1 synchronizable:x2 systemKeychain:x3];
}

id objc_msgSend_readValueForCharacteristic_(void *a1, const char *a2, ...)
{
  return [a1 readValueForCharacteristic:];
}

id objc_msgSend_readingMultiConfigCharacteristics(void *a1, const char *a2, ...)
{
  return _[a1 readingMultiConfigCharacteristics];
}

id objc_msgSend_real(void *a1, const char *a2, ...)
{
  return _[a1 real];
}

id objc_msgSend_reasons(void *a1, const char *a2, ...)
{
  return _[a1 reasons];
}

id objc_msgSend_receivedSignalFlags(void *a1, const char *a2, ...)
{
  return _[a1 receivedSignalFlags];
}

id objc_msgSend_recentlyObservedObjectsCache(void *a1, const char *a2, ...)
{
  return _[a1 recentlyObservedObjectsCache];
}

id objc_msgSend_refreshRangingForToken_(void *a1, const char *a2, ...)
{
  return [a1 refreshRangingForToken:];
}

id objc_msgSend_regionName(void *a1, const char *a2, ...)
{
  return _[a1 regionName];
}

id objc_msgSend_regionSizeCategory(void *a1, const char *a2, ...)
{
  return _[a1 regionSizeCategory];
}

id objc_msgSend_registerDelegate_(void *a1, const char *a2, ...)
{
  return [a1 registerDelegate:];
}

id objc_msgSend_registerForActivityWithIdentifier_(void *a1, const char *a2, ...)
{
  return [a1 registerForActivityWithIdentifier:];
}

id objc_msgSend_registerForInternalBluetoothSamples_(void *a1, const char *a2, ...)
{
  return [a1 registerForInternalBluetoothSamples:];
}

id objc_msgSend_registerForInternalBluetoothSamples_reportCache_(void *a1, const char *a2, ...)
{
  return [a1 registerForInternalBluetoothSamples:reportCache:];
}

id objc_msgSend_registerForLocalNotifications(void *a1, const char *a2, ...)
{
  return _[a1 registerForLocalNotifications];
}

id objc_msgSend_registerForTaskWithIdentifier_usingQueue_launchHandler_(void *a1, const char *a2, ...)
{
  return [a1 registerForTaskWithIdentifier:usingQueue:launchHandler:];
}

id objc_msgSend_registerForVisionInput_(void *a1, const char *a2, ...)
{
  return [a1 registerForVisionInput:];
}

id objc_msgSend_registerNBAMMSSessionWithToken_isFinder_client_serviceRequest_startRangingOptions_sharedProtocol_(void *a1, const char *a2, ...)
{
  return [_objc_msgSend(a1, "registerNBAMMSSessionWithToken:isFinder:client:serviceRequest:startRangingOptions:sharedProtocol:");
}

id objc_msgSend_registerObserver_withIdentifier_(void *a1, const char *a2, ...)
{
  return [a1 registerObserver:withIdentifier:];
}

id objc_msgSend_registerObserversForSession_(void *a1, const char *a2, ...)
{
  return [a1 registerObserversForSession:];
}

id objc_msgSend_registerRequestID_options_handler_(void *a1, const char *a2, ...)
{
  return [a1 registerRequestID:options:handler:];
}

id objc_msgSend_registerSessionWithConnection_observerSession_(void *a1, const char *a2, ...)
{
  return [a1 registerSessionWithConnection:observerSession:];
}

id objc_msgSend_registerWithQueue_callback_(void *a1, const char *a2, ...)
{
  return [a1 registerWithQueue:callback:];
}

id objc_msgSend_relationship(void *a1, const char *a2, ...)
{
  return _[a1 relationship];
}

id objc_msgSend_relativeAltitude(void *a1, const char *a2, ...)
{
  return _[a1 relativeAltitude];
}

id objc_msgSend_relayDCKMessage_(void *a1, const char *a2, ...)
{
  return [a1 relayDCKMessage:];
}

id objc_msgSend_relayInfoToNewObserver_(void *a1, const char *a2, ...)
{
  return [a1 relayInfoToNewObserver:];
}

id objc_msgSend_relayToObserversForToken_blockToRelay_(void *a1, const char *a2, ...)
{
  return [a1 relayToObserversForToken:x0 blockToRelay:x1];
}

id objc_msgSend_remote(void *a1, const char *a2, ...)
{
  return _[a1 remote];
}

id objc_msgSend_remoteDevice_didChangeState_(void *a1, const char *a2, ...)
{
  return [a1 remoteDevice:didChangeState:];
}

id objc_msgSend_remoteObjectProxy(void *a1, const char *a2, ...)
{
  return _[a1 remoteObjectProxy];
}

id objc_msgSend_remoteObjectProxyWithErrorHandler_(void *a1, const char *a2, ...)
{
  return [a1 remoteObjectProxyWithErrorHandler:];
}

id objc_msgSend_remoteTxAntennaMask(void *a1, const char *a2, ...)
{
  return _[a1 remoteTxAntennaMask];
}

id objc_msgSend_removeAllDiscoveryTypes(void *a1, const char *a2, ...)
{
  return _[a1 removeAllDiscoveryTypes];
}

id objc_msgSend_removeAllObjects(void *a1, const char *a2, ...)
{
  return _[a1 removeAllObjects];
}

id objc_msgSend_removeClientWithIdentifier_(void *a1, const char *a2, ...)
{
  return [a1 removeClientWithIdentifier:];
}

id objc_msgSend_removeClientWithIdentifier_dueToTimeout_(void *a1, const char *a2, ...)
{
  return [a1 removeClientWithIdentifier:dueToTimeout:];
}

id objc_msgSend_removeObject_(void *a1, const char *a2, ...)
{
  return [a1 removeObject:];
}

id objc_msgSend_removeObjectAtIndex_(void *a1, const char *a2, ...)
{
  return [a1 removeObjectAtIndex:];
}

id objc_msgSend_removeObjectForKey_(void *a1, const char *a2, ...)
{
  return [a1 removeObjectForKey:];
}

id objc_msgSend_removeObjectsForKeys_(void *a1, const char *a2, ...)
{
  return [a1 removeObjectsForKeys:];
}

id objc_msgSend_removeObjectsInRange_(void *a1, const char *a2, ...)
{
  return [a1 removeObjectsInRange:];
}

id objc_msgSend_removeObserver_(void *a1, const char *a2, ...)
{
  return [a1 removeObserver:];
}

id objc_msgSend_removeObserver_forKeyPath_(void *a1, const char *a2, ...)
{
  return [a1 removeObserver:forKeyPath:];
}

id objc_msgSend_removeObserver_name_object_(void *a1, const char *a2, ...)
{
  return [a1 removeObserver:name:object:];
}

id objc_msgSend_removeObserverWithIdentifier_(void *a1, const char *a2, ...)
{
  return [a1 removeObserverWithIdentifier:];
}

id objc_msgSend_removeObservers_(void *a1, const char *a2, ...)
{
  return [a1 removeObservers:];
}

id objc_msgSend_removePayloadChangeObserver_(void *a1, const char *a2, ...)
{
  return [a1 removePayloadChangeObserver:];
}

id objc_msgSend_removePeerDiscoveryToken_(void *a1, const char *a2, ...)
{
  return [a1 removePeerDiscoveryToken:];
}

id objc_msgSend_removePeerToken_completion_(void *a1, const char *a2, ...)
{
  return [a1 removePeerToken:x0 completion:x1];
}

id objc_msgSend_removeServiceClientWithIdentifier_(void *a1, const char *a2, ...)
{
  return [a1 removeServiceClientWithIdentifier:];
}

id objc_msgSend_removeServiceListenerWithIdentifier_(void *a1, const char *a2, ...)
{
  return [a1 removeServiceListenerWithIdentifier:];
}

id objc_msgSend_removeStaleSamples(void *a1, const char *a2, ...)
{
  return _[a1 removeStaleSamples];
}

id objc_msgSend_replaceItemAtURL_withItemAtURL_backupItemName_options_resultingItemURL_error_(void *a1, const char *a2, ...)
{
  return [a1 replaceItemAtURL:withItemAtURL:backupItemName:options:resultingItemURL:error:];
}

id objc_msgSend_reportAndLogNearbyObject_(void *a1, const char *a2, ...)
{
  return [a1 reportAndLogNearbyObject];
}

id objc_msgSend_reportRangingRequestStatusUpdate_(void *a1, const char *a2, ...)
{
  return [a1 reportRangingRequestStatusUpdate:];
}

id objc_msgSend_requestAcwgRangingSessionSuspend_withSuspendTriggerReason_(void *a1, const char *a2, ...)
{
  return [a1 requestAcwgRangingSessionSuspend:withSuspendTriggerReason:];
}

id objc_msgSend_requestAsyncServiceStatusUpdate(void *a1, const char *a2, ...)
{
  return _[a1 requestAsyncServiceStatusUpdate];
}

id objc_msgSend_requiresBiasCorrection(void *a1, const char *a2, ...)
{
  return _[a1 requiresBiasCorrection];
}

id objc_msgSend_requiresLargeRegions(void *a1, const char *a2, ...)
{
  return _[a1 requiresLargeRegions];
}

id objc_msgSend_requiresNarrowbandToRun(void *a1, const char *a2, ...)
{
  return _[a1 requiresNarrowbandToRun];
}

id objc_msgSend_requiresSpatialInteractionBluetoothResource(void *a1, const char *a2, ...)
{
  return _[a1 requiresSpatialInteractionBluetoothResource];
}

id objc_msgSend_requiresUWBToRun(void *a1, const char *a2, ...)
{
  return _[a1 requiresUWBToRun];
}

id objc_msgSend_requiresUserIntent(void *a1, const char *a2, ...)
{
  return _[a1 requiresUserIntent];
}

id objc_msgSend_reset(void *a1, const char *a2, ...)
{
  return _[a1 reset];
}

id objc_msgSend_resetARSession(void *a1, const char *a2, ...)
{
  return _[a1 resetARSession];
}

id objc_msgSend_resetAnalytics(void *a1, const char *a2, ...)
{
  return _[a1 resetAnalytics];
}

id objc_msgSend_resourceBundleDir(void *a1, const char *a2, ...)
{
  return _[a1 resourceBundleDir];
}

id objc_msgSend_resourcePath(void *a1, const char *a2, ...)
{
  return _[a1 resourcePath];
}

id objc_msgSend_resourcesManager(void *a1, const char *a2, ...)
{
  return _[a1 resourcesManager];
}

id objc_msgSend_resultConfigCharacteristics(void *a1, const char *a2, ...)
{
  return _[a1 resultConfigCharacteristics];
}

id objc_msgSend_resume(void *a1, const char *a2, ...)
{
  return _[a1 resume];
}

id objc_msgSend_retrieveConnectedPeripheralsWithServices_allowAll_(void *a1, const char *a2, ...)
{
  return [a1 retrieveConnectedPeripheralsWithServices:allowAll:];
}

id objc_msgSend_retrievePairedPeers(void *a1, const char *a2, ...)
{
  return _[a1 retrievePairedPeers];
}

id objc_msgSend_reverseObjectEnumerator(void *a1, const char *a2, ...)
{
  return _[a1 reverseObjectEnumerator];
}

id objc_msgSend_revokeFindingExperience(void *a1, const char *a2, ...)
{
  return _[a1 revokeFindingExperience];
}

id objc_msgSend_revokeReason(void *a1, const char *a2, ...)
{
  return _[a1 revokeReason];
}

id objc_msgSend_roll(void *a1, const char *a2, ...)
{
  return _[a1 roll];
}

id objc_msgSend_roseMACAddress(void *a1, const char *a2, ...)
{
  return _[a1 roseMACAddress];
}

id objc_msgSend_rotationRate(void *a1, const char *a2, ...)
{
  return _[a1 rotationRate];
}

id objc_msgSend_rssi(void *a1, const char *a2, ...)
{
  return _[a1 rssi];
}

id objc_msgSend_rssiDbm(void *a1, const char *a2, ...)
{
  return _[a1 rssiDbm];
}

id objc_msgSend_rttInitiator(void *a1, const char *a2, ...)
{
  return _[a1 rttInitiator];
}

id objc_msgSend_rttResponder(void *a1, const char *a2, ...)
{
  return _[a1 rttResponder];
}

id objc_msgSend_run(void *a1, const char *a2, ...)
{
  return _[a1 run];
}

id objc_msgSend_runMode_beforeDate_(void *a1, const char *a2, ...)
{
  return [a1 runMode:beforeDate:];
}

id objc_msgSend_runWithConfiguration_options_(void *a1, const char *a2, ...)
{
  return [a1 runWithConfiguration:options:];
}

id objc_msgSend_runWithConfiguration_reply_(void *a1, const char *a2, ...)
{
  return [a1 runWithConfiguration:reply:];
}

id objc_msgSend_runWithConfigurationCalled(void *a1, const char *a2, ...)
{
  return _[a1 runWithConfigurationCalled];
}

id objc_msgSend_running(void *a1, const char *a2, ...)
{
  return _[a1 running];
}

id objc_msgSend_rxAntennaPacket1(void *a1, const char *a2, ...)
{
  return _[a1 rxAntennaPacket1];
}

id objc_msgSend_rxAntennaPacket2(void *a1, const char *a2, ...)
{
  return _[a1 rxAntennaPacket2];
}

id objc_msgSend_scaleCirValuesIfRequired_(void *a1, const char *a2, ...)
{
  return [_objc_msgSend(a1, "scaleCirValuesIfRequired:");
}

id objc_msgSend_scanHexInt_(void *a1, const char *a2, ...)
{
  return [a1 scanHexInt:];
}

id objc_msgSend_scanRate(void *a1, const char *a2, ...)
{
  return _[a1 scanRate];
}

id objc_msgSend_scannerWithString_(void *a1, const char *a2, ...)
{
  return [a1 scannerWithString:];
}

id objc_msgSend_scheduleSendBarrierBlock_(void *a1, const char *a2, ...)
{
  return [a1 scheduleSendBarrierBlock:];
}

id objc_msgSend_scheduleWithBlock_(void *a1, const char *a2, ...)
{
  return [a1 scheduleWithBlock:];
}

id objc_msgSend_secureKey(void *a1, const char *a2, ...)
{
  return _[a1 secureKey];
}

id objc_msgSend_selectedTechnology(void *a1, const char *a2, ...)
{
  return _[a1 selectedTechnology];
}

id objc_msgSend_sendAnalyticsHeartbeatWasSuccessful_(void *a1, const char *a2, ...)
{
  return [a1 sendAnalyticsHeartbeatWasSuccessful:];
}

id objc_msgSend_sendDataToPeers_(void *a1, const char *a2, ...)
{
  return [a1 sendDataToPeers:];
}

id objc_msgSend_sendRequestID_request_options_responseHandler_(void *a1, const char *a2, ...)
{
  return [a1 sendRequestID:x0 request:x1 options:x2 responseHandler:x3];
}

id objc_msgSend_serialNumber(void *a1, const char *a2, ...)
{
  return _[a1 serialNumber];
}

id objc_msgSend_serialNumberLeft(void *a1, const char *a2, ...)
{
  return _[a1 serialNumberLeft];
}

id objc_msgSend_serialNumberRight(void *a1, const char *a2, ...)
{
  return _[a1 serialNumberRight];
}

id objc_msgSend_serialize_(void *a1, const char *a2, ...)
{
  return [a1 serialize:];
}

id objc_msgSend_serverSessionIdentifier(void *a1, const char *a2, ...)
{
  return _[a1 serverSessionIdentifier];
}

id objc_msgSend_service(void *a1, const char *a2, ...)
{
  return _[a1 service];
}

id objc_msgSend_serviceDidDiscoverNearbyObject_(void *a1, const char *a2, ...)
{
  return [a1 serviceDidDiscoverNearbyObject:];
}

id objc_msgSend_serviceDidGenerateShareableConfigurationData_(void *a1, const char *a2, ...)
{
  return [a1 serviceDidGenerateShareableConfigurationData:];
}

id objc_msgSend_serviceDidGenerateShareableConfigurationData_forObject_(void *a1, const char *a2, ...)
{
  return [a1 serviceDidGenerateShareableConfigurationData:forObject:];
}

id objc_msgSend_serviceDidRemoveNearbyObject_(void *a1, const char *a2, ...)
{
  return [a1 serviceDidRemoveNearbyObject:];
}

id objc_msgSend_serviceDidUpdateAlgorithmConvergenceState_forObject_(void *a1, const char *a2, ...)
{
  return [_objc_msgSend(a1, "serviceDidUpdateAlgorithmConvergenceState:forObject:");
}

id objc_msgSend_serviceDidUpdateNearbyObjects_(void *a1, const char *a2, ...)
{
  return [a1 serviceDidUpdateNearbyObjects:];
}

id objc_msgSend_serviceForToken_createIfNotExists_(void *a1, const char *a2, ...)
{
  return [a1 serviceForToken:createIfNotExists:];
}

id objc_msgSend_serviceName(void *a1, const char *a2, ...)
{
  return _[a1 serviceName];
}

id objc_msgSend_serviceRequest(void *a1, const char *a2, ...)
{
  return _[a1 serviceRequest];
}

id objc_msgSend_serviceRequestDidUpdateStatus_(void *a1, const char *a2, ...)
{
  return [a1 serviceRequestDidUpdateStatus:];
}

id objc_msgSend_serviceWithQueue_(void *a1, const char *a2, ...)
{
  return [a1 serviceWithQueue:];
}

id objc_msgSend_services(void *a1, const char *a2, ...)
{
  return _[a1 services];
}

id objc_msgSend_session_didDiscoverNearbyObject_(void *a1, const char *a2, ...)
{
  return [_objc_msgSend(a1, "session:didDiscoverNearbyObject:");
}

id objc_msgSend_session_didFailWithError_(void *a1, const char *a2, ...)
{
  return [a1 session:didFailWithError:];
}

id objc_msgSend_session_didGenerateShareableConfigurationData_forObject_(void *a1, const char *a2, ...)
{
  return [_objc_msgSend(a1, "session:didGenerateShareableConfigurationData:forObject:");
}

id objc_msgSend_session_didInvalidateWithError_(void *a1, const char *a2, ...)
{
  return [_objc_msgSend(a1, "session:didInvalidateWithError:");
}

id objc_msgSend_session_didPrefetchAcwgUrsk_error_(void *a1, const char *a2, ...)
{
  return [_objc_msgSend(a1, "session:didPrefetchAcwgUrsk:error:");
}

id objc_msgSend_session_didProcessAcwgM1MsgWithResponse_error_(void *a1, const char *a2, ...)
{
  return [_objc_msgSend(a1, "session:didProcessAcwgM1MsgWithResponse:error:");
}

id objc_msgSend_session_didProcessAcwgM3MsgWithResponse_error_(void *a1, const char *a2, ...)
{
  return [_objc_msgSend(a1, "session:didProcessAcwgM3MsgWithResponse:error:");
}

id objc_msgSend_session_didProcessAcwgRangingSessionResumeRequestMsgWithResponse_error_(void *a1, const char *a2, ...)
{
  return [_objc_msgSend(a1, "session:didProcessAcwgRangingSessionResumeRequestMsgWithResponse:error:");
}

id objc_msgSend_session_didProcessBluetoothHostTimeSyncWithResponse_error_(void *a1, const char *a2, ...)
{
  return [_objc_msgSend(a1, "session:didProcessBluetoothHostTimeSyncWithResponse:error:");
}

id objc_msgSend_session_didReceiveRangingAuthRecommendation_forObject_(void *a1, const char *a2, ...)
{
  return [_objc_msgSend(a1, "session:didReceiveRangingAuthRecommendation:forObject:");
}

id objc_msgSend_session_didRemoveNearbyObjects_withReason_(void *a1, const char *a2, ...)
{
  return [a1 session:didRemoveNearbyObjects:withReason:];
}

id objc_msgSend_session_didStartAcwgRanging_(void *a1, const char *a2, ...)
{
  return [a1 session:didStartAcwgRanging:];
}

id objc_msgSend_session_didSuspendAcwgRanging_(void *a1, const char *a2, ...)
{
  return [a1 session:didSuspendAcwgRanging:];
}

id objc_msgSend_session_didUpdateAlgorithmConvergence_forObject_(void *a1, const char *a2, ...)
{
  return [_objc_msgSend(a1, "session:didUpdateAlgorithmConvergence:forObject:");
}

id objc_msgSend_session_didUpdateAlgorithmState_forObject_(void *a1, const char *a2, ...)
{
  return [a1 session:didUpdateAlgorithmState:forObject:];
}

id objc_msgSend_session_didUpdateHealthStatus_(void *a1, const char *a2, ...)
{
  return [a1 session:didUpdateHealthStatus:];
}

id objc_msgSend_session_didUpdateHomeDeviceUWBRangingAvailability_(void *a1, const char *a2, ...)
{
  return [_objc_msgSend(a1, "session:didUpdateHomeDeviceUWBRangingAvailability:");
}

id objc_msgSend_session_didUpdateLocalMotionState_(void *a1, const char *a2, ...)
{
  return [a1 session:didUpdateLocalMotionState:];
}

id objc_msgSend_session_didUpdateNearbyObjects_(void *a1, const char *a2, ...)
{
  return [a1 session:didUpdateNearbyObjects:];
}

id objc_msgSend_session_object_didUpdateRegion_previousRegion_(void *a1, const char *a2, ...)
{
  return [a1 session:object:didUpdateRegion:previousRegion:];
}

id objc_msgSend_session_relayDCKMessage_(void *a1, const char *a2, ...)
{
  return [a1 session:relayDCKMessage:];
}

id objc_msgSend_session_requestAcwgRangingSessionSuspend_withSuspendTriggerReason_(void *a1, const char *a2, ...)
{
  return [a1 session:requestAcwgRangingSessionSuspend:withSuspendTriggerReason:];
}

id objc_msgSend_session_suspendedWithReason_(void *a1, const char *a2, ...)
{
  return [a1 session:suspendedWithReason:];
}

id objc_msgSend_session_suspensionReasonEnded_isNoLongerSuspended_(void *a1, const char *a2, ...)
{
  return [a1 session:suspensionReasonEnded:isNoLongerSuspended:];
}

id objc_msgSend_sessionClientForFinder_(void *a1, const char *a2, ...)
{
  return [a1 sessionClientForFinder:];
}

id objc_msgSend_sessionClientsStatus(void *a1, const char *a2, ...)
{
  return _[a1 sessionClientsStatus];
}

id objc_msgSend_sessionDidStartRunning_(void *a1, const char *a2, ...)
{
  return [a1 sessionDidStartRunning:];
}

id objc_msgSend_sessionDidUpdateDiscoveryToken_(void *a1, const char *a2, ...)
{
  return [a1 sessionDidUpdateDiscoveryToken:];
}

id objc_msgSend_sessionIdentifier(void *a1, const char *a2, ...)
{
  return _[a1 sessionIdentifier];
}

id objc_msgSend_sessionInterruptedWithTimestamp_(void *a1, const char *a2, ...)
{
  return [a1 sessionInterruptedWithTimestamp:];
}

id objc_msgSend_sessionKey(void *a1, const char *a2, ...)
{
  return _[a1 sessionKey];
}

id objc_msgSend_sessionPausedWithTimestamp_(void *a1, const char *a2, ...)
{
  return [a1 sessionPausedWithTimestamp:];
}

id objc_msgSend_sessionRegistered(void *a1, const char *a2, ...)
{
  return _[a1 sessionRegistered];
}

id objc_msgSend_sessionServiceRequestForFinder_(void *a1, const char *a2, ...)
{
  return [a1 sessionServiceRequestForFinder:];
}

id objc_msgSend_sessionShouldAttemptRelocalization_(void *a1, const char *a2, ...)
{
  return [a1 sessionShouldAttemptRelocalization:];
}

id objc_msgSend_sessionShouldAttemptRelocalization_completion_(void *a1, const char *a2, ...)
{
  return [a1 sessionShouldAttemptRelocalization:completion:];
}

id objc_msgSend_sessionStartRangingOptionsForFinder_(void *a1, const char *a2, ...)
{
  return [a1 sessionStartRangingOptionsForFinder:];
}

id objc_msgSend_sessionState(void *a1, const char *a2, ...)
{
  return _[a1 sessionState];
}

id objc_msgSend_sessionSuccessfullyRanWithConfig_withTimestamp_(void *a1, const char *a2, ...)
{
  return [_objc_msgSend(a1, "sessionSuccessfullyRanWithConfig:withTimestamp:");
}

id objc_msgSend_sessionSuspensionEnded_(void *a1, const char *a2, ...)
{
  return [a1 sessionSuspensionEnded:];
}

id objc_msgSend_sessionTokenForFinder_(void *a1, const char *a2, ...)
{
  return [a1 sessionTokenForFinder:];
}

id objc_msgSend_sessionWasSuspended_(void *a1, const char *a2, ...)
{
  return [a1 sessionWasSuspended:];
}

id objc_msgSend_setAcceleration_(void *a1, const char *a2, ...)
{
  return [a1 setAcceleration:];
}

id objc_msgSend_setActivationGuard_(void *a1, const char *a2, ...)
{
  return [a1 setActivationGuard:];
}

id objc_msgSend_setActivationResponse_(void *a1, const char *a2, ...)
{
  return [a1 setActivationResponse:];
}

id objc_msgSend_setActivityType_(void *a1, const char *a2, ...)
{
  return [a1 setActivityType:];
}

id objc_msgSend_setAcwgRangingLimitExceeded_(void *a1, const char *a2, ...)
{
  return [a1 setAcwgRangingLimitExceeded:];
}

id objc_msgSend_setAddress_(void *a1, const char *a2, ...)
{
  return [a1 setAddress:];
}

id objc_msgSend_setAdvertiseRate_(void *a1, const char *a2, ...)
{
  return [a1 setAdvertiseRate:];
}

id objc_msgSend_setAdvertiseRate_timeout_(void *a1, const char *a2, ...)
{
  return [a1 setAdvertiseRate:timeout:];
}

id objc_msgSend_setAdvertisement_(void *a1, const char *a2, ...)
{
  return [a1 setAdvertisement:];
}

id objc_msgSend_setAdvertisingAddressChangedHandler_(void *a1, const char *a2, ...)
{
  return [a1 setAdvertisingAddressChangedHandler:];
}

id objc_msgSend_setAdvertisingState_(void *a1, const char *a2, ...)
{
  return [a1 setAdvertisingState:];
}

id objc_msgSend_setAggregateStateProvider_(void *a1, const char *a2, ...)
{
  return [a1 setAggregateStateProvider:];
}

id objc_msgSend_setAirplaneModeChangedHandler_(void *a1, const char *a2, ...)
{
  return [a1 setAirplaneModeChangedHandler:];
}

id objc_msgSend_setAirplaneModeStatusInternal_(void *a1, const char *a2, ...)
{
  return [a1 setAirplaneModeStatusInternal:];
}

id objc_msgSend_setAlgorithmAidingData_(void *a1, const char *a2, ...)
{
  return [a1 setAlgorithmAidingData:];
}

id objc_msgSend_setAlgorithmAidingData_forPeer_(void *a1, const char *a2, ...)
{
  return [a1 setAlgorithmAidingData:forPeer:];
}

id objc_msgSend_setAlgorithmOutputFlags_(void *a1, const char *a2, ...)
{
  return [a1 setAlgorithmOutputFlags:];
}

id objc_msgSend_setAlgorithmSource_(void *a1, const char *a2, ...)
{
  return [a1 setAlgorithmSource:];
}

id objc_msgSend_setAllowedDevices_(void *a1, const char *a2, ...)
{
  return [a1 setAllowedDevices:];
}

id objc_msgSend_setAnchor_(void *a1, const char *a2, ...)
{
  return [a1 setAnchor:];
}

id objc_msgSend_setAntennaDiversityOverride_(void *a1, const char *a2, ...)
{
  return [a1 setAntennaDiversityOverride:];
}

id objc_msgSend_setAntennaMask_(void *a1, const char *a2, ...)
{
  return [a1 setAntennaMask:];
}

id objc_msgSend_setAppStateMonitor_(void *a1, const char *a2, ...)
{
  return [a1 setAppStateMonitor:];
}

id objc_msgSend_setArSession_(void *a1, const char *a2, ...)
{
  return [a1 setArSession:];
}

id objc_msgSend_setArSessionInClientProcess_(void *a1, const char *a2, ...)
{
  return [a1 setArSessionInClientProcess:];
}

id objc_msgSend_setArSessionInternal_(void *a1, const char *a2, ...)
{
  return [a1 setArSessionInternal:];
}

id objc_msgSend_setArSessionState_(void *a1, const char *a2, ...)
{
  return [a1 setArSessionState:];
}

id objc_msgSend_setAttributes_ofItemAtPath_error_(void *a1, const char *a2, ...)
{
  return [a1 setAttributes:ofItemAtPath:error:];
}

id objc_msgSend_setAzimuth_(void *a1, const char *a2, ...)
{
  return [a1 setAzimuth:];
}

id objc_msgSend_setBackgroundMode_(void *a1, const char *a2, ...)
{
  return [a1 setBackgroundMode:];
}

id objc_msgSend_setBackgroundSupportUpdateHandler_(void *a1, const char *a2, ...)
{
  return [a1 setBackgroundSupportUpdateHandler:];
}

id objc_msgSend_setBleRSSIThresholdHint_(void *a1, const char *a2, ...)
{
  return [a1 setBleRSSIThresholdHint:];
}

id objc_msgSend_setBleRSSIThresholdOrder_(void *a1, const char *a2, ...)
{
  return [a1 setBleRSSIThresholdOrder];
}

id objc_msgSend_setBleScanRate_(void *a1, const char *a2, ...)
{
  return [a1 setBleScanRate:];
}

id objc_msgSend_setBluetoothAdvertisingAddress_(void *a1, const char *a2, ...)
{
  return [a1 setBluetoothAdvertisingAddress:];
}

id objc_msgSend_setBluetoothDeviceIdentifier_(void *a1, const char *a2, ...)
{
  return [a1 setBluetoothDeviceIdentifier:];
}

id objc_msgSend_setBluetoothStateChangedHandler_(void *a1, const char *a2, ...)
{
  return [a1 setBluetoothStateChangedHandler:];
}

id objc_msgSend_setBool_forKey_(void *a1, const char *a2, ...)
{
  return [a1 setBool:forKey:];
}

id objc_msgSend_setBoundedRegionRange_(void *a1, const char *a2, ...)
{
  return [a1 setBoundedRegionRange:];
}

id objc_msgSend_setBtAddressData_(void *a1, const char *a2, ...)
{
  return [a1 setBtAddressData:];
}

id objc_msgSend_setByAddingObjectsFromSet_(void *a1, const char *a2, ...)
{
  return [a1 setByAddingObjectsFromSet:];
}

id objc_msgSend_setCachedPlatformCapabilities_(void *a1, const char *a2, ...)
{
  return [a1 setCachedPlatformCapabilities:];
}

id objc_msgSend_setCameraAssistanceEnabled_(void *a1, const char *a2, ...)
{
  return [a1 setCameraAssistanceEnabled:];
}

id objc_msgSend_setCameraAssistanceInClientProcess_(void *a1, const char *a2, ...)
{
  return [a1 setCameraAssistanceInClientProcess:];
}

id objc_msgSend_setCanRange_(void *a1, const char *a2, ...)
{
  return [a1 setCanRange:];
}

id objc_msgSend_setCancelHandler_(void *a1, const char *a2, ...)
{
  return [a1 setCancelHandler:];
}

id objc_msgSend_setCarKeyRangingLimitExceeded_(void *a1, const char *a2, ...)
{
  return [a1 setCarKeyRangingLimitExceeded:];
}

id objc_msgSend_setCirPacket1_(void *a1, const char *a2, ...)
{
  return [a1 setCirPacket1:];
}

id objc_msgSend_setCirPacket2_(void *a1, const char *a2, ...)
{
  return [a1 setCirPacket2:];
}

id objc_msgSend_setClass_forSelector_argumentIndex_ofReply_(void *a1, const char *a2, ...)
{
  return [a1 setClass:forSelector:argumentIndex:ofReply:];
}

id objc_msgSend_setClasses_forSelector_argumentIndex_ofReply_(void *a1, const char *a2, ...)
{
  return [a1 setClasses:forSelector:argumentIndex:ofReply:];
}

id objc_msgSend_setClientIdentifierData_(void *a1, const char *a2, ...)
{
  return [a1 setClientIdentifierData:];
}

id objc_msgSend_setClientIrkData_(void *a1, const char *a2, ...)
{
  return [a1 setClientIrkData:];
}

id objc_msgSend_setClientVoucher_(void *a1, const char *a2, ...)
{
  return [a1 setClientVoucher:];
}

id objc_msgSend_setClientWantsUpdates_(void *a1, const char *a2, ...)
{
  return [a1 setClientWantsUpdates:];
}

id objc_msgSend_setCoarseEstimation_(void *a1, const char *a2, ...)
{
  return [a1 setCoarseEstimation:];
}

id objc_msgSend_setConfigType_(void *a1, const char *a2, ...)
{
  return [a1 setConfigType:];
}

id objc_msgSend_setConfiguration_(void *a1, const char *a2, ...)
{
  return [a1 setConfiguration:];
}

id objc_msgSend_setControlFlags_(void *a1, const char *a2, ...)
{
  return [a1 setControlFlags:];
}

id objc_msgSend_setCorrectedRange_(void *a1, const char *a2, ...)
{
  return [a1 setCorrectedRange:];
}

id objc_msgSend_setCrown_(void *a1, const char *a2, ...)
{
  return [a1 setCrown:];
}

id objc_msgSend_setCurrentSolutionMacAddress_(void *a1, const char *a2, ...)
{
  return [a1 setCurrentSolutionMacAddress:];
}

id objc_msgSend_setCurrentTask_(void *a1, const char *a2, ...)
{
  return [a1 setCurrentTask:];
}

id objc_msgSend_setCycleIndex_(void *a1, const char *a2, ...)
{
  return [a1 setCycleIndex:];
}

id objc_msgSend_setDataFrame_forPeer_(void *a1, const char *a2, ...)
{
  return [a1 setDataFrame:forPeer:];
}

id objc_msgSend_setDateFormat_(void *a1, const char *a2, ...)
{
  return [a1 setDateFormat:];
}

id objc_msgSend_setDebugDisplayInfo_(void *a1, const char *a2, ...)
{
  return [a1 setDebugDisplayInfo:];
}

id objc_msgSend_setDebugOptions_(void *a1, const char *a2, ...)
{
  return [a1 setDebugOptions:];
}

id objc_msgSend_setDebugParameters_(void *a1, const char *a2, ...)
{
  return [a1 setDebugParameters:];
}

id objc_msgSend_setDelay_(void *a1, const char *a2, ...)
{
  return [a1 setDelay:];
}

id objc_msgSend_setDelegate_(void *a1, const char *a2, ...)
{
  return [a1 setDelegate:];
}

id objc_msgSend_setDelegateQueue_(void *a1, const char *a2, ...)
{
  return [a1 setDelegateQueue:];
}

id objc_msgSend_setDesiredAccuracy_(void *a1, const char *a2, ...)
{
  return [a1 setDesiredAccuracy:];
}

id objc_msgSend_setDestinationDevice_(void *a1, const char *a2, ...)
{
  return [a1 setDestinationDevice:];
}

id objc_msgSend_setDeviceFilter_(void *a1, const char *a2, ...)
{
  return [a1 setDeviceFilter:];
}

id objc_msgSend_setDeviceFoundHandler_(void *a1, const char *a2, ...)
{
  return [a1 setDeviceFoundHandler:];
}

id objc_msgSend_setDeviceIdentifier_(void *a1, const char *a2, ...)
{
  return [a1 setDeviceIdentifier:];
}

id objc_msgSend_setDeviceLostHandler_(void *a1, const char *a2, ...)
{
  return [a1 setDeviceLostHandler:];
}

id objc_msgSend_setDeviceMotionUpdateInterval_(void *a1, const char *a2, ...)
{
  return [a1 setDeviceMotionUpdateInterval:];
}

id objc_msgSend_setDevicePresencePreset_(void *a1, const char *a2, ...)
{
  return [a1 setDevicePresencePreset:];
}

id objc_msgSend_setDeviceRelationshipFlags_(void *a1, const char *a2, ...)
{
  return [a1 setDeviceRelationshipFlags:];
}

id objc_msgSend_setDevicesBufferedHandler_(void *a1, const char *a2, ...)
{
  return [a1 setDevicesBufferedHandler:];
}

id objc_msgSend_setDirection_(void *a1, const char *a2, ...)
{
  return [a1 setDirection:];
}

id objc_msgSend_setDiscoveryFlags_(void *a1, const char *a2, ...)
{
  return [a1 setDiscoveryFlags:];
}

id objc_msgSend_setDiscoveryState_(void *a1, const char *a2, ...)
{
  return [a1 setDiscoveryState:];
}

id objc_msgSend_setDispatchQueue_(void *a1, const char *a2, ...)
{
  return [a1 setDispatchQueue:];
}

id objc_msgSend_setDistance_(void *a1, const char *a2, ...)
{
  return [a1 setDistance:];
}

id objc_msgSend_setDistanceFilter_(void *a1, const char *a2, ...)
{
  return [a1 setDistanceFilter:];
}

id objc_msgSend_setDistanceMeasurementQuality_(void *a1, const char *a2, ...)
{
  return [a1 setDistanceMeasurementQuality:];
}

id objc_msgSend_setDouble_forKey_(void *a1, const char *a2, ...)
{
  return [a1 setDouble:forKey:];
}

id objc_msgSend_setElevation_(void *a1, const char *a2, ...)
{
  return [a1 setElevation:];
}

id objc_msgSend_setEnableEPAForLEAdvertisement_(void *a1, const char *a2, ...)
{
  return [a1 setEnableEPAForLEAdvertisement:];
}

id objc_msgSend_setEndowmentNamespaces_(void *a1, const char *a2, ...)
{
  return [a1 setEndowmentNamespaces:];
}

id objc_msgSend_setEnteredFromActiveFindingUI_(void *a1, const char *a2, ...)
{
  return [a1 setEnteredFromActiveFindingUI:];
}

id objc_msgSend_setErrorHandler_(void *a1, const char *a2, ...)
{
  return [a1 setErrorHandler:];
}

id objc_msgSend_setEventHandler_(void *a1, const char *a2, ...)
{
  return [a1 setEventHandler:];
}

id objc_msgSend_setExpirationHandler_(void *a1, const char *a2, ...)
{
  return [a1 setExpirationHandler:];
}

id objc_msgSend_setExportedInterface_(void *a1, const char *a2, ...)
{
  return [a1 setExportedInterface:];
}

id objc_msgSend_setExportedObject_(void *a1, const char *a2, ...)
{
  return [a1 setExportedObject:];
}

id objc_msgSend_setExportedObjectClass_(void *a1, const char *a2, ...)
{
  return [a1 setExportedObjectClass:];
}

id objc_msgSend_setFOnCellMonitorUpdateCb_(void *a1, const char *a2, ...)
{
  return [a1 setFOnCellMonitorUpdateCb:];
}

id objc_msgSend_setFindableDiscoveryTokens_tokenGroup_(void *a1, const char *a2, ...)
{
  return [a1 setFindableDiscoveryTokens:tokenGroup:];
}

id objc_msgSend_setFindingConfig2_(void *a1, const char *a2, ...)
{
  return [a1 setFindingConfig2:];
}

id objc_msgSend_setFindingConfig_(void *a1, const char *a2, ...)
{
  return [a1 setFindingConfig:];
}

id objc_msgSend_setFindingEnabled_(void *a1, const char *a2, ...)
{
  return [a1 setFindingEnabled:];
}

id objc_msgSend_setFindingPeerToken_(void *a1, const char *a2, ...)
{
  return [a1 setFindingPeerToken:];
}

id objc_msgSend_setFindingStatus_(void *a1, const char *a2, ...)
{
  return [a1 setFindingStatus:];
}

id objc_msgSend_setFirstPathIndexPacket1_(void *a1, const char *a2, ...)
{
  return [a1 setFirstPathIndexPacket1:];
}

id objc_msgSend_setFirstPathIndexPacket2_(void *a1, const char *a2, ...)
{
  return [a1 setFirstPathIndexPacket2:];
}

id objc_msgSend_setFlags_(void *a1, const char *a2, ...)
{
  return [a1 setFlags:];
}

id objc_msgSend_setHeadingFilter_(void *a1, const char *a2, ...)
{
  return [a1 setHeadingFilter:];
}

id objc_msgSend_setHorizontalAccuracy_(void *a1, const char *a2, ...)
{
  return [a1 setHorizontalAccuracy:];
}

id objc_msgSend_setHorizontalAngle_(void *a1, const char *a2, ...)
{
  return [a1 setHorizontalAngle:];
}

id objc_msgSend_setHorizontalAngleAccuracy_(void *a1, const char *a2, ...)
{
  return [a1 setHorizontalAngleAccuracy:];
}

id objc_msgSend_setImag_(void *a1, const char *a2, ...)
{
  return [a1 setImag:];
}

id objc_msgSend_setInputFeatures_(void *a1, const char *a2, ...)
{
  return [a1 setInputFeatures:];
}

id objc_msgSend_setInsufficientHorizontalSweep_(void *a1, const char *a2, ...)
{
  return [a1 setInsufficientHorizontalSweep:];
}

id objc_msgSend_setInsufficientLighting_(void *a1, const char *a2, ...)
{
  return [a1 setInsufficientLighting:];
}

id objc_msgSend_setInsufficientMovement_(void *a1, const char *a2, ...)
{
  return [a1 setInsufficientMovement:];
}

id objc_msgSend_setInsufficientVerticalSweep_(void *a1, const char *a2, ...)
{
  return [a1 setInsufficientVerticalSweep:];
}

id objc_msgSend_setInteger_forKey_(void *a1, const char *a2, ...)
{
  return [a1 setInteger:forKey:];
}

id objc_msgSend_setInternalState_(void *a1, const char *a2, ...)
{
  return [a1 setInternalState:];
}

id objc_msgSend_setInterruptionHandler_(void *a1, const char *a2, ...)
{
  return [a1 setInterruptionHandler:];
}

id objc_msgSend_setInterval_(void *a1, const char *a2, ...)
{
  return [a1 setInterval:];
}

id objc_msgSend_setInvalidationError_(void *a1, const char *a2, ...)
{
  return [a1 setInvalidationError:];
}

id objc_msgSend_setInvalidationHandler_(void *a1, const char *a2, ...)
{
  return [a1 setInvalidationHandler:];
}

id objc_msgSend_setIrkData_(void *a1, const char *a2, ...)
{
  return [a1 setIrkData:];
}

id objc_msgSend_setIsFinder_(void *a1, const char *a2, ...)
{
  return [a1 setIsFinder:];
}

id objc_msgSend_setIsObserver_(void *a1, const char *a2, ...)
{
  return [a1 setIsObserver:];
}

id objc_msgSend_setIsRunning_(void *a1, const char *a2, ...)
{
  return [a1 setIsRunning:];
}

id objc_msgSend_setKeyType_(void *a1, const char *a2, ...)
{
  return [a1 setKeyType:];
}

id objc_msgSend_setLabel_(void *a1, const char *a2, ...)
{
  return [a1 setLabel:];
}

id objc_msgSend_setLatestARFrame_(void *a1, const char *a2, ...)
{
  return [a1 setLatestARFrame:];
}

id objc_msgSend_setLatestActivityTimestamp_(void *a1, const char *a2, ...)
{
  return [a1 setLatestActivityTimestamp:];
}

id objc_msgSend_setLatestActivityType_(void *a1, const char *a2, ...)
{
  return [a1 setLatestActivityType:];
}

id objc_msgSend_setLatestBluetoothState_(void *a1, const char *a2, ...)
{
  return [a1 setLatestBluetoothState:];
}

id objc_msgSend_setLeadingEdgePacket1_(void *a1, const char *a2, ...)
{
  return [a1 setLeadingEdgePacket1:];
}

id objc_msgSend_setLeadingEdgePacket2_(void *a1, const char *a2, ...)
{
  return [a1 setLeadingEdgePacket2:];
}

id objc_msgSend_setListener_(void *a1, const char *a2, ...)
{
  return [a1 setListener:];
}

id objc_msgSend_setLocalDeviceCanInteract_withDiscoveryTokens_reply_(void *a1, const char *a2, ...)
{
  return [a1 setLocalDeviceCanInteract:withDiscoveryTokens:reply:];
}

id objc_msgSend_setLocalDeviceDebugParameters_(void *a1, const char *a2, ...)
{
  return [a1 setLocalDeviceDebugParameters:];
}

id objc_msgSend_setLocalDeviceDebugParameters_reply_(void *a1, const char *a2, ...)
{
  return [a1 setLocalDeviceDebugParameters:reply:];
}

id objc_msgSend_setLocalDeviceInteractableDiscoveryTokens_reply_(void *a1, const char *a2, ...)
{
  return [a1 setLocalDeviceInteractableDiscoveryTokens:reply:];
}

id objc_msgSend_setLocale_(void *a1, const char *a2, ...)
{
  return [a1 setLocale:];
}

id objc_msgSend_setLocation_(void *a1, const char *a2, ...)
{
  return [a1 setLocation:];
}

id objc_msgSend_setLockBtConnHandle_(void *a1, const char *a2, ...)
{
  return [a1 setLockBtConnHandle:];
}

id objc_msgSend_setLockIdentifier_(void *a1, const char *a2, ...)
{
  return [a1 setLockIdentifier:];
}

id objc_msgSend_setLongRangeEnabled_(void *a1, const char *a2, ...)
{
  return [a1 setLongRangeEnabled:];
}

id objc_msgSend_setMachAbsoluteTimestamp_(void *a1, const char *a2, ...)
{
  return [a1 setMachAbsoluteTimestamp:];
}

id objc_msgSend_setMagnetometerUpdateInterval_(void *a1, const char *a2, ...)
{
  return [a1 setMagnetometerUpdateInterval:];
}

id objc_msgSend_setMatching_(void *a1, const char *a2, ...)
{
  return [a1 setMatching:];
}

id objc_msgSend_setMaxInactivityAfterTrackingBeganSeconds_(void *a1, const char *a2, ...)
{
  return [a1 setMaxInactivityAfterTrackingBeganSeconds:];
}

id objc_msgSend_setMaxInactivityBeforeTrackingBeganSeconds_(void *a1, const char *a2, ...)
{
  return [a1 setMaxInactivityBeforeTrackingBeganSeconds:];
}

id objc_msgSend_setMaxNearbyObjectAge_(void *a1, const char *a2, ...)
{
  return [a1 setMaxNearbyObjectAge:];
}

id objc_msgSend_setMinDurationBetweenInstances_(void *a1, const char *a2, ...)
{
  return [a1 setMinDurationBetweenInstances:];
}

id objc_msgSend_setMinimumPreferredUpdatedRate_(void *a1, const char *a2, ...)
{
  return [a1 setMinimumPreferredUpdatedRate:];
}

id objc_msgSend_setMmsRxStatus_(void *a1, const char *a2, ...)
{
  return [a1 setMmsRxStatus:];
}

id objc_msgSend_setMonitoredRegions_(void *a1, const char *a2, ...)
{
  return [a1 setMonitoredRegions:];
}

id objc_msgSend_setMonitoringOption_(void *a1, const char *a2, ...)
{
  return [a1 setMonitoringOption:];
}

id objc_msgSend_setMotionState_(void *a1, const char *a2, ...)
{
  return [a1 setMotionState:];
}

id objc_msgSend_setName_(void *a1, const char *a2, ...)
{
  return [a1 setName:];
}

id objc_msgSend_setNarrowBandMask_(void *a1, const char *a2, ...)
{
  return [a1 setNarrowBandMask:];
}

id objc_msgSend_setNbRssi_(void *a1, const char *a2, ...)
{
  return [a1 setNbRssi:];
}

id objc_msgSend_setNbRxStatus_(void *a1, const char *a2, ...)
{
  return [a1 setNbRxStatus:];
}

id objc_msgSend_setNbUwbAcquisitionChannelIdx_(void *a1, const char *a2, ...)
{
  return [a1 setNbUwbAcquisitionChannelIdx:];
}

id objc_msgSend_setNearbyActionFlags_(void *a1, const char *a2, ...)
{
  return [a1 setNearbyActionFlags:];
}

id objc_msgSend_setNearbyActionNWPrecisionFindingStatus_(void *a1, const char *a2, ...)
{
  return [a1 setNearbyActionNWPrecisionFindingStatus:];
}

id objc_msgSend_setNearbyActionNoWakeAuthTagData_(void *a1, const char *a2, ...)
{
  return [a1 setNearbyActionNoWakeAuthTagData:];
}

id objc_msgSend_setNearbyActionNoWakeConfigData_(void *a1, const char *a2, ...)
{
  return [a1 setNearbyActionNoWakeConfigData:];
}

id objc_msgSend_setNearbyActionNoWakeType_(void *a1, const char *a2, ...)
{
  return [a1 setNearbyActionNoWakeType:];
}

id objc_msgSend_setNearbyActionType_(void *a1, const char *a2, ...)
{
  return [a1 setNearbyActionType:];
}

id objc_msgSend_setNumCharacteristicsLeftToRead_(void *a1, const char *a2, ...)
{
  return [a1 setNumCharacteristicsLeftToRead:];
}

id objc_msgSend_setObject_atIndexedSubscript_(void *a1, const char *a2, ...)
{
  return [a1 setObject:atIndexedSubscript:];
}

id objc_msgSend_setObject_forKey_(void *a1, const char *a2, ...)
{
  return [a1 setObject:forKey:];
}

id objc_msgSend_setObject_forKeyedSubscript_(void *a1, const char *a2, ...)
{
  return [a1 setObject:forKeyedSubscript:];
}

id objc_msgSend_setObservationRegistrar_(void *a1, const char *a2, ...)
{
  return [a1 setObservationRegistrar:];
}

id objc_msgSend_setOdometryUpdateInterval_(void *a1, const char *a2, ...)
{
  return [a1 setOdometryUpdateInterval:];
}

id objc_msgSend_setOobKeys_(void *a1, const char *a2, ...)
{
  return [a1 setOobKeys:];
}

id objc_msgSend_setOutProbabilities_(void *a1, const char *a2, ...)
{
  return [a1 setOutProbabilities:];
}

id objc_msgSend_setOutputs_(void *a1, const char *a2, ...)
{
  return [a1 setOutputs:];
}

id objc_msgSend_setPassiveAccessIntent_(void *a1, const char *a2, ...)
{
  return [a1 setPassiveAccessIntent:];
}

id objc_msgSend_setPeerIdentifier_(void *a1, const char *a2, ...)
{
  return [a1 setPeerIdentifier:];
}

id objc_msgSend_setPeerLostCallbackReceived_(void *a1, const char *a2, ...)
{
  return [a1 setPeerLostCallbackReceived:];
}

id objc_msgSend_setPeersEligibleForDiscovery_requestScan_(void *a1, const char *a2, ...)
{
  return [a1 setPeersEligibleForDiscovery:requestScan:];
}

id objc_msgSend_setPeripheral_(void *a1, const char *a2, ...)
{
  return [a1 setPeripheral:];
}

id objc_msgSend_setPredicates_(void *a1, const char *a2, ...)
{
  return [a1 setPredicates:];
}

id objc_msgSend_setPreferredUpdateRate_(void *a1, const char *a2, ...)
{
  return [a1 setPreferredUpdateRate:];
}

id objc_msgSend_setPressure_(void *a1, const char *a2, ...)
{
  return [a1 setPressure:];
}

id objc_msgSend_setPreventsDeviceSleep_(void *a1, const char *a2, ...)
{
  return [a1 setPreventsDeviceSleep:];
}

id objc_msgSend_setPrewarmSecureElementChannel_(void *a1, const char *a2, ...)
{
  return [a1 setPrewarmSecureElementChannel:];
}

id objc_msgSend_setPrewarmUWB_(void *a1, const char *a2, ...)
{
  return [a1 setPrewarmUWB:];
}

id objc_msgSend_setPriority_(void *a1, const char *a2, ...)
{
  return [a1 setPriority:];
}

id objc_msgSend_setProtocolVersion_(void *a1, const char *a2, ...)
{
  return [a1 setProtocolVersion:];
}

id objc_msgSend_setQualityOfService_(void *a1, const char *a2, ...)
{
  return [a1 setQualityOfService:];
}

id objc_msgSend_setQuaternion_(void *a1, const char *a2, ...)
{
  return [a1 setQuaternion:];
}

id objc_msgSend_setQueryItems_(void *a1, const char *a2, ...)
{
  return [a1 setQueryItems:];
}

id objc_msgSend_setRange_(void *a1, const char *a2, ...)
{
  return [a1 setRange:];
}

id objc_msgSend_setRangeBiasEstimate_(void *a1, const char *a2, ...)
{
  return [a1 setRangeBiasEstimate:];
}

id objc_msgSend_setRangeError_(void *a1, const char *a2, ...)
{
  return [a1 setRangeError:];
}

id objc_msgSend_setRangeUncertainty_(void *a1, const char *a2, ...)
{
  return [a1 setRangeUncertainty:];
}

id objc_msgSend_setRangingActive_(void *a1, const char *a2, ...)
{
  return [a1 setRangingActive:];
}

id objc_msgSend_setRangingRetryCount_(void *a1, const char *a2, ...)
{
  return [a1 setRangingRetryCount:];
}

id objc_msgSend_setRangingRetryTimer_(void *a1, const char *a2, ...)
{
  return [a1 setRangingRetryTimer:];
}

id objc_msgSend_setRangingSession_(void *a1, const char *a2, ...)
{
  return [a1 setRangingSession:];
}

id objc_msgSend_setRangingState_(void *a1, const char *a2, ...)
{
  return [a1 setRangingState:];
}

id objc_msgSend_setRawRange_(void *a1, const char *a2, ...)
{
  return [a1 setRawRange:];
}

id objc_msgSend_setReadingMultiConfigCharacteristics_(void *a1, const char *a2, ...)
{
  return [a1 setReadingMultiConfigCharacteristics:];
}

id objc_msgSend_setReal_(void *a1, const char *a2, ...)
{
  return [a1 setReal:];
}

id objc_msgSend_setReceivedSignalFlags_(void *a1, const char *a2, ...)
{
  return [a1 setReceivedSignalFlags:];
}

id objc_msgSend_setRegionSizeCategory_(void *a1, const char *a2, ...)
{
  return [a1 setRegionSizeCategory:];
}

id objc_msgSend_setRegulatoryLocationAuthorized_(void *a1, const char *a2, ...)
{
  return [a1 setRegulatoryLocationAuthorized:];
}

id objc_msgSend_setRegulatoryLocationHandler_(void *a1, const char *a2, ...)
{
  return [a1 setRegulatoryLocationHandler:];
}

id objc_msgSend_setRelationship_(void *a1, const char *a2, ...)
{
  return [a1 setRelationship:];
}

id objc_msgSend_setRelativeAltitude_(void *a1, const char *a2, ...)
{
  return [a1 setRelativeAltitude:];
}

id objc_msgSend_setRemoteObjectInterface_(void *a1, const char *a2, ...)
{
  return [a1 setRemoteObjectInterface:];
}

id objc_msgSend_setRemoteTxAntennaMask_(void *a1, const char *a2, ...)
{
  return [a1 setRemoteTxAntennaMask:];
}

id objc_msgSend_setRepeats_(void *a1, const char *a2, ...)
{
  return [a1 setRepeats:];
}

id objc_msgSend_setRequiresBiasCorrection_(void *a1, const char *a2, ...)
{
  return [a1 setRequiresBiasCorrection:];
}

id objc_msgSend_setRequiresUserIntent_(void *a1, const char *a2, ...)
{
  return [a1 setRequiresUserIntent:];
}

id objc_msgSend_setResetARSession_(void *a1, const char *a2, ...)
{
  return [a1 setResetARSession:];
}

id objc_msgSend_setResetHandler_(void *a1, const char *a2, ...)
{
  return [a1 setResetHandler:];
}

id objc_msgSend_setResponder_(void *a1, const char *a2, ...)
{
  return [a1 setResponder:];
}

id objc_msgSend_setRevokeFindingExperience_(void *a1, const char *a2, ...)
{
  return [a1 setRevokeFindingExperience:];
}

id objc_msgSend_setRotationRate_(void *a1, const char *a2, ...)
{
  return [a1 setRotationRate:];
}

id objc_msgSend_setRssi_(void *a1, const char *a2, ...)
{
  return [a1 setRssi:];
}

id objc_msgSend_setRssiDbm_(void *a1, const char *a2, ...)
{
  return [a1 setRssiDbm:];
}

id objc_msgSend_setRttInitiator_(void *a1, const char *a2, ...)
{
  return [a1 setRttInitiator:];
}

id objc_msgSend_setRttResponder_(void *a1, const char *a2, ...)
{
  return [a1 setRttResponder:];
}

id objc_msgSend_setRxAntennaPacket1_(void *a1, const char *a2, ...)
{
  return [a1 setRxAntennaPacket1:];
}

id objc_msgSend_setRxAntennaPacket2_(void *a1, const char *a2, ...)
{
  return [a1 setRxAntennaPacket2:];
}

id objc_msgSend_setScanRate_(void *a1, const char *a2, ...)
{
  return [a1 setScanRate:];
}

id objc_msgSend_setService_forToken_(void *a1, const char *a2, ...)
{
  return [a1 setService:forToken:];
}

id objc_msgSend_setSessionKey_(void *a1, const char *a2, ...)
{
  return [a1 setSessionKey:];
}

id objc_msgSend_setShouldWakeDevice_(void *a1, const char *a2, ...)
{
  return [a1 setShouldWakeDevice:];
}

id objc_msgSend_setSignalStrength_(void *a1, const char *a2, ...)
{
  return [a1 setSignalStrength:];
}

id objc_msgSend_setSignallingData_(void *a1, const char *a2, ...)
{
  return [a1 setSignallingData:];
}

id objc_msgSend_setSignallingData_forPeer_(void *a1, const char *a2, ...)
{
  return [a1 setSignallingData:forPeer:];
}

id objc_msgSend_setSoiRssiDbm_(void *a1, const char *a2, ...)
{
  return [a1 setSoiRssiDbm:];
}

id objc_msgSend_setSpecifiedToken_(void *a1, const char *a2, ...)
{
  return [a1 setSpecifiedToken:];
}

id objc_msgSend_setStateChangeHandler_(void *a1, const char *a2, ...)
{
  return [a1 setStateChangeHandler:];
}

id objc_msgSend_setStateChangedHandler_(void *a1, const char *a2, ...)
{
  return [a1 setStateChangedHandler:];
}

id objc_msgSend_setStateDescriptor_(void *a1, const char *a2, ...)
{
  return [a1 setStateDescriptor:];
}

id objc_msgSend_setSupportedTechnologies_(void *a1, const char *a2, ...)
{
  return [a1 setSupportedTechnologies:];
}

id objc_msgSend_setSupportsCameraAssistance_(void *a1, const char *a2, ...)
{
  return [a1 setSupportsCameraAssistance:];
}

id objc_msgSend_setSystemOverrideHandler_(void *a1, const char *a2, ...)
{
  return [a1 setSystemOverrideHandler:];
}

id objc_msgSend_setTaskCompleted(void *a1, const char *a2, ...)
{
  return _[a1 setTaskCompleted];
}

id objc_msgSend_setTatInitiator_(void *a1, const char *a2, ...)
{
  return [a1 setTatInitiator:];
}

id objc_msgSend_setTatResponder_(void *a1, const char *a2, ...)
{
  return [a1 setTatResponder:];
}

id objc_msgSend_setTellClientAboutPeer_(void *a1, const char *a2, ...)
{
  return [a1 setTellClientAboutPeer:];
}

id objc_msgSend_setTimeZone_(void *a1, const char *a2, ...)
{
  return [a1 setTimeZone:];
}

id objc_msgSend_setTimeoutOnPeerInactivity_(void *a1, const char *a2, ...)
{
  return [a1 setTimeoutOnPeerInactivity:];
}

id objc_msgSend_setTimestamp_(void *a1, const char *a2, ...)
{
  return [a1 setTimestamp:];
}

id objc_msgSend_setToaNoiseRms_(void *a1, const char *a2, ...)
{
  return [a1 setToaNoiseRms:];
}

id objc_msgSend_setToaPpwinPeak_(void *a1, const char *a2, ...)
{
  return [a1 setToaPpwinPeak:];
}

id objc_msgSend_setToaPpwinRms_(void *a1, const char *a2, ...)
{
  return [a1 setToaPpwinRms:];
}

id objc_msgSend_setTofPicSecond_(void *a1, const char *a2, ...)
{
  return [a1 setTofPicSecond:];
}

id objc_msgSend_setTolerance_(void *a1, const char *a2, ...)
{
  return [a1 setTolerance:];
}

id objc_msgSend_setTransitionHandler_(void *a1, const char *a2, ...)
{
  return [a1 setTransitionHandler:];
}

id objc_msgSend_setUUID_(void *a1, const char *a2, ...)
{
  return [a1 setUUID:];
}

id objc_msgSend_setUnderlyingQueue_(void *a1, const char *a2, ...)
{
  return [a1 setUnderlyingQueue:];
}

id objc_msgSend_setUniqueIdentifier_(void *a1, const char *a2, ...)
{
  return [a1 setUniqueIdentifier:];
}

id objc_msgSend_setUpdateHandler_(void *a1, const char *a2, ...)
{
  return [a1 setUpdateHandler:];
}

id objc_msgSend_setUpdatesPolicy_(void *a1, const char *a2, ...)
{
  return [a1 setUpdatesPolicy:];
}

id objc_msgSend_setUseCase_(void *a1, const char *a2, ...)
{
  return [a1 setUseCase:];
}

id objc_msgSend_setUwbConfigData_(void *a1, const char *a2, ...)
{
  return [a1 setUwbConfigData:];
}

id objc_msgSend_setUwbExtendedDistanceAvailability_(void *a1, const char *a2, ...)
{
  return [a1 setUwbExtendedDistanceAvailability:];
}

id objc_msgSend_setUwbPreciseDistanceAvailability_(void *a1, const char *a2, ...)
{
  return [a1 setUwbPreciseDistanceAvailability:];
}

id objc_msgSend_setUwbSignalFeatures_(void *a1, const char *a2, ...)
{
  return [a1 setUwbSignalFeatures:];
}

id objc_msgSend_setUwbTime_(void *a1, const char *a2, ...)
{
  return [a1 setUwbTime:];
}

id objc_msgSend_setUwbTokenFlags_(void *a1, const char *a2, ...)
{
  return [a1 setUwbTokenFlags:];
}

id objc_msgSend_setValue_forKey_(void *a1, const char *a2, ...)
{
  return [a1 setValue:forKey:];
}

id objc_msgSend_setValues_(void *a1, const char *a2, ...)
{
  return [a1 setValues:];
}

id objc_msgSend_setVehicleIdentifier_(void *a1, const char *a2, ...)
{
  return [a1 setVehicleIdentifier:];
}

id objc_msgSend_setVerticalDirectionEstimate_(void *a1, const char *a2, ...)
{
  return [a1 setVerticalDirectionEstimate:];
}

id objc_msgSend_setWifiRangingActiveAdvertisement(void *a1, const char *a2, ...)
{
  return _[a1 setWifiRangingActiveAdvertisement];
}

id objc_msgSend_setWiproxStateHandler_(void *a1, const char *a2, ...)
{
  return [a1 setWiproxStateHandler:];
}

id objc_msgSend_setWithArray_(void *a1, const char *a2, ...)
{
  return [a1 setWithArray:];
}

id objc_msgSend_setWithObject_(void *a1, const char *a2, ...)
{
  return [a1 setWithObject:];
}

id objc_msgSend_setWithObjects_(void *a1, const char *a2, ...)
{
  return [a1 setWithObjects:];
}

id objc_msgSend_setWorldPosition_(void *a1, const char *a2, ...)
{
  return [a1 setWorldPosition:];
}

id objc_msgSend_setWrist_(void *a1, const char *a2, ...)
{
  return [a1 setWrist:];
}

id objc_msgSend_setupActivityInterval(void *a1, const char *a2, ...)
{
  return _[a1 setupActivityInterval];
}

id objc_msgSend_setupBackoffResumeManager(void *a1, const char *a2, ...)
{
  return _[a1 setupBackoffResumeManager];
}

id objc_msgSend_setupXPCListeners(void *a1, const char *a2, ...)
{
  return _[a1 setupXPCListeners];
}

id objc_msgSend_shareableConfigData(void *a1, const char *a2, ...)
{
  return _[a1 shareableConfigData];
}

id objc_msgSend_shared(void *a1, const char *a2, ...)
{
  return _[a1 shared];
}

id objc_msgSend_sharedAccessoryManager(void *a1, const char *a2, ...)
{
  return _[a1 sharedAccessoryManager];
}

id objc_msgSend_sharedHardwareManager(void *a1, const char *a2, ...)
{
  return _[a1 sharedHardwareManager];
}

id objc_msgSend_sharedInstance(void *a1, const char *a2, ...)
{
  return _[a1 sharedInstance];
}

id objc_msgSend_sharedObserver(void *a1, const char *a2, ...)
{
  return _[a1 sharedObserver];
}

id objc_msgSend_sharedPairingAgent(void *a1, const char *a2, ...)
{
  return _[a1 sharedPairingAgent];
}

id objc_msgSend_sharedProtocol(void *a1, const char *a2, ...)
{
  return _[a1 sharedProtocol];
}

id objc_msgSend_sharedProvider(void *a1, const char *a2, ...)
{
  return _[a1 sharedProvider];
}

id objc_msgSend_sharedScheduler(void *a1, const char *a2, ...)
{
  return _[a1 sharedScheduler];
}

id objc_msgSend_sharedServicePrintableState(void *a1, const char *a2, ...)
{
  return _[a1 sharedServicePrintableState];
}

id objc_msgSend_sharedSettings(void *a1, const char *a2, ...)
{
  return _[a1 sharedSettings];
}

id objc_msgSend_shortDescription(void *a1, const char *a2, ...)
{
  return _[a1 shortDescription];
}

id objc_msgSend_shortDeviceAddress(void *a1, const char *a2, ...)
{
  return _[a1 shortDeviceAddress];
}

id objc_msgSend_shouldAcceptNewConnection_(void *a1, const char *a2, ...)
{
  return [a1 shouldAcceptNewConnection:];
}

id objc_msgSend_shouldAttemptMerging(void *a1, const char *a2, ...)
{
  return _[a1 shouldAttemptMerging];
}

id objc_msgSend_shouldBypassBleDiscovery(void *a1, const char *a2, ...)
{
  return _[a1 shouldBypassBleDiscovery];
}

id objc_msgSend_shouldInformMutualAuthFailure_(void *a1, const char *a2, ...)
{
  return [a1 shouldInformMutualAuthFailure:];
}

id objc_msgSend_shouldInitiate_peerDiscoveryToken_error_(void *a1, const char *a2, ...)
{
  return [a1 shouldInitiate:peerDiscoveryToken:error:];
}

id objc_msgSend_signalEnvironment(void *a1, const char *a2, ...)
{
  return _[a1 signalEnvironment];
}

id objc_msgSend_signalEnvironmentType(void *a1, const char *a2, ...)
{
  return _[a1 signalEnvironmentType];
}

id objc_msgSend_signalStrength(void *a1, const char *a2, ...)
{
  return _[a1 signalStrength];
}

id objc_msgSend_signingIdentity(void *a1, const char *a2, ...)
{
  return _[a1 signingIdentity];
}

id objc_msgSend_sipHashForIRK_(void *a1, const char *a2, ...)
{
  return [a1 sipHashForIRK:];
}

id objc_msgSend_slotID(void *a1, const char *a2, ...)
{
  return _[a1 slotID];
}

id objc_msgSend_soiRssiDbm(void *a1, const char *a2, ...)
{
  return _[a1 soiRssiDbm];
}

id objc_msgSend_sortedArrayUsingComparator_(void *a1, const char *a2, ...)
{
  return [a1 sortedArrayUsingComparator:];
}

id objc_msgSend_spatialInteractionFlags(void *a1, const char *a2, ...)
{
  return _[a1 spatialInteractionFlags];
}

id objc_msgSend_spatialInteractionTokenData(void *a1, const char *a2, ...)
{
  return _[a1 spatialInteractionTokenData];
}

id objc_msgSend_spatialInteractionUWBConfigData(void *a1, const char *a2, ...)
{
  return _[a1 spatialInteractionUWBConfigData];
}

id objc_msgSend_spatialInteractionUWBTokenFlags(void *a1, const char *a2, ...)
{
  return _[a1 spatialInteractionUWBTokenFlags];
}

id objc_msgSend_spatialScore(void *a1, const char *a2, ...)
{
  return _[a1 spatialScore];
}

id objc_msgSend_specifiedToken(void *a1, const char *a2, ...)
{
  return _[a1 specifiedToken];
}

id objc_msgSend_speed(void *a1, const char *a2, ...)
{
  return _[a1 speed];
}

id objc_msgSend_speedAccuracy(void *a1, const char *a2, ...)
{
  return _[a1 speedAccuracy];
}

id objc_msgSend_standardUserDefaults(void *a1, const char *a2, ...)
{
  return _[a1 standardUserDefaults];
}

id objc_msgSend_startActivityUpdatesToQueue_withHandler_(void *a1, const char *a2, ...)
{
  return [a1 startActivityUpdatesToQueue:withHandler:];
}

id objc_msgSend_startAdvertising(void *a1, const char *a2, ...)
{
  return _[a1 startAdvertising];
}

id objc_msgSend_startAdvertisingAsFinder_toPeer_withAdvertisement_(void *a1, const char *a2, ...)
{
  return [a1 startAdvertisingAsFinder:toPeer:withAdvertisement:];
}

id objc_msgSend_startAdvertisingToPeer_advertisement_timeout_(void *a1, const char *a2, ...)
{
  return [a1 startAdvertisingToPeer:advertisement:timeout:];
}

id objc_msgSend_startAggressiveAdvertisingOnDevice_withTimeout_(void *a1, const char *a2, ...)
{
  return [a1 startAggressiveAdvertisingOnDevice:withTimeout:];
}

id objc_msgSend_startBTScanningWithMaxRateForPrototypeHomeSession_(void *a1, const char *a2, ...)
{
  return [a1 startBTScanningWithMaxRateForPrototypeHomeSession:];
}

id objc_msgSend_startBeingFindableWithDiscoveryTokens_tokenGroup_(void *a1, const char *a2, ...)
{
  return [a1 startBeingFindableWithDiscoveryTokens:tokenGroup:];
}

id objc_msgSend_startDate(void *a1, const char *a2, ...)
{
  return _[a1 startDate];
}

id objc_msgSend_startDeviceFindingUpdates(void *a1, const char *a2, ...)
{
  return _[a1 startDeviceFindingUpdates];
}

id objc_msgSend_startDeviceMotionUpdatesToQueue_withHandler_(void *a1, const char *a2, ...)
{
  return [a1 startDeviceMotionUpdatesToQueue:withHandler:];
}

id objc_msgSend_startDeviceMotionUpdatesUsingReferenceFrame_toQueue_withHandler_(void *a1, const char *a2, ...)
{
  return [a1 startDeviceMotionUpdatesUsingReferenceFrame:toQueue:withHandler:];
}

id objc_msgSend_startEventCounterForDevice_(void *a1, const char *a2, ...)
{
  return [a1 startEventCounterForDevice:];
}

id objc_msgSend_startHighPriorityScanningForToken_forConsumer_(void *a1, const char *a2, ...)
{
  return [a1 startHighPriorityScanningForToken:forConsumer:];
}

id objc_msgSend_startLeechingForConsumer_(void *a1, const char *a2, ...)
{
  return [a1 startLeechingForConsumer:];
}

id objc_msgSend_startMagnetometerUpdatesToQueue_withHandler_(void *a1, const char *a2, ...)
{
  return [a1 startMagnetometerUpdatesToQueue:withHandler:];
}

id objc_msgSend_startMonitoring(void *a1, const char *a2, ...)
{
  return _[a1 startMonitoring];
}

id objc_msgSend_startMonitoringForAvengerAdvertisementsForBTFinding(void *a1, const char *a2, ...)
{
  return _[a1 startMonitoringForAvengerAdvertisementsForBTFinding];
}

id objc_msgSend_startObserving_observeImmediately_callback_(void *a1, const char *a2, ...)
{
  return [a1 startObserving:x0 observeImmediately:x1 callback:x2];
}

id objc_msgSend_startOdometryUpdatesToQueue_withHandler_(void *a1, const char *a2, ...)
{
  return [a1 startOdometryUpdatesToQueue:withHandler:];
}

id objc_msgSend_startOptions(void *a1, const char *a2, ...)
{
  return _[a1 startOptions];
}

id objc_msgSend_startPedometerEventUpdatesWithHandler_(void *a1, const char *a2, ...)
{
  return [a1 startPedometerEventUpdatesWithHandler:];
}

id objc_msgSend_startPedometerUpdatesFromDate_withHandler_(void *a1, const char *a2, ...)
{
  return [a1 startPedometerUpdatesFromDate:withHandler:];
}

id objc_msgSend_startRangingMangager(void *a1, const char *a2, ...)
{
  return _[a1 startRangingMangager];
}

id objc_msgSend_startRangingMangagerAndCompanion_(void *a1, const char *a2, ...)
{
  return [a1 startRangingMangagerAndCompanion:];
}

id objc_msgSend_startRangingOnDevice_targetEventCounter_(void *a1, const char *a2, ...)
{
  return [a1 startRangingOnDevice:targetEventCounter:];
}

id objc_msgSend_startRangingWithPeer_technology_peerAdvertisement_OOBRangingParameters_(void *a1, const char *a2, ...)
{
  return [a1 startRangingWithPeer:peer technology:technology peerAdvertisement:peerAdvertisement OOBRangingParameters:OOBRangingParameters];
}

id objc_msgSend_startRelativeAltitudeUpdatesToQueue_withHandler_(void *a1, const char *a2, ...)
{
  return [a1 startRelativeAltitudeUpdatesToQueue:withHandler:];
}

id objc_msgSend_startScanning(void *a1, const char *a2, ...)
{
  return _[a1 startScanning];
}

id objc_msgSend_startScanningWithBurstPeriod_(void *a1, const char *a2, ...)
{
  return [a1 startScanningWithBurstPeriod:];
}

id objc_msgSend_startSecureElementLoggingSession_(void *a1, const char *a2, ...)
{
  return [a1 startSecureElementLoggingSession:];
}

id objc_msgSend_startServices(void *a1, const char *a2, ...)
{
  return _[a1 startServices];
}

id objc_msgSend_startUnauthorizedAggressiveAdvertisingOnDevice_(void *a1, const char *a2, ...)
{
  return [a1 startUnauthorizedAggressiveAdvertisingOnDevice:];
}

id objc_msgSend_startUpdatingHeading(void *a1, const char *a2, ...)
{
  return _[a1 startUpdatingHeading];
}

id objc_msgSend_startUpdatingLocation(void *a1, const char *a2, ...)
{
  return _[a1 startUpdatingLocation];
}

id objc_msgSend_startedDiscoveringPeersWithTokens_(void *a1, const char *a2, ...)
{
  return [a1 startedDiscoveringPeersWithTokens:];
}

id objc_msgSend_state(void *a1, const char *a2, ...)
{
  return _[a1 state];
}

id objc_msgSend_stationary(void *a1, const char *a2, ...)
{
  return _[a1 stationary];
}

id objc_msgSend_status(void *a1, const char *a2, ...)
{
  return _[a1 status];
}

id objc_msgSend_statusFlags(void *a1, const char *a2, ...)
{
  return _[a1 statusFlags];
}

id objc_msgSend_stopActivityUpdates(void *a1, const char *a2, ...)
{
  return _[a1 stopActivityUpdates];
}

id objc_msgSend_stopAdvertising(void *a1, const char *a2, ...)
{
  return _[a1 stopAdvertising];
}

id objc_msgSend_stopAdvertisingAsFinder_toPeer_(void *a1, const char *a2, ...)
{
  return [a1 stopAdvertisingAsFinder:toPeer:];
}

id objc_msgSend_stopAdvertisingToPeer_(void *a1, const char *a2, ...)
{
  return [a1 stopAdvertisingToPeer:];
}

id objc_msgSend_stopAggressiveAdvertisingOnDevice_(void *a1, const char *a2, ...)
{
  return [a1 stopAggressiveAdvertisingOnDevice:];
}

id objc_msgSend_stopAndClearState(void *a1, const char *a2, ...)
{
  return _[a1 stopAndClearState];
}

id objc_msgSend_stopBTScanningWithMaxRateForPrototypeHomeSession(void *a1, const char *a2, ...)
{
  return _[a1 stopBTScanningWithMaxRateForPrototypeHomeSession];
}

id objc_msgSend_stopBeingFindableWithDiscoveryTokens_tokenGroup_(void *a1, const char *a2, ...)
{
  return [a1 stopBeingFindableWithDiscoveryTokens:tokenGroup:];
}

id objc_msgSend_stopDeviceFindingUpdates(void *a1, const char *a2, ...)
{
  return _[a1 stopDeviceFindingUpdates];
}

id objc_msgSend_stopDeviceMotionUpdates(void *a1, const char *a2, ...)
{
  return _[a1 stopDeviceMotionUpdates];
}

id objc_msgSend_stopEventCounterForDevice_(void *a1, const char *a2, ...)
{
  return [a1 stopEventCounterForDevice:];
}

id objc_msgSend_stopHighPriorityScanning(void *a1, const char *a2, ...)
{
  return _[a1 stopHighPriorityScanning];
}

id objc_msgSend_stopLeechingForConsumer_(void *a1, const char *a2, ...)
{
  return [a1 stopLeechingForConsumer:];
}

id objc_msgSend_stopMagnetometerUpdates(void *a1, const char *a2, ...)
{
  return _[a1 stopMagnetometerUpdates];
}

id objc_msgSend_stopMonitoring(void *a1, const char *a2, ...)
{
  return _[a1 stopMonitoring];
}

id objc_msgSend_stopMonitoringForAvengerAdvertisementsForBTFinding(void *a1, const char *a2, ...)
{
  return _[a1 stopMonitoringForAvengerAdvertisementsForBTFinding];
}

id objc_msgSend_stopObserving_(void *a1, const char *a2, ...)
{
  return [a1 stopObserving:];
}

id objc_msgSend_stopOdometryUpdates(void *a1, const char *a2, ...)
{
  return _[a1 stopOdometryUpdates];
}

id objc_msgSend_stopPedometerEventUpdates(void *a1, const char *a2, ...)
{
  return _[a1 stopPedometerEventUpdates];
}

id objc_msgSend_stopPedometerUpdates(void *a1, const char *a2, ...)
{
  return _[a1 stopPedometerUpdates];
}

id objc_msgSend_stopRanging(void *a1, const char *a2, ...)
{
  return _[a1 stopRanging];
}

id objc_msgSend_stopRangingMangagerAndCompanion_(void *a1, const char *a2, ...)
{
  return [a1 stopRangingMangagerAndCompanion:];
}

id objc_msgSend_stopRangingOnDevice_(void *a1, const char *a2, ...)
{
  return [a1 stopRangingOnDevice:];
}

id objc_msgSend_stopRangingWithPeer_(void *a1, const char *a2, ...)
{
  return [a1 stopRangingWithPeer:];
}

id objc_msgSend_stopRelativeAltitudeUpdates(void *a1, const char *a2, ...)
{
  return _[a1 stopRelativeAltitudeUpdates];
}

id objc_msgSend_stopScanningAndRemovePeers_(void *a1, const char *a2, ...)
{
  return [a1 stopScanningAndRemovePeers:];
}

id objc_msgSend_stopUpdatingHeading(void *a1, const char *a2, ...)
{
  return _[a1 stopUpdatingHeading];
}

id objc_msgSend_stopUpdatingLocation(void *a1, const char *a2, ...)
{
  return _[a1 stopUpdatingLocation];
}

id objc_msgSend_stoppedDiscoveringAllPeers(void *a1, const char *a2, ...)
{
  return _[a1 stoppedDiscoveringAllPeers];
}

id objc_msgSend_stoppedDiscoveringPeersWithTokens_(void *a1, const char *a2, ...)
{
  return [a1 stoppedDiscoveringPeersWithTokens:];
}

id objc_msgSend_string(void *a1, const char *a2, ...)
{
  return _[a1 string];
}

id objc_msgSend_stringByAppendingPathComponent_(void *a1, const char *a2, ...)
{
  return [a1 stringByAppendingPathComponent:];
}

id objc_msgSend_stringByDeletingLastPathComponent(void *a1, const char *a2, ...)
{
  return _[a1 stringByDeletingLastPathComponent];
}

id objc_msgSend_stringForKey_(void *a1, const char *a2, ...)
{
  return [a1 stringForKey:];
}

id objc_msgSend_stringFromDate_(void *a1, const char *a2, ...)
{
  return [a1 stringFromDate:x0];
}

id objc_msgSend_stringWithCString_encoding_(void *a1, const char *a2, ...)
{
  return [a1 stringWithCString:];
}

id objc_msgSend_stringWithCapacity_(void *a1, const char *a2, ...)
{
  return [a1 stringWithCapacity:];
}

id objc_msgSend_stringWithFormat_(void *a1, const char *a2, ...)
{
  return [a1 stringWithFormat:];
}

id objc_msgSend_stringWithString_(void *a1, const char *a2, ...)
{
  return [a1 stringWithString:];
}

id objc_msgSend_stringWithUTF8String_(void *a1, const char *a2, ...)
{
  return [a1 stringWithUTF8String:];
}

id objc_msgSend_strongToWeakObjectsMapTable(void *a1, const char *a2, ...)
{
  return _[a1 strongToWeakObjectsMapTable];
}

id objc_msgSend_subdataWithRange_(void *a1, const char *a2, ...)
{
  return [a1 subdataWithRange:];
}

id objc_msgSend_submitAnalytics(void *a1, const char *a2, ...)
{
  return _[a1 submitAnalytics];
}

id objc_msgSend_submitTaskRequest_error_(void *a1, const char *a2, ...)
{
  return [a1 submitTaskRequest:error:];
}

id objc_msgSend_substringFromIndex_(void *a1, const char *a2, ...)
{
  return [a1 substringFromIndex:];
}

id objc_msgSend_substringToIndex_(void *a1, const char *a2, ...)
{
  return [a1 substringToIndex:];
}

id objc_msgSend_supportedTechnologies(void *a1, const char *a2, ...)
{
  return _[a1 supportedTechnologies];
}

id objc_msgSend_supportsAoA(void *a1, const char *a2, ...)
{
  return _[a1 supportsAoA];
}

id objc_msgSend_supportsBackgroundedClients(void *a1, const char *a2, ...)
{
  return _[a1 supportsBackgroundedClients];
}

id objc_msgSend_supportsCameraAssistance(void *a1, const char *a2, ...)
{
  return _[a1 supportsCameraAssistance];
}

id objc_msgSend_supportsDevicePresence(void *a1, const char *a2, ...)
{
  return _[a1 supportsDevicePresence];
}

id objc_msgSend_supportsDirectionMeasurement(void *a1, const char *a2, ...)
{
  return _[a1 supportsDirectionMeasurement];
}

id objc_msgSend_supportsExtendedDistanceMeasurement(void *a1, const char *a2, ...)
{
  return _[a1 supportsExtendedDistanceMeasurement];
}

id objc_msgSend_supportsNBAMMS(void *a1, const char *a2, ...)
{
  return _[a1 supportsNBAMMS];
}

id objc_msgSend_supportsPreciseDistanceMeasurement(void *a1, const char *a2, ...)
{
  return _[a1 supportsPreciseDistanceMeasurement];
}

id objc_msgSend_supportsSessionObservers(void *a1, const char *a2, ...)
{
  return _[a1 supportsSessionObservers];
}

id objc_msgSend_supportsSyntheticAperture(void *a1, const char *a2, ...)
{
  return _[a1 supportsSyntheticAperture];
}

id objc_msgSend_supportsUWB(void *a1, const char *a2, ...)
{
  return _[a1 supportsUWB];
}

id objc_msgSend_suspendAcwgRanging_withSuspendTriggerReason_(void *a1, const char *a2, ...)
{
  return [a1 suspendAcwgRanging:withSuspendTriggerReason:];
}

id objc_msgSend_suspensionPolicy(void *a1, const char *a2, ...)
{
  return _[a1 suspensionPolicy];
}

id objc_msgSend_synchronize(void *a1, const char *a2, ...)
{
  return _[a1 synchronize];
}

id objc_msgSend_synchronousRemoteObjectProxyWithErrorHandler_(void *a1, const char *a2, ...)
{
  return [a1 synchronousRemoteObjectProxyWithErrorHandler:];
}

id objc_msgSend_systemConfigurator_didUpdateResourceUsageLimitExceeded_forSessionConfigurationType_(void *a1, const char *a2, ...)
{
  return [a1 systemConfigurator:didUpdateResourceUsageLimitExceeded:forSessionConfigurationType:];
}

id objc_msgSend_systemConfigurator_didUpdateState_(void *a1, const char *a2, ...)
{
  return [_objc_msgSend(a1, "systemConfigurator:didUpdateState:");
}

id objc_msgSend_systemDidUpdateResourceUsageLimitExceeded_forSessionConfigurationTypeWithName_(void *a1, const char *a2, ...)
{
  return [a1 systemDidUpdateResourceUsageLimitExceeded:forSessionConfigurationTypeWithName:];
}

id objc_msgSend_systemDidUpdateState_(void *a1, const char *a2, ...)
{
  return [a1 systemDidUpdateState:];
}

id objc_msgSend_systemKeyRelationship(void *a1, const char *a2, ...)
{
  return _[a1 systemKeyRelationship];
}

id objc_msgSend_systemOverrideFlags(void *a1, const char *a2, ...)
{
  return _[a1 systemOverrideFlags];
}

id objc_msgSend_systemOverrideNotification(void *a1, const char *a2, ...)
{
  return _[a1 systemOverrideNotification];
}

id objc_msgSend_targetWithPid_(void *a1, const char *a2, ...)
{
  return [a1 targetWithPid:];
}

id objc_msgSend_taskRequestForIdentifier_(void *a1, const char *a2, ...)
{
  return [a1 taskRequestForIdentifier:];
}

id objc_msgSend_taskState(void *a1, const char *a2, ...)
{
  return _[a1 taskState];
}

id objc_msgSend_tatInitiator(void *a1, const char *a2, ...)
{
  return _[a1 tatInitiator];
}

id objc_msgSend_tatResponder(void *a1, const char *a2, ...)
{
  return _[a1 tatResponder];
}

id objc_msgSend_tellClientAboutPeer(void *a1, const char *a2, ...)
{
  return _[a1 tellClientAboutPeer];
}

id objc_msgSend_terminate(void *a1, const char *a2, ...)
{
  return _[a1 terminate];
}

id objc_msgSend_timeIntervalSince1970(void *a1, const char *a2, ...)
{
  return _[a1 timeIntervalSince1970];
}

id objc_msgSend_timeIntervalSinceDate_(void *a1, const char *a2, ...)
{
  return [a1 timeIntervalSinceDate:];
}

id objc_msgSend_timeIntervalSinceNow(void *a1, const char *a2, ...)
{
  return _[a1 timeIntervalSinceNow];
}

id objc_msgSend_timeIntervalSinceReferenceDate(void *a1, const char *a2, ...)
{
  return _[a1 timeIntervalSinceReferenceDate];
}

id objc_msgSend_timeOfLatestConnectionState(void *a1, const char *a2, ...)
{
  return _[a1 timeOfLatestConnectionState];
}

id objc_msgSend_timeOfLatestSessionLifecycleChange(void *a1, const char *a2, ...)
{
  return _[a1 timeOfLatestSessionLifecycleChange];
}

id objc_msgSend_timeZoneWithName_(void *a1, const char *a2, ...)
{
  return [a1 timeZoneWithName:];
}

id objc_msgSend_timeoutOnPeerInactivity(void *a1, const char *a2, ...)
{
  return _[a1 timeoutOnPeerInactivity];
}

id objc_msgSend_timestamp(void *a1, const char *a2, ...)
{
  return _[a1 timestamp];
}

id objc_msgSend_toBitmap(void *a1, const char *a2, ...)
{
  return _[a1 toBitmap];
}

id objc_msgSend_toStruct(void *a1, const char *a2, ...)
{
  return _[a1 toStruct];
}

id objc_msgSend_toaNoiseRms(void *a1, const char *a2, ...)
{
  return _[a1 toaNoiseRms];
}

id objc_msgSend_toaPpwinPeak(void *a1, const char *a2, ...)
{
  return _[a1 toaPpwinPeak];
}

id objc_msgSend_toaPpwinRms(void *a1, const char *a2, ...)
{
  return _[a1 toaPpwinRms];
}

id objc_msgSend_tofPicSecond(void *a1, const char *a2, ...)
{
  return _[a1 tofPicSecond];
}

id objc_msgSend_token(void *a1, const char *a2, ...)
{
  return _[a1 token];
}

id objc_msgSend_tokenData(void *a1, const char *a2, ...)
{
  return _[a1 tokenData];
}

id objc_msgSend_tokenVariant(void *a1, const char *a2, ...)
{
  return _[a1 tokenVariant];
}

id objc_msgSend_trackingState(void *a1, const char *a2, ...)
{
  return _[a1 trackingState];
}

id objc_msgSend_transform(void *a1, const char *a2, ...)
{
  return _[a1 transform];
}

id objc_msgSend_transmitPowerOne(void *a1, const char *a2, ...)
{
  return _[a1 transmitPowerOne];
}

id objc_msgSend_transmitPowerThree(void *a1, const char *a2, ...)
{
  return _[a1 transmitPowerThree];
}

id objc_msgSend_transmitPowerTwo(void *a1, const char *a2, ...)
{
  return _[a1 transmitPowerTwo];
}

id objc_msgSend_triggerEnhancedDiscovery_useCase_completion_(void *a1, const char *a2, ...)
{
  return [a1 triggerEnhancedDiscovery:useCase completion:completion];
}

id objc_msgSend_trueHeading(void *a1, const char *a2, ...)
{
  return _[a1 trueHeading];
}

id objc_msgSend_type(void *a1, const char *a2, ...)
{
  return _[a1 type];
}

id objc_msgSend_u64Identifier(void *a1, const char *a2, ...)
{
  return _[a1 u64Identifier];
}

id objc_msgSend_uncacheDevice_(void *a1, const char *a2, ...)
{
  return [a1 uncacheDevice:];
}

id objc_msgSend_uncacheDeviceByTokenData_(void *a1, const char *a2, ...)
{
  return [a1 uncacheDeviceByTokenData:];
}

id objc_msgSend_unionSet_(void *a1, const char *a2, ...)
{
  return [a1 unionSet:];
}

id objc_msgSend_uniqueIdentifier(void *a1, const char *a2, ...)
{
  return _[a1 uniqueIdentifier];
}

id objc_msgSend_uniqueIdentifierForEngine_(void *a1, const char *a2, ...)
{
  return [a1 uniqueIdentifierForEngine:];
}

id objc_msgSend_unknown(void *a1, const char *a2, ...)
{
  return _[a1 unknown];
}

id objc_msgSend_unpublish(void *a1, const char *a2, ...)
{
  return _[a1 unpublish];
}

id objc_msgSend_unregisterForInternalBluetoothSamples_(void *a1, const char *a2, ...)
{
  return [a1 unregisterForInternalBluetoothSamples:];
}

id objc_msgSend_unregisterForVisionInput_(void *a1, const char *a2, ...)
{
  return [a1 unregisterForVisionInput:];
}

id objc_msgSend_unregisterNBAMMSSessionForToken_(void *a1, const char *a2, ...)
{
  return [a1 unregisterNBAMMSSessionForToken:];
}

id objc_msgSend_unregisterObserverWithIdentifier_(void *a1, const char *a2, ...)
{
  return [a1 unregisterObserverWithIdentifier:];
}

id objc_msgSend_unsignedCharValue(void *a1, const char *a2, ...)
{
  return _[a1 unsignedCharValue];
}

id objc_msgSend_unsignedIntValue(void *a1, const char *a2, ...)
{
  return _[a1 unsignedIntValue];
}

id objc_msgSend_unsignedIntegerValue(void *a1, const char *a2, ...)
{
  return _[a1 unsignedIntegerValue];
}

id objc_msgSend_unsignedLongLongValue(void *a1, const char *a2, ...)
{
  return _[a1 unsignedLongLongValue];
}

id objc_msgSend_unsignedShortValue(void *a1, const char *a2, ...)
{
  return _[a1 unsignedShortValue];
}

id objc_msgSend_updateAlgorithmAidingData_token_(void *a1, const char *a2, ...)
{
  return [a1 updateAlgorithmAidingData:token];
}

id objc_msgSend_updateAltimeterData_(void *a1, const char *a2, ...)
{
  return [a1 updateAltimeterData:];
}

id objc_msgSend_updateConfiguration_(void *a1, const char *a2, ...)
{
  return [a1 updateConfiguration:];
}

id objc_msgSend_updateDeviceMotion_(void *a1, const char *a2, ...)
{
  return [a1 updateDeviceMotion:];
}

id objc_msgSend_updateDistanceAnalytics_(void *a1, const char *a2, ...)
{
  return [a1 updateDistanceAnalytics:];
}

id objc_msgSend_updateLocationAuthorized(void *a1, const char *a2, ...)
{
  return _[a1 updateLocationAuthorized];
}

id objc_msgSend_updatePeerData_(void *a1, const char *a2, ...)
{
  return [a1 updatePeerData:];
}

id objc_msgSend_updatePeerState_(void *a1, const char *a2, ...)
{
  return [a1 updatePeerState:];
}

id objc_msgSend_updateRanging_(void *a1, const char *a2, ...)
{
  return [a1 updateRanging:];
}

id objc_msgSend_updateSignallingData_token_(void *a1, const char *a2, ...)
{
  return [a1 updateSignallingData:token:];
}

id objc_msgSend_updateTimeAnalytics_currentTime_(void *a1, const char *a2, ...)
{
  return [a1 updateTimeAnalytics:currentTime:];
}

id objc_msgSend_updateWatchOrientation_(void *a1, const char *a2, ...)
{
  return [a1 updateWatchOrientation:];
}

id objc_msgSend_updateWithAcquisitionReason_(void *a1, const char *a2, ...)
{
  return [a1 updateWithAcquisitionReason:];
}

id objc_msgSend_updateWithFindeePeerData_(void *a1, const char *a2, ...)
{
  return [a1 updateWithFindeePeerData:];
}

id objc_msgSend_updateWithFindeeRequestAt0Finder2Findee_(void *a1, const char *a2, ...)
{
  return [_objc_msgSend(a1, "updateWithFindeeRequestAt0Finder2Findee:");
}

id objc_msgSend_updateWithFindeeRequestAt1Finder1Findee_(void *a1, const char *a2, ...)
{
  return [a1 updateWithFindeeRequestAt1Finder1Findee:];
}

id objc_msgSend_updateWithFindeeRequestAt1Finder2Findee_(void *a1, const char *a2, ...)
{
  return [a1 updateWithFindeeRequestAt1Finder2Findee:];
}

id objc_msgSend_updateWithFinderPeerData_(void *a1, const char *a2, ...)
{
  return [a1 updateWithFinderPeerData:];
}

id objc_msgSend_updateWithFinderRequestAt0Finder2Findee_(void *a1, const char *a2, ...)
{
  return [a1 updateWithFinderRequestAt0Finder2Findee:];
}

id objc_msgSend_updateWithMissedRange(void *a1, const char *a2, ...)
{
  return _[a1 updateWithMissedRange];
}

id objc_msgSend_updateWithMostRecentDistance_(void *a1, const char *a2, ...)
{
  return [a1 updateWithMostRecentDistance:];
}

id objc_msgSend_updateWithMostRecentRawDistance_(void *a1, const char *a2, ...)
{
  return [a1 updateWithMostRecentRawDistance:];
}

id objc_msgSend_updateWithPDR_(void *a1, const char *a2, ...)
{
  return [a1 updateWithPDR:];
}

id objc_msgSend_updateWithPeerLocationFromFMF(void *a1, const char *a2, ...)
{
  return _[a1 updateWithPeerLocationFromFMF];
}

id objc_msgSend_updateWithPose_(void *a1, const char *a2, ...)
{
  return [a1 updateWithPose:];
}

id objc_msgSend_updateWithRangeResult_(void *a1, const char *a2, ...)
{
  return [a1 updateWithRangeResult:];
}

id objc_msgSend_updateWithSASolution_(void *a1, const char *a2, ...)
{
  return [a1 updateWithSASolution:];
}

id objc_msgSend_updateWithSolution_(void *a1, const char *a2, ...)
{
  return [a1 updateWithSolution:];
}

id objc_msgSend_updateWithSuccessfulRange_uwbRSSI_nbRSSI_(void *a1, const char *a2, ...)
{
  return [a1 updateWithSuccessfulRange:uwbRSSI:nbRSSI:];
}

id objc_msgSend_updateWithVIOPose_(void *a1, const char *a2, ...)
{
  return [a1 updateWithVIOPose:];
}

id objc_msgSend_updatesEngine(void *a1, const char *a2, ...)
{
  return _[a1 updatesEngine];
}

id objc_msgSend_updatesEngine_didUpdateAlgorithmConvergenceState_forObject_(void *a1, const char *a2, ...)
{
  return [_objc_msgSend(a1, "updatesEngine:didUpdateAlgorithmConvergenceState:forObject:");
}

id objc_msgSend_updatesEngine_didUpdateFindeeData_forToken_(void *a1, const char *a2, ...)
{
  return [_objc_msgSend(a1, "updatesEngine:didUpdateFindeeData:forToken:");
}

id objc_msgSend_updatesEngine_didUpdateNearbyObjects_(void *a1, const char *a2, ...)
{
  return [a1 updatesEngine:didUpdateNearbyObjects:];
}

id objc_msgSend_updatesEngine_object_didUpdateRegion_previousRegion_regionTransitionSuppressed_(void *a1, const char *a2, ...)
{
  return [_objc_msgSend(a1, "updatesEngine:object:didUpdateRegion:previousRegion:regionTransitionSuppressed:");
}

id objc_msgSend_updatesPolicy(void *a1, const char *a2, ...)
{
  return _[a1 updatesPolicy];
}

id objc_msgSend_updatesQueue(void *a1, const char *a2, ...)
{
  return _[a1 updatesQueue];
}

id objc_msgSend_useCase(void *a1, const char *a2, ...)
{
  return _[a1 useCase];
}

id objc_msgSend_userAcceleration(void *a1, const char *a2, ...)
{
  return _[a1 userAcceleration];
}

id objc_msgSend_userInfo(void *a1, const char *a2, ...)
{
  return _[a1 userInfo];
}

id objc_msgSend_uwbConfigData(void *a1, const char *a2, ...)
{
  return _[a1 uwbConfigData];
}

id objc_msgSend_uwbExtendedDistanceAvailability(void *a1, const char *a2, ...)
{
  return _[a1 uwbExtendedDistanceAvailability];
}

id objc_msgSend_uwbPreciseDistanceAvailability(void *a1, const char *a2, ...)
{
  return _[a1 uwbPreciseDistanceAvailability];
}

id objc_msgSend_uwbProvider(void *a1, const char *a2, ...)
{
  return _[a1 uwbProvider];
}

id objc_msgSend_uwbResource(void *a1, const char *a2, ...)
{
  return _[a1 uwbResource];
}

id objc_msgSend_uwbSessionDidFailWithError_(void *a1, const char *a2, ...)
{
  return [a1 uwbSessionDidFailWithError:];
}

id objc_msgSend_uwbSessionDidInvalidateWithError_(void *a1, const char *a2, ...)
{
  return [a1 uwbSessionDidInvalidateWithError:];
}

id objc_msgSend_uwbSessionId(void *a1, const char *a2, ...)
{
  return _[a1 uwbSessionId];
}

id objc_msgSend_uwbSessionInterruptedWithReason_timestamp_(void *a1, const char *a2, ...)
{
  return [a1 uwbSessionInterruptedWithReason:timestamp:];
}

id objc_msgSend_uwbSessionInterruptionReasonEnded_timestamp_(void *a1, const char *a2, ...)
{
  return [a1 uwbSessionInterruptionReasonEnded:x0 timestamp:x1];
}

id objc_msgSend_uwbSignalFeatures(void *a1, const char *a2, ...)
{
  return _[a1 uwbSignalFeatures];
}

id objc_msgSend_uwbTime(void *a1, const char *a2, ...)
{
  return _[a1 uwbTime];
}

id objc_msgSend_uwbTokenFlags(void *a1, const char *a2, ...)
{
  return _[a1 uwbTokenFlags];
}

id objc_msgSend_validateClientEntitlements_(void *a1, const char *a2, ...)
{
  return [a1 validateClientEntitlements:];
}

id objc_msgSend_validateClientPermissions(void *a1, const char *a2, ...)
{
  return _[a1 validateClientPermissions];
}

id objc_msgSend_value(void *a1, const char *a2, ...)
{
  return _[a1 value];
}

id objc_msgSend_valueForEntitlement_(void *a1, const char *a2, ...)
{
  return [a1 valueForEntitlement:];
}

id objc_msgSend_valueForKey_(void *a1, const char *a2, ...)
{
  return [a1 valueForKey:];
}

id objc_msgSend_valueForProperty_(void *a1, const char *a2, ...)
{
  return [a1 valueForProperty:];
}

id objc_msgSend_vehicleIdentifier(void *a1, const char *a2, ...)
{
  return _[a1 vehicleIdentifier];
}

id objc_msgSend_verticalAccuracy(void *a1, const char *a2, ...)
{
  return _[a1 verticalAccuracy];
}

id objc_msgSend_verticalDirectionEstimate(void *a1, const char *a2, ...)
{
  return _[a1 verticalDirectionEstimate];
}

id objc_msgSend_verticalState(void *a1, const char *a2, ...)
{
  return _[a1 verticalState];
}

id objc_msgSend_walking(void *a1, const char *a2, ...)
{
  return _[a1 walking];
}

id objc_msgSend_weakObjectsHashTable(void *a1, const char *a2, ...)
{
  return _[a1 weakObjectsHashTable];
}

id objc_msgSend_wifiProvider(void *a1, const char *a2, ...)
{
  return _[a1 wifiProvider];
}

id objc_msgSend_wifiRangingRangeError_(void *a1, const char *a2, ...)
{
  return [a1 wifiRangingRangeError:];
}

id objc_msgSend_wifiRangingReadiness_(void *a1, const char *a2, ...)
{
  return [a1 wifiRangingReadiness:];
}

id objc_msgSend_wifiResource(void *a1, const char *a2, ...)
{
  return _[a1 wifiResource];
}

id objc_msgSend_willChangeValueForKey_(void *a1, const char *a2, ...)
{
  return [a1 willChangeValueForKey:];
}

id objc_msgSend_worldAlignment(void *a1, const char *a2, ...)
{
  return _[a1 worldAlignment];
}

id objc_msgSend_worldPosition(void *a1, const char *a2, ...)
{
  return _[a1 worldPosition];
}

id objc_msgSend_worldTrackingState(void *a1, const char *a2, ...)
{
  return _[a1 worldTrackingState];
}

id objc_msgSend_writeItem_synchronizable_systemKeychain_(void *a1, const char *a2, ...)
{
  return [a1 writeItem:synchronizable:systemKeychain:];
}

id objc_msgSend_writeToFile_atomically_(void *a1, const char *a2, ...)
{
  return [a1 writeToFile:atomically:];
}

id objc_msgSend_writeToFile_options_error_(void *a1, const char *a2, ...)
{
  return [a1 writeToFile:x0 options:x1 error:x2];
}

id objc_msgSend_yaw(void *a1, const char *a2, ...)
{
  return _[a1 yaw];
}