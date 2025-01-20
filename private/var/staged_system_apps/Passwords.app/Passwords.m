uint64_t sub_100002E94()
{
  uint64_t v0;
  id v1;
  id v2;

  type metadata accessor for AppLaunchActions();
  v0 = swift_allocObject();
  v1 = [self sharedLogger];
  [v1 didLaunchPasswordsApp];

  if ([self isSignInWithAppleCredentialSharingEnabled])
  {
    v2 = [objc_allocWithZone((Class)PMSignInWithAppleController) init];
    [v2 performHealthCheckInBackground];
  }
  return v0;
}

uint64_t sub_100002F44@<X0>(uint64_t a1@<X8>)
{
  uint64_t v68 = a1;
  uint64_t v67 = sub_100004A20(&qword_10000C2A8);
  ((void (*)(void))__chkstk_darwin)();
  v66 = (char *)&v52 - ((v1 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v65 = sub_100004A20(&qword_10000C2B0);
  uint64_t v73 = *(void *)(v65 - 8);
  uint64_t v2 = ((uint64_t (*)(void))__chkstk_darwin)();
  v64 = (char *)&v52 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v4 = __chkstk_darwin(v2);
  v63 = (char *)&v52 - v5;
  uint64_t v6 = __chkstk_darwin(v4);
  v72 = (char *)&v52 - v7;
  __chkstk_darwin(v6);
  v71 = (char *)&v52 - v8;
  uint64_t v9 = type metadata accessor for PMPasswordsApp();
  uint64_t v52 = *(void *)(v9 - 8);
  uint64_t v10 = *(void *)(v52 + 64);
  __chkstk_darwin(v9 - 8);
  uint64_t v11 = type metadata accessor for PMWindowGroupIdentifier();
  uint64_t v12 = *(void *)(v11 - 8);
  __chkstk_darwin(v11);
  v14 = (char *)&v52 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v15 = sub_100004A20(&qword_10000C2B8);
  uint64_t v59 = *(void *)(v15 - 8);
  __chkstk_darwin(v15);
  v17 = (char *)&v52 - ((v16 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v18 = sub_100004A20(&qword_10000C2C0);
  uint64_t v19 = *(void *)(v18 - 8);
  uint64_t v61 = v18;
  uint64_t v62 = v19;
  __chkstk_darwin(v18);
  v53 = (char *)&v52 - ((v20 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v70 = sub_100004A20(&qword_10000C2C8);
  uint64_t v75 = *(void *)(v70 - 8);
  uint64_t v21 = __chkstk_darwin(v70);
  v69 = (char *)&v52 - ((v22 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v21);
  v74 = (char *)&v52 - v23;
  v24 = *(void (**)(char *, void, uint64_t))(v12 + 104);
  uint64_t v57 = v12 + 104;
  v58 = v24;
  uint64_t v54 = v11;
  v24(v14, enum case for PMWindowGroupIdentifier.main(_:), v11);
  PMWindowGroupIdentifier.rawValue.getter();
  v55 = *(void (**)(char *, uint64_t))(v12 + 8);
  uint64_t v56 = v12 + 8;
  v55(v14, v11);
  uint64_t v25 = v60;
  sub_1000053F0(v60, (uint64_t)&v52 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0));
  unint64_t v26 = (*(unsigned __int8 *)(v52 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v52 + 80);
  uint64_t v27 = swift_allocObject();
  sub_100005458((uint64_t)&v52 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0), v27 + v26);
  sub_100004A20(&qword_10000C2D0);
  sub_100006B50(&qword_10000C2D8, &qword_10000C2D0);
  WindowGroup.init(id:title:lazyContent:)();
  sub_1000059D0((uint64_t)&off_100008730);
  swift_arrayDestroy();
  uint64_t v28 = sub_100006B50(&qword_10000C2E0, &qword_10000C2B8);
  v29 = v53;
  Scene.handlesExternalEvents(matching:)();
  swift_bridgeObjectRelease();
  (*(void (**)(char *, uint64_t))(v59 + 8))(v17, v15);
  uint64_t v76 = v25;
  sub_100004A20(&qword_10000C2E8);
  uint64_t v77 = v15;
  uint64_t v78 = v28;
  swift_getOpaqueTypeConformance2();
  sub_100006B50(&qword_10000C2F0, &qword_10000C2E8);
  v30 = v69;
  uint64_t v31 = v61;
  Scene.commands<A>(content:)();
  (*(void (**)(char *, uint64_t))(v62 + 8))(v29, v31);
  (*(void (**)(char *, char *, uint64_t))(v75 + 32))(v74, v30, v70);
  uint64_t v32 = v54;
  v33 = v58;
  v58(v14, enum case for PMWindowGroupIdentifier.accountDetails(_:), v54);
  uint64_t v61 = PMWindowGroupIdentifier.rawValue.getter();
  v34 = v55;
  v55(v14, v32);
  uint64_t v62 = sub_100004A20(&qword_10000C2F8);
  sub_100006B50(&qword_10000C300, &qword_10000C2F8);
  v35 = v71;
  WindowGroup.init<A, B>(id:for:content:)();
  v33(v14, enum case for PMWindowGroupIdentifier.wifiDetails(_:), v32);
  PMWindowGroupIdentifier.rawValue.getter();
  v34(v14, v32);
  v36 = v72;
  WindowGroup.init<A, B>(id:for:content:)();
  v37 = *(void (**)(char *, char *, uint64_t))(v75 + 16);
  v39 = v69;
  uint64_t v38 = v70;
  v37(v69, v74, v70);
  v40 = *(void (**)(char *, char *, uint64_t))(v73 + 16);
  v41 = v63;
  v42 = v35;
  uint64_t v43 = v65;
  v40(v63, v42, v65);
  v44 = v64;
  v45 = v36;
  uint64_t v46 = v43;
  v40(v64, v45, v43);
  v47 = v66;
  v37(v66, v39, v38);
  uint64_t v48 = v67;
  v40(&v47[*(int *)(v67 + 48)], v41, v46);
  v40(&v47[*(int *)(v48 + 64)], v44, v46);
  _TupleScene.init(_:)();
  v49 = *(void (**)(char *, uint64_t))(v73 + 8);
  v49(v72, v46);
  v49(v71, v46);
  v50 = *(void (**)(char *, uint64_t))(v75 + 8);
  v50(v74, v38);
  v49(v44, v46);
  v49(v41, v46);
  return ((uint64_t (*)(char *, uint64_t))v50)(v39, v38);
}

uint64_t sub_10000391C@<X0>(uint64_t a1@<X0>, uint64_t (**a2)()@<X8>)
{
  uint64_t v4 = *(void *)(type metadata accessor for PMPasswordsApp() - 8);
  uint64_t v5 = *(void *)(v4 + 64);
  __chkstk_darwin();
  sub_1000053F0(a1, (uint64_t)v13 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0));
  unint64_t v6 = (*(unsigned __int8 *)(v4 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v4 + 80);
  uint64_t v7 = swift_allocObject();
  sub_100005458((uint64_t)v13 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0), v7 + v6);
  *a2 = sub_100005D28;
  a2[1] = (uint64_t (*)())v7;
  uint64_t v8 = sub_100004A20(&qword_10000C2D0);
  uint64_t v9 = (uint64_t *)((char *)a2 + *(int *)(v8 + 36));
  *uint64_t v9 = swift_getKeyPath();
  sub_100004A20(&qword_10000C340);
  swift_storeEnumTagMultiPayload();
  uint64_t v10 = (uint64_t (**)())((char *)a2 + *(int *)(v8 + 40));
  [objc_allocWithZone((Class)type metadata accessor for PMPasswordManagerState()) init];
  type metadata accessor for PMExtensionCoordinator();
  swift_allocObject();
  v13[1] = PMExtensionCoordinator.init(appState:)();
  uint64_t result = State.init(wrappedValue:)();
  uint64_t v12 = v13[3];
  *uint64_t v10 = v13[2];
  v10[1] = v12;
  return result;
}

uint64_t sub_100003AC0()
{
  return PMPasswordsPaneView.init(appState:style:)();
}

uint64_t sub_100003B74@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  v18[1] = a1;
  uint64_t v20 = a2;
  uint64_t v19 = sub_100004A20(&qword_10000C318);
  __chkstk_darwin();
  uint64_t v3 = (char *)v18 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_100004A20(&qword_10000C320);
  __chkstk_darwin();
  uint64_t v5 = (char *)v18 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v6 = type metadata accessor for PMWindowGroupIdentifier();
  uint64_t v7 = *(void *)(v6 - 8);
  __chkstk_darwin();
  uint64_t v9 = (char *)v18 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v10 = type metadata accessor for PMAppCommands();
  uint64_t v11 = *(void *)(v10 - 8);
  __chkstk_darwin();
  uint64_t v13 = (char *)v18 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  (*(void (**)(char *, void, uint64_t))(v7 + 104))(v9, enum case for PMWindowGroupIdentifier.main(_:), v6);
  PMWindowGroupIdentifier.rawValue.getter();
  (*(void (**)(char *, uint64_t))(v7 + 8))(v9, v6);
  PMAppCommands.init(mainWindowGroupIdentifier:)();
  type metadata accessor for PMPasswordsApp();
  if ((dispatch thunk of PMDebugSettingsManager.shouldShowDebugMenu.getter() & 1) != 0
    && (dispatch thunk of PMDebugSettingsManager.hideDebugMenuUntilRelaunch.getter() & 1) == 0
    && [self isInternalInstall])
  {
    LocalizedStringKey.init(stringLiteral:)();
    type metadata accessor for PMDebugSettingsControls();
    sub_100005BC4(&qword_10000C330, (void (*)(uint64_t))&type metadata accessor for PMDebugSettingsControls);
    CommandMenu.init(_:content:)();
    uint64_t v14 = sub_100004A20(&qword_10000C328);
    (*(void (**)(char *, void, uint64_t, uint64_t))(*(void *)(v14 - 8) + 56))(v5, 0, 1, v14);
  }
  else
  {
    uint64_t v15 = sub_100004A20(&qword_10000C328);
    (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v15 - 8) + 56))(v5, 1, 1, v15);
  }
  uint64_t v16 = (uint64_t)&v3[*(int *)(v19 + 48)];
  (*(void (**)(char *, char *, uint64_t))(v11 + 16))(v3, v13, v10);
  sub_100006B94((uint64_t)v5, v16, &qword_10000C320);
  TupleCommandContent.init(_:)();
  sub_100006AF4((uint64_t)v5, &qword_10000C320);
  return (*(uint64_t (**)(char *, uint64_t))(v11 + 8))(v13, v10);
}

uint64_t sub_100003F7C(uint64_t a1)
{
  return sub_100003FFC(a1, (void (*)(void))&type metadata accessor for PMAppAccountDetailsWindowModel, (void (*)())&PMAppAccountDetailsWindowModel.init(accountID:));
}

uint64_t sub_100003FBC(uint64_t a1)
{
  return sub_100003FFC(a1, (void (*)(void))&type metadata accessor for PMWiFiDetailsWindowModel, (void (*)())&PMWiFiDetailsWindowModel.init(networkID:));
}

uint64_t sub_100003FFC(uint64_t a1, void (*a2)(void), void (*a3)())
{
  return swift_release();
}

uint64_t sub_10000414C(uint64_t a1, unsigned int *a2)
{
  type metadata accessor for PMAppDetailsWindowView.Detail();
  __chkstk_darwin();
  uint64_t v5 = (uint64_t *)((char *)&v8 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0));
  *uint64_t v5 = a1;
  (*(void (**)(void *, void))(v6 + 104))(v5, *a2);
  swift_retain();
  return PMAppDetailsWindowView.init(model:)();
}

uint64_t sub_10000422C@<X0>(int *a1@<X0>, uint64_t a2@<X8>)
{
  type metadata accessor for PMUIApplicationDelegate();
  sub_100005BC4(&qword_10000C298, (void (*)(uint64_t))&type metadata accessor for PMUIApplicationDelegate);
  UIApplicationDelegateAdaptor<>.init(_:)();
  uint64_t v4 = a2 + a1[5];
  *(void *)uint64_t v4 = sub_100002E94;
  *(void *)(v4 + 8) = 0;
  *(unsigned char *)(v4 + 16) = 0;
  uint64_t v5 = (uint64_t *)(a2 + a1[6]);
  swift_getKeyPath();
  sub_100005BC4(&qword_10000C2A0, (void (*)(uint64_t))&type metadata accessor for PMDebugSettingsManager);
  *uint64_t v5 = ObservedObject.init(dependency:)();
  v5[1] = v6;
  uint64_t v7 = a1[7];
  uint64_t result = AppStorage.init<A>(wrappedValue:_:store:)();
  *(void *)(a2 + v7) = result;
  return result;
}

uint64_t sub_100004354@<X0>(uint64_t a1@<X0>, char *a2@<X8>)
{
  uint64_t v3 = v2;
  v35 = a2;
  uint64_t v5 = sub_100004A20(&qword_10000C348);
  uint64_t v6 = __chkstk_darwin(v5 - 8);
  uint64_t v8 = *(void *)(a1 + 16);
  uint64_t v9 = a1;
  uint64_t v31 = a1;
  uint64_t v32 = v8;
  uint64_t v33 = (uint64_t)&v31 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v34 = *(void *)(v8 - 8);
  __chkstk_darwin(v6);
  uint64_t v11 = (char *)&v31 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_10000552C(&qword_10000C3F0);
  uint64_t v12 = type metadata accessor for ModifiedContent();
  uint64_t v13 = *(void *)(v12 - 8);
  uint64_t v14 = __chkstk_darwin(v12);
  uint64_t v16 = (char *)&v31 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v14);
  uint64_t v18 = (char *)&v31 - v17;
  uint64_t v19 = *v3;
  uint64_t v20 = (uint64_t *)((char *)v3 + *(int *)(v9 + 40));
  uint64_t v22 = *v20;
  uint64_t v21 = v20[1];
  uint64_t v38 = v22;
  uint64_t v39 = v21;
  sub_100004A20(&qword_10000C3F8);
  State.wrappedValue.getter();
  v19(v40);
  swift_release();
  swift_getKeyPath();
  uint64_t v23 = v31;
  uint64_t v24 = v33;
  sub_10000513C(v33);
  uint64_t v25 = *(void *)(v23 + 24);
  uint64_t v26 = v32;
  View.environment<A>(_:_:)();
  swift_release();
  sub_100006AF4(v24, &qword_10000C348);
  (*(void (**)(char *, uint64_t))(v34 + 8))(v11, v26);
  uint64_t v27 = sub_100006B50(&qword_10000C400, &qword_10000C3F0);
  uint64_t v36 = v25;
  uint64_t v37 = v27;
  swift_getWitnessTable();
  uint64_t v28 = *(void (**)(char *, char *, uint64_t))(v13 + 16);
  v28(v18, v16, v12);
  v29 = *(void (**)(char *, uint64_t))(v13 + 8);
  v29(v16, v12);
  v28(v35, v18, v12);
  return ((uint64_t (*)(char *, uint64_t))v29)(v18, v12);
}

uint64_t sub_100004690()
{
  return EnvironmentValues.windowHorizontalSizeClass.getter();
}

uint64_t sub_1000046B4(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return sub_100004708(a1, a2, a3, a4, (uint64_t (*)(char *))&EnvironmentValues.windowHorizontalSizeClass.setter);
}

uint64_t sub_1000046CC()
{
  return EnvironmentValues.horizontalSizeClass.getter();
}

uint64_t sub_1000046F0(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return sub_100004708(a1, a2, a3, a4, (uint64_t (*)(char *))&EnvironmentValues.horizontalSizeClass.setter);
}

uint64_t sub_100004708(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t (*a5)(char *))
{
  uint64_t v7 = sub_100004A20(&qword_10000C348);
  __chkstk_darwin(v7 - 8);
  uint64_t v9 = (char *)&v11 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_100006B94(a1, (uint64_t)v9, &qword_10000C348);
  return a5(v9);
}

uint64_t sub_1000047B4()
{
  return static View._viewListCount(inputs:)();
}

uint64_t sub_1000047D4()
{
  return _swift_deallocClassInstance(v0, 16, 7);
}

uint64_t sub_1000047E4@<X0>(uint64_t *a1@<X8>)
{
  type metadata accessor for AppLaunchActions();
  uint64_t result = ObservableObject<>.objectWillChange.getter();
  *a1 = result;
  return result;
}

int main(int argc, const char **argv, const char **envp)
{
  return 0;
}

uint64_t type metadata accessor for PMPasswordsApp()
{
  uint64_t result = qword_10000C250;
  if (!qword_10000C250) {
    return swift_getSingletonMetadata();
  }
  return result;
}

uint64_t type metadata accessor for AppLaunchActions()
{
  return self;
}

uint64_t *sub_1000048FC(uint64_t *a1, uint64_t *a2, int *a3)
{
  uint64_t v4 = a1;
  int v5 = *(_DWORD *)(*((void *)a3 - 1) + 80);
  if ((v5 & 0x20000) != 0)
  {
    uint64_t v19 = *a2;
    *a1 = *a2;
    uint64_t v4 = (uint64_t *)(v19 + ((v5 + 16) & ~(unint64_t)v5));
  }
  else
  {
    uint64_t v7 = sub_100004A20(&qword_10000C1F0);
    (*(void (**)(uint64_t *, uint64_t *, uint64_t))(*(void *)(v7 - 8) + 16))(v4, a2, v7);
    uint64_t v8 = a3[5];
    uint64_t v9 = (char *)v4 + v8;
    uint64_t v10 = (char *)a2 + v8;
    uint64_t v11 = *(void *)v10;
    uint64_t v12 = *((void *)v10 + 1);
    char v13 = v10[16];
    sub_100004A64();
    *(void *)uint64_t v9 = v11;
    *((void *)v9 + 1) = v12;
    v9[16] = v13;
    uint64_t v14 = a3[6];
    uint64_t v15 = a3[7];
    uint64_t v16 = (uint64_t *)((char *)v4 + v14);
    uint64_t v17 = (uint64_t *)((char *)a2 + v14);
    uint64_t v18 = v17[1];
    *uint64_t v16 = *v17;
    v16[1] = v18;
    *(uint64_t *)((char *)v4 + v15) = *(uint64_t *)((char *)a2 + v15);
    swift_retain();
  }
  swift_retain();
  return v4;
}

uint64_t sub_100004A20(uint64_t *a1)
{
  uint64_t result = *a1;
  if (result < 0)
  {
    uint64_t result = swift_getTypeByMangledNameInContext2();
    *a1 = result;
  }
  return result;
}

uint64_t sub_100004A64()
{
  return swift_retain();
}

uint64_t sub_100004A6C(uint64_t a1)
{
  uint64_t v2 = sub_100004A20(&qword_10000C1F0);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(a1, v2);
  sub_100004B08();
  swift_release();

  return swift_release();
}

uint64_t sub_100004B08()
{
  return swift_release();
}

uint64_t sub_100004B10(uint64_t a1, uint64_t a2, int *a3)
{
  uint64_t v6 = sub_100004A20(&qword_10000C1F0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v6 - 8) + 16))(a1, a2, v6);
  uint64_t v7 = a3[5];
  uint64_t v8 = a1 + v7;
  uint64_t v9 = (uint64_t *)(a2 + v7);
  uint64_t v10 = *v9;
  uint64_t v11 = v9[1];
  char v12 = *((unsigned char *)v9 + 16);
  sub_100004A64();
  *(void *)uint64_t v8 = v10;
  *(void *)(v8 + 8) = v11;
  *(unsigned char *)(v8 + 16) = v12;
  uint64_t v13 = a3[6];
  uint64_t v14 = a3[7];
  uint64_t v15 = (void *)(a1 + v13);
  uint64_t v16 = (void *)(a2 + v13);
  uint64_t v17 = v16[1];
  *uint64_t v15 = *v16;
  v15[1] = v17;
  *(void *)(a1 + v14) = *(void *)(a2 + v14);
  swift_retain();
  swift_retain();
  return a1;
}

uint64_t sub_100004BE8(uint64_t a1, uint64_t a2, int *a3)
{
  uint64_t v6 = sub_100004A20(&qword_10000C1F0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v6 - 8) + 24))(a1, a2, v6);
  uint64_t v7 = a3[5];
  uint64_t v8 = a1 + v7;
  uint64_t v9 = (uint64_t *)(a2 + v7);
  uint64_t v10 = *v9;
  uint64_t v11 = v9[1];
  char v12 = *((unsigned char *)v9 + 16);
  sub_100004A64();
  *(void *)uint64_t v8 = v10;
  *(void *)(v8 + 8) = v11;
  *(unsigned char *)(v8 + 16) = v12;
  sub_100004B08();
  uint64_t v13 = a3[6];
  uint64_t v14 = (void *)(a1 + v13);
  uint64_t v15 = (void *)(a2 + v13);
  void *v14 = *v15;
  v14[1] = v15[1];
  swift_retain();
  swift_release();
  *(void *)(a1 + a3[7]) = *(void *)(a2 + a3[7]);
  swift_retain();
  swift_release();
  return a1;
}

uint64_t sub_100004CEC(uint64_t a1, uint64_t a2, int *a3)
{
  uint64_t v6 = sub_100004A20(&qword_10000C1F0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v6 - 8) + 32))(a1, a2, v6);
  uint64_t v7 = a3[5];
  uint64_t v8 = a3[6];
  uint64_t v9 = a1 + v7;
  uint64_t v10 = a2 + v7;
  *(_OWORD *)uint64_t v9 = *(_OWORD *)v10;
  *(unsigned char *)(v9 + 16) = *(unsigned char *)(v10 + 16);
  *(_OWORD *)(a1 + v8) = *(_OWORD *)(a2 + v8);
  *(void *)(a1 + a3[7]) = *(void *)(a2 + a3[7]);
  return a1;
}

uint64_t sub_100004D90(uint64_t a1, uint64_t a2, int *a3)
{
  uint64_t v6 = sub_100004A20(&qword_10000C1F0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v6 - 8) + 40))(a1, a2, v6);
  uint64_t v7 = a3[5];
  uint64_t v8 = a1 + v7;
  uint64_t v9 = a2 + v7;
  char v10 = *(unsigned char *)(v9 + 16);
  *(_OWORD *)uint64_t v8 = *(_OWORD *)v9;
  *(unsigned char *)(v8 + 16) = v10;
  sub_100004B08();
  uint64_t v11 = a3[6];
  char v12 = (void *)(a1 + v11);
  uint64_t v13 = (uint64_t *)(a2 + v11);
  uint64_t v15 = *v13;
  uint64_t v14 = v13[1];
  *char v12 = v15;
  v12[1] = v14;
  swift_release();
  *(void *)(a1 + a3[7]) = *(void *)(a2 + a3[7]);
  swift_release();
  return a1;
}

uint64_t sub_100004E5C(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return _swift_getEnumTagSinglePayloadGeneric(a1, a2, a3, sub_100004E70);
}

uint64_t sub_100004E70(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = sub_100004A20(&qword_10000C1F0);
  uint64_t v7 = *(void *)(v6 - 8);
  if (*(_DWORD *)(v7 + 84) == a2)
  {
    uint64_t v8 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v7 + 48);
    return v8(a1, a2, v6);
  }
  else
  {
    unint64_t v10 = *(void *)(a1 + *(int *)(a3 + 24) + 8);
    if (v10 >= 0xFFFFFFFF) {
      LODWORD(v10) = -1;
    }
    return (v10 + 1);
  }
}

uint64_t sub_100004F38(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return _swift_storeEnumTagSinglePayloadGeneric(a1, a2, a3, a4, sub_100004F4C);
}

uint64_t sub_100004F4C(uint64_t a1, uint64_t a2, int a3, uint64_t a4)
{
  uint64_t result = sub_100004A20(&qword_10000C1F0);
  uint64_t v9 = *(void *)(result - 8);
  if (*(_DWORD *)(v9 + 84) == a3)
  {
    unint64_t v10 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v9 + 56);
    return v10(a1, a2, a2, result);
  }
  else
  {
    *(void *)(a1 + *(int *)(a4 + 24) + 8) = (a2 - 1);
  }
  return result;
}

void sub_100005010()
{
  sub_1000050BC();
  if (v0 <= 0x3F) {
    swift_initStructMetadata();
  }
}

void sub_1000050BC()
{
  if (!qword_10000C260)
  {
    type metadata accessor for PMUIApplicationDelegate();
    unint64_t v0 = type metadata accessor for UIApplicationDelegateAdaptor();
    if (!v1) {
      atomic_store(v0, (unint64_t *)&qword_10000C260);
    }
  }
}

void *sub_100005114()
{
  return &protocol witness table for ObservableObjectPublisher;
}

uint64_t sub_100005120()
{
  return swift_getOpaqueTypeConformance2();
}

uint64_t sub_10000513C@<X0>(uint64_t a1@<X8>)
{
  uint64_t v2 = v1;
  uint64_t v4 = type metadata accessor for EnvironmentValues();
  uint64_t v5 = *(void *)(v4 - 8);
  __chkstk_darwin(v4);
  uint64_t v7 = (char *)&v15 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v8 = sub_100004A20(&qword_10000C340);
  __chkstk_darwin(v8);
  unint64_t v10 = (char *)&v15 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_100006B94(v2, (uint64_t)v10, &qword_10000C340);
  if (swift_getEnumCaseMultiPayload() == 1) {
    return sub_100006BF8((uint64_t)v10, a1);
  }
  os_log_type_t v12 = static os_log_type_t.fault.getter();
  uint64_t v13 = static Log.runtimeIssuesLog.getter();
  if (os_log_type_enabled(v13, v12))
  {
    uint64_t v14 = swift_slowAlloc();
    uint64_t v16 = swift_slowAlloc();
    *(_DWORD *)uint64_t v14 = 136315138;
    *(void *)(v14 + 4) = sub_100005574(0xD000000000000020, 0x8000000100007670, &v16);
    _os_log_impl((void *)&_mh_execute_header, v13, v12, "Accessing Environment<%s>'s value outside of being installed on a View. This will always read the default value and will not update.", (uint8_t *)v14, 0xCu);
    swift_arrayDestroy();
    swift_slowDealloc();
    swift_slowDealloc();
  }

  EnvironmentValues.init()();
  swift_getAtKeyPath();
  swift_release();
  return (*(uint64_t (**)(char *, uint64_t))(v5 + 8))(v7, v4);
}

uint64_t sub_100005398@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result = PMDependencyStore.debugSettingsManager.getter();
  *a1 = result;
  return result;
}

uint64_t sub_1000053C4()
{
  return PMDependencyStore.debugSettingsManager.setter();
}

uint64_t sub_1000053F0(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = type metadata accessor for PMPasswordsApp();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

uint64_t sub_100005458(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = type metadata accessor for PMPasswordsApp();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 32))(a2, a1, v4);
  return a2;
}

uint64_t sub_1000054BC@<X0>(uint64_t (**a1)()@<X8>)
{
  uint64_t v3 = *(void *)(type metadata accessor for PMPasswordsApp() - 8);
  uint64_t v4 = v1 + ((*(unsigned __int8 *)(v3 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v3 + 80));

  return sub_10000391C(v4, a1);
}

uint64_t sub_10000552C(uint64_t *a1)
{
  uint64_t result = *a1;
  if (result < 0)
  {
    uint64_t result = swift_getTypeByMangledNameInContextInMetadataState2();
    *a1 = result;
  }
  return result;
}

unint64_t sub_100005574(uint64_t a1, unint64_t a2, uint64_t *a3)
{
  unint64_t v6 = sub_100005648(v12, 0, 0, 1, a1, a2);
  unint64_t v7 = v12[0];
  if (v6)
  {
    unint64_t v8 = v6;
    ObjectType = (void *)swift_getObjectType();
    v12[0] = v8;
    uint64_t v9 = *a3;
    if (*a3)
    {
      sub_100006CB0((uint64_t)v12, *a3);
      *a3 = v9 + 32;
    }
  }
  else
  {
    ObjectType = &type metadata for _StringGuts;
    v12[0] = a1;
    v12[1] = a2;
    uint64_t v10 = *a3;
    if (*a3)
    {
      sub_100006CB0((uint64_t)v12, *a3);
      *a3 = v10 + 32;
    }
    swift_bridgeObjectRetain();
  }
  sub_100006C60((uint64_t)v12);
  return v7;
}

unint64_t sub_100005648(unint64_t *a1, void *__dst, uint64_t a3, char a4, uint64_t a5, unint64_t a6)
{
  if ((a6 & 0x2000000000000000) != 0)
  {
    if ((a4 & 1) == 0)
    {
      if (__dst)
      {
        uint64_t v10 = HIBYTE(a6) & 0xF;
        if (a3 - (uint64_t)__dst > v10)
        {
          v12[0] = a5;
          v12[1] = a6 & 0xFFFFFFFFFFFFFFLL;
          memcpy(__dst, v12, HIBYTE(a6) & 0xF);
          unint64_t result = 0;
          *((unsigned char *)__dst + v10) = 0;
          *a1 = (unint64_t)__dst;
          return result;
        }
      }
    }
    goto LABEL_11;
  }
  if ((a6 & 0x1000000000000000) != 0)
  {
LABEL_11:
    unint64_t result = (unint64_t)sub_100005748(a5, a6);
    *a1 = v11;
    return result;
  }
  if ((a5 & 0x1000000000000000) != 0)
  {
    unint64_t result = (a6 & 0xFFFFFFFFFFFFFFFLL) + 32;
  }
  else
  {
    unint64_t result = _StringObject.sharedUTF8.getter();
    if (!result)
    {
      __break(1u);
      return result;
    }
  }
  *a1 = result;
  if ((a6 & 0x8000000000000000) != 0) {
    return 0;
  }
  else {
    return swift_unknownObjectRetain();
  }
}

char *sub_100005748(uint64_t a1, unint64_t a2)
{
  uint64_t v2 = (char *)sub_1000057E0(a1, a2);
  if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
    uint64_t v2 = sub_1000058E4(0, *((void *)v2 + 2) + 1, 1, v2);
  }
  unint64_t v4 = *((void *)v2 + 2);
  unint64_t v3 = *((void *)v2 + 3);
  if (v4 >= v3 >> 1) {
    uint64_t v2 = sub_1000058E4((char *)(v3 > 1), v4 + 1, 1, v2);
  }
  *((void *)v2 + 2) = v4 + 1;
  v2[v4 + 32] = 0;
  return v2;
}

void *sub_1000057E0(uint64_t a1, unint64_t a2)
{
  if ((a2 & 0x1000000000000000) != 0) {
    goto LABEL_9;
  }
  if ((a2 & 0x2000000000000000) != 0) {
    uint64_t v2 = HIBYTE(a2) & 0xF;
  }
  else {
    uint64_t v2 = a1 & 0xFFFFFFFFFFFFLL;
  }
  if (v2)
  {
    while (1)
    {
      unint64_t v3 = sub_10000587C(v2, 0);
      unint64_t result = (void *)_StringGuts.copyUTF8(into:)();
      if (v5) {
        break;
      }
      if (result == (void *)v2) {
        return v3;
      }
      __break(1u);
LABEL_9:
      uint64_t v2 = String.UTF8View._foreignCount()();
      if (!v2) {
        return &_swiftEmptyArrayStorage;
      }
    }
    __break(1u);
  }
  else
  {
    return &_swiftEmptyArrayStorage;
  }
  return result;
}

void *sub_10000587C(uint64_t a1, uint64_t a2)
{
  if (a2 <= a1) {
    uint64_t v2 = a1;
  }
  else {
    uint64_t v2 = a2;
  }
  if (!v2) {
    return &_swiftEmptyArrayStorage;
  }
  sub_100004A20(&qword_10000C408);
  unint64_t v4 = (void *)swift_allocObject();
  size_t v5 = j__malloc_size(v4);
  v4[2] = a1;
  v4[3] = 2 * v5 - 64;
  return v4;
}

char *sub_1000058E4(char *result, int64_t a2, char a3, char *a4)
{
  char v5 = (char)result;
  if (a3)
  {
    unint64_t v6 = *((void *)a4 + 3);
    int64_t v7 = v6 >> 1;
    if ((uint64_t)(v6 >> 1) < a2)
    {
      if (v7 + 0x4000000000000000 < 0)
      {
        __break(1u);
        return result;
      }
      int64_t v7 = v6 & 0xFFFFFFFFFFFFFFFELL;
      if ((uint64_t)(v6 & 0xFFFFFFFFFFFFFFFELL) <= a2) {
        int64_t v7 = a2;
      }
    }
  }
  else
  {
    int64_t v7 = a2;
  }
  int64_t v8 = *((void *)a4 + 2);
  if (v7 <= v8) {
    int64_t v9 = *((void *)a4 + 2);
  }
  else {
    int64_t v9 = v7;
  }
  if (v9)
  {
    sub_100004A20(&qword_10000C408);
    uint64_t v10 = (char *)swift_allocObject();
    size_t v11 = j__malloc_size(v10);
    *((void *)v10 + 2) = v8;
    *((void *)v10 + 3) = 2 * v11 - 64;
  }
  else
  {
    uint64_t v10 = (char *)&_swiftEmptyArrayStorage;
  }
  os_log_type_t v12 = v10 + 32;
  uint64_t v13 = a4 + 32;
  if (v5)
  {
    if (v10 != a4 || v12 >= &v13[v8]) {
      memmove(v12, v13, v8);
    }
    *((void *)a4 + 2) = 0;
  }
  else
  {
    memcpy(v12, v13, v8);
  }
  swift_bridgeObjectRelease();
  return v10;
}

Swift::Int sub_1000059D0(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 16);
  if (v1)
  {
    sub_100004A20(&qword_10000C338);
    uint64_t v3 = static _SetStorage.allocate(capacity:)();
    uint64_t v4 = 0;
    uint64_t v5 = v3 + 56;
    uint64_t v25 = a1 + 32;
    while (1)
    {
      unint64_t v6 = (uint64_t *)(v25 + 16 * v4);
      uint64_t v8 = *v6;
      uint64_t v7 = v6[1];
      Hasher.init(_seed:)();
      swift_bridgeObjectRetain();
      String.hash(into:)();
      Swift::Int result = Hasher._finalize()();
      uint64_t v10 = -1 << *(unsigned char *)(v3 + 32);
      unint64_t v11 = result & ~v10;
      unint64_t v12 = v11 >> 6;
      uint64_t v13 = *(void *)(v5 + 8 * (v11 >> 6));
      uint64_t v14 = 1 << v11;
      if (((1 << v11) & v13) != 0)
      {
        uint64_t v15 = *(void *)(v3 + 48);
        uint64_t v16 = (void *)(v15 + 16 * v11);
        BOOL v17 = *v16 == v8 && v16[1] == v7;
        if (v17 || (Swift::Int result = _stringCompareWithSmolCheck(_:_:expecting:)(), (result & 1) != 0))
        {
LABEL_3:
          swift_bridgeObjectRelease();
          goto LABEL_4;
        }
        uint64_t v18 = ~v10;
        while (1)
        {
          unint64_t v11 = (v11 + 1) & v18;
          unint64_t v12 = v11 >> 6;
          uint64_t v13 = *(void *)(v5 + 8 * (v11 >> 6));
          uint64_t v14 = 1 << v11;
          if ((v13 & (1 << v11)) == 0) {
            break;
          }
          uint64_t v19 = (void *)(v15 + 16 * v11);
          if (*v19 != v8 || v19[1] != v7)
          {
            Swift::Int result = _stringCompareWithSmolCheck(_:_:expecting:)();
            if ((result & 1) == 0) {
              continue;
            }
          }
          goto LABEL_3;
        }
      }
      *(void *)(v5 + 8 * v12) = v14 | v13;
      uint64_t v21 = (void *)(*(void *)(v3 + 48) + 16 * v11);
      *uint64_t v21 = v8;
      v21[1] = v7;
      uint64_t v22 = *(void *)(v3 + 16);
      BOOL v23 = __OFADD__(v22, 1);
      uint64_t v24 = v22 + 1;
      if (v23)
      {
        __break(1u);
        return result;
      }
      *(void *)(v3 + 16) = v24;
LABEL_4:
      if (++v4 == v1) {
        return v3;
      }
    }
  }
  return (Swift::Int)&_swiftEmptySetSingleton;
}

uint64_t sub_100005B74@<X0>(uint64_t a1@<X8>)
{
  return sub_100003B74(*(void *)(v1 + 16), a1);
}

uint64_t sub_100005B7C()
{
  return sub_10000414C(v0, &enum case for PMAppDetailsWindowView.Detail.wifi(_:));
}

uint64_t sub_100005BA0()
{
  return sub_10000414C(v0, &enum case for PMAppDetailsWindowView.Detail.account(_:));
}

uint64_t sub_100005BC4(unint64_t *a1, void (*a2)(uint64_t))
{
  uint64_t result = *a1;
  if (!result)
  {
    a2(255);
    uint64_t result = swift_getWitnessTable();
    atomic_store(result, a1);
  }
  return result;
}

uint64_t sub_100005C10()
{
  uint64_t v1 = *(void *)(type metadata accessor for PMPasswordsApp() - 8);
  uint64_t v2 = *(unsigned __int8 *)(v1 + 80);
  uint64_t v3 = (v2 + 16) & ~v2;
  uint64_t v4 = v3 + *(void *)(v1 + 64);
  uint64_t v5 = v2 | 7;
  uint64_t v6 = v0 + v3;
  uint64_t v7 = sub_100004A20(&qword_10000C1F0);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v7 - 8) + 8))(v6, v7);
  sub_100004B08();
  swift_release();
  swift_release();

  return _swift_deallocObject(v0, v4, v5);
}

uint64_t sub_100005D28()
{
  type metadata accessor for PMPasswordsApp();

  return sub_100003AC0();
}

uint64_t sub_100005DA8(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return _swift_allocateGenericValueMetadata(a1, a2, a3, 32);
}

void sub_100005DB0()
{
  sub_100006A18();
  if (v0 <= 0x3F) {
    swift_initStructMetadata();
  }
}

void *sub_100005E54(void *a1, uint64_t *a2, uint64_t a3)
{
  uint64_t v3 = a1;
  int v4 = *(_DWORD *)(*(void *)(a3 - 8) + 80);
  uint64_t v5 = *a2;
  if ((v4 & 0x20000) != 0)
  {
    *a1 = v5;
    uint64_t v3 = (void *)(v5 + ((v4 + 16) & ~(unint64_t)v4));
  }
  else
  {
    uint64_t v8 = a2[1];
    *uint64_t v3 = v5;
    v3[1] = v8;
    uint64_t v9 = *(int *)(a3 + 36);
    uint64_t v10 = (void *)((char *)v3 + v9);
    unint64_t v11 = (uint64_t *)((char *)a2 + v9);
    swift_retain();
    sub_100004A20(&qword_10000C340);
    if (swift_getEnumCaseMultiPayload() == 1)
    {
      uint64_t v12 = type metadata accessor for UserInterfaceSizeClass();
      uint64_t v13 = *(void *)(v12 - 8);
      if ((*(unsigned int (**)(void *, uint64_t, uint64_t))(v13 + 48))(v11, 1, v12))
      {
        uint64_t v14 = sub_100004A20(&qword_10000C348);
        memcpy(v10, v11, *(void *)(*(void *)(v14 - 8) + 64));
      }
      else
      {
        (*(void (**)(void *, void *, uint64_t))(v13 + 16))(v10, v11, v12);
        (*(void (**)(void *, void, uint64_t, uint64_t))(v13 + 56))(v10, 0, 1, v12);
      }
    }
    else
    {
      *uint64_t v10 = *v11;
      swift_retain();
    }
    swift_storeEnumTagMultiPayload();
    uint64_t v15 = *(int *)(a3 + 40);
    uint64_t v16 = (void *)((char *)v3 + v15);
    BOOL v17 = (uint64_t *)((char *)a2 + v15);
    uint64_t v18 = v17[1];
    *uint64_t v16 = *v17;
    v16[1] = v18;
    swift_retain();
  }
  swift_retain();
  return v3;
}

uint64_t sub_10000604C(uint64_t a1, uint64_t a2)
{
  swift_release();
  uint64_t v4 = a1 + *(int *)(a2 + 36);
  sub_100004A20(&qword_10000C340);
  if (swift_getEnumCaseMultiPayload() == 1)
  {
    uint64_t v5 = type metadata accessor for UserInterfaceSizeClass();
    uint64_t v6 = *(void *)(v5 - 8);
    if (!(*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v6 + 48))(v4, 1, v5)) {
      (*(void (**)(uint64_t, uint64_t))(v6 + 8))(v4, v5);
    }
  }
  else
  {
    swift_release();
  }
  swift_release();

  return swift_release();
}

void *sub_100006168(void *a1, void *a2, uint64_t a3)
{
  uint64_t v6 = a2[1];
  *a1 = *a2;
  a1[1] = v6;
  uint64_t v7 = *(int *)(a3 + 36);
  uint64_t v8 = (void *)((char *)a1 + v7);
  uint64_t v9 = (void *)((char *)a2 + v7);
  swift_retain();
  sub_100004A20(&qword_10000C340);
  if (swift_getEnumCaseMultiPayload() == 1)
  {
    uint64_t v10 = type metadata accessor for UserInterfaceSizeClass();
    uint64_t v11 = *(void *)(v10 - 8);
    if ((*(unsigned int (**)(void *, uint64_t, uint64_t))(v11 + 48))(v9, 1, v10))
    {
      uint64_t v12 = sub_100004A20(&qword_10000C348);
      memcpy(v8, v9, *(void *)(*(void *)(v12 - 8) + 64));
    }
    else
    {
      (*(void (**)(void *, void *, uint64_t))(v11 + 16))(v8, v9, v10);
      (*(void (**)(void *, void, uint64_t, uint64_t))(v11 + 56))(v8, 0, 1, v10);
    }
  }
  else
  {
    *uint64_t v8 = *v9;
    swift_retain();
  }
  swift_storeEnumTagMultiPayload();
  uint64_t v13 = *(int *)(a3 + 40);
  uint64_t v14 = (void *)((char *)a1 + v13);
  uint64_t v15 = (void *)((char *)a2 + v13);
  uint64_t v16 = v15[1];
  void *v14 = *v15;
  v14[1] = v16;
  swift_retain();
  swift_retain();
  return a1;
}

void *sub_100006314(void *a1, void *a2, uint64_t a3)
{
  uint64_t v6 = a2[1];
  *a1 = *a2;
  a1[1] = v6;
  swift_retain();
  swift_release();
  if (a1 != a2)
  {
    uint64_t v7 = *(int *)(a3 + 36);
    uint64_t v8 = (void *)((char *)a1 + v7);
    uint64_t v9 = (void *)((char *)a2 + v7);
    sub_100006AF4((uint64_t)a1 + v7, &qword_10000C340);
    sub_100004A20(&qword_10000C340);
    if (swift_getEnumCaseMultiPayload() == 1)
    {
      uint64_t v10 = type metadata accessor for UserInterfaceSizeClass();
      uint64_t v11 = *(void *)(v10 - 8);
      if ((*(unsigned int (**)(void *, uint64_t, uint64_t))(v11 + 48))(v9, 1, v10))
      {
        uint64_t v12 = sub_100004A20(&qword_10000C348);
        memcpy(v8, v9, *(void *)(*(void *)(v12 - 8) + 64));
      }
      else
      {
        (*(void (**)(void *, void *, uint64_t))(v11 + 16))(v8, v9, v10);
        (*(void (**)(void *, void, uint64_t, uint64_t))(v11 + 56))(v8, 0, 1, v10);
      }
    }
    else
    {
      *uint64_t v8 = *v9;
      swift_retain();
    }
    swift_storeEnumTagMultiPayload();
  }
  uint64_t v13 = *(int *)(a3 + 40);
  uint64_t v14 = (char *)a1 + v13;
  uint64_t v15 = (char *)a2 + v13;
  *(void *)((char *)a1 + v13) = *(void *)((char *)a2 + v13);
  swift_retain();
  swift_release();
  *((void *)v14 + 1) = *((void *)v15 + 1);
  swift_retain();
  swift_release();
  return a1;
}

_OWORD *sub_100006500(_OWORD *a1, _OWORD *a2, uint64_t a3)
{
  *a1 = *a2;
  uint64_t v6 = *(int *)(a3 + 36);
  uint64_t v7 = (char *)a1 + v6;
  uint64_t v8 = (char *)a2 + v6;
  uint64_t v9 = sub_100004A20(&qword_10000C340);
  if (swift_getEnumCaseMultiPayload() == 1)
  {
    uint64_t v10 = type metadata accessor for UserInterfaceSizeClass();
    uint64_t v11 = *(void *)(v10 - 8);
    if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v11 + 48))(v8, 1, v10))
    {
      uint64_t v12 = sub_100004A20(&qword_10000C348);
      memcpy(v7, v8, *(void *)(*(void *)(v12 - 8) + 64));
    }
    else
    {
      (*(void (**)(char *, char *, uint64_t))(v11 + 32))(v7, v8, v10);
      (*(void (**)(char *, void, uint64_t, uint64_t))(v11 + 56))(v7, 0, 1, v10);
    }
    swift_storeEnumTagMultiPayload();
  }
  else
  {
    memcpy(v7, v8, *(void *)(*(void *)(v9 - 8) + 64));
  }
  *(_OWORD *)((char *)a1 + *(int *)(a3 + 40)) = *(_OWORD *)((char *)a2 + *(int *)(a3 + 40));
  return a1;
}

_OWORD *sub_10000669C(_OWORD *a1, _OWORD *a2, uint64_t a3)
{
  *a1 = *a2;
  swift_release();
  if (a1 != a2)
  {
    uint64_t v6 = *(int *)(a3 + 36);
    uint64_t v7 = (char *)a1 + v6;
    uint64_t v8 = (char *)a2 + v6;
    sub_100006AF4((uint64_t)a1 + v6, &qword_10000C340);
    uint64_t v9 = sub_100004A20(&qword_10000C340);
    if (swift_getEnumCaseMultiPayload() == 1)
    {
      uint64_t v10 = type metadata accessor for UserInterfaceSizeClass();
      uint64_t v11 = *(void *)(v10 - 8);
      if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v11 + 48))(v8, 1, v10))
      {
        uint64_t v12 = sub_100004A20(&qword_10000C348);
        memcpy(v7, v8, *(void *)(*(void *)(v12 - 8) + 64));
      }
      else
      {
        (*(void (**)(char *, char *, uint64_t))(v11 + 32))(v7, v8, v10);
        (*(void (**)(char *, void, uint64_t, uint64_t))(v11 + 56))(v7, 0, 1, v10);
      }
      swift_storeEnumTagMultiPayload();
    }
    else
    {
      memcpy(v7, v8, *(void *)(*(void *)(v9 - 8) + 64));
    }
  }
  uint64_t v13 = *(int *)(a3 + 40);
  uint64_t v14 = (char *)a1 + v13;
  uint64_t v15 = (void *)((char *)a2 + v13);
  *(void *)((char *)a1 + v13) = *v15;
  swift_release();
  *((void *)v14 + 1) = v15[1];
  swift_release();
  return a1;
}

uint64_t sub_100006878(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return _swift_getEnumTagSinglePayloadGeneric(a1, a2, a3, sub_10000688C);
}

uint64_t sub_10000688C(uint64_t *a1, uint64_t a2, uint64_t a3)
{
  if (a2 == 0x7FFFFFFF)
  {
    uint64_t v4 = *a1;
    if ((unint64_t)*a1 >= 0xFFFFFFFF) {
      LODWORD(v4) = -1;
    }
    return (v4 + 1);
  }
  else
  {
    uint64_t v8 = sub_100004A20(qword_10000C350);
    uint64_t v9 = *(uint64_t (**)(char *, uint64_t, uint64_t))(*(void *)(v8 - 8) + 48);
    uint64_t v10 = v8;
    uint64_t v11 = (char *)a1 + *(int *)(a3 + 36);
    return v9(v11, a2, v10);
  }
}

uint64_t sub_100006940(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return _swift_storeEnumTagSinglePayloadGeneric(a1, a2, a3, a4, sub_100006954);
}

void *sub_100006954(void *result, uint64_t a2, int a3, uint64_t a4)
{
  uint64_t v5 = result;
  if (a3 == 0x7FFFFFFF)
  {
    *uint64_t result = (a2 - 1);
  }
  else
  {
    uint64_t v7 = sub_100004A20(qword_10000C350);
    uint64_t v8 = *(uint64_t (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v7 - 8) + 56);
    uint64_t v9 = v7;
    uint64_t v10 = (char *)v5 + *(int *)(a4 + 36);
    return (void *)v8(v10, a2, a2, v9);
  }
  return result;
}

uint64_t type metadata accessor for PMCoordinatorStoreView()
{
  return sub_100006D10();
}

void sub_100006A18()
{
  if (!qword_10000C3D8)
  {
    sub_10000552C(&qword_10000C348);
    unint64_t v0 = type metadata accessor for Environment.Content();
    if (!v1) {
      atomic_store(v0, (unint64_t *)&qword_10000C3D8);
    }
  }
}

uint64_t sub_100006A74()
{
  return sub_100006B50(&qword_10000C3E0, &qword_10000C3E8);
}

uint64_t sub_100006AB0()
{
  return swift_getOpaqueTypeConformance2();
}

uint64_t sub_100006AF4(uint64_t a1, uint64_t *a2)
{
  uint64_t v3 = sub_100004A20(a2);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v3 - 8) + 8))(a1, v3);
  return a1;
}

uint64_t sub_100006B50(unint64_t *a1, uint64_t *a2)
{
  uint64_t result = *a1;
  if (!result)
  {
    sub_10000552C(a2);
    uint64_t result = swift_getWitnessTable();
    atomic_store(result, a1);
  }
  return result;
}

uint64_t sub_100006B94(uint64_t a1, uint64_t a2, uint64_t *a3)
{
  uint64_t v5 = sub_100004A20(a3);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v5 - 8) + 16))(a2, a1, v5);
  return a2;
}

uint64_t sub_100006BF8(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_100004A20(&qword_10000C348);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 32))(a2, a1, v4);
  return a2;
}

uint64_t sub_100006C60(uint64_t a1)
{
  uint64_t v1 = *(void *)(*(void *)(a1 + 24) - 8);
  if ((*(unsigned char *)(v1 + 82) & 2) != 0) {
    return swift_release();
  }
  else {
    return (*(uint64_t (**)(void))(v1 + 8))();
  }
}

uint64_t sub_100006CB0(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void *)(a1 + 24);
  *(void *)(a2 + 24) = v3;
  (**(void (***)(uint64_t, uint64_t))(v3 - 8))(a2, a1);
  return a2;
}

uint64_t sub_100006D10()
{
  return swift_getGenericMetadata();
}

uint64_t sub_100006D40()
{
  return swift_getWitnessTable();
}

uint64_t type metadata accessor for ResourceBundleClass()
{
  return self;
}

uint64_t type metadata accessor for PMPasswordManagerState()
{
  return type metadata accessor for PMPasswordManagerState();
}

uint64_t dispatch thunk of PMDebugSettingsManager.shouldShowDebugMenu.getter()
{
  return dispatch thunk of PMDebugSettingsManager.shouldShowDebugMenu.getter();
}

uint64_t dispatch thunk of PMDebugSettingsManager.accountsNavigationStyle.getter()
{
  return dispatch thunk of PMDebugSettingsManager.accountsNavigationStyle.getter();
}

uint64_t dispatch thunk of PMDebugSettingsManager.hideDebugMenuUntilRelaunch.getter()
{
  return dispatch thunk of PMDebugSettingsManager.hideDebugMenuUntilRelaunch.getter();
}

uint64_t PMAppCommands.init(mainWindowGroupIdentifier:)()
{
  return PMAppCommands.init(mainWindowGroupIdentifier:)();
}

uint64_t type metadata accessor for PMAppCommands()
{
  return type metadata accessor for PMAppCommands();
}

uint64_t PMDependencyStore.debugSettingsManager.getter()
{
  return PMDependencyStore.debugSettingsManager.getter();
}

uint64_t PMDependencyStore.debugSettingsManager.setter()
{
  return PMDependencyStore.debugSettingsManager.setter();
}

uint64_t PMPasswordsPaneView.init(appState:style:)()
{
  return PMPasswordsPaneView.init(appState:style:)();
}

uint64_t PMAppDetailsWindowView.init(model:)()
{
  return PMAppDetailsWindowView.init(model:)();
}

uint64_t type metadata accessor for PMAppDetailsWindowView.Detail()
{
  return type metadata accessor for PMAppDetailsWindowView.Detail();
}

uint64_t type metadata accessor for PMAppDetailsWindowView()
{
  return type metadata accessor for PMAppDetailsWindowView();
}

uint64_t PMExtensionCoordinator.appState.getter()
{
  return PMExtensionCoordinator.appState.getter();
}

uint64_t PMExtensionCoordinator.init(appState:)()
{
  return PMExtensionCoordinator.init(appState:)();
}

uint64_t type metadata accessor for PMExtensionCoordinator()
{
  return type metadata accessor for PMExtensionCoordinator();
}

uint64_t PMDebugSettingsControls.init()()
{
  return PMDebugSettingsControls.init()();
}

uint64_t type metadata accessor for PMDebugSettingsControls()
{
  return type metadata accessor for PMDebugSettingsControls();
}

uint64_t type metadata accessor for PMUIApplicationDelegate()
{
  return type metadata accessor for PMUIApplicationDelegate();
}

uint64_t PMWindowGroupIdentifier.rawValue.getter()
{
  return PMWindowGroupIdentifier.rawValue.getter();
}

uint64_t type metadata accessor for PMWindowGroupIdentifier()
{
  return type metadata accessor for PMWindowGroupIdentifier();
}

uint64_t type metadata accessor for PMAccountsNavigationStyle()
{
  return type metadata accessor for PMAccountsNavigationStyle();
}

uint64_t ObservableObject<>.objectWillChange.getter()
{
  return ObservableObject<>.objectWillChange.getter();
}

uint64_t AppStorage.init<A>(wrappedValue:_:store:)()
{
  return AppStorage.init<A>(wrappedValue:_:store:)();
}

uint64_t CommandMenu.init(_:content:)()
{
  return CommandMenu.init(_:content:)();
}

uint64_t type metadata accessor for Environment.Content()
{
  return type metadata accessor for Environment.Content();
}

uint64_t WindowGroup.init<A, B>(id:for:content:)()
{
  return WindowGroup.init<A, B>(id:for:content:)();
}

uint64_t WindowGroup.init(id:title:lazyContent:)()
{
  return WindowGroup.init(id:title:lazyContent:)();
}

uint64_t _TupleScene.init(_:)()
{
  return _TupleScene.init(_:)();
}

uint64_t ObservedObject.init(dependency:)()
{
  return ObservedObject.init(dependency:)();
}

uint64_t type metadata accessor for ModifiedContent()
{
  return type metadata accessor for ModifiedContent();
}

uint64_t NavigationStack.init<>(root:)()
{
  return NavigationStack.init<>(root:)();
}

uint64_t EnvironmentValues.windowHorizontalSizeClass.getter()
{
  return EnvironmentValues.windowHorizontalSizeClass.getter();
}

uint64_t EnvironmentValues.horizontalSizeClass.getter()
{
  return EnvironmentValues.horizontalSizeClass.getter();
}

uint64_t EnvironmentValues.init()()
{
  return EnvironmentValues.init()();
}

uint64_t type metadata accessor for EnvironmentValues()
{
  return type metadata accessor for EnvironmentValues();
}

uint64_t LocalizedStringKey.init(stringLiteral:)()
{
  return LocalizedStringKey.init(stringLiteral:)();
}

uint64_t TupleCommandContent.init(_:)()
{
  return TupleCommandContent.init(_:)();
}

uint64_t type metadata accessor for UserInterfaceSizeClass()
{
  return type metadata accessor for UserInterfaceSizeClass();
}

uint64_t UIApplicationDelegateAdaptor<>.init(_:)()
{
  return UIApplicationDelegateAdaptor<>.init(_:)();
}

uint64_t type metadata accessor for UIApplicationDelegateAdaptor()
{
  return type metadata accessor for UIApplicationDelegateAdaptor();
}

uint64_t static App.main()()
{
  return static App.main()();
}

uint64_t static Log.runtimeIssuesLog.getter()
{
  return static Log.runtimeIssuesLog.getter();
}

uint64_t static View._makeView(view:inputs:)()
{
  return static View._makeView(view:inputs:)();
}

uint64_t static View._makeViewList(view:inputs:)()
{
  return static View._makeViewList(view:inputs:)();
}

uint64_t View.environment<A>(_:_:)()
{
  return View.environment<A>(_:_:)();
}

uint64_t static View._viewListCount(inputs:)()
{
  return static View._viewListCount(inputs:)();
}

uint64_t Scene.handlesExternalEvents(matching:)()
{
  return Scene.handlesExternalEvents(matching:)();
}

uint64_t Scene.commands<A>(content:)()
{
  return Scene.commands<A>(content:)();
}

uint64_t State.init(wrappedValue:)()
{
  return State.init(wrappedValue:)();
}

uint64_t State.wrappedValue.getter()
{
  return State.wrappedValue.getter();
}

uint64_t Binding.projectedValue.getter()
{
  return Binding.projectedValue.getter();
}

uint64_t String.hash(into:)()
{
  return String.hash(into:)();
}

Swift::Int __swiftcall String.UTF8View._foreignCount()()
{
  return String.UTF8View._foreignCount()();
}

uint64_t static os_log_type_t.fault.getter()
{
  return static os_log_type_t.fault.getter();
}

uint64_t static _SetStorage.allocate(capacity:)()
{
  return static _SetStorage.allocate(capacity:)();
}

uint64_t _StringGuts.copyUTF8(into:)()
{
  return _StringGuts.copyUTF8(into:)();
}

uint64_t _StringObject.sharedUTF8.getter()
{
  return _StringObject.sharedUTF8.getter();
}

uint64_t _stringCompareWithSmolCheck(_:_:expecting:)()
{
  return _stringCompareWithSmolCheck(_:_:expecting:)();
}

uint64_t Hasher.init(_seed:)()
{
  return Hasher.init(_seed:)();
}

Swift::Int __swiftcall Hasher._finalize()()
{
  return Hasher._finalize()();
}

void _os_log_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
}

size_t malloc_size(const void *ptr)
{
  return _malloc_size(ptr);
}

void *__cdecl memcpy(void *__dst, const void *__src, size_t __n)
{
  return _memcpy(__dst, __src, __n);
}

void *__cdecl memmove(void *__dst, const void *__src, size_t __len)
{
  return _memmove(__dst, __src, __len);
}

id objc_allocWithZone(Class a1)
{
  return _objc_allocWithZone(a1);
}

id objc_msgSend(id a1, SEL a2, ...)
{
  return _[a1 a2];
}

uint64_t self
{
  return _self;
}

id objc_retainAutoreleasedReturnValue(id a1)
{
  return _a1;
}

BOOL os_log_type_enabled(os_log_t oslog, os_log_type_t type)
{
  return _os_log_type_enabled(oslog, type);
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

uint64_t swift_getAtKeyPath()
{
  return _swift_getAtKeyPath();
}

uint64_t swift_getEnumCaseMultiPayload()
{
  return _swift_getEnumCaseMultiPayload();
}

uint64_t swift_getGenericMetadata()
{
  return _swift_getGenericMetadata();
}

uint64_t swift_getKeyPath()
{
  return _swift_getKeyPath();
}

uint64_t swift_getObjectType()
{
  return _swift_getObjectType();
}

uint64_t swift_getOpaqueTypeConformance2()
{
  return _swift_getOpaqueTypeConformance2();
}

uint64_t swift_getSingletonMetadata()
{
  return _swift_getSingletonMetadata();
}

uint64_t swift_getTypeByMangledNameInContext2()
{
  return _swift_getTypeByMangledNameInContext2();
}

uint64_t swift_getTypeByMangledNameInContextInMetadataState2()
{
  return _swift_getTypeByMangledNameInContextInMetadataState2();
}

uint64_t swift_getWitnessTable()
{
  return _swift_getWitnessTable();
}

uint64_t swift_initStructMetadata()
{
  return _swift_initStructMetadata();
}

uint64_t swift_isUniquelyReferenced_nonNull_native()
{
  return _swift_isUniquelyReferenced_nonNull_native();
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

uint64_t swift_storeEnumTagMultiPayload()
{
  return _swift_storeEnumTagMultiPayload();
}

uint64_t swift_unknownObjectRetain()
{
  return _swift_unknownObjectRetain();
}